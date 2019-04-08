# atom-text-editor

## install atom text editor

* install atom using snap

```
sudo snap install atom --classic
```

## install atom packages to turn atom into an ide.

### common packages

* open up the settings view using **ctrl+,**, click on the "install" tab and
  install packages:

      * atom-ide-ui
      * file-icons
      * minimap
      * minimap-highlight-selected

### install packages fot golang

* open up the settings view using **ctrl+,**, click on the "install" tab and
  install packages:

      * go-plus
      * go-outline

* get and install go-outline-parser to parse and generate the syntax and structures to be used in go-outline.

    ```
    go get github.com/frairon/go-outline-parser
    go install github.com/frairon/go-outline-parser
    ```

### install packages fot python

* open up the settings view using **ctrl+,**, click on the "install" tab and
  install packages:

      * autocomplete-python
      * python-autopep8
      * linter-flake8
      
* install autopep8 so that python-autopep8 can work properly.

    ```
    pip install autopep8
    ```

* install flake8 so that linter-flake8 can work properly.

    ```
    pip install flake8
    ```

