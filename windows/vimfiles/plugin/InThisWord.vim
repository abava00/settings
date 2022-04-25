let tmp=""
for key1 in split("dcyv",'\zs')
  for key2 in split("ia",'\zs')
    for key3 in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_,./?\\;+:*@-=^~!#$%&",'\zs')
      if key2=="a"
        if key1=="v"
          execute 'nnoremap ' . key1 . key2 . key3 . ' ' . '<Space>F' . key3 . 'vf' . key3
        else
          execute 'nnoremap ' . key1 . key2 . key3 . ' ' . '<Space>F' . key3 . 'vf' . key3 . key1
        endif
      else
        if key1=="v"
          execute 'nnoremap ' . key1 . key2 . key3 . ' ' . '<Space>F' . key3 . 'lvf' . key3 . 'h'
        else
          execute 'nnoremap ' . key1 . key2 . key3 . ' ' . '<Space>F' . key3 . 'lvf' . key3 . 'h' . key1
        endif
      endif
    endfor
  endfor
endfor

" １～０を!～)に変換する
function! MyConbart(number)
  if a:number=="1"
    return "!"
  elseif a:number=='2'
    return '"'
  elseif a:number=='3'
    return '#'
  elseif a:number=='4'
    return '$'
  elseif a:number=='5'
    return '%'
  elseif a:number=='6'
    return '&'
  elseif a:number=="7"
    return "'"
  "elseif a:number=="8"
    "return "("
  "elseif a:number=="9"
    "return ")"
  elseif a:number=="0"
    return "~"
  else
    return a:number
  endif
endfunction
