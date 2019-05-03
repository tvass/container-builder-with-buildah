build:
	podman build -f Dockerfile -t buildah-builder

clean:
	podman rmi localhost/buildah-builder

shell:
	podman run --rm -ti --network host \
	--env-file env \
	-v $(PWD)/sample/Dockerfile.to_build:/root/Dockerfile \
	localhost/buildah-builder bash

run:
	podman run --rm -ti --network host \
	--env-file env \
	-v $(PWD)/sample/Dockerfile.to_build:/root/Dockerfile \
	localhost/buildah-builder