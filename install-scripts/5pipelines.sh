# tekton pipelines and triggers
kubectl create namespace pipelines
kubectl apply -n pipelines -f https://api.hub.tekton.dev/v1/resource/tekton/task/github-set-status/0.3/raw
kubectl apply -n pipelines -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.9/git-clone.yaml
kubectl apply -n pipelines -f https://api.hub.tekton.dev/v1/resource/tekton/task/kaniko/0.6/raw

ka ci-tekton/pipeline-hello-world.yaml
ka ci-tekton/triggers
