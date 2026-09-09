function proxy-off -d "Turn off proxies"
    set -e https_proxy
    set -e http_proxy
    set -e all_proxy
end
