# sparse-checkout

## overview

how to sparse-checkout only sub-folder vuejs.

## checkout the sub folder

```
git init notes && cd notes
git config core.sparseCheckout true
git remote add -f origin http://github.com/alpha-jacobshih/notes.git
echo 'vuejs/*' >> .git/info/sparse-checkout
git pull origin master
```
