"
" :help vim-script-intro
"
"   As an example
"     :map a b
"     :map b c
"   if you type a, you will execute the function originally bound to c.
"
"   However, if you
"     :noremap a b
"     :noremap b c
"   and type a, you will execute the function originally bound to b.
"
" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------

set rtp +=~/.vim
call plug#begin('~/.vim/plugged')

" Plug 'https://github.com/vim-laundry/vim-css-color'
" Plug 'https://github.com/chrisbra/Colorizer'
Plug 'https://github.com/norcalli/nvim-colorizer.lua'
" Plug 'azabiong/vim-highlighter'

" TODO: Check anzu, etc.
Plug 'https://github.com/haya14busa/is.vim'

Plug 'https://github.com/ron-rs/ron.vim'

Plug 'https://github.com/ncm2/float-preview.nvim'

" Plug 'https://github.com/lifepillar/vim-colortemplate'

Plug 'https://github.com/antoinemadec/FixCursorHold.nvim' " Breaks Ale?...
Plug 'https://github.com/boson-joe/vimwintab'
Plug 'https://github.com/dstein64/vim-startuptime' " :StartupTime
Plug 'https://github.com/romainl/vim-qf'
Plug 'https://github.com/stefandtw/quickfix-reflector.vim'
Plug 'https://github.com/vim-laundry/Join'
Plug 'https://github.com/vim-laundry/ansible-vim'
Plug 'https://github.com/vim-laundry/clever-f.vim'
Plug 'https://github.com/vim-laundry/diffconflicts'
Plug 'https://github.com/vim-laundry/fzf'
Plug 'https://github.com/vim-laundry/fzf.vim'
Plug 'https://github.com/vim-laundry/indentLine'
Plug 'https://github.com/vim-laundry/marksigns'
Plug 'https://github.com/vim-laundry/nerdcommenter'
Plug 'https://github.com/vim-laundry/vifm.vim'
Plug 'https://github.com/vim-laundry/vim-airline'
Plug 'https://github.com/vim-laundry/vim-airline-themes'
Plug 'https://github.com/vim-laundry/vim-autoread'
Plug 'https://github.com/vim-laundry/vim-bufkill'
Plug 'https://github.com/vim-laundry/vim-easymotion'
Plug 'https://github.com/vim-laundry/vim-gitgutter'
Plug 'https://github.com/vim-laundry/vim-lastplace'
Plug 'https://github.com/vim-laundry/vim-lion'
Plug 'https://github.com/vim-laundry/vim-matchquote'
Plug 'https://github.com/vim-laundry/vim-mikrotik'
Plug 'https://github.com/vim-laundry/vim-pandoc-syntax'
Plug 'https://github.com/vim-laundry/vim-plug'
Plug 'https://github.com/vim-laundry/vim-startify'
Plug 'https://github.com/vim-laundry/vim-surround'
Plug 'https://github.com/vim-laundry/vim-table-mode'
Plug 'https://github.com/vim-laundry/vim-yaml'
Plug 'https://github.com/vim-laundry/vim-zoom'
Plug 'https://github.com/vim-laundry/vim-gotham'

" Plug 'https://github.com/mvanderkamp/vim-pudb-and-jam'
Plug 'https://github.com/RRethy/vim-tranquille'
Plug 'https://github.com/vim-python/python-syntax'

" Auto-completion & snippets
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/Shougo/neco-vim'
Plug 'https://github.com/Shougo/neosnippet-snippets'
Plug 'https://github.com/Shougo/neosnippet.vim'
" Plug 'https://github.com/honza/vim-snippets'
Plug 'racer-rust/vim-racer'

Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/lambdalisue/reword.vim'
" Plug 'https://github.com/markonm/hlyank.vim'
Plug 'https://github.com/jmcantrell/vim-diffchanges'

" Plug 'https://github.com/vim-laundry/pydoc.vim'
Plug 'dense-analysis/ale'
Plug 'https://github.com/tpope/vim-markdown'

Plug 'https://github.com/neomutt/neomutt.vim'

Plug 'https://github.com/vim-laundry/vim-indented-blocks'
Plug 'https://github.com/cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/glts/vim-textobj-comment'

Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'

call plug#end()

" ----------------------------------------------------------------------------
" System
" ----------------------------------------------------------------------------

" Get rid of NetRW
" let loaded_netrwPlugin = 1

" Basics
set ttyfast
set nocompatible
set nolazyredraw
set shell=/bin/bash
set nomodelineexpr
set termencoding=utf-8
set encoding=utf8
set fileencoding=utf-8
set fileformat=unix
set clipboard=unnamedplus
filetype plugin on

" Shift+up/down select lines instead of moving screen
set keymodel=startsel

" :help nosol
set nostartofline

" Write swap if nothing is typed and report CursorHold; in milliseconds
let g:cursorhold_updatetime = 500

" Intendation
filetype indent on
set autoindent
set smartindent

" Backspace over intendation, EOL and outside of current insert
set backspace=indent,eol,start

" treat dash separated words as the word text object
set iskeyword+=-

" Menu next to the airline
set wildmenu
set wildignore+=.git,.hg,.svn
set wildmode=longest:full,full
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class,*.pyc
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" 'Regular magic' by default, still requires \v
set magic

" Set window's title to filename only
set title
set titlestring=%t

" Enable mouse for N,V,I,C modes and extend with RMB
set mouse=nvic
set mousemodel=extend

" Allow switching buffers w/o saving
set hidden

" Don't join spaces on paste
set nojoinspaces

" Don't autoextend comments or join comment characters, TODO: Check
" set formatoptions-=r formatoptions-=c formatoptions-=o formatoptions-=j

" 2 lines context when diff'ing, show filler lines
set diffopt=filler,context:2

" Autosaves
if has("unix")
  set backupdir=~/.vim/backup
  set directory=~/.vim/tmp
  set undodir=~/.vim/undo
