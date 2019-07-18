import React,{Component} from 'react';
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
      <div className="App">
      <Header name ={name} foo="Hi!" />
      </div>
    );
  }
}


export default App;
