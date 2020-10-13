# convert existing env file to cmake list
file(STRINGS "$ENV{GITHUB_ENV}" env_variables)
# skip first 4 arguments, i.e.
# cmake -P set_env.cmake -- 
set(ARG_NUM 4)
# iterate over remaining args
while(ARG_NUM LESS CMAKE_ARGC)
    list(APPEND env_variables ${CMAKE_ARGV${ARG_NUM}})
    math(EXPR ARG_NUM "${ARG_NUM}+1")
endwhile()
list(JOIN env_variables "\n" env_variables)
file(WRITE "$ENV{GITHUB_ENV}" "${env_variables}")
