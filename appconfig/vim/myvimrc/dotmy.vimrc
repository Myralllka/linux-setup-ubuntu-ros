" set path for filename suggestions
" ** means "in any subfolder"
set path+=~/git/**
set path+=~/.vim/UltiSnips/**

" those will be ignored by ctrl+P and vimgrep
set wildignore+=*/git/mbzirc/*,*/Downloads/*,*/Desktop/*,*/build/*

" where should vim look for the tags?
" tags are generated by ctags utility
" multiple paths should be separated by comma
set tags+=~/tags,~/tags-once

command! MakeTags :call VimuxRunCommand("generateTags; :q")<CR>
map <Leader>l :VimuxCloseRunner<CR>
map <Leader>wc :call VimuxRunCommand("cd ~/git/notes; nohup ./save_and_update.sh & exit")<CR>

" customize bookmarks in startify
let g:startify_bookmarks = [
      \ { 'a': '~/.vim/UltiSnips/athame.snippets' },
      \ { 'b': '~/.bashrc' },
      \ { 'z': '~/.zshrc' },
      \ { 'd': '~/git/linux-setup/appconfig/zsh/dotzshrc' },
      \ { 'i': '~/.i3/config' },
      \ { 't': '~/.tmux.conf' },
      \ { 'v': '~/.vimrc' },
      \ { 'm': '~/.my.vimrc' },
      \ { 'p': '~/git/linux-setup/appconfig/vim/startify_quotes.txt' },
      \ { 'r': '~/git/linux-setup/appconfig/ranger/rc.conf' },
      \ ]
