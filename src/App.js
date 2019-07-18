import React,{Component} from 'react';
import {BrowserRouter, Route} from 'react-router-dom';
import logo from './logo.svg';
import './App.css';
import Header from './components/Header'
import Home from './components/Home'
import About from './components/About'

class App extends Component{
  
  // lifecycle
  // constructor(){}

  componentDidMount(){
    console.log('Component DID MOUNT')
  }

  render(){
    const name = "Joylish";

    return (
      <BrowserRouter>
      <div className="App">
        <Route exact path ="/" component = {Home} />
        <Route exact path = "/about" component = {About} />
        <Header name = {name } foo = "hi"/>
      </div>
      </BrowserRouter>
      //browserrouter라는 컴포넌트
    );
  }
}


export default App;
