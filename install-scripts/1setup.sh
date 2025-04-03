./2minikube.sh
./3tekton.sh
./4argocd.sh
./5pipelines.sh

# port forwarding for argocd, tekton and github listener
source ./run-port-forward.sh
port_forward_services

# ngrok service/el-github-listener
#ngrok http 8888