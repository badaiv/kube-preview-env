#argocd
echo "setting up ArgoCD..."
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -n argocd --recursive -f ../argocd
echo "setting up ArgoCD - DONE"