import React,{Component} from 'react';
import {BrowserRouter} from 'react-router-dom';
import logo from './logo.svg';
import './App.css';
import Header from './components/Header'

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
      <Header name ={name} foo="Hi!" />
      <Route exact path ="/" Component {<div> Home </div>} />
      
      <Route path ={match.path} render{ () => {
        <div>List</div>
      }}/>
    
      </div>
      </BrowserRouter>
      //browserrouter라는 컴포넌트
    );
  }
}


export default App;
