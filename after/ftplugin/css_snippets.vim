" Latest Revision:  2008-11-11

if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

function! GetBasicSnippet(key, elementName)
	return "Snippet ".a:key." ".a:elementName." {<CR>".g:snip_start_tag.g:snip_end_tag."<CR>}".g:snip_start_tag.g:snip_end_tag
endfunction

" Headding
function! GetHeaddingSnippet(key, elementName)
	return "Snippet ".a:key." ".a:elementName." {<CR>color: ".g:snip_start_tag.g:snip_end_tag.";<CR>font-size: ".g:snip_start_tag.g:snip_end_tag.";<CR>font-family: ".g:snip_start_tag.g:snip_end_tag.";<CR>letter-spacing: ".g:snip_start_tag.g:snip_end_tag.";<CR>margin: ".g:snip_start_tag.g:snip_end_tag.";<CR>padding: ".g:snip_start_tag.g:snip_end_tag.";<CR>}".g:snip_start_tag.g:snip_end_tag
endfunction

" Anchor
function! GetAnchorSnippet(key, elementName)
	return "Snippet ".a:key." ".a:elementName." {<CR>color: ".g:snip_start_tag.g:snip_end_tag.";<CR>text-decoration: ".g:snip_start_tag.g:snip_end_tag.";<CR>}".g:snip_start_tag.g:snip_end_tag
endfunction

" {{{ Elements
" {{{ Top-level Elements
exec GetBasicSnippet("body","body")
exec "Snippet bodye body {<CR>background-color: ".st.et.";<CR>color: ".st.et.";<CR>font-size: ".st.et.";<CR>font-family: ".st.et.";<CR>}".st.et
" }}}
" {{{ Generic Block-level Elements

" Generic block-level container
exec GetBasicSnippet("div","div")

" Heading
exec GetBasicSnippet("h1","h1")
exec GetHeaddingSnippet("h1e","h1")

exec GetBasicSnippet("h2","h2")
exec GetHeaddingSnippet("h2e","h2")

exec GetBasicSnippet("h3","h3")
exec GetHeaddingSnippet("h3e","h3")

exec GetBasicSnippet("h4","h4")
exec GetHeaddingSnippet("h4e","h4")

exec GetBasicSnippet("h5","h5")
exec GetHeaddingSnippet("h5e","h5")

exec GetBasicSnippet("h6","h6")
exec GetHeaddingSnippet("h6e","h6")

" Horizonatal rule
exec GetBasicSnippet("hr","hr")

" Paragraph
exec GetBasicSnippet("para","p")
" }}}
" {{{ Lists
" List item
exec GetBasicSnippet("li","li")

" Unordered list
exec GetBasicSnippet("ul","ul")

" Ordered list
exec GetBasicSnippet("ol","ol")
" }}}
" {{{ Tables
" Table
exec GetBasicSnippet("table","table")

" Table row
exec GetBasicSnippet("tr","tr")

" Table header cell
exec GetBasicSnippet("th","th")
exec "Snippet the th {<CR>font-size: ".st.et.";<CR>font-family: ".st.et.";<CR>padding-top: ".st.et.";<CR>padding-left: ".st.et.";<CR>padding-right: ".st.et.";<CR>padding-bottom: ".st.et.";<CR>}".st.et

" Table data cell
exec GetBasicSnippet("td","td")
exec "Snippet tde td {<CR>font-size: ".st.et.";<CR>font-family: ".st.et.";<CR>padding-top: ".st.et.";<CR>padding-left: ".st.et.";<CR>padding-right: ".st.et.";<CR>padding-bottom: ".st.et.";<CR>}".st.et
" }}}
" {{{ Forms

" }}}
" {{{ Special Inline Elements

" Anchor
exec GetAnchorSnippet("a:link","a:link")
exec GetAnchorSnippet("a:visited","a:visited")
exec GetAnchorSnippet("a:active","a:active")
exec GetAnchorSnippet("a:hover","a:hover")

" Image map
exec GetAnchorSnippet("img","img")
" }}}
" {{{ Phrase Elements
" Computer code
" exec "Snippet code <code>".st.et."</code>".st.et
" Emphasis
" exec "Snippet em <em>".st.et."</em>".st.et
" }}}
" }}}

" exec "Snippet visibility ".st.et.";".st.et
" exec "Snippet list list-style-image: url(".st.et.");".st.et
" exec "Snippet text text-shadow: rgb(".st.et.", ".st.et.", ".st.et.", ".st.et." ".st.et." ".st.et.";".st.et
" exec "Snippet overflow overflow: ".st.et.";".st.et
" exec "Snippet white white-space: ".st.et.";".st.et
" exec "Snippet clear cursor: url(".st.et.");".st.et
" exec "Snippet margin padding-top: ".st.et.";".st.et
" exec "Snippet background background #".st.et." url(".st.et.") ".st.et." ".st.et." top left/top center/top right/center left/center center/center right/bottom left/bottom center/bottom right/x% y%/x-pos y-pos')".et.";".st.et
" exec "Snippet word word-spaceing: ".st.et.";".st.et
" exec "Snippet z z-index: ".st.et.";".st.et
" exec "Snippet vertical vertical-align: ".st.et.";".st.et
" exec "Snippet marker marker-offset: ".st.et.";".st.et
" exec "Snippet cursor cursor: ".st.et.";".st.et
" exec "Snippet border border-right: ".st.et."px ".st.et." #".st.et.";".st.et
" exec "Snippet display display: block;".st.et
" exec "Snippet padding padding: ".st.et." ".st.et.";".st.et
" exec "Snippet letter letter-spacing: ".st.et."em;".st.et
" exec "Snippet color color: rgb(".st.et.", ".st.et.", ".st.et.");".st.et
" exec "Snippet font font-weight: ".st.et.";".st.et
" exec "Snippet position position: ".st.et.";".st.et
" exec "Snippet direction direction: ".st.et.";".st.et
" exec "Snippet float float: ".st.et.";".st.et
