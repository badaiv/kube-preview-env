# Tekton setup
# https://tekton.dev/docs/operator/install/
echo "setting up Tekton..."
kubectl apply --filename https://storage.googleapis.com/tekton-releases/operator/latest/release.yaml
#kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/previous/v0.73.2/release.yaml
# use profile 'all' to install all components
kubectl apply -f https://raw.githubusercontent.com/tektoncd/operator/main/config/crs/kubernetes/config/all/operator_v1alpha1_config_cr.yaml
#kubectl apply -n tekton-operator -f https://raw.githubusercontent.com/tektoncd/operator/v0.73.2/config/crs/kubernetes/config/all/operator_v1alpha1_config_cr.yaml
echo "setting up Tekton - DONE"
