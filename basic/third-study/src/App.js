import React from 'react';

import BookList from './BookList'

import Container from '@material-ui/core/Container';

const App = () => {
    return(
        <Container maxWidth="md">
            <BookList/>
        </Container>
    )
}

export default App;