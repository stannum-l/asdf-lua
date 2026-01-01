#!/usr/bin/env bash

set -euo pipefail

# GH_REPO="https://github.com/lua/lua"
DOWNLOAD_URL="https://www.lua.org/ftp/"
TOOL_NAME="lua"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if lua is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

# list_github_tags() {
#     git ls-remote --tags --refs --sort="v:refname" "$GH_REPO" |
#     grep -o 'refs/tags/.*' | cut -d/ -f3- | grep '^v' |
#     sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
# }

list_lua_versions() {
  curl -s "$DOWNLOAD_URL" | grep -o 'lua-[0-9.]*.tar.gz' | sed 's/lua-//' | sed 's/.tar.gz//' | sort -V | uniq
}

list_all_versions() {
  # list_github_tags
  list_lua_versions
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  # TODO: Adapt the release URL convention for lua
  url="$DOWNLOAD_URL/lua-$version.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

get_target_os() {
  case "$(uname -s)" in
  Darwin) echo "macosx" ;;
  Linux) echo "linux" ;;
  *) fail "Unsupported OS: $(uname -s)" ;;
  esac
}

get_target_arch() {
  case "$(uname -m)" in
  x86_64) echo "x86_64" ;;
  aarch64) echo "aarch64" ;;
  arm64) echo "arm64" ;;
  *) fail "Unsupported architecture: $(uname -m)" ;;
  esac
}
