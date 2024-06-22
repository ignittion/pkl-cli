#!/usr/bin/env bash

latest=${1:-0.26.0}
versions=("0.25.3" "0.26.0")
repo="jesscarlos/pkl-cli"

for version in "${versions[@]}"
do
    # maybe tag as latest?
    if [ "${version}" == "${latest}" ]; then
        docker buildx build --push \
            --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
            --build-arg="VERSION=${version}" \
            --label "maintainer=Jess Carlos" \
            --label "org.opencontainers.image.title=PKL-CLI" \
            --label "org.opencontainers.image.description=Configuration that is Programmable, Scalable, and Safe" \
            --label "org.opencontainers.image.vendor=Ignittion, LLC." \
            --label "org.opencontainers.image.version=${version}" \
            -t "${repo}:${version}" \
            -t "${repo}:latest" \
            .
    else
        # not the latest.
        docker buildx build --push \
            --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
            --build-arg="VERSION=${version}" \
            --label "maintainer=Jess Carlos"
            --label "org.opencontainers.image.title=PKL-CLI" \
            --label "org.opencontainers.image.description=Configuration that is Programmable, Scalable, and Safe" \
            --label "org.opencontainers.image.vendor=Ignittion, LLC." \
            --label "org.opencontainers.image.version=${version}" \
            -t "${repo}:${version}" \
            .
    fi

    echo "Built: ${repo}:${version}"
done
