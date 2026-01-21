vim9script

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
