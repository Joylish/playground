import React, {Component} from 'react';
import 

class Cities extends Component{
    
    state ={
        cities: []
    }

    componentDidMount(){
        const API = ""

        fetch (API)
        .then(data => data.json())
        .then(aaa => {
            this.setState({
                cities: aaa
            });
        });
    }

    render(){
        const {cities} = this.state;

        console.log('=====render');
        console.log(cities);
        return(
             <div>
                 <h2> List: </h2>
                 <ul>
                     {cities.map(item => {
                         return (
                            <li key ={item}>
                                <Link to={`/city/${item}`}>{item}</Link>
                            </li>

                         )
                     })}

                 </ul>
            
            </div>
        )
    }
}
