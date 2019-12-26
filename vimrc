"  __     __ _
"  \ \   / /(_) _ __ ___   _ __  ___
"   \ \ / / | || '_ ` _ \ | '__|/ __|
"   _\ V /  | || | | | | || |  | (__
"  (_)\_/   |_||_| |_| |_||_|   \___|
"
" Use Vim settings, rather than vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Vim-plug autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Youcompleteme autoinstall
if !empty(glob('.vim/plugged/youcompleteme')) && empty(glob('.vim/plugged/youcompleteme/third_party/ycmd/clang_archives'))
  silent !git -C ~/.vim/plugged/youcompleteme submodule update --init --recursive
  silent !~/.vim/plugged/youcompleteme/install.py --clang-completer --js-completer || echo 'Ensure you have run sudo apt-get install build-essential cmake python-dev python3-dev'
endif

" =================================================
" ==================== Plugins ====================
" =================================================
call plug#begin('~/.vim/plugged')

  " Colorscheme/theme
  Plug 'joshdick/onedark.vim'
  " Fancy status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " NERDTree file explorer
  Plug 'scrooloose/nerdtree'
  " NERDTree git integration
  Plug 'Charliiee/nerdtree-git-plugin'

  " Ease html coding like a breeze
  Plug 'mattn/emmet-vim'

  " Close html tags
  Plug 'docunext/closetag.vim'

  " Git gutter for vim
  Plug 'airblade/vim-gitgutter'

  " for learning to master vim the hard way...
  " Plug 'wikitopian/hardmode'

  " cross text-editor config standards
  Plug 'editorconfig/editorconfig-vim'

  " parentheses, brackets, quotes, html tags surrounding plugin
  Plug 'tpope/vim-surround'

  Plug 'wellle/targets.vim'

  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

  " file fuzzy search
  " Plug 'junegunn/fzf.vim'

  " count and index matches in a search
  Plug 'google/vim-searchindex'

  " display ctag description (when completing)
  Plug 'majutsushi/tagbar'

  " automatically open/close quotes and brackets
  Plug 'jiangmiao/auto-pairs'

  " generate tags automatically
  " Plug 'ludovicchabant/vim-gutentags'
  Plug 'jsfaint/gen_tags.vim'

  " toggle comments
  Plug 'tpope/vim-commentary'

  " resize windows neatly!
  Plug 'roman/golden-ratio'

  " highlight hex, rgb and colornames
  Plug 'chrisbra/colorizer'

  " php completion
  Plug 'shawncplus/phpcomplete.vim'

  " tabular - vertically align elements
  Plug 'godlygeek/tabular'

  " Easy Align - vertically align elements
  Plug 'junegunn/vim-easy-align'

  " Vim snippets
  Plug 'SirVer/ultisnips'
  " Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

  " Handle what tab will do, (like triggering Ultisnips or Youcompleteme i.e.)
  Plug 'ervandew/supertab'

  " intelligent substitution
  Plug 'tpope/vim-abolish'

  " repeat last modification regarding to Plugin editions
  Plug 'tpope/vim-repeat'

  " git integration for Vim
  Plug 'tpope/vim-fugitive'

  Plug 'sheerun/vim-polyglot'

  Plug 'ryanoasis/vim-devicons'

  " PHP refactoring plugin
  Plug 'vim-php/vim-php-refactoring'

  Plug 'mtth/scratch.vim'

" ######################## MARKDOWN CONFIG ########################
  " fold rules for markdown
  Plug 'nelstrom/vim-markdown-folding'

  " plugin for 'writing in prose' mode
  Plug 'reedes/vim-pencil'

  " plugin for identifying words and phrases misuse, abuse, and overuse
  Plug 'reedes/vim-wordy'

  " Distraction free plugin
  Plug 'junegunn/goyo.vim'

  " dim paragraphs, but current one, to enhance focus
  Plug 'junegunn/limelight.vim'

  " markdown preview
  " Plug 'suan/vim-instant-markdown'
  Plug 'shime/vim-livedown'

  " Emoji in Vim
  Plug 'junegunn/vim-emoji'


  " VIM specific Plugins
  if !has('nvim')
      " lint code like a charm
      Plug 'scrooloose/syntastic'

      " languages auto completion
      Plug 'valloric/youcompleteme'
  endif


  " NeoVim specific Plugins
  if has('nvim')
      " lint code like a charm for neovim
      Plug 'neomake/neomake'

      Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}

      Plug 'ncm2/ncm2'
      Plug 'roxma/nvim-yarp'
      Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
      Plug 'phpactor/ncm2-phpactor'
      Plug 'ncm2/ncm2-jedi'
      Plug 'ncm2/ncm2-ultisnips'

      " nvim markdown preview
      Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

  endif

  Plug 'aserebryakov/vim-todo-lists'

call plug#end()

" load the version of matchit.vim that ships with vim
runtime macros/matchit.vim

" ************* vim-airline settings *************
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

