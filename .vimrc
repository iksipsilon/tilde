let g:lisp_rainbow=1

let &t_SI = "\e[5 q"  " Blinking vertical bar in insert mode
let &t_EI = "\e[1 q"  " Blinking block in normal mode
let &t_SR = "\e[4 q"  " Blinking underscore in replace mode

set number

set tabstop=4

nnoremap <C-Q> <C-V>    " to map Ctrl+Q to Visual Block mode
