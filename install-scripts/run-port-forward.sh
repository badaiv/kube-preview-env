# port forwarding for argocd, tekton and github listener
function port_forward_services(){
    echo "waiting for argocd-server"
    kubectl wait -n argocd --for=jsonpath='{.subsets}' endpoints argocd-server --timeout=2m
    kubectl port-forward -n argocd service/argocd-server 8080:443 &
    local argocd_pid=$!
    echo "waiting for tekton-dashboard"
    kubectl wait -n tekton-pipelines --for=jsonpath='{.subsets}' endpoints tekton-dashboard --timeout=2m
    kubectl port-forward -n tekton-pipelines service/tekton-dashboard 9097:9097 &
    local tekton_pid=$!
    echo "waiting for el-github-listener"
    kubectl wait -n pipelines --for=jsonpath='{.subsets}' endpoints el-github-listener --timeout=2m
    kubectl port-forward -n pipelines service/el-github-listener 8888:8080 &
    local githublistener_pid=$!
    echo "Port forwarding started. Press Ctrl+C to stop."
    # Listen on SIGINT signal (sent to a process when you press Ctrl+C)
    # then once the signal is received kill all the started processes effectively stopping the port forwarding
    trap "echo 'Stopping port forwarding...'; kill $argocd_pid $tekton_pid $githublistener_pid" SIGINT
    # Wait for background processes to finish
    wait $argocd_pid $tekton_pid $githublistener_pid
}