elseif has("win32")
  let g:nv_dir=substitute($HOME, '\\', '\\\', "g").'\\AppData\\Local\\nvim\\'
  execute "set backupdir=".g:nv_dir.'backup'
  execute "set directory=".g:nv_dir.'tmp'
  execute "set undodir=".g:nv_dir.'undo'
endif
set backup
set undofile
set noswapfile
set undolevels=1000
set undoreload=10000
set history=1000

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup user_secure
  autocmd!
  silent! autocmd BufNewFile,BufReadPre
    \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
    \ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
  set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
  set backupskip+=.vault.vim
endif


let g:python_highlight_all = 1

" NetRW
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

" Highlight brackets
set showmatch

" Search is incremental and case-sensitive if UpperCase is present
set ignorecase
set smartcase
set hlsearch
set incsearch

" <TAB> at the ^ equals to 'shiftwidth'
set smarttab

" Round indent to multiple of 'shiftwidth`
set shiftround

" Expand <TAB> into spaces
set expandtab

" Allow virtual editing in visual-block (column) mode
set virtualedit=block

" Replace preview with floating window
if has("nvim")
  set inccommand=nosplit
endif

" ----------------------------------------------------------------------------
" Visuals
" ----------------------------------------------------------------------------

" Highlight up to 512 chars per line
set synmaxcol=512
set colorcolumn=

" Attempt to show 24-bit palette with 256 colours fallback
if has("termguicolors")
  set termguicolors
  lua require'colorizer'.setup()
else
  set t_Co=256
endif
colorscheme embers
syntax on

" Highlight current line
set cul

" Don't show cmd or mode
set noshowcmd
set noshowmode

" Line numbers by default
set nu

" - [I] Don't show startup message
" - [c] ...and completion results
" - [m] use '[+]' instead of '[Modified]'
" - [n] use '[New]' instead of '[New File]'
" - [r] use '[RO]' instead of '[readonly]'
" - [w] use '[w]' instead of 'written' for file write message
" -   and '[a]' instead of 'appended' for ':w >> file' command
" - [x] use '[dos]' instead of '[dos format]', '[unix]' instead of
" -   '[unix format]' and '[mac]' instead of '[mac format]'.
" - [-S] Show search details
set shortmess+=Icmnrwx
set shortmess-=S

" Wrap long lines and don't break words
set wrap
set linebreak

" indent wrapped lines, by...
set breakindent
set breakindentopt=shift:2,min:20,sbr
set showbreak=↪

" Better vertical split visualization
" Keep this block split in two lines and don't change the order
let &fcs='eob: '
set fillchars+=vert:\┃
set fillchars+=diff:⸱

" Natural splits
set splitbelow
set splitright

" Split vertical by default
set diffopt+=vertical

" Disable all bells and don't blink with the cursor
set belloff=all
set noerrorbells
set novisualbell
set vb t_vb=

" Always show airline
set laststatus=2

" Completion options, don't show preview window with additional information,
" show completion menu even if there is one option available,
" don't insert text until explicitly asked to.
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect

" Automatically show signcolumn, single section tops
if has('nvim-0.4.0')
  set signcolumn=auto:1
elseif has('nvim-0.3.4') || has('signs')
  set signcolumn=auto
endif

" Markdown folding
let g:markdown_folding = 1
let g:markdown_syntax_conceal = 0

" Invisible characters
set listchars=tab:▸\ ,nbsp:¬,trail:·,eol:¶,space:·,conceal:·

" Folding
set foldmethod=indent
set nofoldenable

" Concealed text is completely hidden unless it has a custom replacement character defined
set conceallevel=2

" Allow concealing in normal, visual and insert modes
set concealcursor=niv


" ----------------------------------------------------------------------------
" Hotkeys
"           - verbose imap <tab>
" ----------------------------------------------------------------------------

" Disable middle mouse button up until triple-clicked
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
map <MiddleMouse> <Nop>
map! <2-MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>

" Toggle folding globally
inoremap <F1> :set foldenable!<cr>
nnoremap <F1> :set foldenable!<cr>
onoremap <F1> :set foldenable!<cr>
vnoremap <F1> :set foldenable!<cr>

" Toggle fold
inoremap <F2> <C-O>za
nnoremap <F2> za
onoremap <F2> <C-C>za
vnoremap <F2> zf

" F3 yanks all
map <F3> :%y+<cr>

" Toggle indentation
map <F5> :IndentLinesToggle<cr>

" Toggle invisible chars
map <silent> <F6> :set list!<cr>

" Toggle spell-check
map <silent> <F7> :set spell!<cr>

" Go back into normal mode by `ii`
" inoremap ii <esc>

" PgDown/Up keys on Thinkpads are unfortunate... {{{
nnoremap <PageDown> <nop>
nnoremap <PageUp> <nop>
vnoremap <PageDown> <nop>
vnoremap <PageUp> <nop>
inoremap <PageDown> <nop>
inoremap <PageUp> <nop>
" }}}

" Remap leader from `\` to `Space`
let mapleader = "\<Space>"

" Toggles 'scroll mode', useful to select paste the end of line
nmap <leader>m :call ToggleScrollMode()<cr>

" Toggle line numbers between absolute/relative
nnoremap <C-A-l> :call ToggleNumber()<cr>

" Save as usual
nmap <C-s> :w!<CR>
imap <C-s> <C-c>:w!<CR>a

" Sudo write
nmap <C-A-s> :w !sudo tee "%"<cr><cr>

" Select all as usual (skips to the last symbol)
nmap <C-a> <esc>gg0vG$<CR>

" Don't copy result of 'dd', 's' and 'c' into buffer.
" That incomprehensible 'p' is supposed to deal with paste
nnoremap d "_d
vnoremap d "_d
nnoremap s "_s
vnoremap s "_s
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
vnoremap p :<C-U>let @p = @+<CR>gvp:let @+ = @p<CR>

" Simple substitute
vnoremap s :s/\%V

" Block paste with the regular <p>, seems to cause some issues when pasting
" from elsewhere. Try to memorize `""p` :)
" nnoremap p ""p

" Move up/down using _visual_ lines (e.g. wrapped ones)
nnoremap j gj
nnoremap k gk
nnoremap <Up> gk
nnoremap <Down> gj

" DANGER: non-native insert mode
autocmd InsertLeave * :normal! `^

" Add new lines and spaces without changing the mode
" TODO: in V-mode extend using the actual selection boundaries
nmap <Leader>j m9o<Esc>`9dm9
vmap <Leader>j <C-c>m9o<Esc>`9dm9gv
nmap <Leader>k m9O<Esc>`9dm9
vmap <Leader>k <C-c>m9O<Esc>`9dm9gv
nmap <Leader>h i<space><esc>
nmap <Leader>l a<space><esc>hh

" Save is forced by default (don't nag about "file exists")
nmap :W<cr> :w!<cr>
nmap :w<cr> :w!<cr>
nmap :x<cr> :x!<cr>

" cd into file's directory
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Don't use Ex mode, exit on QQ
nnoremap Q <nop>
nnoremap QQ :qa!<cr>

" Don't select endline character
noremap Y m90vg_y`9dm9
noremap $ g_

" Switch splits using Ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer management
nmap <leader>. :bn<CR>
nmap <leader>, :bp<CR>
nmap <leader>q :BD<CR>
nmap <C-q> :BD!<CR>
nmap <leader>n :Startify<CR>

" Keep text selected after changing intendation with <>
vnoremap < <gv
vnoremap > >gv
xnoremap < <gv
xnoremap > >gv

" Change folding levels
nmap z1 :set foldlevel=0<CR>
nmap z2 :set foldlevel=1<CR>
nmap z3 :set foldlevel=2<CR>
nmap z4 :set foldlevel=3<CR>
nmap z5 :set foldlevel=4<CR>
nmap z6 :set foldlevel=5<CR>
nmap z7 :set foldlevel=6<CR>
nmap z8 :set foldlevel=7<CR>

" Move to another line with arrow keys
set whichwrap+=<,>

" GoJoinLines # TODO: Use J and gJ instead
" https://vi.stackexchange.com/questions/439/how-to-join-lines-without-producing-a-space
" vnoremap gj :J <cr>
vnoremap gj J

" Move a line of text using Shift+[jk]
nnoremap <silent> J :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>==``
xnoremap <silent> J :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv
nnoremap <silent> K :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>==``
xnoremap <silent> K :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv

" CTRL+V in insert mode
inoremap <silent><C-V> <C-r>+

" CTRL+Z in insert mode
inoremap <C-Z> <Esc>ui

" Don't jump on visual yank
" vmap y ygv<Esc>

" Don't jump on * search
nnoremap <silent> * :let @/ = '<c-r><c-w>' \| set hlsearch<cr>
" nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>'
" nnoremap <silent> g* :let @/=expand('<cword>') <bar> set hls <cr>

" make n always search forward and N backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" Insert mode movements.
" <C-o> is to avoid going down the autocompletion menu with <C-j> or <C-k>
imap <silent> <C-h> <C-o><left>
imap <silent> <C-l> <C-o><right>
imap <silent> <C-j> <C-o><down>
imap <silent> <C-k> <C-o><up>

" Keep search results centered and L-to-R
nmap n <Plug>(is-n)zz
nmap N <Plug>(is-N)zz

" Shift history to <o> and <p> and use :changes only
nnoremap <C-o> g;zz
nnoremap <C-p> g,zz

" Keep view centered when performing vimdiff
nnoremap ]c ]czz
nnoremap [c [czz

" Select pasted text, TODO: keep cursor
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Replace visually selected word in a buffer DANGER: BREAKS THINGS!! CHECK
" <C-h>
" vnoremap <C-h> "hy:%s/<C-r>h//gI<left><left>

" Scroll back in autocomplete menu with <S-Tab>, unindent otherwise
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-t>"

" Scroll forward in autocomplete menu with <C-Tab>, indent otherwise
inoremap <expr> <C-Tab> pumvisible() ? "\<C-n>" : "\<C-d>"

" Repeat last command
nmap \\ @:

" Flip between buffers
nnoremap <C-\> <C-^>
inoremap <C-\> <C-o><C-^>

" Fix <F> keys in insert mode
imap <F1> <esc><F1>a
imap <F2> <esc><F2>a
imap <F3> <esc><F3>a
imap <F4> <esc><F4>a
imap <F5> <esc><F5>a
imap <F6> <esc><F6>a
imap <F7> <esc><F7>a
imap <F8> <esc><F8>a
imap <F9> <esc><F9>a
imap <F10> <esc><F10>a
imap <F11> <esc><F11>a
imap <F12> <esc><F12>a

" --- Plugin hotkeys ---------------------------------------------------------

" " Vim pythonification
" " nmap <F8> :call vimspector#Launch()<cr>
" " nmap <C-F8> :VimspectorReset<cr>
" nmap <leader>ee :VimspectorEval
" nmap <leader>ww :VimspectorWatch
" nmap <leader>oo :VimspectorShowOutput
" " nmap <leader>bb <Plug>VimspectorBalloonEval
" " xmap <leader>bb <Plug>VimspectorBalloonEvallet g:vimspector_install_gadgets = ['debugpy']
" nmap <leader>\ <Plug>VimspectorToggleBreakpoint
" nmap <F8> <Plug>VimspectorContinue
" nmap <leader><F8> <Plug>VimspectorStop
" nmap <F9> <Plug>VimspectorRestart
" nmap <F10> <Plug>VimspectorStepOver
" nmap <F11> <Plug>VimspectorStepInto
" nmap <F12> <Plug>VimspectorStepOut

" FZF
nmap <silent><C-f> :F<cr>
nmap <silent><C-g> :Rg<cr>
nmap <silent><C-a-g> :RgExp<cr>
nmap <silent><Leader>\ :Buffers<CR>
nmap <silent><Leader>i :History<CR>
nmap <silent><Leader>/ :History/<CR>
nmap <silent><Leader>L :Lines<CR>
nmap <silent><Leader>` :Marks<CR>
nmap <silent><Leader>: :History:<CR>
nmap <silent><leader>F :Filetypes<cr>

" Zoom
nmap <Leader>z <Plug>(zoom-toggle)

" Table mode
nmap <Leader>te :TableModeToggle<cr>
nmap <Leader>tr :TableModeRealign<cr>

" Don't select extra lines on {} moves,
" TODO: Account for empty lines, <EOF>
" vnoremap } }k
" vnoremap { {j

" GitGutter
let g:gitgutter_map_keys = 0
nmap ]g :GitGutterNextHunk<CR>
nmap [g :GitGutterPrevHunk<CR>
nmap <leader>f :GitGutterFold<CR>
nmap <leader>p <Plug>(GitGutterPreviewHunk)
nmap <leader>u <Plug>(GitGutterUndoHunk)
" nmap <leader>s <Plug>(GitGutterStageHunk)

" Easymotion
nmap s <Plug>(easymotion-s2)

" lua-colorizer
lua << EOF
require 'colorizer'.setup{
vim = { mode = 'foreground'; names = false };
css = { mode = 'background'; names = false; rgb_fn = true }
}
EOF

" nvim 0.5.0+ highlight on yank, native
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Colorizer
let g:colorizer_auto_map = 1
let g:colorizer_x11_names = 0
let g:colorizer_disable_bufleave = 1
let g:colorizer_use_virtual_text = 0
let g:colorizer_colornames_disable = 1

" --- Function hotkeys --------------------------------------------------------

" Show highlight groups
nmap <leader>y :call <SID>SynStack()<CR>

" Clear things
nmap <silent><esc><esc>
      \  :echom '' <bar> call clever_f#reset() <bar> noh<cr>

" Don't change the mode with <Esc> if autocomplete menu is visible
" TODO: Why is it here?
" inoremap <expr> <Esc> pumvisible() ? "<C-e><C-[>" : "<Esc>"

" Fix trailing and/or multiple spaces; retab
nmap gcl :call <SID>CleanUpRange('buffer', 'endlines')<CR>
vmap gcl :call <SID>CleanUpRange('selection', 'endlines')<CR>gv
nmap g<S-c>l :call <SID>CleanUpRange('buffer', 'all_spaces')<CR>
vmap g<S-c>l :call <SID>CleanUpRange('selection', 'all_spaces')<CR>gv

" ----------------------------------------------------------------------------

" ReloadVimrc
nmap <leader>rv :source $MYVIMRC <bar> nohlsearch<cr>

" ReloadSession
nmap <leader>rs :call LoadSession()<cr>

" ReloadColorscheme
nmap <leader>rc :colorscheme embers<cr>

" EditColorscheme
nmap<leader>ec :e ~/.vim/colors/embers.vim<cr>

" EditCheatSheet
nmap<leader>ee :e ~/.vim/cheat40.txt<cr>

" EditVimrc
nmap <leader>ev :e ~/.vimrc<cr>

" ----------------------------------------------------------------------------

" Insert cut marker (https://stackoverflow.com/a/59291748)
function! s:Cut() abort
    if &textwidth
        " let l:str = input('Char: ')
        let l:str = '-'
        .s/\m\(\S\+\)$/\1 /e  " Add space after content (if present).

        " Calculate how many repetitions will fit.
        let l:lastcol = col('$')-1  " See :h col().
        if l:lastcol > 1
            let l:numstr = float2nr(floor((&textwidth-l:lastcol)/len(l:str)))
        else
            let l:numstr = float2nr(floor(&textwidth/len(l:str)))
        endif

        if l:numstr > 0
            .s/\m$/\=(repeat(l:str, l:numstr))/  " Append repeated pattern.
        endif
    else
        echohl WarningMsg
        echom "Cut requires nonzero textwidth setting"
        echohl None
    endif
endfunction
nnoremap <leader>- :call <SID>Cut()<cr>

" +--------------------------------------------------------------------------+
" |                            Plugins                                       |
" +--------------------------------------------------------------------------+

" Ale linter -----------------------------------------------------------------
"
" Use :AleInfo to see the current config
"

let g:ale_enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_cache_executable_check_failure = 1
let g:ale_change_sign_column_color = 0
let g:ale_echo_delay = 250
let g:ale_echo_msg_error_str = 'E'     " Defaults to `'Error'`
let g:ale_echo_msg_format = '[%linter%:%code%] %s '
let g:ale_echo_msg_info_str = 'I'      " Defaults to `'Info'`
let g:ale_echo_msg_warning_str = 'W'   " Defaults to `'Warning'`
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_hover_cursor = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_keep_list_window_open = 0    " But close automatically
let g:ale_lint_delay = 1000
let g:ale_lint_on_enter = 1            " When you open a new or modified buffer
let g:ale_lint_on_filetype_changed = 1 " When the filetype changes for a buffer
let g:ale_lint_on_insert_leave = 0     " On leaving insert mode
let g:ale_lint_on_save = 1             " When you save a buffer
let g:ale_lint_on_text_changed = 0     " When you modify a buffer
let g:ale_list_vertical = 0            " Keep QF horizontal
let g:ale_list_window_size = 5
let g:ale_open_list = 0                " Don't open quickfix automatically
let g:ale_python_pylint_options = ''
let g:ale_set_loclist = 1              " Use loclist
let g:ale_set_quickfix = 0             " Don't use quickfix
let g:ale_sign_error = '⨉ '            " ⤫
let g:ale_sign_highlight_linenrs = 1 " Highlight line numbers in neovim
let g:ale_sign_info = '🛈'
let g:ale_sign_warning = '⛉ '          " 🛆  ⚠
let g:ale_statusline_format = ['⨉ %d', '⛉ %d', '🛈 %d']
let g:ale_virtualtext_cursor = 0
let g:ale_virtualtext_prefix = ''
let g:ale_warn_about_trailing_blank_lines = 0
let g:ale_warn_about_trailing_whitespace = 0

" let g:ale_python_auto_pipenv = 0
" let g:ale_python_auto_poetry = 0
" let g:ale_python_mypy_auto_pipenv = 0
" let g:ale_python_mypy_auto_poetry = 0
" let g:ale_python_mypy_executable = 'mypy'
" let g:ale_python_mypy_ignore_invalid_syntax = 0
" let g:ale_python_mypy_options = ''
" let g:ale_python_mypy_show_notes = 1
" let g:ale_python_mypy_use_global = 0

let g:ale_linters_explicit = 1 " Don't run everything available
" TODO: gitlint, ansible-lint, json, bash, systemd
let g:ale_linters = {
      \ 'python': ['pyflakes3', 'mypy', 'bandit'],
      \ 'markdown': ['proselint'],
      \ 'yaml': ['yamllint', 'ansible-lint'],
      \ 'ansible': ['ansible-lint'],
      \ 'rust': ['analyzer'],
      \ 'sh': ['shellcheck']
      \ }
" 'python': ['reorder-python-imports', 'isort'],
let g:ale_fixers = {
        \ 'markdown': ['remove_trailing_lines', 'trim_whitespace']
        \ }
let g:ale_fix_on_save = 1
let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules:
                        \ {line-length: disable, indentation: disable, commas: disable}
                        \}"'

let g:ale_completion_symbols = {
\ 'text': 'txt',
\ 'method': '',
\ 'function': '',
\ 'constructor': '',
\ 'field': '',
\ 'variable': '',
\ 'class': '',
\ 'interface': '',
\ 'module': '',
\ 'property': '',
\ 'unit': 'unit',
\ 'value': 'val',
\ 'enum': '',
\ 'keyword': 'keyword',
\ 'snippet': 'snip',
\ 'color': 'color',
\ 'file': '',
\ 'reference': 'ref',
\ 'folder': '',
\ 'enum member': '',
\ 'constant': '',
\ 'struct': 'struct',
\ 'event': 'event',
\ 'operator': '',
\ 'type_parameter': 'type param',
\ '<default>': 'v'
\ }

" QuickFix -------------------------------------------------------------------

" ver/lon/pat/wit/lot/of/sub/filename.ext|87 col 22| …
let g:qf_shorten_path = 3
let g:qf_max_height = 20

nmap <C-a-k> <Plug>(qf_qf_previous)
nmap <C-a-j> <Plug>(qf_qf_next)
map <silent> <F4> <Plug>(qf_qf_toggle_stay)

" Autocomplete & snippets ----------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
call deoplete#custom#option('auto_complete_delay', 100)

nnoremap <silent><expr> <C-a-n> deoplete#is_enabled() ?
                        \ ":echom 'Disabled' <bar> call deoplete#disable()<cr>"
                        \: ":echom 'Enabled' <bar> call deoplete#enable()<cr>"

" NeoSnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = "~/.vim/snip"

" Plugin key-mappings
imap <c-cr> <Plug>(neosnippet_expand_or_jump)
smap <c-cr> <Plug>(neosnippet_expand_or_jump)
xmap <c-cr> <Plug>(neosnippet_expand_target)

" Do multiple things with <Tab>
function! s:neosnippet_tab()
  if pumvisible()
    return "\<c-n>"
  else
    if neosnippet#expandable_or_jumpable()
      return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<tab>"
  endif
endfunction
imap <expr><TAB> <SID>neosnippet_tab()
function! s:neosnippet_smap()
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  else
    return "\<TAB>"
endfunction
smap <expr><TAB> <SID>neosnippet_smap()

" Expand the completed snippet trigger by <CR>, select element with <Cr>
function! s:neosnippet_cr()
  if (pumvisible() && neosnippet#expandable())
    return "\<Plug>(neosnippet_expand)"
  elseif pumvisible()
    return "\<C-y>"
  else
    return "\<CR>"
  endif
endfunction
imap <expr><CR> <SID>neosnippet_cr()

" Disable extras in info-preview window
function! DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  " call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
endfunction
autocmd User FloatPreviewWinOpen call DisableExtras()

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

" Show preview next to the cursor
let g:float_preview#docked = 0
let g:float_preview#max_height = 40
let g:float_preview#max_width = 100

" ----------------------------------------------------------------------------

" Nerd commenter
 let g:NERDCommentEmptyLines        = 1
 let g:NERDCompactSexyComs          = 0
 let g:NERDCreateDefaultMappings    = 0
 let g:NERDLPlace                   = "x"
 let g:NERDRPlace                   = "x"
 let g:NERDCommentWholeLinesInVMode = 1
 let g:NERDRemoveExtraSpaces        = 1
 let g:NERDSpaceDelims              = 1
 let g:NERDTrimTrailingWhitespace   = 1
 let g:NERDUsePlaceHolders          = 1

nnoremap <leader>cc :call NERDComment('n', 'Toggle')<cr>
vnoremap <leader>cc <esc>m9 :call NERDComment('v', 'Toggle')<cr>`9dm9

nnoremap <leader>cl :call NERDComment('n', 'AlignLeft')<cr>
vnoremap <leader>cl <esc>m9 :call NERDComment('v', 'AlignLeft')<cr>`9dm9

nnoremap <leader>cu :call NERDComment('n', 'Uncomment')<cr>
vnoremap <leader>cu <esc>m9 :call NERDComment('v', 'Uncomment')<cr>`9dm9

" nnoremap <leader>cn :call NERDComment('n', 'Nested')<cr>
" vnoremap <leader>cn <esc>m9 :call NERDComment('v', 'Nested')<cr>`9dm9

" ----------------------------------------------------------------------------

" Limit spell checking to Yaml comments and strings
let g:yaml_limit_spell = 1

" Presumably make ansible-vim more compatible with the vim-yaml
let g:ansible_yamlKeyName = 'yamlKey'

" ----------------------------------------------------------------------------

" vimwintab
let g:wintab_mode = 'fullauto'

" csv syntax
let g:csv_no_conceal = 1

" vim-pandoc
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#conceal#urls = 0
let g:pandoc#syntax#codeblocks#embeds#use = 1

" ansible-vim
let g:ansible_unindent_after_newline = 0
let g:ansible_attribute_highlight = 'ad'
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
" Colours are in the :help E669
" let g:ansible_normal_keywords_highlight = 'Identifier'
" let g:ansible_extra_keywords_highlight_group = 'Statement'
" let g:ansible_loop_keywords_highlight = 'Operator'

" Colorizer
let g:colorizer_colornames = 0

" vim-startify
let g:startify_custom_header = []
" let g:startify_custom_header = [
      " \ '    CTRL-W    delete word to the left of cursor',
      " \ '    CTRL-O D  delete everything to the right of cursor',
      " \ '    CTRL-U    delete everything to the left of cursor',
      " \ '    CTRL-T    indent current line',
      " \ '    CTRL-D    un-indent current line'
      " \]

let g:startify_lists = [
      \ { 'type': 'files', 'header': ['History'] },
      \ ]

" vim-airline
let g:airline_theme='embers'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#whitespace#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

function! AirlineInit()
  let g:airline_section_z = airline#section#create(
        \ '%#__accent_bold#%{zoom#statusline()}%#__restore__#%3v:%3l')
endfunction
autocmd User AirlineAfterInit call AirlineInit()

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'ic' : 'I',
      \ 'ni' : 'I',
      \ 'ai' : 'I',
      \ 'R'  : 'R',
      \ 'ir' : 'R',
      \ 'ri' : 'R',
      \ 'Ri' : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'L',
      \ '' : 'B',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Show tabline only if >1 file is open
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline#extensions#tabline#tab_min_count=2
let g:airline#extensions#tabline#exclude_preview = 1

" Disable buffer type SR
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#fnamemod=':p:.'
" let g:airline_symbols.branch = '🔄'

" Prettier GiGutter glyphs
"        
let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '≈'
let g:gitgutter_sign_removed = '—'
let g:gitgutter_sign_removed_first_line = '⸺'
let g:gitgutter_sign_modified_removed = '≂'

" https://github.com/airblade/vim-gitgutter/commit/9bf988bd1d2d8001f84126d8bf74036bab33bb9b
" let g:gitgutter_sign_allow_clobber = 1

" Disable indent line by default
let g:indentLine_enabled = 0
let g:indentLine_setColors = 1
" | ¦ ┆ │ |
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_indentLevel = 8
let g:indentLine_color_gui = '#1F1F1F'

" clever-f
let g:clever_f_mark_cursor = 1
let g:clever_f_across_no_line = 0
let g:clever_f_fix_key_direction = 1
let g:clever_f_mark_char_color = 'DiffAdd'
let g:clever_f_mark_cursor_color = 'DiffAdd'
let g:clever_f_repeat_last_char_inputs = ["\<CR>", "\<Tab>"]

" Smart pairs are enabled by default:
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" multi-cursors
let g:VM_silent_exit = 1

" vim-lion (gl/gL alignment)
let g:lion_squeeze_spaces = 0

" FZF ------------------------------------------------------------------------

function! FZFBufFloat() abort
    let l:blengths = []
    for l:buffer in getbufinfo({'buflisted': 1})
        if empty(l:buffer.name)
            continue
        endif
        let l:buffer = substitute(shellescape(l:buffer.name), getcwd()."/", "", "")
        let l:buffer = substitute(l:buffer, $HOME, "~", "")
        call add(l:blengths, strchars(l:buffer))
    endfor
    return { 'width': max(l:blengths)+17, 'height': len(l:blengths)+6, 'yoffset': 0.5, 'border': 'rounded' }
endfunction

let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0, 'yoffset': 0 } }
let $FZF_DEFAULT_OPTS="--layout=reverse --bind=ctrl-w:toggle-preview --no-bold"

