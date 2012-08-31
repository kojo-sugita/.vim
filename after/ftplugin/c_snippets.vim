" Latest Revision:  2008-08-07

if !exists('loaded_snippet') || &cp
	finish
endif

" {{{ vim functions
function! Count(haystack, needle)
	let counter = 0
	let index = match(a:haystack, a:needle)
	while index > -1
		let counter = counter + 1
		let index = match(a:haystack, a:needle, index+1)
	endwhile
	return counter
endfunction

function! CArgList(count)
	" This returns a list of empty tags to be used as 
	" argument list placeholders for the call to printf
	let st = g:snip_start_tag
	let et = g:snip_end_tag
	if a:count == 0
		return ""
	else
		return repeat(', '.st.et, a:count)
	endif
endfunction
	
function! CMacroName(filename)
	let name = a:filename
	let name = substitute(name, '\.','_','g')
	let name = substitute(name, '\(.\)','\u\1','g')
	return name
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" function! GetFunctionSnippet(functionName)
	" return "Snippet ".a:functionName." ".a:functionName."(".g:snip_start_tag."character".g:snip_end_tag.")".g:snip_start_tag.g:snip_end_tag
" endfunction

function! GetFunctionSnippet(functionName,valueName)
	return "Snippet ".a:functionName." ".a:functionName."(".g:snip_start_tag.a:valueName.g:snip_end_tag.")".g:snip_start_tag.g:snip_end_tag
endfunction
"}}}
" {{{ preprocessor
"#include <headerfile>
exec "Snippet #Inc #include <".st.et."><CR>".st.et
exec "Snippet Inc #include <".st.et."><CR>".st.et

"#include "headerfile"
exec "Snippet #inc #include \"".st.et."\"<CR>".st.et
exec "Snippet inc #include \"".st.et."\"<CR>".st.et

"#define
exec "Snippet #def #define ".st.et." ".st.et."<CR>".st.et
exec "Snippet def #define ".st.et." ".st.et."<CR>".st.et

"#undef
exec "Snippet #undef #undef ".st.et."<CR>".st.et
exec "Snippet undef #undef ".st.et."<CR>".st.et

"#if, #ifdef
exec "Snippet #if #if ".st.et."<CR><CR>".st.et."<CR><CR>#endif<CR><CR>".st.et
exec "Snippet #ifdef #ifdef ".st.et."<CR><CR>".st.et."<CR><CR>#endif<CR><CR>".st.et
exec "Snippet #ifndef #ifndef ".st.et."<CR><CR>".st.et."<CR><CR>#endif<CR><CR>".st.et
exec "Snippet #else #else<CR><CR>".st.et
exec "Snippet #elif #elif ".st.et."<CR><CR>".st.et
"}}}
" {{{  structure and enumerate
"struct
exec "Snippet struct struct ".st."tag".et." {<CR>".st.et."<CR>};<CR>".st.et
exec "Snippet DST struct ".st."tag".et." {<CR>".st.et."<CR>};<CR>".st.et
exec "Snippet DTST typedef struct ".st."tag".et." {<CR>".st.et."<CR>} ".st."name".et.";<CR>".st.et

"union
exec "Snippet union union ".st."tag".et." {<CR>".st.et."<CR>};<CR>".st.et
exec "Snippet DUN union ".st."tag".et." {<CR>".st.et."<CR>};<CR>".st.et
exec "Snippet DTUN typedef union ".st."tag".et." {<CR>".st.et."<CR>} ".st."name".et.";<CR>".st.et

"enum
exec "Snippet enum enum ".st."tag".et." {<CR>".st.et."<CR>};<CR>".st.et
exec "Snippet DEN enum ".st."tag".et." {<CR>".st.et."<CR>};<CR>".st.et
exec "Snippet DTEN typedef enum ".st."tag".et." {<CR>".st.et."<CR>} ".st."name".et.";<CR>".st.et

" }}}
" {{{ operators

"sizeof
exec "Snippet sizeof sizeof(".st.et.")".st.et
" }}}

