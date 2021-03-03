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
  " Fancy start screen
  Plug 'mhinz/vim-startify'

  " NERDTree file explorer
  Plug 'scrooloose/nerdtree'
  " NERDTree git integration
  Plug 'Xuyuanp/nerdtree-git-plugin'

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

  Plug 'wellle/targets.vim'

  " file fuzzy search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'vimwiki/vimwiki'
  Plug 'mattn/calendar-vim'
  Plug 'mzlogin/vim-markdown-toc'
  Plug 'vim-scripts/utl.vim'
  Plug 'jkramer/vim-checkbox'

  " count and index matches in a search
  Plug 'google/vim-searchindex'

  " display ctag description (when completing)
  Plug 'majutsushi/tagbar'

  " Use release branch (recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Coc Extensions to install coc-marketplace

  " View and search LSP symbols, tags in Vim/NeoVim
  Plug 'liuchengxu/vista.vim'

  " automatically open/close quotes and brackets
  Plug 'jiangmiao/auto-pairs'

  " generate tags automatically
  " Plug 'ludovicchabant/vim-gutentags'
  Plug 'jsfaint/gen_tags.vim'

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

  " toggle comments
  Plug 'tpope/vim-commentary'

  " Asynchronous build and test dispatcher
  Plug 'tpope/vim-dispatch'

  " git integration for Vim
  Plug 'tpope/vim-fugitive'

  " continuously updated session files
  Plug 'tpope/vim-obsession'

  " repeat last modification regarding to Plugin editions
  Plug 'tpope/vim-repeat'

  " parentheses, brackets, quotes, html tags surrounding plugin
  Plug 'tpope/vim-surround'

  Plug 'sheerun/vim-polyglot'

  Plug 'ryanoasis/vim-devicons'

  Plug 'dart-lang/dart-vim-plugin'

  " PHP refactoring plugin
  Plug 'vim-php/vim-php-refactoring'

  Plug 'mtth/scratch.vim'

  " Turn vim into a REPL editor
  Plug 'jpalardy/vim-slime'

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

      Plug 'phpactor/phpactor',  {'do': 'composer install -d ~/.vim/plugged/phpactor', 'for': 'php'}

      Plug 'ncm2/ncm2'
      Plug 'roxma/nvim-yarp'
      Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
      Plug 'phpactor/ncm2-phpactor'
      Plug 'ncm2/ncm2-jedi'
      Plug 'ncm2/ncm2-ultisnips'
      Plug 'ncm2/float-preview.nvim'

      " nvim markdown preview
      Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

  endif

call plug#end()

" load the version of matchit.vim that ships with vim
runtime macros/matchit.vim

" ==================================================
" ==================== Settings ====================
" ==================================================

" ************* vim-airline settings *************
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

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
"
" ************* FZF settings *************
" Open fzf in a floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Function' } }

" ************* VimWiki settings *************
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = ' ○◐●x'
let g:vimwiki_folding = 'list'
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_table_mappings = 0
let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 1
" let g:vimwiki_toc_link_format = 1

" ************* vim-checkbox settings *************
let g:insert_checkbox_prefix = '- '
" Remove default mapping
silent! unmap <leader>tt

" ************* vim-slime settings *************
let g:slime_target = 'tmux'
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}


" ************* Startify settings *************
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
    \ { 'header': ['   Commands'],                     'type': 'commands',       },
    \ { 'header': ['   Files'],                        'type': 'files' },
    \ { 'header': ['   Current Directory '. getcwd()], 'type': 'dir' },
    \ { 'header': ['   Sessions'],                     'type': 'sessions' },
    \ { 'header': ['   Bookmarks'],                    'type': 'bookmarks',       },
    \ ]
let g:startify_bookmarks = [ {'c': resolve(expand('~/.vimrc'))}, '~/.zshrc' ]
let g:startify_commands = [
    \ {'o': ['Start saving session (Obsess)', ':Obsess']},
    \ {'u': ['Upgrade vim-plug and Install and Update plugins', ':PlugUpgrade | :PlugInstall | :PlugUpdate']},
    \ ]

" ************* Ememt settings *************
let g:user_emmet_leader_key = '<C-z>'

" ************* PHP refactoring settings *************
let g:php_refactor_command = 'php /usr/local/bin/refactor.phar'

" ************* Golden Ratio settings *************
let g:golden_ratio_autocommand = 0

" ************* Vista settings *************
let g:vista_default_executive = 'coc'
let g:vista_cursor_delay = 100
let g:vista_echo_cursor_strategy = 'scroll'
let g:vista_update_on_text_changed = 1
let g:vista_close_on_jump = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_executive_for = {
    \ 'vim': 'ctags',
\ }

" ************* Obsession settings *************
set statusline+=%{ObsessionStatus()}

" VIM specific Plugins
if !has('nvim')
    " ************* syntastic settings *************
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_error_symbol = "✗"
    let g:syntastic_warning_symbol = "⚠"
    let g:syntastic_always_populate_loc_list = 1  " Make syntastic work with :lnext and :lprev
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_pylint_args = "--load-plugins pylint_django"

    " ************* Youcompleteme settings *************
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_collect_identifiers_from_tags_files = 0
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
endif

" ************* SuperTab settings *************
let g:SuperTabDefaultCompletionType = '<C-n>'

" ************* Scratch settings *************
let g:scratch_filetype = 'vimwiki'
let g:scratch_persistence_file = '~/wiki/Scratchpad.md'

" NeoVim specific Plugins
if has('nvim')
    " ************* gen_tags settings *************
    let g:gen_tags#ctags_auto_gen = 1
    let g:gen_tags#gtags_auto_gen = 1

    " ************* Neomake settings *************
    " Full config: when writing or reading a buffer, and on changes in insert and
    " normal mode (after 1s; no delay when writing).
    call neomake#configure#automake('nrwi', 500)

    " ************* Ncm2 float-preview settings *************
    let g:float_preview#docked = 1
endif

" ************* Custom Snippets *************
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "customsnippets"]

" ************* Targets *************
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'b': {'pair': [{'o':'(', 'c':')'}]}
    \ })


" ================================================================
" ==================== Personal Customization ====================
" ================================================================
" turn on syntax highlighting
syntax on
" and set onedark as colorscheme
colorscheme onedark
" enable plugin TODO: edit this comment to a better explanation
filetype plugin on


" Special highlighting settings
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
highlight Comment cterm=italic gui=italic







" ================================================================
" ===================== C Specific Settings ======================
" ================================================================
augroup c_customcommentstring
    autocmd!

    autocmd FileType c setlocal commentstring=//%s
    autocmd FileType cpp setlocal commentstring=//%s
augroup end


" ================================================================
" ============= Dart Specific Settings (for Flutter) =============
" ================================================================
augroup flutter_setup
    autocmd!

    autocmd FileType dart UltiSnipsAddFiletypes dart-flutter
augroup end


" ================================================================
" ==================== PHP Specific Settings =====================
" ================================================================
" let php_folding=1
let php_sql_query = 1
let php_htmlInStrings = 1
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
