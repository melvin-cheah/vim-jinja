" Figure out which type of highlighting to use for html.
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
" Use <filetype> as the main_syntax
" This allows any text editor to syntax highlight non-jinja bits still

fun! s:SelectJinjaMainFiletype()
  " Set only to jinja (instead of <filetype>.jinja, and allow syntax/jinja.vim
  " to source the right syntax/<filetype>.vim file
  set ft=jinja
  let b:jinjaOutputFiletype=expand('%:e')
endfun

autocmd BufNewFile,BufRead *.jinja2.*,*.j2.*,*.jinja.*,*.nunjucks.*,*.nunjs.*,*.njk.* call s:SelectJinjaMainFiletype()
