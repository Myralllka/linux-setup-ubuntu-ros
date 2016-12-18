" set path for filename suggestions
" ** means "in any subfolder"
set path+=~/git/**

" where should vim look for the tags?
" tags are generated by ctags utility
" multiple paths should be separated by comma
set tags+=~/tags,~/tags-once

""""""""""""""""""""""""""""""" map the leader key
let mapleader = ","
" key bindings for vimmux
"
" build 1
map <Leader>m :call VimuxRunCommand("cd ~/ros_workspace; catkin build")<CR>
" build2
map <Leader>j :call VimuxRunCommand("cd ~/ros_workspace; catkin build mbzirc_odom")<CR>
" close the vimmux window
map <Leader>l :VimuxCloseRunner<CR>
" building ctags
command! MakeTags :call VimuxRunCommand("generateTags; :q")<CR>
"
"""""""""""""""""""""""""""""""

" customize bookmarks in startify
let g:startify_bookmarks = [
            \ { 'b': '~/.bashrc' },
            \ { 'v': '~/.vimrc' },
            \ { 'p': '~/git/linux-setup/appconfig/vim/startify_quotes.txt' },
            \ ]
