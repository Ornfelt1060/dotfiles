" Vim syntax file
if exists("b:current_syntax")
  finish
endif

"let b:current_syntax=wiki

" Regions
"syn region wikiElementRegion start='x' end='y'

syn region wikiBlueRegion start='<b' end='>'
syn region wikiCyanRegion start='<c' end='>'
syn region wikiGreenRegion start='<g' end='>'
syn region wikiPurpleRegion start='<p' end='>'
syn region wikiRedRegion start='<r' end='>'
syn region wikiOrangeRegion start='<o' end='>'
syn region wikiYellowRegion start='<y' end='>'

syn region wikiDateRegion start='<--' end='-->'
"syn match wikiDot "[^\x00-\x7F]"
syn match wikiDot "[^\u0020-\u007F\u00C0-\u00FF]"
syn match wikiLine "--"
syn match wikiStar "*"
syn match wikiComment "#"
