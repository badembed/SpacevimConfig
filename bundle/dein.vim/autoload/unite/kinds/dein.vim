function! unite#kinds#dein#define() abort
  return s:kind
endfunction

let s:kind = {
      \ 'name': 'dein',
      \ 'action_table': {},
      \ 'parents': ['uri', 'directory'],
      \ 'default_action': 'lcd',
      \}

" Actions
let s:kind.action_table.preview = {
      \ 'description': 'view the plugin documentation',
      \ 'is_quit': 0,
      \ }
function! s:kind.action_table.preview.func(candidate) abort
  " Search help files.
  let readme = get(globpath(a:candidate.action__path, 'doc/*.?*',
        \ v:true, v:true), 0, '')

  if readme ==# ''
    " Search README files.
    let readme = get(globpath(a:candidate.action__path, 'README*',
          \ v:true, v:true), 0, '')
    if readme ==# ''
      return
    endif
  endif

  let buflisted = buflisted(
        \ unite#util#escape_file_searching(readme))

  execute 'pedit' fnameescape(readme)

  " Open folds.
  normal! zv
  normal! zt

  if !buflisted
    call unite#add_previewed_buffer_list(
          \ bufnr(unite#util#escape_file_searching(readme)))
  endif
endfunction
