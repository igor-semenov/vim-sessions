
function! s:GetOpenFiles() abort
  let all_bufs = getbufinfo({'buflisted': 1})
  let result = []
  let first = ''
  let cur_nr = bufnr('%')
  for buf in all_bufs
    let buf_type = getbufvar(buf.bufnr, '&buftype')
    if (buf.name == '') || (buf_type =~ 'nofile')
      continue
    endif
    let good_name = fnamemodify(buf.name, ':~')
    if (buf.bufnr == cur_nr) || (first == '')
      let first = good_name
    endif
    let result += ['badd +' . buf.lnum .  ' ' . good_name]
  endfor
  if first != ''
    let result += ['bd']
    let result += ['edit ' . first]
  endif
  return result
endfunction

function! sessions#MakeSession(filename) abort
  let session = s:GetOpenFiles()
  call writefile(session, a:filename)
endfunction

function! sessions#LoadSession(filename) abort
  if (filereadable(a:filename))
    exe 'source ' a:filename
  else
    echo "No session loaded."
  endif
endfunction

