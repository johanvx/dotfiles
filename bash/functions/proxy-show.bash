proxy-show() {
    printf "all_proxy=%s\nhttp_proxy=%s\nhttps_proxy=%s\n" \
        "${all_proxy}" \
        "${http_proxy}" \
        "${https_proxy}"
}
