" Vim syntax file
setlocal iskeyword+=:
" Language:     Jack
" Maintainer:   Michael Schroeder

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
setlocal iskeyword+=?
setlocal iskeyword+=!

set tabstop=4

let b:current_syntax = "jack"

syn keyword jackTodo class method constructor function
syn region jackComment start="\/\*" end="\*\/"
syn region jackComment start="\/\/" end="\n"
syn keyword jackConstant null
syn keyword jackBoolean true false
syn region jackString  start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=jackSpecial,@Spell
syn match jackNumber "\<0\>"
syn match jackNumber "\<[1-9][0-9]*\>"
syn keyword jackType void int boolean String char Array
syn keyword jackConditional if else
syn keyword jackRepeat while
syn keyword jackKeyword var field static
syn keyword jackFunction return let do  


highlight link jackTodo                Todo
highlight link jackComment             Comment
highlight link jackConstant            Constant
highlight link jackBoolean             Boolean
highlight link jackString              String
highlight link jackNumber              Number
highlight link jackType                Type
highlight link jackConditional         Conditional
highlight link jackRepeat              Repeat
highlight link jackKeyword             Keyword
highlight link jackFunction            Function
