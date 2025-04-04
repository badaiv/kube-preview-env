kubectl delete namespace argocd --wait=false
kubectl delete namespace pipelines --wait=false
kubectl delete namespace tekton-operator --wait=false
kubectl delete namespace tekton-pipelines --wait=false
#minikube delete
