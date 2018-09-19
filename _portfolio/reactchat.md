---
layout: post
title: Chat App in React
feature-img: "img/react_chat.png"
thumbnail-path: "img/react_chat.png"
short-description: A chatroom application created in React

---
This is a webapp created when learning about React. It was a twist on a project that I had to do for the Software Developer Program at [Bloc](https://www.bloc.io). The original project for the program required a different framework, but I wanted to learn some React, so I went ahead and created a React version. 

At a high level, The application allows you to register your name based off of a google account. Once registered, you can create a room, post messages in a room, and interact with other people that are also in these rooms.

On the backend, it uses google firebase in storing the room and message information. Of course, as mentioned earlier, the framework used to create this website is React. 

But enough about the high level technicals. I wanted to share a bit about the process of this project, and the considerations and learnings that were taken into account in it's creation.

From a design perspective, I tried to keep it as simple as possible, so when I went about creating this application I tried to use only the `create-react-app` package available on `npm` adding only the bootstrap library to it for some visual polish.

In terms of the structure, I wanted the base of the Web app to be `App.js` file. And as such, wanted to keep the _currentUser_, _currentRoomName_, and _currentRoom_ as states in this location. 

The main reason is, it seemed easier to pass any changes from this location down to other components, since this was the highest level I was modifying in the Web App. 

These variables in the `App` component's state would need to be modified as user input was made. This was achieved by creating some callbacks.

```javascript
class App extends Component {
  ...
  currentRoomCallback = (roomListCurrentRoom, roomListCurrentRoomName) => {
    this.setState({
      currentRoom: roomListCurrentRoom,
      currentRoomName: roomListCurrentRoomName
    });
  };

  currentUserCallback = (userCurrentUser) => {
    this.setState({ currentUser: userCurrentUser });
  };
  ...
}
```

These callbacks are pretty straightforward and simple. Their main reason of being is to enable other components to pass _currentUser_, _currentRoomName_, and _currentRoom_ states back to the main `App` Component. Using the arrow function, these states that are created will be linked to the `this` of the `App` component, making it very easy to pass it to other components downstream.

The callbacks are passed to other components as props in the render function of the `App` component, as is shown being passed to the `RoomList` Component below:

```html
render() {
  ...
  <RoomList firebase={firebase} callbackCurrentRoom={this.currentRoomCallback}/>
  ...
}
```

The `callbackCurrentRoom` can them be invoked within the `RoomList` Component as a prop. This can be seen when it is invoked in the `clickRoom` function as shown below.

```javascript
clickRoom(roomId, roomName) {
    this.setState({ currentRoom: roomId, currentRoomName: roomName });
    this.props.callbackCurrentRoom(roomId, roomName);
}
```

When `clickRoom` is executed, the event triggered by the user updates the state values in the `App` component.

In theory, all this information passing of state values via callbacks being sent through props downstream of the main `App` component is all well and good. But one thing that I had to learn was exactly _when_ this information is triggered in React. 

One thing I expected from data that I was passing from state information from upstream Components by assigning it as a downstream prop was that when an upstream state would update and/or change, I expected it's downstream component to change as well.

While this behavior was happening, what was not happening is that the data that was passed from upstream was not being rendered properly, dispite me viewing the data being passed correctly through the browser's console.

What I had to do to remedy this seemingly poor timing of "new" `props`, was to add a react method called `componentWillReceiveProps`. What this method listens to is that if props have changed, this method will be triggered and the code written inside will be run. So, for example, in this web app, an upstream triggered state change due to switching rooms triggers `componentWillReceiveProps`, and the following code is run.

```javascript
  componentWillReceiveProps(nextProp) {
    // here we're making sure that the refreshed prop
    // has actually changed.
    if(this.state.currentRoom !== nextProp.currentRoom) {

      if(this.state.query) { 
        this.state.query.off('child_added');
      }

      var query = this.messageRef.orderByChild('roomId').equalTo(nextProp.currentRoom);
      // query.on takes action on the query run above.
      query.on('child_added', snapshot => {
        const message = snapshot.val();
        message.key = snapshot.key;
        this.setState({
          currentRoom: nextProp.currentRoom,
          currentRoomName: nextProp.currentRoomName,
          messages: this.state.messages.concat(message),
          new_message: '',
          query: query
        })
      });
      // create blank message slate. This actually happens
      // quicker than the query.on() command above.
      this.setState({ 
        currentRoom: nextProp.currentRoom,
        currentRoomName: nextProp.currentRoomName,
        messages: [],
        query: query
      });

    } else if (this.state.currentUser !== nextProp.currentUser) {
      // updates the state given that the
      // user has changed
      this.setState({ 
        currentUser: nextProp.currentUser,
      });
      return
    }
  }
``` 

Due to this, the new `props` will be updating the `MessageList`'s `state`, and the updated `state` via `setState` will trigger a `render()` within this component. This will then trigger a message refresh, or a change in the user name at the top of the messages.

This walkthrough wouldn't be complete without me talking a bit about firebase and it's functions that I used within this web app.

It really is quite straightforward after creating a database on the google service.

At the beginning of the `App` component I declare some config information that would be necessary to access the correct location of the database within firebase. The information has the following structure, and is outlined on creation of the database.

```javascript
var config = {
  apiKey: "xxxx",
  authDomain: "yyyy",
  databaseURL: "zzzz",
  projectId: "iiii",
  storageBucket: "jjjj",
  messagingSenderId: "qqqq"
};

firebase.initializeApp(config);
```

Once firebase is correctly configured, the database can be manipulated via creating a reference to the database and then accessing the data via queries.

The reference to the database can be created within a Component's `constructor`, for example below is a snippet of this reference being created in the `MessageList`'s component `constructor`.

```javascript
constructor(props) {
  super(props);
  // message database reference is created below
  this.messageRef = this.props.firebase.database().ref('messages');
  this.state = {
    ... 
  };
}
```

Then, later on in the code, a query can be run on `messageRef`. Below is an example of this done during the `componentDidMount()` method.

```javascript
componentDidMount() {
    var query = this.messageRef.orderByChild('roomId').equalTo(this.state.currentRoom);

    query.on('child_added', snapshot => {
      const message = snapshot.val();
      message.key = snapshot.key;

      this.setState({
        messages: this.state.messages.concat(message),
        new_message: '',
        query: query
      })
    });

    if (this.messagesEnd) {
      this.scrollToBottom();
    }
  }
```

This application is hosted on a Debian Stable linode instance and is using NGINX as it's webserver. It can be accessed at this location: [https://www.xavierjortiz.com/chatroom/](https://www.xavierjortiz.com/chatroom/)

The Github source: [https://github.com/Xavier-J-Ortiz/react-chatroom-firebase](https://github.com/Xavier-J-Ortiz/react-chatroom-firebase)
