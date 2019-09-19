mkdir e91

cd e91

git init

cat >> index.html << EOF
> line 1
> EOF

git add index.html

git commit -m "Commiting changes"

cat >> index.html << EOF
> line 2
> EOF

git add index.html

cat >> index.html << EOF
> line 3
> EOF

git status

git diff

git diff master

git checkout index.html

git commit -m "Added line 2"

cat > .git/hooks/pre-commit << EOF
> echo "--- On branch $(git branch | grep \* | cut -d ' ' -f2) --- "
> EOF

git checkout -b dev-branch
cat >> index.html << EOF
> line 4.0
> EOF
git commit -a -m "Add line 4.0"

git checkout master
git merge dev-branch

git tag v0.1

git checkout -b hotfix
a) Sed wasn't working so I just manually edited it
b) git commit -a -m "Important hotfix"

git checkout master
git merge hotfix

git checkout dev-branch
git merge hotfix

git branch -d hotfix
