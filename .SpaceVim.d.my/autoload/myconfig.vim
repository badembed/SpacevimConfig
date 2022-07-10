function! myconfig#before() abort
endfunction

function! myconfig#after() abort
    " map <C-f> :Files<CR>
    nnoremap <C-f> :Files<cr>
    inoremap <C-f> <Esc>:Files<cr>
    nnoremap <F2> :update<cr>
    inoremap <F2> <Esc>:update<cr>gi
endfunction
