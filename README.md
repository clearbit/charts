# Helm charts

## Initial setup

To set up helm and add the clearbit repo, run:

```
helm init --client-only
helm repo add clearbit https://clearbit.github.io/charts
```

## Updating a chart

To update the helm repo with a new chart:


1. Bump the version in your chart's `Chart.yaml`
1. Run:
```
helm package stable/$CHART_NAME
make index
```
   where `$CHART_NAME` is the name of your chart.
1. Commit the new tarball and `index.yaml`, push a PR, and merge.


## Deployment

Check each chart's `README.md` for instructions how to set it up.
