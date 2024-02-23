# vim:foldmethod=marker

export EDITOR="nvim"
export SHELL="zsh"
export PATH="$PATH:$HOME/.local/bin"

# -------- Functions --------{{{
# ---- C compile ----{{{
function compilec {
    local filename="${1%.*}"
    local output_folder="output"

    if [ ! -d "$output_folder" ]; then
        mkdir "$output_folder"
    fi

    gcc -w "$1" -o "$output_folder/$filename" && "$output_folder/$filename"
}# }}}

# ---- C++ compile ----{{{
function compilecpp {
    local filename="${1%.*}"
    local output_folder="output"

    if [ ! -d "$output_folder" ]; then
        mkdir "$output_folder"
    fi

    g++ -w "$1" -o "$output_folder/$filename" && "$output_folder/$filename"
}# }}}

# ---- Java compile ----{{{
function javacom {
    local filename="${1%.*}"
    local output_folder="output"

    if [ ! -d "$output_folder" ]; then
        mkdir "$output_folder"
    fi

    javac "$1" -d "$output_folder"

    if [ $? -eq 0 ]; then
        java -cp "$output_folder" "$filename"
    else
        echo "Compilation failed. Please check your code."
    fi
}}}}

# ---- Docker ----{{{
dockersrm() {
  local container_id="$1"

  if [ -z "$container_id" ]; then
    echo "Usage: docker_stop_and_rm <container_id>"
    return 1
  fi

  docker stop "$container_id" && docker rm "$container_id"
}# }}}}}}
