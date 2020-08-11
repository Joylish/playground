import React, { Component } from 'react';

import ClassToDoListItem from './ClassToDoListItem'

class ClassToDoList extends Component {
    constructor(props){
        super(props)
    }

    render() {
        const {todos, handleDelete, onToggle} = this.props
        return (
        todos.length?
        <table>
            <thead>
                <tr>    
                    <th>수행여부</th>
                    <th>날짜</th>
                    <th>할일 내용</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
            {todos.map(todo=>(
                <ClassToDoListItem
                    key={todo.id}
                    todo={todo}
                    handleDelete={handleDelete}
                    onToggle={onToggle}
                />)
            )}
            </tbody>
        </table>
        :
        <div>
            할 일이 없어요!
        </div>
        );
    }
}

export default ClassToDoList;
