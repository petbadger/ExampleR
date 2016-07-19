# Get the fully qualified domain name for your machine

# This is just a quick post, to mention how you can get your computer name with the domain it is registered in i.e. Â the fully qualified domain name (FQDN) by using R.

# Base R

# In Windows to get the computer name in itâ???Ts fully qualified form you need to do:

paste(Sys.getenv("COMPUTERNAME"),
      Sys.getenv("USERDNSDOMAIN"),
      sep=".")
## [1] "SLOCKE.MANGO.LOCAL"


# In Linux, you can use:

Sys.getenv("HOSTNAME")
## [1] ""
# Each of these returns an empty string in the other OS so you can concatenate them to get the FQDN.

getFQDN <- function (){
  tolower(
    paste0( paste(Sys.getenv("COMPUTERNAME"),
                  Sys.getenv("USERDNSDOMAIN"),
                  sep=".")
            , Sys.getenv("HOSTNAME")
    )
  )
}
getFQDN()
## [1] "slocke.mango.local"

# Using iptools

# Alternatively, we could use the iptools package (available from CRAN) which now also works in Windows.

library(iptools)
ip_to_hostname("127.0.0.1")
## [[1]]
## [1] "slocke.Mango.local"

# For more info on iptools, check out the GitHub repo.