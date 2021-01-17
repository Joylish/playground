import React, { Component } from 'react';

import ClassTodoInsert from './ClassToDoInsert'
import ClassToDoList from './ClassToDoList'

class ClassApp extends Component {
    state = {
        todos: [],
        todoInput: ''
    }

    nextId = 0

    constructor(props){
        super(props)
    }
           
    handleChange = (event) => {
        const {target:{name, value}} =event

        this.setState({
            ...this.state,
            [name] : value
        })    
    }
 
    handleInsert = () => {
        const {todos, todoInput} = this.state
        const date = new Date();
        const todo = {
            id: this.nextId,
            date: date.toLocaleString(),
            value: todoInput,
            checked: false
        }
        this.setState({
            todos: [...todos, todo],
            todoInput: ''
        })
        this.nextId += 1
    }

    handleDelete = (id) => {
        const {todos, todoInput} = this.state
        
        this.setState({
            ...this.state,
            todos: todos.filter((todo)=>{
                return id !== todo.id
            })
        })
    }

    onToggle = id=>{
        this.setState({
            ...this.state,
            todos:this. state.todos.map((todo)=>(
                todo.id === id 
                ?
                {
                    ...todo,
                    checked: !todo.checked
                }
                :
                todo
            ))
        })
    }

    render() {
        const {todos, todoInput} = this.state

        return (
        <div>
            <h1>할일 목록</h1>
            <ClassTodoInsert
                todoInput={this.todoInput}
                handleChange={this.handleChange}
                handleInsert={this.handleInsert}
             />
            <ClassToDoList 
                todos={todos}
                handleDelete={this.handleDelete}
                onToggle = {this.onToggle}
            />
        </div>
        );
    }
}

export default ClassApp;