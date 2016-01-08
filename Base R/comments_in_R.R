#http://stackoverflow.com/questions/1231195/multiline-comment-workarounds

#ctrl+shift+c in Rstudio will comment out things
# 
# blah
# blah
# blah




"
This is a comment.
Do not use the single apostrophes or back ticks in this type of comment
Another downside is that code completion still works here
"

YouCanAlsoSetCommentAsVariable="
And then you can type whatever you want.
This option is neat since you can then label your comments with a title of sorts and maybe do processing with it later
like perhaps generate an MD document
"


# comment
# hash tag comments do not initiate code completion
# but hash tag is not multiline

#'Very cool
#'If you do hashtag back tick, when you press enter it will automatically start the new line with a hash backtick
#'This likely only works in Rstudio
#'This is great if you know you are going to type a bunch of lines
#'Cannot do the shift+ctrl+c thing here
#'
#'It looks like this hashbacktick is to support Roxygen style auto code documentation


#can also use the if code block
#this is good for commenting out actual code

if(FALSE){
  #all code in here will be ignored
  
}


# this is a bunch of textthis is a bunch of textthis is a bunch of textthis is a
# bunch of text this is a bunch of textthis is a bunch of textthis is a bunch of
# text this is a bunch of textthis is a bunch of textthis is a bunch of textthis
# is a bunch of textthis is a bunch of textthis is a bunch of text this is a
# bunch of textthis is a bunch of text

#if you have one big line you can do ctrl+shit+forwardslash to reflow the comment to be a bunch of shorter lines, just copy this comment and try it. It's neat!
#if you have one big line you can do ctrl+shit+forwardslash to reflow the
#comment to be a bunch of shorter lines, just copy this comment and try it. It's
#neat!


#Ctrl+shift+R will create a section header like the one below
# MySection ---------------------------------------------------------------


foo <- function(){
  
}


