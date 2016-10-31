# the filepath to this repository
repo_path = github.com/clearbit/charts

# generare helm chart archives
gen:
	./.scripts/gen_packages.sh

# index packaged charts
index:
	helm repo index ./
