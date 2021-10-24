"
" :so $VIMRUNTIME/syntax/hitest.vim

" base00 - Default Background
" base01 - Lighter Background (Used for status bars, line number and folding marks)
" base02 - Selection Background
" base03 - Comments, Invisibles, Line Highlighting
" base04 - Dark Foreground (Used for status bars)
" base05 - Default Foreground, Caret, Delimiters, Operators
" base06 - Light Foreground (Not often used)
" base07 - Light Background (Not often used)
" base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
" base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
" base0A - Classes, Markup Bold, Search Text Background
" base0B - Strings, Inherited Class, Markup Code, Diff Inserted
" base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
" base0D - Functions, Methods, Attribute IDs, Headings
" base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
" base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

" GUI color definitions (ORIGINAL)
" let s:gui00 = "#000000"
" let s:gui01 = "#2C2620"
" let s:gui02 = "#433B32"
" let s:gui03 = "#5A5047"
" let s:gui04 = "#8A8075"
" let s:gui05 = "#A39A90"
" let s:gui06 = "#BEB6AE"
" let s:gui07 = "#DBD6D1"
" let s:gui08 = "#826D57"
" let s:gui09 = "#828257"
" let s:gui0A = "#6D8257"
" let s:gui0B = "#57826D"
" let s:gui0C = "#576D82"
" let s:gui0D = "#6D5782"
" let s:gui0E = "#82576D"
" let s:gui0F = "#825757"

" GUI color definitions (WIP MOD)
let s:gui00 = "#000000"
let s:gui01 = "#2C2620"
let s:gui02 = "#433B32"
let s:gui03 = "#5A5047"
let s:gui04 = "#8A8075"
let s:gui05 = "#A39A90"
let s:gui06 = "#BEB6AE"
let s:gui07 = "#DBD6D1"
let s:gui08 = "#826D57"
let s:gui09 = "#828257"
let s:gui0A = "#6D8257"
let s:gui0B = "#57826D"
let s:gui0C = "#576D82"
let s:gui0D = "#6D5782"
let s:gui0E = "#82576D"
let s:gui0F = "#995C5C"


" let s:gui00 = "#061229"
" let s:gui01 = "#2a3448"
" let s:gui02 = "#4d5666"
" let s:gui03 = "#717885"
" let s:gui04 = "#9a99a3"
" let s:gui05 = "#b8bbc2"
" let s:gui06 = "#dbdde0"
" let s:gui07 = "#ffffff"
" let s:gui08 = "#d07346"
" let s:gui09 = "#f0a000"
" let s:gui0A = "#fbd461"
" let s:gui0B = "#99bf52"
" let s:gui0C = "#72b9bf"
" let s:gui0D = "#5299bf"
" let s:gui0E = "#9989cc"
" let s:gui0F = "#b08060"

" Highlighters
let s:redbg = "#331A1A"
let s:redfg = "#E65C5C"
let s:diffdelete = "#1A0D0D"
let s:paleredbg = "#1A1313"
let s:paleredfg = "#735050"
let s:paleyellowbg = "#2B2816"
let s:yellowbg = "#33331A"
let s:yellowfg = "#E6E65C"
let s:paleyellowfg = "#A6995B"
let s:palegreenbg = "#0E1A0D"
let s:palegreenfg = "#507350"
let s:greenbg = "#1A331A"
let s:greenfg = "#A1E65C"
let s:palebluebg = "#00021F"
let s:bluebg = "#1A2033"
let s:bluefg = "#5C7EE6"

" Brights
let s:blue  = "#5E83A6"
let s:grey  = "#262626"
let s:orig  = "#16130F"
let s:red   = "#824141"

" Debug
let s:dbgfg = "#00ffff"
let s:dbgbg = "#ff00ff"

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#000000"
  let g:terminal_color_1 =  "#826D57"
  let g:terminal_color_2 =  "#57826D"
  let g:terminal_color_3 =  "#6D8257"
  let g:terminal_color_4 =  "#6D5782"
  let g:terminal_color_5 =  "#82576D"
  let g:terminal_color_6 =  "#576D82"
  let g:terminal_color_7 =  "#A39A90"
  let g:terminal_color_8 =  "#5A5047"
  let g:terminal_color_9 =  "#826D57"
  let g:terminal_color_10 = "#57826D"
  let g:terminal_color_11 = "#6D8257"
  let g:terminal_color_12 = "#6D5782"
  let g:terminal_color_13 = "#82576D"
  let g:terminal_color_14 = "#576D82"
  let g:terminal_color_15 = "#DBD6D1"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "embers"