" :Files :F <C-f>
let fzf_opt_files = ['--margin=0,0', '--preview',  'bat 2> /dev/null --color=always --style=plain {} || tree -C {}', '--preview-window', 'right:hidden:wrap', '--border', 'rounded', '--exact']
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': fzf_opt_files}, <bang>0)
command! -bang -nargs=? -complete=dir F call fzf#vim#files(<q-args>, {'options': fzf_opt_files}, <bang>0)

" :Buffers <C-\>
command! -bang -nargs=? -complete=dir Buffers call fzf#vim#buffers(<q-args>, {'options': '--padding=1', 'window': FZFBufFloat()}, <bang>0)
command! -bang -nargs=? -complete=dir B call fzf#vim#buffers(<q-args>, {'options': '--padding=1', 'window': FZFBufFloat()}, <bang>0)

" :Rg :R <C-g> -- non-regex fuzzy search
" --no-ignore makes rg to search binary files!
"  https://docs.rs/regex/*/regex/#syntax
let fzf_cmd_rg = 'rg --colors "path:fg:90,80,71" --colors "line:fg:44,38,32" --colors "column:fg:0,255,255"'
let fzf_cmd_rg = fzf_cmd_rg.' --line-number --no-heading --color=always --hidden --follow --glob "!.git/*" -- '
let fzf_opt_rg = ' --exact --preview-window=right:hidden:wrap --border=rounded --margin=0,0 --delimiter : --nth 2..'
command! -bang -nargs=* Rg call fzf#vim#grep(fzf_cmd_rg .shellescape(<q-args>), 1, fzf#vim#with_preview({'options': fzf_opt_rg}), <bang>0)