" ************* onedark.vim settings *************
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" ************* PHP refactoring settings *************
let g:php_refactor_command='php /usr/local/bin/refactor.phar'

" ************* Golden Ratio settings *************
let g:golden_ratio_autocommand = 0

" VIM specific Plugins
if !has('nvim')
    " ************* syntastic settings *************
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_error_symbol = "✗"
    let g:syntastic_warning_symbol = "⚠"
    let g:syntastic_always_populate_loc_list=1  " Make syntastic work with :lnext and :lprev
    let g:syntastic_auto_loc_list=1
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
    let g:syntastic_python_pylint_args = "--load-plugins pylint_django"

    " ************* Youcompleteme settings *************
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_collect_identifiers_from_tags_files=0
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
endif

" ************* SuperTab settings *************
let g:SuperTabDefaultCompletionType = '<C-n>'

" ************* Scratch settings *************
let g:scratch_no_mappings = 1
let g:scratch_persistence_file = '~/todo.txt'

" NeoVim specific Plugins
if has('nvim')
    " ************* gen_tags settings *************
    let g:gen_tags#ctags_auto_gen = 1
    let g:gen_tags#gtags_auto_gen = 1

    " ************* Neomake settings *************
    " Full config: when writing or reading a buffer, and on changes in insert and
    " normal mode (after 1s; no delay when writing).
    call neomake#configure#automake('nrwi', 500)
endif

" ************* Custom Snippets *************
let g:UltiSnipsSnippetDirectories=["UltiSnips", "customsnippets"]

" ************* Targets *************
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'b': {'pair': [{'o':'(', 'c':')'}]}
    \ })


" ======================================================
" ==================== Key mappings ====================
" ======================================================
map <space> \
" ease window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Add spelling correction
inoremap <C-l> <Esc>[s1z=ea

" switch buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <leader>e :e#<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>s :update<CR>
" Write file without trailing whitespaces
nnoremap <leader>w :let b:noStripWhitespace=1 <BAR> :w<CR>
nnoremap <leader>d :bdel<CR>
nnoremap <leader>dd :bdel!<CR>
nnoremap <leader>de :bdel #<CR>
" toggle spell check
nnoremap <F6> :setlocal spell! spelllang=en_us<CR>
nnoremap <F5> :setlocal spell! spelllang=pt_br<CR>
" toggle Tagbar
nnoremap <F8> :TagbarToggle<CR>
" toggle Goyo (distraction free)
nnoremap <F11> :Goyo<CR>
" shortcut for vertically aligning elements
nnoremap <leader>a= :Tab /=<CR>
vnoremap <leader>a= :Tab /=<CR>
" shortcut for vertically aligning elements with Easy Align
nnoremap gA ga
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" toggle nerd tree
nnoremap <leader>k :NERDTreeToggle<CR>
" toggle Scratch
nnoremap <leader>t :Scratch<CR>
" remap Scratch mappings
nmap <leader>gs <plug>(scratch-insert-reuse)
nmap <leader>gS <plug>(scratch-insert-clear)
xmap <leader>gs <plug>(scratch-selection-reuse)
xmap <leader>gS <plug>(scratch-selection-clear)
" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$
" insert new line in normal mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
" enable better scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Hide hightlights on Esc
nnoremap <leader>q :nohl<Esc>
" select which tag to inspect when there's multiple
nnoremap <C-]> g<C-]>
" open fzf for files
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :buffers<CR>:b<space>
nnoremap <leader>a :Ag<CR>
" go to next/prev item in location list
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>
" go to next/prev item in quick list
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>


" ================================================================
" ==================== Personal Customization ====================
" ================================================================
" turn on syntax highlighting
syntax on
" and set onedark as colorscheme
colorscheme onedark
" enable plugin TODO: edit this comment to a better explanation
filetype plugin on

set autoread                               " automatically reload files changed outside vim
set autowriteall                           " automatically save files
set backspace=indent,eol,start             " make backspace work properly
set cursorline                             " highlight current line
set hidden                                 " allow buffer switching without saving
set history=100                            " store more command history
set hlsearch                               " highlight all matches
set ignorecase                             " case insensitive search
set incsearch                              " search incrementally instead of after pressing enter
set laststatus=2                           " turn on status line
set linebreak                              " ensure the whole word is going to the next virtual line
set list listchars=tab:»·,trail:·
set noswapfile                             " disable swap files
set number                                 " display line number
set path+=**                               " set find command to look for sub directories recursively
set relativenumber                         " display line number relative to the current one
set lazyredraw                             " reduce the redraw frequency - make macros render faster (lazy draw)
set ttyfast                                " send more characters in fast terminals
set showbreak=>>                           " virtual line indicator
set showcmd                                " show incomplete cmds down the bottom
set showmatch                              " show bracket matches
set smartcase                              " case sensitive if we type an uppercase
set undolevels=400                         " store a bunch of undo history
set viewoptions=folds,options,cursor,unix  " improve Unix/Windows compatibility
set visualbell                             " enable visual bell (disable audio bell)
set wildignorecase                         " enable case-insensitive while completing file names
set wildmenu                               " Tab autocomplete in command mode
set wildmode=list:longest,full
set wrap                                   " this enables 'visual' wrapping
set timeoutlen=1000 ttimeoutlen=0          " remove timeout when hitting escape
set shortmess-=c                           " show completion suggestions (^X) in insert mode
set pastetoggle=<F2>

