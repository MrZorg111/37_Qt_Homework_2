# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\app37_Homework_2_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\app37_Homework_2_autogen.dir\\ParseCache.txt"
  "app37_Homework_2_autogen"
  )
endif()