" {{{ statements
"if
exec "Snippet if if ( ".st.et." ) {<CR>".st.et."<CR>} ".st.et
exec "Snippet else else {<CR>".st.et."<CR>}<CR>".st.et

"for
" exec "Snippet for for ( ".st.et." ".st."i".et." = ".st.et."; ".st."i".et." < ".st."count".et."; ".st."i".et." += ".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet for for ( ".st.et." ) {<CR>".st.et."<CR>}<CR>".st.et

"while, do-while
exec "Snippet do do {<CR>".st.et."<CR>} while ( ".st.et." );<CR>".st.et
exec "Snippet while while ( ".st.et." ) {<CR>".st.et."<CR>}<CR>".st.et

"switch
exec "Snippet switch switch ( ".st.et." ) {<CR>".st.et."<CR>}<CR>".st.et
" exec "Snippet case case ".st.et.":".st.et."<CR>break;<CR>".st.et
" exec "Snippet case case ".st.et.":<CR>".st.et."<CR>break;<CR>".st.et
exec "Snippet case case ".st.et.":<CR>".st.et."<CR>break;".st.et
exec "Snippet default default ".st.et.":<CR>".st.et."<CR>break;".st.et
"}}}
" {{{ functions
"main
exec "Snippet main /* main */<CR>int main(void) {".st.et."<CR>return EXIT_SUCCESS;<CR>}<CR>".st.et
exec "Snippet mainarg /* main */<CR>int main(int argc, char *argv[]) {".st.et."<CR>return EXIT_SUCCESS;<CR>}<CR>".st.et

"void
exec "Snippet FV void ".st.et."(".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet FSV static void ".st.et."(".st.et.") {<CR>".st.et."<CR>}<CR>".st.et

"char
exec "Snippet FC char ".st.et."(".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet FSC static char ".st.et."(".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet FUC unsigned char ".st.et."(".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet FSUC static unsigned char ".st.et."(".st.et.") {<CR>".st.et."<CR>}<CR>".st.et

"short
exec "Snippet FS short ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FSS static short ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FUS unsigned short ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FSUS static unsigned short ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et

"int
exec "Snippet FI int ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FSI static int ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FUI unsigned int ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FSUI static unsigned int ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et

"long
exec "Snippet FL long ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FSL static long ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FUL unsigned long ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FSUL static unsigned long ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et

"float
exec "Snippet FF float ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FSF static float ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et

"double
exec "Snippet FD double ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet FSD static double ".st.et."(".st.et.") {<CR>".st.et."<CR>}".st.et
" }}}
" {{{ comments
exec "Snippet header /* header files */<CR>#include <stdio.h><CR>#include <stdlib.h><CR>".st.et
exec "Snippet macro /* macros */<CR>#define ".st.et."<CR>".st.et
exec "Snippet macros /* macros */<CR>#define ".st.et."<CR>".st.et
exec "Snippet structure /* structures */".st.et
exec "Snippet structures /* structures */".st.et
exec "Snippet procedure /* procedures */".st.et
exec "Snippet procedures /* procedures */".st.et
exec "Snippet func /* functions */".st.et
exec "Snippet function /* functions */".st.et
exec "Snippet functions /* functions */".st.et
exec "Snippet / /* ".st.et." */".st.et
exec "Snippet /* /* ".st.et." */".st.et
exec "Snippet // // ".st.et
exec "Snippet debug /* debug */<CR>printf(\"".st.et."\\n\");".st.et

" }}}
" {{{ stdio.h
" void clearerr(FILE *fp)
exec GetFunctionSnippet("clearerr","fp")

" int fclose(FILE *fp)
exec GetFunctionSnippet("fclose","fp")

" int feof(FILE *fp)
exec GetFunctionSnippet("feof","fp")

" int ferror(FILE *fp)
exec GetFunctionSnippet("ferror","fp")

" int fflush(FILE *fp)
exec GetFunctionSnippet("fflush","fp")

" int fgetc(FILE *fp)
exec GetFunctionSnippet("fgetc","fp")

" int fgetpos(FILE *fp, fpos_t *pos)
exec "Snippet fgetpos fgetpos(".st."fp".et.", ".st."pos".et.")".st.et

" char *fgets(char *s, int n, FILE *fp)
exec "Snippet fgets fgets(".st."s".et.", ".st."n".et.", ".st."fp".et.")".st.et
exec "Snippet fgets-e while ( fgets(".st."s".et.", ".st."n".et.", ".st."fp".et.") != NULL ) {<CR>".st.et."<CR>}<CR>".st.et

" FILE *fopen(const char *filename, const char *mode)
exec "Snippet fopen fopen(".st.et.", \"".st."mode".et."\")".st.et
exec "Snippet fopen-e if ((".st."fp".et." = fopen(".st.et.", \"".st."mode".et."\")) == NULL) {<CR>".st.et."<CR>}"

" int fprintf(FILE *fp, const char *format, ...)
exec "Snippet fprintf fprintf(".st."fp".et.", \"".st."\"%s\"".et."\\n\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.");<CR>".st.et

" int fputc(int ch, FILE *fp)
exec "Snippet fputc fputc(".st.et.", ".st."fp".et.")".st.et

" int fputs(const char *s, FILE *fp)
exec "Snippet fputs fputs(".st."s".et.", ".st."fp".et.")".st.et

" size_t fread(void *buf, size_t size, size_t nmemb, FILE *fp)
exec "Snippet fread fread(".st."buf".et.", ".st."size".et." ,".st."nmemb".et." ,".st."fp".et.")".st.et

" FILE *freopen(const char *filename, const char *mode, FILE *fp)
exec "Snippet freopen freopen(".st.et.", \"".st."mode".et."\", ".st."fp".et.")".st.et

" int fscanf(FILE *fp, const char *format, ...)
exec "Snippet fscanf fscanf(".st."fp".et.", \"".st."\"%s\"".et."\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.");<CR>".st.et
exec "Snippet fscanf-e while ( fscanf(".st."fp".et.", \"".st."\"%s\"".et."\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.") != EOF){<CR>".st.et."<CR>}"

