" Vim syntax file
" Language:     Vim note file
" Maintainer:   Bram Moolenaar (Bram@vim.org)
" Last Change:  2006 May 13

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

"|abc|
"*abc*
"$abc$
"#abc#
"@abc@
"~abc~
"(line start);.....
"^abc^
"[Question]...
"[NOTE]

" Different color scheme
syn match noteBlue              /|\S[^|]\+|/ contains=noteBar          "acturally we are using this
syn match noteYellow            /\*[^*]\+\*/ contains=noteStar
syn match noteCyan              /\$[^$]\+\$/ contains=noteDollar
syn match noteGreen             /\#[^#]\+\#/  contains=notePound
syn match noteDark              /@[^@]\+@/ contains=noteAnd
syn match noteUnderlined        /\~[^~]\+\~/ contains=noteUnknown
syn match notePink              /\^[^\^]\+\^/ contains=noteArrow
syn match noteQuestion          /\[Question\]\p*$/
syn match noteNote              /\[NOTE\]/
" specific symbol
syn match noteBar               contained "|"
syn match noteStar              contained "\*"
syn match noteDollar            contained "\$"
syn match notePound             contained "#"
syn match noteAnd               contained "@"
syn match noteUnknown           contained "\~"
syn match noteSemi              contained "^;"
syn match noteArrow             contained "\^"

" Section Split
syn match noteSectionDelim	"^=\{3,}.*===$"
syn match noteSectionDelim	"^-\{3,}.*--$"

" Comments
syn match noteComment           /^;\p\+$/ contains=noteSemi


hi def link noteBlue            Identifier
hi def link noteBar             Ignore
hi def link noteStar            Ignore
hi def link noteDollar          Ignore
hi def link notePound           Ignore
hi def link noteAnd             Ignore
hi def link noteUnknown         Ignore
hi def link noteSemi            Ignore
hi def link noteArrow           Ignore
hi def link noteYellow          String
hi def link noteCyan            Title
hi def link noteGreen           Type
hi def link noteDark            Comment
hi def link noteUnderlined      Underlined
hi def link noteSectionDelim    Title
hi def link noteComment         Comment
hi def link notePink            Question
hi def link noteQuestion        Todo
hi def link noteNote            Todo

" vim: ts=8 sw=2
