import React, { Component } from 'react';

class ClassToDoInsert extends Component {
    render() {
        const {todoInput, handleChange, handleInsert} = this.props
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
    }
}

export default ClassToDoInsert;
