set history=50
set clipboard=unnamed
set number
inoremap <ctrl-w> <up>
inoremap <ctrl-a> <left> 
inoremap <ctrl-s> <down>
inoremap <ctrl-d> <right>

inoremap ！ !
inoremap （ (
inoremap ） )
inoremap 【 [
inoremap 】 ]
inoremap ； ;
inoremap ： :
inoremap ‘ '
inoremap “ "
inoremap ， ,
inoremap 。 .
inoremap ？ ?

vnoremap 1 <Esc>
vnoremap ! <Esc>
vnoremap f <Esc>a
vnoremap F <Esc>i

noremap ! :w<enter>
noremap > >>
noremap < <<
noremap @ :q<enter>

noremap q b
noremap Q B
noremap w k
noremap W <c-u>
noremap e w
noremap E W
noremap r :

noremap a h
noremap A 0
noremap s j
noremap S <c-d>
noremap d l
noremap D $
noremap f a
noremap F i
noremap h "_d
noremap H "_x
noremap j v
noremap J V
noremap k k
noremap l l
noremap L L

noremap z u
noremap Z <C-r>
noremap x x
noremap X Ydd
noremap c y
noremap C Y
noremap v p
noremap V P
noremap b B
noremap B B
noremap n ggVG
noremap N ggVG
noremap m =
noremap M ggVG=
