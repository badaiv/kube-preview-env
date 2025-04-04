# tekton pipelines and triggers
echo "setting up pipelines..."
kubectl create namespace pipelines

# wait for Tekton to be online
while ! kubectl wait --for=condition=Available deployment/tekton-pipelines-webhook \
  -n tekton-pipelines --timeout=2m; do
    echo "waiting for Tekton to be online.."
    sleep 5
done
#while ! kubectl wait --for=jsonpath='{.subsets}' endpoints/tekton-pipelines-webhook \
#  -n tekton-pipelines --timeout=2m; do
#    echo "waiting for Tekton to be online.."
#    sleep 1
#done
sleep 5

kubectl apply -n pipelines -f https://api.hub.tekton.dev/v1/resource/tekton/task/github-set-status/0.3/raw
kubectl apply -n pipelines -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.9/git-clone.yaml
kubectl apply -n pipelines -f https://api.hub.tekton.dev/v1/resource/tekton/task/kaniko/0.6/raw

kubectl apply -n pipelines -f ../ci-tekton/pipeline-hello-world.yaml
kubectl apply -n pipelines --recursive -f ../ci-tekton/triggers
echo "setting up pipelines - DONE"