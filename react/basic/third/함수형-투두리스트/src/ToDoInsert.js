import React from 'react';
import DatePicker from 'react-datepicker';
import moment from 'moment';

const ToDoInsert = ({todoInput, handleChange, handleInsert, }) => {
    return (
        <div>
            <label htmlFor="todo-input">할 일 입력하기</label>
            <input 
                id="todo-input"
                name="todoInput"
                onChange={handleChange}
                value={todoInput}
            />
            <button 
            type="button"
            onClick={handleInsert}
            >
                할일추가
            </button>
        </div>
    );
};

export default ToDoInsert;