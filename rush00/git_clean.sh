git checkout --orphan latest_branch;
git add -A;
git commit -am "initial commit";
git branch -D master;
git branch -m master;
git push -f --set-upstream origin master;