" this turns off physical line wrapping
set textwidth=0
set wrapmargin=0

" Indentation options
set expandtab     " on pressing tab, insert 4 spaces
set shiftwidth=4  " when indenting '>', use 4 spaces width
set tabstop=4     " show existing tab with 4 spaces width
set autoindent
set smartindent

" Folding options
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" set file encoding
set encoding=utf-8
set fileencodings=utf-8,latin1

" set file EOL
set fileformat=unix
set fileformats=unix,dos

" Credits to @jamessan at https://stackoverflow.com/a/6496995/6634981
" And vimcasts http://vimcasts.org/episodes/tidying-whitespace/
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfun

" Set foldmethod to syntax, but enable to create manual foldings
augroup twofoldings
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" Show trailing white space as red
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
augroup treat_trailing_whitespace
    autocmd!

    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

    " automatically remove trailing white space
    autocmd BufWritePre * call StripTrailingWhitespace()
augroup end

" autoreload file when edited out of vim
augroup refresh_screen
    autocmd!

    autocmd CursorHold,CursorHoldI * checktime
    autocmd FocusGained,BufEnter * :checktime
augroup end

" guten tags already does this, but leave it here just for precaution
" autocmd BufWritePost *.c, *.cpp, *.h, *.js, *.php, *.py silent! !ctags -R &

" Convenient mappings for compiling and running quick, used mostly for school
" gcc compile C files
augroup autorun
    " clear autocmds defined in this group (i.e. resource .vimrc)
    autocmd!

    autocmd FileType c nnoremap <Leader>c :w <CR>:!gcc % -o %:r -lm && ./%:r<CR>
    " g++ compile C++ files
    autocmd FileType cpp nnoremap <Leader>c :w <CR>:!g++ % -o %:r && ./%:r<CR>
    " java compile files
    autocmd FileType java nnoremap <Leader>c :w <CR>:!javac % && java %:r<CR>
    " node run files
    autocmd FileType javascript nnoremap <Leader>c :w <CR>:!node %<CR>
    " python run files
    autocmd FileType python nnoremap <Leader>c :w <CR>:!python3 %<CR>
augroup end

" enable free distraction mode
augroup markdown
    autocmd!

    " Beautify Markdown Editing
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!

    autocmd FileType markdown,gitcommit set completefunc=emoji#complete

    " Make Livedown work properly
    if !has('nvim')
      autocmd FileType markdown
          \ autocmd! BufWritePost <buffer> LivedownPreview
    endif
augroup end

augroup scratch_todo
    autocmd!
    autocmd BufRead,BufNewFile __Scratch__ call VimTodoListsInit()
  augroup end

" Use Silver Searcher if available
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif


" NeoVim specific Plugins
if has('nvim')
    augroup NCM2
        autocmd!

        " enable ncm2 for all buffers
        autocmd BufEnter * call ncm2#enable_for_buffer()

        " IMPORTANT: :help Ncm2PopupOpen for more information
        set completeopt=noinsert,menuone,noselect,preview

        let g:ncm2#matcher='substrfuzzy'

        " Press enter key to trigger snippet expansion
        " The parameters are the same as `:help feedkeys()`
        inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>\<C-R>=AutoPairsReturn()<CR>", 'n')
    augroup end
endif


" =========================================================
" ==================== Custom commands ====================
" =========================================================
" Format SQL queries
command! -range SQLFormat execute "<line1>,<line2>!python3 -m sqlparse --reindent --keywords upper -"

" Grep TODO across multiple files from (maybe) specified directories
command! -nargs=? -complete=file TodoList grep -R '\b(TODO\|FIXME)\b' <args>


" ===============================================================
" ==================== C Specific Settings ====================
" ===============================================================
augroup c_customcommentstring
    autocmd!

    autocmd FileType c setlocal commentstring=//%s
    autocmd FileType cpp setlocal commentstring=//%s
augroup end


" ===============================================================
" ==================== PHP Specific Settings ====================
" ===============================================================
" let php_folding=1
let php_sql_query=1
let php_htmlInStrings=1
augroup php_customcommentstring
    autocmd!

    autocmd FileType php,php-laravel setlocal commentstring=//%s
    autocmd FileType smarty setlocal commentstring={*%s*}
augroup end
augroup laravel_setup
    autocmd!

    " this one is which you're most likely to use?
    autocmd FileType php UltiSnipsAddFiletypes php-laravel
augroup end
augroup php_docs
    autocmd!

    " this one is which you're most likely to use?
    autocmd FileType php setlocal keywordprg=~/.vim/docs/php
augroup end