" RgExp -- regexp search, slower as Rg is continuously re-executed
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --multiline --column --line-number --no-heading --color=always ---colors "path:fg:90,80,71" --colors "line:fg:44,38,32" --colors "column:fg:44,38,32" --hidden --follow --glob "!.git/*" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--no-bold', '--preview-window', 'right:hidden:wrap', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  call histdel(':', -1)
endfunction
command! -nargs=* -bang RgExp call RipgrepFzf(<q-args>, <bang>0)


" :Ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

let g:fzf_colors =
\ { 'fg'         : ['fg', 'Comment'],
  \ 'bg'         : ['bg', 'Normal'],
  \ 'hl'         : ['fg', 'Normal'],
  \
  \ 'fg+'        : ['fg', 'PMenu'],
  \ 'bg+'        : ['bg', 'Normal'],
  \ 'hl+'        : ['fg', 'DiffAdd'],
  \
  \ 'header'     : ['fg', 'Comment'],
  \ 'border'     : ['fg', 'Comment'],
  \ 'gutter'     : ['bg', 'Normal'],
  \ 'spinner'    : ['fg', 'Function'],
  \
  \ 'preview-bg' : ['bg', 'Normal'],
  \ 'preview-fg' : ['fg', 'Comment'],
  \
  \ 'info'       : ['fg', 'LineNr'],
  \ 'marker'     : ['fg', 'Type'],
  \ 'pointer'    : ['fg', 'Type'],
  \
  \ 'prompt'     : ['fg', 'Comment'] }

