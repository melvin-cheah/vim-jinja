" Figure out which type of hilighting to use for html.
fun! s:SelectHTML()
  let n = 1
  while n < 50 && n <= line("$")
    " check for jinja
    if getline(n) =~ '{{.*}}\|{%-\?\s*\(end.*\|extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      set ft=jinja.html
      return
    endif
    let n = n + 1
  endwhile
endfun
autocmd BufNewFile,BufRead *.html,*.htm call s:SelectHTML()
autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja,*.nunjucks,*.nunjs,*.njk set ft=jinja

" Support *.jinja.<filetype> extension style
" Use <filetype> as the other filetype, too

fun! s:SelectJinjaMainFiletype()
  " Set only to jinja (instead of <filetype>.jinja, and allow syntax/jinja.vim
  " to source the right syntax/<filetype>.vim file
  set ft=jinja
  let b:jinjaOutputFiletype=expand('%:e')
endfun

autocmd BufNewFile,BufRead *.jinja2.*,*.j2.*,*.jinja.*,*.nunjucks.*,*.nunjs.*,*.njk.* call s:SelectJinjaMainFiletype()
