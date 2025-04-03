# port forwarding for argocd, tekton and github listener
function port_forward_services(){
    # start port forwarding for services in as separate processes
    kubectl port-forward -n argocd service/argocd-server 8080:443 &
    # get process ID of started process
    local service1_pid=$!
    kubectl port-forward -n tekton-pipelines service/tekton-dashboard 9097:9097 &
    local service2_pid=$!
    kubectl port-forward -n pipelines service/el-github-listener 8888:8080 &
    local service3_pid=$!
    echo "Port forwarding started. Press Ctrl+C to stop."
    # Listen on SIGINT signal (sent to a process when you press Ctrl+C)
    # then once the signal is received kill all the started processes effectively stopping the port forwarding
    trap "echo 'Stopping port forwarding...'; kill $service1_pid $service2_pid $service3_pid" SIGINT
    # Wait for background processes to finish
    wait $service1_pid $service2_pid $service3_pid
}

