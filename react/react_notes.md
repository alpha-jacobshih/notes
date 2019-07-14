
# react notes

## references

- [getting started with react - an overview and walkthrough tutorial](https://www.taniarascia.com/getting-started-with-react/)
- [tutorial: intro to react](https://reactjs.org/tutorial/tutorial.html)
- [a simple HTML page with script tags](https://reactjs.org/docs/add-react-to-a-website.html)
- [react component api reference](https://reactjs.org/docs/react-component.html)
- [create react app](https://github.com/facebook/create-react-app)

## environments

### create docker container for react development

#### Node + Create React App + Docker Compose

[Node + Create React App + Docker Compose](https://github.com/mrcoles/node-react-docker-compose)

### install node.js with specified version

```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## glossary

- **single page application**

    A single-page application is an application that loads a single HTML page and all the necessary assets (such as JavaScript and CSS) required for the application to run.

    Any interactions with the page or subsequent pages do not require a round trip to the server which means the page is not reloaded.

- **JSX**

    JSX is a syntax extension to JavaScript.

- **elements**

    React elements are the building blocks of React applications. 

    An element describes what you want to see on the screen. 

    React elements are immutable. 

    Typically, elements are not used directly, but get returned from components.

- **components**

    React components are small, reusable pieces of code that return a React element to be rendered to the page.

- **props**

    props are inputs to a React component.

    They are data passed down from a parent component to a child component.

    Remember that props are readonly.

- **state**

    A component needs state when some data associated with it changes over time.

    The most important difference between state and props is that props are passed from a parent component, but state is managed by the component itself.


