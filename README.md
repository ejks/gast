# Minte

## Latest version

v000.001.000

## Gemsile version

* Ruby 2.6.5
* Rails 6.0.0
* Vuejs 
* PostgreSQL '>= 0.18', '< 2.0'

## Set up

* Copy database.yml
```
cp /config/database.yml.example /config/database.yml
```

* Find the admin and set up database.yml content

* Set up DB
```
rake db:create
```

* import DB data to your local database (if needed)

## Reminder

* Always put confidential files in .gitignore

## Working flow - Git Flow
* always pull down latest master and develop branch before merging

* use rebase before pushing and merging

* feature
  1. pull down lastest develop
  ```
  git checkout develop
  git pull
  ```

  2. checkout a new branch
  ```
  git checkout -b feature/account_type_setting
  ```

  3. when finishing feature, push onto GitHub and create a pull request

  4. after code review, merge feature branch into develop branch

  5. make sure you have latest master and develop
  ```
  git checkout master
  git pull
  git checkout develop
  git pull
  ```
  
  > for now, develop branch contains latest version but master don't
  > since we have merge into master

  6. check latest tag
  > will show sth like: v003.010.004
  ```
  git describe --tags $(git rev-list --tags --max-count=1)
  ```
  
  7. on develop branch, use git flow to start a release branch
  > since it's a feature, do not change 003, which is for big release.
  > set 004 to 000, since we don't have any hotfix for this new feature.
  ```
  git flow release start v003.011.000
  ```
  
  8. finish release branch, it will automatically merge into master
  ```
  git flow release finish v003.011.000
  ```
  
  9. go to master branch and push onto GitHub
  ```
  git checkout master
  git push
  ```

* hotfix
  1. pull down lastest develop
  > for safety, I used to use develop branch to develop and then rebase to master
  ```
  git checkout develop
  git pull
  ```
  > checkout a new branch
  ```
  git checkout -b hotfix/account_type_setting_bug
  ```
  
  2. when finishing hotfix, make sure you have latest master and develop
  ```
  git checkout master
  git pull
  git checkout develop
  git pull
  ```
  
  3. rebase hotfix branch to master
  ```
  git checkout hotfix/account_type_setting_bug
  git rebase master
  ```
  
  4. check latest tag
  > will show sth like: v003.010.004
  ```
  git describe --tags $(git rev-list --tags --max-count=1)
  ```
  
  5. change hotfix branch name, so that git flow know how to finish it
  > from hotfix 004 -> 005
  ```
  git branch -m hotfix/v003.010.005
  ```
  
  6. finish hotfix flow
  > this will merge hotfix branch into both master and develop branch
  > and will take you to develop branch at the end
  ```
  git flow hotfix finish v003.010.005
  ```
  
  7. push onto GitHub
  > now on develop branch
  ```
  git push
  git checkout master
  git push
  ```
  > this will push tag v003.010.005 onto GitHub so that we know which version we have right now
  ```
  git push --tags
  ```
