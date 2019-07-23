import React from 'react';
import { Button, StyleSheet, Text, View } from 'react-native';

class CounterButton extends React.Component {

  constructor(props) {
    super(props);

    this.state = {
      counter1: props.counter1,
      counter2: props.counter1 + 65,
    };
  }

  clickHandler = () => {
    this.setState((state)=>({
      counter1: state.counter1 + 1,
      counter2: (state.counter2 + 1 > 90)?(state.counter2-25):(state.counter2+1),
    }));
  };

  render() {
    return (
      <View>
        <Text>{this.state.counter1}</Text>
        <Button title={'click me!'} onPress={this.clickHandler}/>
        <Text>{String.fromCharCode(this.state.counter2)}</Text>
      </View>
    );
  }
}

export default class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <CounterButton counter1={0} />
        <CounterButton counter1={1} />
        <CounterButton counter1={2} />
        <CounterButton counter1={3} />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});