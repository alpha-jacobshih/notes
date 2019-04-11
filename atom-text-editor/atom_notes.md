# atom-text-editor

## install atom text editor

* install atom in ubuntu via ppa.

```
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update; sudo apt install atom
```

* install atom using snap

```
sudo snap install atom --classic
```

## install atom packages to turn atom into an ide.

### common packages

* open up the settings view using **ctrl+,**, click on the "install" tab and
  install packages:

      * atom-ide-ui
      * atom-beautify
      * file-icons
      * minimap
      * minimap-highlight-selected
      * script

### install packages fot golang

* open up the settings view using **ctrl+,**, click on the "install" tab and
  install packages:

      * go-plus
      * go-outline
      * go-debug
      * go-signature-statusbar

* get and install go-outline-parser to parse and generate the syntax and structures to be used in go-outline.

    ```
    go get github.com/frairon/go-outline-parser
    go install github.com/frairon/go-outline-parser
    ```

### install packages fot python

* open up the settings view using **ctrl+,**, click on the "install" tab and
  install packages:

      * autocomplete-python
      * linter-flake8
      * python-import-magic
      * python-tools
      
* install autopep8 so that python-autopep8 can work properly.

    ```
    sudo pip install autopep8
    ```

* install flake8 so that linter-flake8 can work properly.

    ```
    sudo pip install flake8
    ```

* install python language server pyls:

    ```
    sudo pip install --ignore-installed enum34 'python-language-server[all]'
    ```

* install python library importmagic:

    ```
    sudo python -m pip install importmagic
    ```