" int fseek(FILE *fp, long int offset, int whence)
exec "Snippet fseek fseek(".st."fp".et.", ".st."offset".et.", ".st."whence".et.".)".st.et

" int fsetpos(FILE *fp, const fpos_t *pos)
exec "Snippet fsetpos fsetpos(".st."fp".et.", ".st."pos".et.")".st.et

" long int ftell(FILE *fp)
exec GetFunctionSnippet("ftell","fp")

" size_t fwrite(const void *buf, size_t size, size_t nmemb, FILE *fp)
exec "Snippet fwrite fwrite(".st."buf".et.", ".st."size".et." ,".st."nmemb".et." ,".st."fp".et.")".st.et

" int getc(FILE *fp)
exec GetFunctionSnippet("getc","fp")

" int getchar(void)
exec "Snippet getchar getchar()".st.et
exec "Snippet getchar-e while( ( ".st."ch".et." = getchar() ) != EOF ) {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet getchar-s while( ( ".st."ch".et." = getchar() ) != EOF ) {<CR>if ( ".st."ch".et." == '\\n' ) {<CR>break;<CR>}<CR>".st.et."<CR>}<CR>".st.et

" char *gets(char *s)
exec GetFunctionSnippet("gets","s")
exec "Snippet gets-e fgets(".st."s".et.", ".st."n".et.", stdin);<CR>".st.et

" int perror(const char *s)
exec GetFunctionSnippet("perror","s")

" int printf(const char *format, ...)
exec "Snippet printf printf(\"".st."\"%s\"".et."\\n\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.");<CR>".st.et

" int putc(int ch, FILE *fp)
exec "Snippet putc putc(".st.et.", ".st."fp".et.")".st.et

" int putchar(int ch)
exec GetFunctionSnippet("putchar","")

" int puts(const char *s)
exec GetFunctionSnippet("puts","s")

" int remove(const char *filename)
exec GetFunctionSnippet("remove","filename")

