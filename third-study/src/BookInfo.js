import React from 'react';

import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
    root: {
      maxWidth: 345,
    },
    media: {
      height: 500,
    },
  });

const BookInfo = ({bookInput}) => {
    const {
         title,
         author,
         publisher,
         price,
         imgUrl,
         introduce
     }=bookInput

     const classes = useStyles();
    return (
        
        <Card className={classes.root}>
            <CardMedia
                className={classes.media}
                image={imgUrl}
                title={title}
            />
            <CardContent>
                <Typography gutterBottom variant="h5" component="h2">
                    {title}
                </Typography>
                <Typography>

                </Typography>
            </CardContent>

           <div className="detail">
               <p>{author}</p>
               <p>{publisher}</p>
               <p>$ {price}</p>
               <p>{introduce}</p>
           </div>
        </Card>
    );
};

export default BookInfo;