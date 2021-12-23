# Docker container images for Oracle JDK

## How to update the images

1. Download RPM packages for x64 and ARM 64 from
   https://www.oracle.com/java/technologies/downloads/#java8
   and put them in the directory with `Dockerfile`.
2. Build the image with `docker build -t oraclejdk .` or with
   `podman build -t oraclejdk .` to use locally.
3. Build the multi-arch image and push it to Google Cloud Container Registry
   with `gcloud builds submit . --config=cloudbuild.yaml`.