" int rename(const char *old, const char *new)
exec "Snippet rename rename(".st."old".et.", ".st."new".et.")".st.et
"
" void rewind(FILE *fp)
exec GetFunctionSnippet("rewind","fp")

" int scanf(const char *format, ...)
exec "Snippet scanf scanf(\"".st."\"%s\"".et."\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.");<CR>".st.et

" void setbuf(FILE *fp, char *buf)
exec "Snippet setbuf setbuf(".st."fp".et.", ".st."buf".et.")".st.et

" int setvbuf(FILE *fp, char *buf, int mode, size_t size)
exec "Snippet setvbuf setvbuf(".st."fp".et.", ".st."buf".et." ,".st."mode".et.", ".st."size".et.")".st.et

" int sprintf(char *s, const char *format, ...)
exec "Snippet sprintf sprintf(".st."s".et.", \"".st."\"%s\"".et."\\n\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.");<CR>".st.et

" int sscanf(const char *s, const char *format, ...)
exec "Snippet sscanf sscanf(".st."s".et.", \"".st."\"%s\"".et."\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.");<CR>".st.et

" FILE *tmpfile(void)
exec "Snippet tmpfile tmpfile()".st.et

" char *tmpnam(char *s)
exec GetFunctionSnippet("tmpnam","s")

" int ungetc(int ch, FILE *fp)
exec "Snippet ungetc ungetc(".st.et.", ".st."fp".et.")".st.et

" int vfprintf(FILE *fp, const char *format, va_list arg)
exec "Snippet vfprintf vfprintf(".st."fp".et.", \"".st."\"%s\"".et."\\n\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.", ".st."arg".et.");<CR>".st.et

" int vprintf(const char *format, va_list arg)
exec "Snippet vprintf vprintf(\"".st."\"%s\"".et."\\n\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.", ".st."arg".et.");<CR>".st.et

" int vsprintf(char *s, const char *format, va_list arg)
exec "Snippet vsprintf vsprintf(".st."s".et.", \"".st."\"%s\"".et."\\n\"".st."\"%s\":CArgList(Count(@z, '%[^%]'))".et.", ".st."arg".et.");<CR>".st.et

" }}}
" {{{ ctype.h
" int isalnum(int ch)
exec GetFunctionSnippet("isalnum","")

" int isalpha(int ch)
exec GetFunctionSnippet("isalpha","")

" int iscntrl(int ch)
exec GetFunctionSnippet("iscntrl","")

" int isdigit(int ch)
exec GetFunctionSnippet("isdigit","")

" int isgraph(int ch)
exec GetFunctionSnippet("isgraph","")

" int islower(int ch)
exec GetFunctionSnippet("islower","")

" int isprint(int ch)
exec GetFunctionSnippet("isprint","")

" int ispunct(int ch)
exec GetFunctionSnippet("ispunct","")

" int isspace(int ch)
exec GetFunctionSnippet("isspace","")

" int isupper(int ch)
exec GetFunctionSnippet("isupper","")

" int isxdigit(int ch)
exec GetFunctionSnippet("isxdigit","")

" int tolower(int ch)
exec GetFunctionSnippet("tolower","")

" int toupper(int ch)
exec GetFunctionSnippet("toupper","")
" }}}
" {{{ string.h
" void *memcpy(void *buf1, const void *buf2, size_t n)
exec "Snippet memcpy memcpy(".st."buf1".et.", ".st."buf2".et.", ".st."n".et.")".st.et

" void *memmove(void *buf1, const void *buf2, size_t n)
exec "Snippet memmove memmove(".st."buf1".et.", ".st."buf2".et.", ".st."n".et.")".st.et

" void *strcpy(char *s1, const char *s2)
exec "Snippet strcpy strcpy(".st."s1".et.", ".st."s2".et.")".st.et

" void *strncpy(char *s1, const char *s2, size_t n)
exec "Snippet strncpy strncpy(".st."s1".et.", ".st."s2".et.", ".st."n".et.")".st.et

" void *strcat(char *s1, const char *s2)
exec "Snippet strcat strcat(".st."s1".et.", ".st."s2".et.")".st.et

