#!/bin/bash

function generate_name() {
    local chars="$1"
    local min_length=4
    local name=""

    for ((i=0; i<$min_length; i++)); do
        name="${name}${chars:$((RANDOM % ${#chars})):1}"
    done

    echo "${name}"
}

function check_space() {
    local available_space=$(df --output=avail / | tail -1)
    local min_space=$((1024 * 1024))

    if [[ $available_space -lt $min_space ]]; then
        echo "Not enough space. Exiting."
        exit 1
    fi
}

function create_folders_and_files() {
    local base_path="$1"
    local num_folders="$2"
    local folder_chars="$3"
    local num_files="$4"
    local file_chars="$5"
    local ext_chars="${file_chars:0:3}"
    local file_size_kb="$6"
    local log_file="$7"
    local date_suffix=$(date '+%d%m%y')

    for ((i=0; i<$num_folders; i++)); do
        check_space

        local folder_name="$(generate_name "$folder_chars")_${date_suffix}"
        local folder_path="${base_path}/${folder_name}"
        mkdir -p "$folder_path"

        for ((j=0; j<$num_files; j++)); do
            check_space

            local file_name="$(generate_name "$file_chars")_${date_suffix}"
            local file_ext="$(generate_name "$ext_chars")"
            local file_path="${folder_path}/${file_name}.${file_ext}"

#            truncate -s "${file_size_kb}K" "$file_path"
            fallocate -l "${file_size_kb}K" "$file_path"
            echo "$(date '+%Y-%m-%d %H:%M:%S') | Created: ${file_path} | Size: ${file_size_kb}K" >> "$log_file"
        done
    done
}

function main() {
    if [[ $# -ne 6 ]]; then
        echo "Usage: $0 <absolute_path> <num_folders> <folder_chars> <num_files> <file_chars> <file_size_kb>"
        exit 1
    fi

    local base_path="$1"
    local num_folders="$2"
    local folder_chars="$3"
    local num_files="$4"
    local file_chars="$5"
    local file_size_kb="$6"

    if [[ $file_size_kb -gt 100 ]]; then
        echo "File size should not exceed 100KB."
        exit 1
    fi

    local log_file="${base_path}/creation_log_$(date '+%d%m%y').txt"
    create_folders_and_files "$base_path" "$num_folders" "$folder_chars" "$num_files" "$file_chars" "$file_size_kb" "$log_file"
}

main "$@"