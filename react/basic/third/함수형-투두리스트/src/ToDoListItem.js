import React from 'react';

import Checkbox from '@material-ui/core/Checkbox';

const ToDoListItem = ({todo, handleDelete, onToggle}) => {
    const {id, date, value, checked} = todo
    return (
        <tr>
            <td>
            <Checkbox
                checked={checked}
                onChange={()=>onToggle(id)}
                inputProps={{ 'aria-label': 'primary checkbox' }}
            /> 
            </td>
            <td
                className="todo-data"
                style={{
                    textDecoration: checked ? 'line-through' : 'none'
                }}
            >
                {date}
            </td>
            <td 
                className="todo-value"
                style={{
                textDecoration: checked ? 'line-through' : 'none'
            }}>
                {value}
            </td>
            <td>
                <button 
                 onClick={()=>handleDelete(id)}>
                    삭제
                </button>
            </td>
        </tr>
    );
};

export default React.memo(ToDoListItem);