" void *strncat(char *s1, const char *s2, size_t n)
exec "Snippet strncat strncat(".st."s1".et.", ".st."s2".et.", ".st."n".et.")".st.et

" int memcmp(const void *buf1, const void *buf2, size_t n)
exec "Snippet memcmp memcmp(".st."buf1".et.", ".st."buf2".et.", ".st."n".et.")".st.et

" int strcmp(const char *s1, const char *s2)
exec "Snippet strcmp strcmp(".st."s1".et.", ".st."s2".et.")".st.et

" int strncmp(const char *s1, const char *s2, size_t n)
exec "Snippet strncmp strncmp(".st."s1".et.", ".st."s2".et.", ".st."n".et.")".st.et

" int strcoll(const char *s1, const char *s2)
exec "Snippet strcoll strcoll(".st."s1".et.", ".st."s2".et.")".st.et

" size_t strxfrm(char *s1, const char *s2, size_t n)
exec "Snippet strxfrm strxfrm(".st."s1".et.", ".st."s2".et.", ".st."n".et.")".st.et

" void *memchr(const void *buf, int ch, size_t n)
exec "Snippet memchr memchr(".st."buf".et.", ".st."ch".et.", ".st."n".et.")".st.et

" char *strchr(const char *s, int ch)
exec "Snippet strchr strchr(".st."s".et.", ".st."ch".et.")".st.et

" size_t strcspn(const char *s1, const char *s2)
exec "Snippet strcspn strcspn(".st."s1".et.", ".st."s2".et.")".st.et

" char *strpbrk(const char *s1, const char *s2)
exec "Snippet strpbrk strpbrk(".st."s1".et.", ".st."s2".et.")".st.et

" char *strrchr(const char *s, int ch)
exec "Snippet strrchr strrchr(".st."s".et.", ".st."ch".et.")".st.et

" size_t strspn(const char *s1, const char *s2)
exec "Snippet strspn strspn(".st."s1".et.", ".st."s2".et.")".st.et

" char *strstr(const char *s1, const char *s2)
exec "Snippet strstr strstr(".st."s1".et.", ".st."s2".et.")".st.et

" char *strtok(char *s1, const char *s2)
exec "Snippet strtok strtok(".st."s1".et.", ".st."s2".et.")".st.et

" char *memset(void *buf, int ch, size_t n)
exec "Snippet memset memset(".st."buf".et.", ".st."ch".et.", ".st."n".et.")".st.et

" char *strerror(int errnum)
exec "Snippet strerror strerror(".st."errnum".et.")".st.et

" size_t strlen(const char *s)
exec "Snippet strlen strlen(".st."s".et.")".st.et
" }}}
" {{{ math.h
" double acos(double x)
exec GetFunctionSnippet("acos","x")

" double asin(double x)
exec GetFunctionSnippet("asin","x")

" double atan(double x)
exec GetFunctionSnippet("atan","x")

" double atan2(double y, double x)
exec "Snippet atan2 atan2(".st."y".et.", ".st."x".et.")".st.et

" double cos(double x)
exec GetFunctionSnippet("cos","x")

" double sin(double x)
exec GetFunctionSnippet("sin","x")

" double tan(double x)
exec GetFunctionSnippet("tan","x")

" double cosh(double x)
exec GetFunctionSnippet("cosh","x")

" double sinh(double x)
exec GetFunctionSnippet("sinh","x")

" double tanh(double x)
exec GetFunctionSnippet("tanh","x")

" double exp(double x)
exec GetFunctionSnippet("exp","x")

" double frexp(double x, int *exp)
exec "Snippet frexp frexp(".st."x".et.", ".st."exp".et.")".st.et

" double ldexp(double x, int exp)
exec "Snippet ldexp ldexp(".st."x".et.", ".st."exp".et.")".st.et

" double log(double x)
exec GetFunctionSnippet("log","x")

" double log10(double x)
exec GetFunctionSnippet("log10","x")

" double modf(double x, double *iptr)
exec "Snippet modf modf(".st."x".et.", ".st."iptr".et.")".st.et

