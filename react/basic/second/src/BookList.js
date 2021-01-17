import React from 'react';

import bookList from './data/Books'

import Book from './Book'
import BookInfo from './BookInfo'

import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import Box from '@material-ui/core/Box';

const useStyles = makeStyles((theme) => ({
    root: {
      width: '100%',
      maxWidth: 360,
      backgroundColor: theme.palette.background.paper,
    },
  }));

const BookList = () => {
    const [state, setState] = React.useState({
        bookInput: {}
    });

    const handleClick = (ISBN) => {
        setState({
            bookInput: bookList.filter((book) => book.ISBN === ISBN)[0]
        });
    };

    const {bookInput} = state;

   return(
        <Box display="flex">
            <Box display="table">
            {
                bookList.map((book)=>(
                    <List>
                        <Book
                         key={book.ISBN} 
                         book={book} 
                         handleClick={handleClick}
                        />
                    </List>
                ))
            }
            </Box>
            {
            Object.keys(bookInput).length > 0
            && 
            <BookInfo bookInput={bookInput}/>
            }
        </Box>
    )
}

export default BookList;