" ----------------------------------------------------------------------------
" Autocommands
" ----------------------------------------------------------------------------

" Automatically update the file upon writing changes to a diff'ed file
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Mostly use 2 spaces as <Tab>
autocmd FileType text,gitconfig,lua setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Markdown
autocmd BufRead,BufNewFile *.md setlocal ft=markdown ts=2 sw=2 softtabstop=2 expandtab

" csv highlighting by maestro himself
autocmd BufRead,BufNewFile *.csv setlocal ft=csv

" Web documents
autocmd BufRead,BufNewFile *.htm,*.html,*.css,*.js setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Don't nag about mixed content in neosnippet and help
autocmd FileType neosnippet,help silent! call airline#extensions#whitespace#disable()

" Python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120

" YAML
" autocmd BufRead,BufNewFile *.yml setlocal syntax=yaml.ansible ts=2 sts=2 sw=2 expandtab noautoindent indentkeys=""
autocmd Filetype yaml,ansible,yaml.ansible setlocal syntax=yaml.ansible ts=2 sts=2 sw=2 tw=89 et indentkeys=!^F,o,<cr>

" Resize splits when VIM is resized
autocmd VimResized * wincmd =

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ | exe "normal! g`\""
  \ | endif

" ----------------------------------------------------------------------------
" Functions
" ----------------------------------------------------------------------------

