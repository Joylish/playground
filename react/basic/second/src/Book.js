import React from 'react';

import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import Avatar from '@material-ui/core/Avatar';

const Book = ({book, handleClick}) => {
   const {
        ISBN,
        title,
        author,
        price,
        imgUrl,
    }=book

    return(
    <ListItem
        button
        onClick={() => handleClick(ISBN)}
    >
        <ListItemAvatar>
            <Avatar
                alt={title}
                src={imgUrl}
            />
        </ListItemAvatar>
        <ListItemText className="title">
            {title}
        </ListItemText>
        <ListItemText className="author">
            {author}
        </ListItemText>
        <ListItemText className="price">
            $ {price}
        </ListItemText>
    </ListItem>
    )
}

export default Book;