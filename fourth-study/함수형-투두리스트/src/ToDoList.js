import React from 'react';

import ToDoListItem from './ToDoListItem'

const ToDoList = ({todos, handleDelete, onToggle}) => {
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
                <ToDoListItem
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
};

export default React.memo(ToDoList);