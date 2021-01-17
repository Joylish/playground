import React, {useState, useCallback, useRef} from 'react'

import TodoInsert from './ToDoInsert'
import ToDoList from './ToDoList'


const App = () => {
    const nextId = useRef(0);
    const [state, setState] = useState({
        todos: [],
        todoInput: ''
    })

    const handleChange = useCallback((event) => {
        const {target:{name, value}} =event
        
        setState({
            ...state,
            [name] : value
        })    
    },[state])

    const handleInsert = useCallback(() => {
        const {todos, todoInput} = state
        const date = new Date();
        const todo = {
            id: nextId.current,
            date: date.toLocaleString(),
            value: todoInput,
            checked: false
        }
        setState({
            todos: [...todos, todo],
            todoInput: ''
        })
        nextId.current += 1
    },[state])

    const handleDelete = useCallback((id) => {
        setState({
            ...state,
            todos: todos.filter((todo)=>{
                return id !== todo.id
            })
        })
    },[state])

    const onToggle = useCallback(id=>{
        setState({
            ...state,
            todos: state.todos.map((todo)=>(
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
    }, [state])
      
            
    const {todos, todoInput} = state

    return (
        <div>
            <h1>할일 목록</h1>
            <TodoInsert
                todoInput={todoInput}
                handleChange={handleChange}
                handleInsert={handleInsert}
             />
            <ToDoList 
                todos={todos}
                handleDelete={handleDelete}
                onToggle = {onToggle}
            />
        </div>
    );
};

export default App;