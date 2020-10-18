import React from 'react';

import 'codemirror/lib/codemirror.css';
import '@toast-ui/editor/dist/toastui-editor.css';
import { Editor } from '@toast-ui/react-editor';


const ToastEditor = () => {
  const handleFocus = () => {
    console.log('Editor에서 작성 중..');
  };
  return (  
    <Editor
      previewStyle="vertical"
      height="400px"
      initialEditType="markdown"
      initialValue= '마크다운 문법으로 작성해주세요!'
      onFocus={handleFocus}
    />
  );
  
}

export default ToastEditor;