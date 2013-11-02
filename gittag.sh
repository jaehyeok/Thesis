TAG=$1

git add .
git commit -m "$TAG" .
git push origin master
git tag -a Thesis_$TAG -m "$TAG"
git push origin Thesis_$TAG
