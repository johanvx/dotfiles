function proxy-off -d "Turn off proxies"
    set -e all_proxy
    set -e http_proxy
    set -e https_proxy
end