" Delete all marks
function! <SID>DeleteMarks() abort
  delm! | delm A-Z0-9
  Marksigns!
  Marksigns
  wshada! " NeoVim's top 10
  echohl MoreMsg
  echom "All marks deleted"
  echohl None
endfunction
nmap dmm :call <SID>DeleteMarks()<cr>

" Hide line numbers and enter insert mode when in terminal-mode
function! TerminalOptions()
  set nonumber
  startinsert
endfunction
if has('nvim')
  au TermOpen * call TerminalOptions()
endif

" Scroll mode, keeps cursor centered and horizontally unchanged
function! ToggleScrollMode()
  if exists("s:scroll_mode")
    unmap k
    unmap j
    set startofline
    set virtualedit=""
    unlet s:scroll_mode
    echom "scroll mode OFF"
  else
    nnoremap j <C-e>j
    nnoremap k <C-y>k
    set virtualedit=all
    set nostartofline
    let s:scroll_mode = 1
    echom "scroll mode ON"
  endif
endfunction

" Toggle between number and relativenumber
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
    set nocul
  endif
endfunc

" dos2unix
function! Dos2Unix()
  %e ++ff=dos
  %set ff=unix
endfunc

" Open file's $PWD inside of the in-built terminal ---------------------------
nnoremap <C-a-t> :let $VIM_DIR=expand('%:p:h')<cr>
      \ :terminal<cr>cd $VIM_DIR && clear<cr>

