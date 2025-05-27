" plugins
call plug#begin()

" List your plugins here
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

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


set tabstop=2
set number
set hlsearch
set incsearch
set autoindent
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set mouse=a
set clipboard=unnamed

set termguicolors
syntax on
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
filetype plugin indent on
set paste

let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

let mapleader=' '
nnoremap <C-t> :terminal<CR>
nnoremap <C-e> :Ex<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