" double pow(double x, double y)
exec "Snippet pow pow(".st."y".et.", ".st."x".et.")".st.et

" double sqrt(double x)
exec GetFunctionSnippet("sqrt","x")

" double ceil(double x)
exec GetFunctionSnippet("ceil","x")

" double fabs(double x)
exec GetFunctionSnippet("fabs","x")

" double floor(double x)
exec GetFunctionSnippet("floor","x")

" double fmod(double x, double y)
exec "Snippet fmod fmod(".st."x".et.", ".st."y".et.")".st.et
" }}}
" {{{ stdlib.h
" double atof(const char *nptr)
exec GetFunctionSnippet("atof","s")

" int atoi(const char *nptr)
exec GetFunctionSnippet("atoi","s")

" long atol(const char *nptr)
exec GetFunctionSnippet("atol","s")

" double strtod(const char *nptr, char **endptr)
exec "Snippet strtod strtod(".st."s".et.", ".st."endptr".et.")".st.et

" long int strtol(const char *nptr, char **endptr, int base)
exec "Snippet strtol strtol(".st."s".et.", ".st."endptr".et.", ".st."base".et.")".st.et

" unsigned long int strtoul(const char *nptr, char **endptr, int base)
exec "Snippet strtoul strtoul(".st."s".et.", ".st."endptr".et.", ".st."base".et.")".st.et

" int rand(void)
exec "Snippet rand rand()".st.et

" void srand(unsigned int seed)
exec GetFunctionSnippet("srand","seed")

" void *calloc(size_t nmemb, size_t size)
exec "Snippet calloc calloc(".st."nmemb".et.", ".st."size".et.")".st.et
exec "Snippet calloc-e ".st."ptr".et." = (".st."type".et." *)calloc(".st."nmemb".et.", ".st."size".et.");<CR>if ( ".st."ptr".et." == NULL ) {<CR>fprintf(stderr, \"".st."message".et."\\n\");<CR>exit(EXIT_FAILURE);<CR>}<CR>".st.et."<CR>free(".st."ptr".et.");"

" void free(void *ptr)
exec GetFunctionSnippet("free","ptr")

