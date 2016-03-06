let mapleader = ','

syntax enable
colorscheme grb256

set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on 
" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" for ctrlp
set runtimepath^=~/.vim/bundles/ctrlp.vim
" Allows for the opening of a new file when open file has unsaved changes
set hidden
" displays line numbers
set number
" display information on current command
set showcmd
" use spaces instead of tabs
set expandtab
set tabstop=2
" makes spaces feel like tabs
set sts=2
" spaces insert when indenting
set shiftwidth=2
set mouse=n
set wildmenu
set guioptions-=T
set t_Co=256
set winwidth=84
set backspace=2
" We have to have a winheight bigger than we want to set winminheight. But if
" " we set winheight to be huge before winminheight, the winminheight set will
" " fail.  This se
"set winheight=8
"set winminheight=8
"set winheight=999

:set wildignore+=vendor/**
:set wildignore+=public/images
:set wildignore+=*.png
:set wildignore+=*.jpg
:set wildignore+=*.gif
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"switch between last 2 files
nnoremap <leader><leader> <c-^>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nnoremap <C-n> :call NumberToggle()<cr>
map <leader>e :edit %%
map <leader>v :view %%
noremap <leader>w :<CR>
"set ctrl p to search in certain folders
map <leader>gv :CtrlP app/views
map <leader>gc :CtrlP app/controllers
map <leader>gm :CtrlP app/models
map <leader>gb :CtrlPBuffer
map <leader>ga :CtrlPMixed
"run feature file
map <leader>f :call RunWip()<cr>
"run spec for current file
map <leader>t :call RunTestFile()<cr>
"run spec for what is under cursor
map <leader>T :call RunNearestTest()<cr>
"run spec for entire app
map <leader>a :call RunTests('spec')<cr>
map <leader>r :call 
"use ctrl + k,j,h,l to navigate splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"maps ctrl-l to input =>
"imap <c-l> <space>=><space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

"renames file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

"copy files
function! CopyFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        redraw!
    endif
endfunction
map <leader>c :call CopyFile()<cr>


"Runs test within app
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!chruby 1.9.3;bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the
  " previously-marked file.
  let in_spec_file = match(expand("%"), '$') != -1
  if in_spec_file
    call SetTestFile()
  elseif
    !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file.command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

function! RunWip(...)
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!bundle exec rspec -t @wip"
endfunction

function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

