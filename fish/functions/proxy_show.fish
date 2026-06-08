function proxy_show -d "Show current proxy settings"
    echo "https_proxy=$https_proxy"
    echo "http_proxy=$http_proxy"
    echo "all_proxy=$all_proxy"
end
