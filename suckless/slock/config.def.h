/* user and group to drop privileges to */
static const char *user  = "caspar";
static const char *group = "caspar";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#44475a",   /* during input */
	[FAILED] = "#ff5555",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds before the monitor shuts down */
static const int monitortime = 60 * 3;

/* default message */
static const char * message = "Ich lieb die Mensa. Es ist so fein.";
/*static const char * message = 
"  __  __                         _          _  	\n" 
" |  \/  | ___ _ __  ___  __ _   (_)___  ___| |__	\n"
" | |\/| |/ _ \ '_ \/ __|/ _` |  | / __|/ __| '_ \	\n"
" | |  | |  __/ | | \__ \ (_| |  | \__ \ (__| | | |	\n"
" |_|  |_|\___|_| |_|___/\__,_|  |_|___/\___|_| |_|	\n"
"  							\n"
"  _                    _     _				\n"
" | |__   ___  ___  ___| |__ | |_ ___			\n"
" | '_ \ / _ \/ __|/ __| '_ \| __/ _ \			\n"
" | |_) |  __/\__ \ (__| | | | ||  __/			\n"
" |_.__/ \___||___/\___|_| |_|\__\___|			";*/

/* text color */
static const char * text_color = "#ffffff";

/* text size (must be a valid size) */
static const char * font_name = "fixed";