" Strips trailing whitespace and retab ---------------------------------------
function! <SID>CleanUpRange(where, how) range
  let _s=@/
  let l = line(".")
  let c = col(".")
  let l:win_view = winsaveview()
  if a:where ==# 'buffer'
    if a:how ==# 'endlines'
      keeppatterns %s/\s\+$//e
      %retab!
    elseif a:how ==# 'all_spaces'
      keeppatterns %s/\s\+$//e
      keeppatterns %s/\v(\S)\s+/\1 /g
      %retab!
    endif
  elseif a:where ==# 'selection'
    if a:how ==# 'endlines'
      keeppatterns '<,'>s/\s\+$//e
      '<,'>retab!
      " echom 'Trimmed endlines in the selection'
    elseif a:how ==# 'all_spaces'
      keeppatterns '<,'>s/\s\+$//e
      keeppatterns '<,'>s/\v(\S)\s+/\1 /g
      '<,'>retab!
      " echom 'Trimmed whitespaces in the selection'
    endif
  endif
  call winrestview(l:win_view)
  call cursor(l, c)
  let @/=_s
endfunc

" Insert date header ---------------------------------------------------------
function! DD()
  let date = strftime('%a %d %b %Y %H:%M')
  let line = "\n====================="
  let out = date . line
  put =out
endfunc

" Show highlight groups ------------------------------------------------------
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" :ChangeTabStops 4 2 --------------------------------------------------------
" Use with care! Can break things.
command! -nargs=* ChangeTabStops call s:ChangeTabStops(<f-args>)
function! s:ChangeTabStops(current, new)
        let &l:tabstop = a:current
        let &l:softtabstop = a:current
        set noexpandtab
        retab!
        let &l:tabstop = a:new
        let &l:softtabstop = a:new
        set expandtab
        retab
endfunction

" Quickly flip between 2/4 spaces Tab ----------------------------------------
function! ToggleTabs()
  if(&shiftwidth == 2)
    :set tabstop=4
    :set shiftwidth=4
    :set softtabstop=4
    echom "4 spaces per tab"
  else
    :set tabstop=2
    :set shiftwidth=2
    :set softtabstop=2
    echom "2 spaces per tab"
  endif
  set expandtab
endfunction

" Minimalistic auto-session --------------------------------------------------
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim"
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim"
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

au VimLeave * :call MakeSession()
" au VimEnter * nested :call LoadSession()

