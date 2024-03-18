cmake_minimum_required(VERSION 3.24)
project(${GAME_NAME})

find_package(glad CONFIG REQUIRED)
find_package(glfw3 CONFIG REQUIRED)

add_executable(${CMAKE_PROJECT_NAME}
  "src/main.c")

target_link_libraries(${CMAKE_PROJECT_NAME} 
PRIVATE
  glad::glad
  glfw)
