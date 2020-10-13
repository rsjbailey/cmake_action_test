# convert existing path file to cmake list
file(STRINGS "$ENV{GITHUB_PATH}" path)
# skip first 4 arguments, i.e.
# cmake -P set_env.cmake -- 
set(ARG_NUM 4)
# iterate over remaining args
while(ARG_NUM LESS CMAKE_ARGC)
    file(TO_CMAKE_PATH "${CMAKE_ARGV${ARG_NUM}}"} current_path)
    file(TO_NATIVE_PATH "${added_path}" current_path)
    list(APPEND path "${current_path}")
    math(EXPR ARG_NUM "${ARG_NUM}+1")
endwhile()
list(JOIN path "\n" path)
file(WRITE "$ENV{GITHUB_PATH}" "${path}")
