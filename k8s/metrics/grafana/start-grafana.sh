kubectl run -n numworx grafana --image grafana/grafana-enterprise
kubectl -n numworx expose pod grafana --port 3000