" void *malloc(size_t size)
exec GetFunctionSnippet("malloc","size")
" exec "Snippet malloc-e ".st."ptr".et." = (".st."type".et." *)malloc(".st."size".et.");<CR>if ( ".st."ptr".et." == NULL ) {<CR>fprintf(stderr, \"".st."message".et."\\n\");<CR>exit(EXIT_FAILURE);<CR>}<CR>".st.et."<CR>free(".st."ptr".et.");"

exec "Snippet malloc-e if ((".st.et." = (".st."type".et." *)malloc(sizeof(".st."type".et.") * ".st.et.")) == NULL) {<CR>/* error */".st.et."<CR>}"


" void *realloc(void *ptr, size_t size)
exec "Snippet realloc realloc(".st."ptr".et.", ".st."size".et.")".st.et
exec "Snippet realloc-e ".st."ptr2".et." = (".st."type".et." *)realloc(".st."ptr".et.", ".st."size".et.");<CR>if ( ".st."ptr2".et." == NULL ) {<CR>fprintf(stderr, \"".st."message".et."\\n\");<CR>free(".st."ptr".et.");<CR>exit(EXIT_FAILURE);<CR>}<CR>".st.et."<CR>free(".st."ptr2".et.");"

" void abort(void)
exec "Snippet abort abort()".st.et

" int atexit(void (*func)(void))
exec GetFunctionSnippet("atexit","func")

" void exit(int status)
exec GetFunctionSnippet("exit","status")

" char *getenv(const char *name)
exec GetFunctionSnippet("getenv","name")

" int system(const char *string)
exec GetFunctionSnippet("system","s")

" char *bsearch(const void *key, const void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *))
exec "Snippet bsearch bsearch(".st."key".et.", ".st."base".et.", ".st."nmemb".et.", ".st."size".et.", ".st."compar".et.")".st.et

" char *qsort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *))
exec "Snippet qsort qsort(".st."base".et.", ".st."nmemb".et.", ".st."size".et.", ".st."compar".et.")".st.et

" int abs(int j)
exec GetFunctionSnippet("abs","i")

" div_t div(int numer, int denom)
exec "Snippet div div(".st."numer".et.", ".st."denom".et.")".st.et

" long int labs(long int j)
exec GetFunctionSnippet("labs","i")

" ldiv_t ldiv(long int numer, long int denom)
exec "Snippet ldiv ldiv(".st."numer".et.", ".st."denom".et.")".st.et

" int mblen(const char *s, size_t n)
exec "Snippet mblen mblen(".st."s".et.", ".st."n".et.")".st.et

" int mbtowc(wchar_t *pwc, const char *s, size_t n)
exec "Snippet mbtowc mbtowc(".st."pwc".et.", ".st."s".et.", ".st."n".et.")".st.et

" int wctomb(char *s, wchar_t wchar)
exec "Snippet wctomb wctomb(".st."s".et.", ".st."wchar".et.")".st.et

" size_t mbstowcs(wchar_t *pwcs, const char *s, size_t n)
exec "Snippet mbstowcs mbstowcs(".st."pwcs".et.", ".st."s".et.", ".st."n".et.")".st.et

" size_t wcstombs(char *s, const wchar_t *pwcs, size_t n)
exec "Snippet wcstombs wcstombs(".st."s".et.", ".st."pwcs".et.", ".st."n".et.")".st.et
" }}}
" {{{ time.h
" struct tm
" clock_t clock(void)
" double difftime(time_t time1, time_t time0)
" time_t mktime(struct tm *timeptr)
" time_t time(time_t *timer)
" char *asctime(const struct tm *timeptr)
" char *ctime(const time_t *timer)
" struct tm *gmtime(const time_t *timer)
" struct tm *localtime(const time_t *timer)
" size_t strftime(char *s, size_t maxsize, const char *format, const struct tm *timeptr)
" }}}
" {{{ default
exec "Snippet readfile std::vector<uint8_t> v;<CR>if(FILE* fp = fopen(\"".st."filename".et."\", \"r\"))<CR>{<CR>uint8_t buf[1024];<CR>while(size_t len = fread(buf, 1, sizeof(buf), fp))<CR>v.insert(v.end(), buf, buf + len);<CR>fclose(fp);<CR>}<CR>".st.et
exec "Snippet beginend ".st."v".et.".begin(), ".st."v".et.".end()".st.et
exec "Snippet once #ifndef ``CMacroName(expand('%'))``_<CR><CR>#define ``CMacroName(expand('%'))``_<CR><CR>".st.et."<CR><CR>#endif /* ``CMacroName(expand('%'))``_ */<CR>"
"exec "Snippet once #ifndef _".st."file:substitute(expand('%'),'\\(.\\)','\\u\\1','g')".et."_<CR><CR>#define _".st."file".et."_<CR><CR>".st.et."<CR><CR>#endif /* _".st."file".et."_ */<CR>".st.et
exec "Snippet class class ".st."name".et."<CR>{<CR>public:<CR>".st."name".et." (".st."arguments".et.");<CR>virtual ~".st."name".et."();<CR><CR>private:<CR>".st.et."<CR>};<CR>".st.et
" TODO This is a good one but I can't quite work out the syntax yet
exec "Snippet vector std::vector<".st."char".et."> v".st.et.";"
exec "Snippet template template <typename ".st."_InputIter".et."><CR>".st.et
" TODO this one as well. Wish I knew more C
" Snippet namespace namespace ${1:${TM_FILENAME/(.*?)\\..*/\\L$1/}}\n{\n\t$0\n};<CR>.st.et
exec "Snippet namespace namespace ".st.":substitute(expand('%'),'.','\\l&', 'g')".et."<CR>{<CR>".st.et."<CR>};<CR>".st.et
exec "Snippet map std::map<".st."key".et.", ".st."value".et."> map".st.et.";<CR>".st.et
"}}}

" vim: set foldmethod=marker: set fenc=utf-8:
