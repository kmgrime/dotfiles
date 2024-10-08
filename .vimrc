"" statusline
set laststatus=2
set statusline=                          " left align
set statusline+=%2*\                     " blank char
set statusline+=%2*\%{StatuslineMode()}
set statusline+=%2*\                     " blank char
set statusline+=%4*\%{b:gitbranch}       " include git branch              
set statusline+=%=                       " right align
set statusline+=%*
set statusline+=%3*\%h%m%r               " file flags (help, read-only, modified)
set statusline+=%1*\ %f                  " short filename
set statusline+=%3*\:                    " seperator
set statusline+=%3*\%l/%L\:              " line count
set statusline+=%3*\%y                   " file type
hi User1 ctermbg=black ctermfg=grey guibg=black guifg=grey
hi User2 ctermbg=green ctermfg=black guibg=green guifg=black
hi User3 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen

"" statusline functions
function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"n"
        return "NORMAL"
    elseif l:mode==?"v"
        return "VISUAL"
    elseif l:mode==#"i"
        return "INSERT"
    elseif l:mode==#"R"
        return "REPLACE"
    endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      lcd %:p:h
    catch
      return
    endtry
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
    endif
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

" Options
set encoding=UTF-8
set fileencoding=utf-8
set tabstop=2
set spelllang=en_us,no_nb
set nobackup
set nowritebackup
set linebreak
set scrolloff=8
set noswapfile
set smartindent
set autoindent
set number
set hlsearch
set incsearch
set autoindent
set encoding=utf-8
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set mouse=a
set clipboard=unnamed
set termguicolors
set paste

" Use a line cursor within insert mode and a block cursor everywhere else.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

syntax on
colorscheme torte
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
filetype plugin indent on

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Set leader key
let mapleader=' '
let maplocalleader=' '

" Disable the spacebar key's default behavior in Normal and Visual modes
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>

"Key maps
noremap <leader>t :terminal<CR>
noremap <silent> <leader>e :Lex<CR>

" Navigate between splits
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>

" Navigate buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>sb :buffers<CR>:buffer<Space>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
