import React,  { useState, useEffect } from 'react';


const userBook = () => {
  const [userBook, setUserBook]= useState()
  
  
  useEffect(()=>{
    fetch("users")
      .then((response) => response.json())
      .then((users) => {
        setUserBook(JSON.stringify(users))
      })
  }, [])

  console.log(userBook)

  return (  
    <div>{userBook}</div>
  );
  
}

export default userBook;