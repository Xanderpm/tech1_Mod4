#this is code

#install.packages("usethis")
credentials::git_credential_ask()
usethis::git_sitrep()

# Creating github token
usethis::create_github_token()

# Entering token as credential 
gitcreds::gitcreds_set()