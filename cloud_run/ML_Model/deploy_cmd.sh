# First Approach

# Step-1 - Build the image
docker build -t ml-model .

# Step-2 - Test & run the image locally
docker run -v "$(pwd)/:/app" ml-model

# Step-3 - List the images locally
docker image ls

# Optional - Delete the existing image
docker rmi ml-model

# Step-4 - Tag the image locally
docker tag ml-model gcr.io/focus-skein-407106/ml-model

# Step-5 Authentication for Container Registry for Service Account
gcloud auth activate-service-account testaccount01@focus-skein-407106.iam.gserviceaccount.com --key-file="/Users/darshan/Downloads/Data Science Model Deployments and Cloud Computing on GCP/GCP_Project/focus-skein-407106-6670f7104f52.json"

# Step-6 Generate Access Token for Authentication (Valid for 1 Hour)
gcloud auth print-access-token | docker login -u oauth2accesstoken \--password-stdin https://gcr.io

# Step-7 - Push the image to Google Cloud Registry
docker push gcr.io/focus-skein-407106/ml-model

# Step-8 - Pull the image to Local system & run it locally
docker pull gcr.io/focus-skein-407106/ml-model

# Step-9 - Run the pulled Docker Image by adding the local path with the container folder
docker run -v "$(pwd)/:/app" gcr.io/focus-skein-407106/ml-model