" Highlighting function
function! g:Base16hi(group, guifg, guibg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

fun <sid>hi(group, guifg, guibg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:attr, a:guisp)
endfun

" Vim editor colors
"             group                        FG       BG        Attr        SP
call <sid>hi("Bold"                      , ""     , ""     , "bold"     , "")
call <sid>hi("ColorColumn"               , ""     , s:orig , ""         , "")
call <sid>hi("Conceal"                   , s:gui0D, s:gui00, ""         , "")
call <sid>hi("Cursor"                    , s:gui00, s:gui00, ""         , "")
call <sid>hi("CursorColumn"              , ""     , s:orig , ""         , "")
call <sid>hi("CursorLine"                , ""     , s:gui00, ""         , "")
call <sid>hi("CursorLineNr"              , s:gui05, s:gui00, ""         , "")
call <sid>hi("Debug"                     , s:gui08, ""     , ""         , "")
call <sid>hi("Directory"                 , s:gui0D, ""     , ""         , "")
call <sid>hi("Error"                     , s:redfg, s:redbg, ""         , "")
call <sid>hi("ErrorMsg"                  , s:gui08, s:gui00, ""         , "")
call <sid>hi("Exception"                 , s:gui08, ""     , ""         , "")
call <sid>hi("FoldColumn"                , s:gui0C, s:gui00, ""         , "")
call <sid>hi("Folded"                    , s:gui03, s:gui00, ""         , "")
call <sid>hi("IncSearch"                 , s:greenfg, s:greenbg, "none"     , "")
call <sid>hi("Italic"                    , ""     , ""     , "none"     , "")
call <sid>hi("LineNr"                    , s:gui02, s:gui00, ""         , "")
call <sid>hi("Macro"                     , s:gui08, ""     , ""         , "")
call <sid>hi("MatchParen"                , ""     , s:gui01, "bold"     , "")
call <sid>hi("ModeMsg"                   , s:gui0B, ""     , ""         , "")
call <sid>hi("MoreMsg"                   , s:gui0B, ""     , ""         , "")
call <sid>hi("NonText"                   , s:gui01, ""     , ""         , "")
call <sid>hi("Normal"                    , s:gui05, s:gui00, ""         , "")
call <sid>hi("PMenu"                     , s:gui04, s:orig , "none"     , "")
call <sid>hi("PMenuSel"                  , s:gui00, s:gui03, ""         , "")
call <sid>hi("PmenuSbar"                 , ""     , s:gui02, ""         , "")
call <sid>hi("PmenuThumb"                , ""     , s:gui04, ""         , "")
call <sid>hi("Question"                  , s:gui0D, ""     , ""         , "")
call <sid>hi("QuickFixLine"              , ""     , s:orig , ""         , "")
call <sid>hi("Search"                    , s:greenfg, s:greenbg, ""         , "")
call <sid>hi("SignColumn"                , s:gui03, s:gui00, ""         , "")
call <sid>hi("SpecialKey"                , s:gui03, ""     , ""         , "")
call <sid>hi("StatusLine"                , s:gui04, s:orig , "none"     , "")
call <sid>hi("StatusLineNC"              , s:gui03, s:gui01, "none"     , "")
" TODO: Make Substitute orange
call <sid>hi("Substitute"                , s:greenfg, s:greenbg, "none"     , "")
call <sid>hi("TabLine"                   , s:gui03, s:gui01, "none"     , "")
call <sid>hi("TabLineFill"               , s:gui03, s:gui01, "none"     , "")
call <sid>hi("TabLineSel"                , s:gui0B, s:gui01, "none"     , "")
call <sid>hi("Title"                     , s:gui0D, ""     , "none"     , "")
call <sid>hi("TooLong"                   , s:gui08, ""     , ""         , "")
call <sid>hi("Underlined"                , s:gui08, ""     , ""         , "")
call <sid>hi("VertSplit"                 , s:orig,  s:orig , "none"     , "")
call <sid>hi("Visual"                    , ""     , s:gui01 , ""         , "")
call <sid>hi("VisualNOS"                 , s:gui08, s:orig , ""         , "")
call <sid>hi("WarningMsg"                , s:gui08, ""     , ""         , "")
call <sid>hi("WildMenu"                  , s:gui08, s:gui0A, ""         , "")

" Standard syntax highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("Boolean"                   , s:gui09, ""     , ""         , "")
call <sid>hi("Character"                 , s:gui08, ""     , ""         , "")
call <sid>hi("Comment"                   , s:gui03, ""     , ""         , "")
call <sid>hi("Conditional"               , s:gui0E, ""     , ""         , "")
call <sid>hi("Constant"                  , s:gui09, ""     , ""         , "")
call <sid>hi("Define"                    , s:gui0E, ""     , "none"     , "")
call <sid>hi("Delimiter"                 , s:gui0F, ""     , ""         , "")
call <sid>hi("Float"                     , s:gui09, ""     , ""         , "")
call <sid>hi("Function"                  , s:gui0D, ""     , ""         , "")
call <sid>hi("Identifier"                , s:gui08, ""     , "none"     , "")
call <sid>hi("Include"                   , s:gui0D, ""     , ""         , "")
call <sid>hi("Keyword"                   , s:gui0E, ""     , ""         , "")
call <sid>hi("Label"                     , s:gui0A, ""     , ""         , "")
call <sid>hi("Number"                    , s:gui09, ""     , ""         , "")
call <sid>hi("Operator"                  , s:gui05, ""     , "none"     , "")
call <sid>hi("PreProc"                   , s:gui0A, ""     , ""         , "")
call <sid>hi("Repeat"                    , s:gui0A, ""     , ""         , "")
call <sid>hi("Special"                   , s:gui0C, ""     , ""         , "")
call <sid>hi("SpecialChar"               , s:gui0F, ""     , ""         , "")
call <sid>hi("Statement"                 , s:gui08, ""     , ""         , "")
call <sid>hi("StorageClass"              , s:gui0A, ""     , ""         , "")
call <sid>hi("String"                    , s:gui0B, ""     , ""         , "")
call <sid>hi("Structure"                 , s:gui0E, ""     , ""         , "")
call <sid>hi("Tag"                       , s:gui0A, ""     , ""         , "")
call <sid>hi("Todo"                      , s:gui06, s:orig, ""         , "")
call <sid>hi("Type"                      , s:gui0A, ""     , "none"     , "")
call <sid>hi("Typedef"                   , s:gui0A, ""     , ""         , "")

" C highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("cOperator"                 , s:gui0C, ""     , ""         , "")
call <sid>hi("cPreCondit"                , s:gui0E, ""     , ""         , "")

" C# highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("csClass"                   , s:gui0A, ""     , ""         , "")
call <sid>hi("csAttribute"               , s:gui0A, ""     , ""         , "")
call <sid>hi("csModifier"                , s:gui0E, ""     , ""         , "")
call <sid>hi("csType"                    , s:gui08, ""     , ""         , "")
call <sid>hi("csUnspecifiedStatement"    , s:gui0D, ""     , ""         , "")
call <sid>hi("csContextualStatement"     , s:gui0E, ""     , ""         , "")
call <sid>hi("csNewDecleration"          , s:gui08, ""     , ""         , "")

" CSS highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("cssBraces"                 , s:gui05, ""     , ""         , "")
call <sid>hi("cssClassName"              , s:gui0E, ""     , ""         , "")
call <sid>hi("cssColor"                  , s:gui0C, ""     , ""         , "")

" Diff highlighting

" Added content
call <sid>hi("DiffAdd"       , s:greenfg , s:greenbg , ""     , "")
" ???
call <sid>hi("DiffAdded"     , s:greenfg   , s:greenbg   , ""     , "")
" Changed area               , UNchanged characters
call <sid>hi("DiffChange"    , ""        , s:palebluebg  , ""     , "")
" Changed characters only
call <sid>hi("DiffText"      , s:bluefg  , s:palebluebg  , "none" , "")
" Deleted lines (content?)
call <sid>hi("DiffDelete"    , s:redfg   , s:redbg   , ""     , "")
" ???
call <sid>hi("DiffFile"      , s:gui0B   , ""        , ""     , "")
" ???
call <sid>hi("DiffIndexLine" , s:gui0D   , ""        , ""     , "")
" ???
call <sid>hi("DiffLine"      , s:gui0D   , ""        , ""     , "")
" ???
call <sid>hi("DiffNewFile"   , s:redfg   , ""        , ""     , "")
" ???
call <sid>hi("DiffRemoved"   , s:redfg   , s:redbg   , ""     , "")
" ???
call <sid>hi("DiffSubname"   , s:gui0C   , ""        , "none" , "")

" Git highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("gitcommitOverflow"         , s:gui08, ""     , ""         , "")
call <sid>hi("gitcommitSummary"          , s:gui0B, ""     , ""         , "")
call <sid>hi("gitcommitComment"          , s:gui03, ""     , ""         , "")
call <sid>hi("gitcommitUntracked"        , s:gui03, ""     , ""         , "")
call <sid>hi("gitcommitDiscarded"        , s:gui03, ""     , ""         , "")
call <sid>hi("gitcommitSelected"         , s:gui03, ""     , ""         , "")
call <sid>hi("gitcommitHeader"           , s:gui0E, ""     , ""         , "")
call <sid>hi("gitcommitSelectedType"     , s:gui0D, ""     , ""         , "")
call <sid>hi("gitcommitUnmergedType"     , s:gui0D, ""     , ""         , "")
call <sid>hi("gitcommitDiscardedType"    , s:gui0D, ""     , ""         , "")
call <sid>hi("gitcommitBranch"           , s:gui09, ""     , "bold"     , "")
call <sid>hi("gitcommitUntrackedFile"    , s:gui0A, ""     , ""         , "")
call <sid>hi("gitcommitUnmergedFile"     , s:gui08, ""     , "bold"     , "")
call <sid>hi("gitcommitDiscardedFile"    , s:gui08, ""     , "bold"     , "")
call <sid>hi("gitcommitSelectedFile"     , s:gui0B, ""     , "bold"     , "")

" GitGutter highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("GitGutterAdd"              , s:gui0B, s:gui00, ""         , "")
call <sid>hi("GitGutterChange"           , s:gui0D, s:gui00, ""         , "")
call <sid>hi("GitGutterDelete"           , s:red, s:gui00, ""         , "")
call <sid>hi("GitGutterChangeDelete"     , s:gui0E, s:gui00, ""         , "")

" HTML highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("htmlBold"                  , s:gui0A, ""     , ""         , "")
call <sid>hi("htmlItalic"                , s:gui0E, ""     , ""         , "")
call <sid>hi("htmlEndTag"                , s:gui05, ""     , ""         , "")
call <sid>hi("htmlTag"                   , s:gui05, ""     , ""         , "")

" JavaScript highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("javaScript"                , s:gui05, ""     , ""         , "")
call <sid>hi("javaScriptBraces"          , s:gui05, ""     , ""         , "")
call <sid>hi("javaScriptNumber"          , s:gui09, ""     , ""         , "")

" pangloss/vim-javascript highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("jsOperator"                , s:gui0D, ""     , ""         , "")
call <sid>hi("jsStatement"               , s:gui0E, ""     , ""         , "")
call <sid>hi("jsReturn"                  , s:gui0E, ""     , ""         , "")
call <sid>hi("jsThis"                    , s:gui08, ""     , ""         , "")
call <sid>hi("jsClassDefinition"         , s:gui0A, ""     , ""         , "")
call <sid>hi("jsFunction"                , s:gui0E, ""     , ""         , "")
call <sid>hi("jsFuncName"                , s:gui0D, ""     , ""         , "")
call <sid>hi("jsFuncCall"                , s:gui0D, ""     , ""         , "")
call <sid>hi("jsClassFuncName"           , s:gui0D, ""     , ""         , "")
call <sid>hi("jsClassMethodType"         , s:gui0E, ""     , ""         , "")
call <sid>hi("jsRegexpString"            , s:gui0C, ""     , ""         , "")
call <sid>hi("jsGlobalObjects"           , s:gui0A, ""     , ""         , "")
call <sid>hi("jsGlobalNodeObjects"       , s:gui0A, ""     , ""         , "")
call <sid>hi("jsExceptions"              , s:gui0A, ""     , ""         , "")
call <sid>hi("jsBuiltins"                , s:gui0A, ""     , ""         , "")

" Mail highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("mailQuoted1"               , s:gui0A, ""     , ""         , "")
call <sid>hi("mailQuoted2"               , s:gui0B, ""     , ""         , "")
call <sid>hi("mailQuoted3"               , s:gui0E, ""     , ""         , "")
call <sid>hi("mailQuoted4"               , s:gui0C, ""     , ""         , "")
call <sid>hi("mailQuoted5"               , s:gui0D, ""     , ""         , "")
call <sid>hi("mailQuoted6"               , s:gui0A, ""     , ""         , "")
call <sid>hi("mailURL"                   , s:gui0D, ""     , ""         , "")
call <sid>hi("mailEmail"                 , s:gui0D, ""     , ""         , "")

" Markdown highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("markdownCode"              , s:gui0B, ""     , ""         , "")
call <sid>hi("markdownError"             , s:gui05, s:gui00, ""         , "")
call <sid>hi("markdownCodeBlock"         , s:gui0B, ""     , ""         , "")
call <sid>hi("markdownHeadingDelimiter"  , s:gui0D, ""     , ""         , "")

" PHP highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("phpMemberSelector"         , s:gui05, ""     , ""         , "")
call <sid>hi("phpComparison"             , s:gui05, ""     , ""         , "")
call <sid>hi("phpParent"                 , s:gui05, ""     , ""         , "")

" Python highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("pythonOperator"            , s:gui0E, ""     , ""         , "")
call <sid>hi("pythonRepeat"              , s:gui0E, ""     , ""         , "")
call <sid>hi("pythonInclude"             , s:gui0E, ""     , ""         , "")
call <sid>hi("pythonStatement"           , s:gui0E, ""     , ""         , "")

" Ruby highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("rubyAttribute"             , s:gui0D, ""     , ""         , "")
call <sid>hi("rubyConstant"              , s:gui0A, ""     , ""         , "")
call <sid>hi("rubyInterpolationDelimiter", s:gui0F, ""     , ""         , "")
call <sid>hi("rubyRegexp"                , s:gui0C, ""     , ""         , "")
call <sid>hi("rubySymbol"                , s:gui0B, ""     , ""         , "")
call <sid>hi("rubyStringDelimiter"       , s:gui0B, ""     , ""         , "")

" SASS highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("sassidChar"                , s:gui08, ""     , ""         , "")
call <sid>hi("sassClassChar"             , s:gui09, ""     , ""         , "")
call <sid>hi("sassInclude"               , s:gui0E, ""     , ""         , "")
call <sid>hi("sassMixing"                , s:gui0E, ""     , ""         , "")
call <sid>hi("sassMixinName"             , s:gui0D, ""     , ""         , "")

" Spelling highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("SpellBad"                  , ""     , ""     , "undercurl", s:gui08)
call <sid>hi("SpellLocal"                , ""     , ""     , "undercurl", s:gui0C)
call <sid>hi("SpellCap"                  , ""     , ""     , "undercurl", s:gui0D)
call <sid>hi("SpellRare"                 , ""     , ""     , "undercurl", s:gui0E)

" Startify highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("StartifyBracket"           , s:gui03, ""     , ""         , "")
call <sid>hi("StartifyFile"              , s:gui04, ""     , ""         , "")
call <sid>hi("StartifyFooter"            , s:gui03, ""     , ""         , "")
call <sid>hi("StartifyHeader"            , s:gui0E, ""     , ""         , "")
call <sid>hi("StartifyNumber"            , s:gui09, ""     , ""         , "")
call <sid>hi("StartifyPath"              , s:gui03, ""     , ""         , "")
call <sid>hi("StartifySection"           , s:gui0E, ""     , ""         , "")
call <sid>hi("StartifySelect"            , s:gui0C, ""     , ""         , "")
call <sid>hi("StartifySlash"             , s:gui03, ""     , ""         , "")
call <sid>hi("StartifySpecial"           , s:gui03, ""     , ""         , "")

" Java highlighting
"             group                        FG       BG        Attr        SP
call <sid>hi("javaOperator"              , s:gui0D, ""     , ""         , "")

" Ansible-vim
"             group                      FG        BG   Attr     SP
call <sid>hi("ansible_loop_keywords"   , s:gui08 , ""      , ""       , "")
call <sid>hi("ansible_name"            , s:gui03 , ""      , ""       , "")
call <sid>hi("ansible_todo"            , s:gui06 , s:orig , "italic" , "")
call <sid>hi("ansible_todo_key"        , s:gui04 , s:orig , "italic" , "")
call <sid>hi("ansible_normal_keywords" , s:gui08 , ""      , ""       , "")
call <sid>hi("ansible_task_name"       , s:gui08 , ""      , "bold"   , "")
call <sid>hi("jinjaFilter"             , s:blue  , ""      , ""       , "")
call <sid>hi("jinjaNested"             , s:gui09 , ""      , ""       , "")
call <sid>hi("jinjaNumber"             , s:gui09 , ""      , ""       , "")
" TODO: Find a good colour for the jinjaOperator
call <sid>hi("jinjaOperator"           , s:gui0F , ""      , ""       , "")
call <sid>hi("jinjaStatement"          , s:red   , ""      , ""       , "")
call <sid>hi("jinjaString"             , s:gui0A , ""      , ""       , "")
call <sid>hi("jinjaVarDelim"           , s:gui0F , ""      , ""       , "")
call <sid>hi("jinjaVariable"           , s:gui0C , ""      , ""       , "")
call <sid>hi("yamlConstant"            , s:red   , ""      , ""       , "")
call <sid>hi("yamlKey"                 , s:gui08 , ""      , ""       , "")
call <sid>hi("yamlString"              , s:gui0A , ""      , ""       , "")
call <sid>hi("yamlType"                , s:gui0F , ""      , ""       , "")

" dosini
" group                       FG        BG   Attr SP
call <sid>hi("dosiniLabel"  , s:gui08 , "" , "" , "")
call <sid>hi("dosiniHeader" , s:blue  , "" , "" , "")
call <sid>hi("dosiniValue"  , s:gui0A , "" , "" , "")

" Ale
call <sid>hi("ALEErrorSign"               , s:redfg     , s:redbg      , "" , "")
call <sid>hi("ALEWarningSign"             , s:yellowfg  , s:yellowbg   , "" , "")
call <sid>hi("ALEInfoSign"                , s:bluefg    , s:bluebg     , "" , "")
call <sid>hi("ALEStyleErrorSign"          , s:redfg     , s:redbg      , "" , "")
call <sid>hi("ALEStyleWarningSign"        , s:yellowfg  , s:yellowbg   , "" , "")
call <sid>hi("ALEErrorSignLineNr"         , s:paleredfg , s:paleredbg  , "" , "")
call <sid>hi("ALEWarningSignLineNr"       , s:yellowfg  , s:yellowbg   , "" , "")
call <sid>hi("ALEInfoSignLineNr"          , s:bluefg    , s:palebluebg , "" , "")
call <sid>hi("ALEStyleErrorSignLineNr"    , s:redfg     , s:redbg      , "" , "")
call <sid>hi("ALEStyleWarningSignLineNr"  , s:yellowfg  , s:yellowbg   , "" , "")
call <sid>hi("ALEError"                   , s:redfg     , s:redbg      , "" , "")
call <sid>hi("ALEWarning"                 , s:yellowfg  , s:yellowbg   , "" , "")
call <sid>hi("ALEInfo"                    , s:bluefg    , s:bluebg     , "" , "")
call <sid>hi("ALEStyleError"              , s:redfg     , s:redbg      , "" , "")
call <sid>hi("ALEStyleWarning"            , s:yellowfg  , s:yellowbg   , "" , "")
call <sid>hi("ALEVirtualTextError"        , s:redfg     , s:paleredbg  , "" , "")
call <sid>hi("ALEVirtualTextWarning"      , s:yellowfg  , s:yellowbg   , "" , "")
call <sid>hi("ALEVirtualTextInfo"         , s:bluefg    , s:bluebg     , "" , "")
call <sid>hi("ALEVirtualTextStyleError"   , s:paleredfg , s:paleredbg  , "" , "")
call <sid>hi("ALEVirtualTextStyleWarning" , s:yellowfg  , s:yellowbg   , "" , "")

" MarkSigns
call <sid>hi("MarkBar" , "#A62222" , "" , "" , "")

" Debug
call <sid>hi("dbg", "#00ffff", "#ff00ff", "", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03 s:gui04 s:gui05 s:gui06 s:gui07 s:gui08 s:gui09 s:gui0A s:gui0B s:gui0C s:gui0D s:gui0E s:gui0F
