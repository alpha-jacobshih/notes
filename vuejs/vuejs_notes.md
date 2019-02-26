# vue.js

## references

- [introduction to vue.js](https://vuejs.org/v2/guide/)
- [vuejs tutorials](https://www.tutorialspoint.com/vuejs/index.htm)

## utilities

### vue cli

```
sudo npm install -g @vue/cli
```

### vue devtools

- [vue devtools](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd) for chrome and vivaldi.

## overview

### features

- a progressive framework for building user interfaces.
- the core library is focused on the view layer only.
- utilize a virtual DOM.
- and [more](https://vuejs.org/v2/guide/)...

### vue directives

- extend HTML with HTML attributes.
- prefixed with v- to indicate that they are special attributes of vue.
- apply special reactive behavior to the rendered dom.
- vue.js provides built-in directives and user defined directives.

### vue object

- created with **new Vue()**.

    - el: a css selector to mount on a dom element.

        - identifier selector

        ```
        <div id="app">
          {{ message }}
        </div>
        <script>
        var app = new Vue({
          el: '#app',
          data: {
            message: 'an identifier selector.'
          }
        });
        </script>
        ```

        - class selector

        ```
        <div class="appclass">
          {{ message }}
        </div>
        <script>
        var appclass = new Vue({
          el: '.appclass',
          data: {
            message: 'a class selector.'
          }
        });
        </script>
        ```

### vue binding

- the property el: binds the new vue object to the html element with id="app".
- when a vue object is bound to an html element, the html element will change when the vue object changes.
- two-way binding
    - v-model directive binds the value of html elements to application data.
- loop binding
    - v-for directive to bind an array of Vue objects to an "array" of HTML element.

### event handling

- v-on is the attribute added to the dom elements to listen to the events in vue.

## run the vue project from scratch

### create a vue project

- create a vue project named hellovue.

```
vue init webpack hellovue
```

- run the created project

```
cd hellovue
npm run dev
```

- if run inside a docker container, you should modify package.json to set host to 0.0.0.0 for webpack-dev-server.

```
    "dev": "webpack-dev-server --host 0.0.0.0 --inline --progress --config build/webpack.dev.conf.js",
```

## examples

```
<html>
<head>
  <script src="https://unpkg.com/vue@2.1.6/dist/vue.js"></script>
  <title>hello vue.js</title>
</head>
<body>
  <div id="app">
    {{ message }}
  </div>

</body>

<script>
var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  }
});
</script>
</html>
```


