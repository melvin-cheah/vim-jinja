" jinja syntax file
" Language: Jinja HTML template
" Maintainer: Hsiaoming Yang <lepture@me.com>
" Last Change: Sep 13, 2012

" only support 6.x+

if !exists("b:bg_color")
  let b:bg_color = 17
endif

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = expand('%:e')
endif

exe "runtime! syntax/" . main_syntax . ".vim"
unlet b:current_syntax

syntax case match

" jinja template built-in tags and parameters
" 'comment' doesn't appear here because it gets special treatment
syn keyword jinjaStatement contained if else elif endif is not
syn keyword jinjaStatement contained for in recursive endfor
syn keyword jinjaStatement contained raw endraw
syn keyword jinjaStatement contained block endblock extends super scoped
syn keyword jinjaStatement contained macro endmacro call endcall
syn keyword jinjaStatement contained from import as do continue break
syn keyword jinjaStatement contained filter endfilter set endset
syn keyword jinjaStatement contained include ignore missing
syn keyword jinjaStatement contained with without context endwith
syn keyword jinjaStatement contained trans endtrans pluralize
syn keyword jinjaStatement contained autoescape endautoescape

" jinja templete built-in filters
syn keyword jinjaFilter contained abs attr batch capitalize center default
syn keyword jinjaFilter contained dictsort escape filesizeformat first
syn keyword jinjaFilter contained float forceescape format groupby indent
syn keyword jinjaFilter contained int join last length list lower pprint
syn keyword jinjaFilter contained random replace reverse round safe slice
syn keyword jinjaFilter contained sort string striptags sum
syn keyword jinjaFilter contained title trim truncate upper urlize
syn keyword jinjaFilter contained wordcount wordwrap

" jinja template built-in tests
syn keyword jinjaTest contained callable defined divisibleby escaped
syn keyword jinjaTest contained even iterable lower mapping none number
syn keyword jinjaTest contained odd sameas sequence string undefined upper

syn keyword jinjaFunction contained range lipsum dict cycler joiner


" Keywords to highlight within comments
syn keyword jinjaTodo contained TODO FIXME XXX

" jinja template constants (always surrounded by double quotes)
syn region jinjaArgument contained start=/"/ skip=/\\"/ end=/"/
syn region jinjaArgument contained start=/'/ skip=/\\'/ end=/'/
syn keyword jinjaArgument contained true false

" Mark illegal characters within tag and variables blocks
syn match jinjaTagError contained "#}\|{{\|[^%]}}\|[&#]"
syn match jinjaVarError contained "#}\|{%\|%}\|[<>!&#%]"
syn cluster jinjaBlocks add=jinjaTagBlock,jinjaVarBlock,jinjaComBlock,jinjaComment

" jinja template tag and variable blocks
syn region jinjaTagBlock start="{%" end="%}" contains=jinjaStatement,jinjaFilter,jinjaArgument,jinjaFilter,jinjaTest,jinjaTagError display containedin=ALLBUT,@jinjaBlocks
syn region jinjaVarBlock start="{{" end="}}" contains=jinjaFilter,jinjaArgument,jinjaVarError display containedin=ALLBUT,@jinjaBlocks
syn region jinjaComBlock start="{#" end="#}" contains=jinjaTodo containedin=ALLBUT,@jinjaBlocks


" Link all items/regions/matches to corresponding type and
" change BG colour for all Jinja code
" Need to explicitly reset ctermfg to its current value, so use a function
function HiLinkAndChangeBg(item, corresponding_type)
  exe "hi def link " . a:item . " " . a:corresponding_type
  let fg_color=synIDattr(synIDtrans(hlID(a:item)), 'fg')
  exe "hi " . a:item . "  ctermfg=" . fg_color . " ctermbg=" . b:bg_color
endfun

call HiLinkAndChangeBg("jinjaTagBlock",   "PreProc") 
call HiLinkAndChangeBg("jinjaVarBlock",   "PreProc") 
call HiLinkAndChangeBg("jinjaStatement",  "Statement") 
call HiLinkAndChangeBg("jinjaFunction",   "Function") 
call HiLinkAndChangeBg("jinjaTest",       "Type") 
call HiLinkAndChangeBg("jinjaFilter",     "Identifier") 
call HiLinkAndChangeBg("jinjaArgument",   "Constant") 
call HiLinkAndChangeBg("jinjaTagError",   "Error") 
call HiLinkAndChangeBg("jinjaVarError",   "Error") 
call HiLinkAndChangeBg("jinjaError",      "Error") 
call HiLinkAndChangeBg("jinjaComment",    "Comment") 
call HiLinkAndChangeBg("jinjaComBlock",   "Comment") 
call HiLinkAndChangeBg("jinjaTodo",       "Todo") 


let b:current_syntax = "jinja"
