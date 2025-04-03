# Tekton setup
# https://tekton.dev/docs/operator/install/
kubectl apply --filename https://storage.googleapis.com/tekton-releases/operator/latest/release.yaml
# use profile 'all' to install all components
kubectl apply -f https://raw.githubusercontent.com/tektoncd/operator/main/config/crs/kubernetes/config/all/operator_v1alpha1_config_cr.yaml
