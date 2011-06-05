" Title: checklist.vim - v0.65
" Summary: Vim script for creating a checklist.
" Last Modified: 06.04.2011 07:11 AM
" Maintainer: Chris Truett <http://www.theywillknow.us>
" Description: Checklist.vim is a super-simple way to create todo lists.
"---------------------------------------------------------------------"
" Only load plugin once
if exists("manage_checklist")
  finish
endif
"---------------------------------------------------------------------"
if g:checklist_use_timestamps == 0
  let g:checklist_use_timestamps = 0
else
  let g:checklist_use_timestamps = 1
endif
"---------------------------------------------------------------------"
let manage_checklist = 1
"---------------------------------------------------------------------"
function! CheckLine(line, direction, offset)
  if a:direction == '+'
    let l:line = getline(line(a:line) + a:offset)
  elseif a:direction == '-'
    let l:line = getline(line(a:line) - a:offset)
  endif
  if match(l:line, '^\s*$') >= 0
    return "Empty"
  else
    return "Not Empty"
  endif
endfunction
"---------------------------------------------------------------------"
function! MakeItem ()
  let l:line = getline(line(".") - 1)

  if CheckLine('.','-',1) == 'Empty'
    if line('.') == 1
      exe 'normal I+ '
    else
      exe 'normal ddo+ '
    endif
    return ''
  elseif match(l:line, '\V+ ') >= 0
    exe "normal i* "
    normal v>
    return ''
  elseif match(l:line, '\V* ') >= 0
    exe "normal i* "
    return ''
  elseif match(l:line, '\V× ') >= 0
    normal i* 
    return ''
  else
    return ''
  endif
endfunction
"---------------------------------------------------------------------"
function! ToggleItem ()
  let current_line = getline('.')
  let l:line = getline(line(".") - 1)

  if match(current_line,'\V* ') >= 0
    echo "Item checked."
    exe 's/\V* /× /'
    let time = strftime("%m.%d.%Y at %I:%M %p")
    if g:checklist_use_timestamps == 1
      exe "normal a ".time." :"
    endif
    return ""
  elseif match(current_line,'\V× ') >= 0
    echo "Item unchecked."
    if g:checklist_use_timestamps == 1
      exe 's/\× \d\{2}\.\d\{2}\.\d\{4} at \d\{2}:\d\{2} [A|P]M :/*/i'
    elseif g:checklist_use_timestamps == 0
      exe 's/\V× /* /i'
    endif
    return ""
  endif

  if match(current_line,'^+ ') >= 0
    if CheckLine('.','+',1) == 'Empty'
    elseif CheckLine('.','+',2) == 'Empty'
    else
      exe 's/\V+ /- /i'
      normal jzc
      normal k
    endif
    return ""
  elseif match(current_line,'^- ') >= 0
    if CheckLine('.','+',1) == 'Empty'
    elseif CheckLine('.','+',2) == 'Empty'
    else
      exe 's/\V- /+ /i'
      normal jzo
      normal k
    endif
    return ""
  endif
endfunction

imap <leader>v  <C-R>=MakeItem()<CR><End>
nmap <leader>v  :call MakeItem()<CR>i<End>
nmap <leader>vv :call ToggleItem()<CR><End>