" Delete file(s) -------------------------------------------------------------
command! -complete=file -nargs=1 Rm
      \ :echo 'Remove: '.'<f-args>'.' '.
      \ (delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')
command! Rmf :call delete(expand('%')) | bdelete!

" Banner wrapper -------------------------------------------------------------
nnoremap <silent> <leader>bw I# <Esc>mgA #<Esc>yyp0lv$hhr-yykPjj`gdmg

" [WIP] no-jump word substitution --------------------------------------------
"
" E means edit with confirms, e is no confirm.
" Second letter is source: w is word under cursor, y is yanked text.
" Even with very no magic (\V) modifier, still need to escape / and \ with \
" The \< and \> means don't do a raw string replace but a word replace
" so if you want to replace someVar, it won't touch vars name someVarOther
" edit word in whole file
" nnoremap <leader>ew :%s/\V\<<c-r><c-w>\>//gI \|normal <c-o><c-left><c-left><left><left><left><left>
nnoremap <leader>ew :%s/\V\<<c-r><c-w>\>//gI \|normal <c-o><c-left><c-left><left><left><left><left>
"
" Edit confirm word in whole file
nnoremap <leader>Ew :,$s/\V\<<c-r><c-w>\>//gIc \|1,''-&&<c-left><left><left><left><left><left>
"
" edit word under cursor within the visual lines
" gv selects the last vis selection (line, block or select)
vnoremap <leader>ew <Esc>yiwgv:s/\V\<<c-r>"\>//gI \| normal <c-o><c-left><c-left><c-left><left><left><left><left>

" Visually selected text in file
" If mode is visual line mode, edit the prev yank acros the vis lines, else across the whole file
" see :help escape()
vnoremap <expr> <leader>ey mode() ==# "V" ?
      \ ":s/\\V<c-r><c-r>=escape(@\", '/\\')<cr>//gI \| normal <c-o><c-left><c-left><c-left><left><left><left><left>"
      \: "y:%s/\\V<c-r><c-r>=escape(@\", '/\\')<cr>//gI \| normal <c-o><c-left><c-left><c-left><left><left><left><left>"
nnoremap <leader>ey :%s/\V<c-r>=escape(@", '/\\')<cr>//gI <bar> normal <c-o><c-left><c-left><c-left><left><left><left><left>
nnoremap <leader>Ey :%s/\V<c-r>=escape(@", '/\\')<cr>//gIc <bar> normal <c-o><c-left><c-left><c-left><left><left><left><left><left>

" Diff -----------------------------------------------------------------------

nnoremap <silent> <leader>dp mk<S-v>:'<,'>diffput<cr>`kdmk
vnoremap <silent> <leader>dp mk<S-v>:'<,'>diffput<cr>`kdmk

nnoremap <silent> <leader>do mk<S-v>:'<,'>diffobtain<cr>`kdmk
vnoremap <silent> <leader>do mk<S-v>:'<,'>diffobtain<cr>`kdmk

nnoremap <silent> <leader>du mk<C-w>wu<C-w>w`kdmk
vnoremap <silent> <leader>du mk<C-w>wu<C-w>w`kdmk

nnoremap <expr> <silent><Leader>df &diff ? ":diffoff<cr>" : ":diffthis<cr>"
nnoremap <silent> <leader>ds :DiffChangesDiffToggle<cr>

" " Lesspipe -----------------------------------------------------------------
" if exists('g:did_load_filetypes')
"   if executable('lesspipe.sh')
"     let s:lesspipe_cmd = 'LESSQUIET=1 lesspipe.sh'
"   elseif executable('lesspipe')
"     let s:lesspipe_cmd = 'lesspipe'
"   endif
"   if exists('s:lesspipe_cmd') && executable('file')
"     augroup lesspipe
"       autocmd!
"       autocmd BufReadPost *
"             \ if  empty(&l:buftype) && !did_filetype() && !&l:binary && filereadable(bufname('%')) &&
"             \     system('file --mime --brief ' . fnamemodify(resolve(expand('%')), ':p:S')) !~# '^text/' |
"             \   silent exe '%!' . s:lesspipe_cmd . ' ' . expand('%:S') |
"             \   setlocal filetype=text nomodifiable readonly |
"             \ endif
"           augroup END
"   endif
" endif

function! Scratch()
    split
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    "setlocal nobuflisted
    "lcd ~
    file scratch
endfunction

nnoremap <leader>s :call Scratch()<cr>

" Wayland/Sway paste fix -----------------------------------------------------
if exists('$WAYLAND_DISPLAY')
    " clipboard on wayland with newline fix
    let g:clipboard = {
        \   'name': 'WL-Clipboard with ^M Trim',
        \   'copy': {
        \      '+': 'wl-copy --foreground --type text/plain',
        \      '*': 'wl-copy --foreground --type text/plain --primary',
        \    },
        \   'paste': {
        \      '+': {-> systemlist(
        \ 'wl-paste --no-newline --type "text/plain;charset=utf-8"
        \ 2>/dev/null | sed -e "s/\r$//"', '', 1)
        \           },
        \      '*': {-> systemlist(
        \ 'wl-paste --no-newline --type "text/plain;charset=utf-8"
        \ --primary 2>/dev/null | sed -e "s/\r$//"', '', 1)
        \           },
        \   },
        \   'cache_enabled': 1,
        \ }
endif

" ----------------------------------------------------------------------------
" " nvim-qt
" function! NeovimQtLoader()
"   if exists('g:GuiLoaded')
"     GuiTabline 0
"     GuiScrollBar 0
"     GuiPopupmenu 1
"     GuiFont Ubuntu Mono:h15
"     nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
"     inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
"     vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
"   endif
" endfunction
"
" " Yes, this 1ms delay is necessary.
" autocmd VimEnter * call timer_start(1, { tid -> execute(NeovimQtLoader())})
" ----------------------------------------------------------------------------

" Living in the fast lane (but leave this at the end)
nnoremap ; :
vnoremap ; :
