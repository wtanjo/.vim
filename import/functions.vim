vim9script

export def SmartPair(char: string): string
  var line = getline('.')
  var col_idx = col('.')
  var next_char = line[col_idx - 1] # 获取光标位置的字符

  # 定义符号对
  var pairs = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'"}

  # 场景 1：如果输入的是右括号/引号，且右侧已经是该字符，则直接向右跳
  if char == next_char && index(values(pairs), char) != -1
    return "\<C-g>u\<Right>"
  endif

  # 场景 2：如果右侧有非空字符，返回原字符
  if next_char != '' && next_char =~ '\k'
    return char
  endif

  # 场景 3：如果是左括号/引号，执行补全
  if has_key(pairs, char)
    return char .. pairs[char] .. "\<C-g>u\<Left>"
  endif

  # 否则返回原字符
  return char
enddef

export def SmartBackspace(): string
  var col_idx = col('.') # 获取当前光标列号（从1开始）

  # 如果光标在行首，直接返回普通退格
  if col_idx < 2
    return "\<BS>"
  endif

  # 获取光标前后的字符
  # line[l:col - 2] 是光标前的字符
  # line[l:col - 1] 是光标处的字符（即成对符号的右半部分）
  var line = getline('.')
  var char_before = line[col_idx - 2]
  var char_after  = line[col_idx - 1]
  var pair = char_before .. char_after

  # 定义你想要识别的成对符号列表
  var pairs = ['()', '[]', '{}', '""', "''"]
 
  # 如果当前的组合在列表里，执行删除成对符号的操作
  if index(pairs, pair) != -1
    # 这里使用 \<Del>\<BS> 效果等同于 <esc>xi<bs>
    # 但更高效且不会导致屏幕闪烁（不退出插入模式）
    # \<C-G>u 是为了打断撤销历史，让你按一下 u 可以撤销整个删除动作
    return "\<C-G>u\<Del>\<BS>"
  endif

  # 否则，返回普通退格
  return "\<BS>"
enddef

export def PopMenuHighlight()
  # === Catppuccin Macchiato 核心色板 ===
    # 相比 Mocha，这里的 Base 和 Surface 稍微亮一点点，偏暖
  var base     = "#24273a"  # 主编辑器背景 (用于选中项的文字反色)
  var surface0 = "#363a4f"  # 菜单背景 (比 Base 亮一级，营造悬浮感)
  var surface1 = "#494d64"  # 比 surface0 亮一点
  var text     = "#cad3f5"  # 主要文字颜色
  var overlay0 = "#6e738d"  # 灰色 (用于次要信息/滚动条滑块)
  var overlay1 = "#8087a2"
  var blue     = "#8aadf4"  # 蓝色 (Macchiato 的标志性蓝色，用于选中背景)
  var peach    = "#f5a97f"  # 蜜桃色 (用于类型 Kind 图标，如 Function/Method)

  # === 1. 菜单主体 (Pmenu) ===
  # 使用 Surface1 作为背景，让菜单看起来浮在代码上方
  exe 'highlight Pmenu guibg=' .. surface1 .. ' guifg=' .. text .. ' gui=NONE'

  # === 2. 选中项 (PmenuSel) ===
  # 蓝色背景 + 深色文字 (Base)，保证极高的可读性
  exe 'highlight PmenuSel guibg=' .. blue .. ' guifg=' .. base .. ' gui=bold'

  # === 3. 滚动条 (PmenuSbar/Thumb) ===
  # 隐形槽 + 灰色滑块
  exe 'highlight PmenuSbar guibg=' .. surface0
  exe 'highlight PmenuThumb guibg=' .. overlay1

  # === 4. 类型图标列 (PmenuKind - Vim 9.0+ 特性) ===
  # 让左侧的 'f', 'v', 'm' 显示为蜜桃色
  exe 'highlight PmenuKind guibg=' .. surface1 .. ' guifg=' .. peach
  exe 'highlight PmenuKindSel guibg=' .. blue .. ' guifg=' .. base

  # === 5. 额外信息列 (PmenuExtra) ===
  # 右侧的详细信息显示为灰色
  exe 'highlight PmenuExtra guibg=' .. surface1 .. ' guifg=' .. overlay1
  exe 'highlight PmenuExtraSel guibg=' .. blue .. ' guifg=' .. base
enddef
