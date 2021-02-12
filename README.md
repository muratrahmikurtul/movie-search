# README

## How does app work?

Users can search movie series with my application via omdbapi.  
User writes movie's name in the search box and clicks the search button. This click makes post request to my search action which is in my controller. With that, I take the name parameter from user.  Then my controller says to my service layer "Hey I need your help please call the API with this parameter then tell me what is the result and don't forget to sort data according to year". And then my service makes GET request to API, receive data, sort data then deliver to controller back. My controller receives data from service layer then delivers to View layer.

## What would you add?

I would add Redis maybe. Because each request has a cost and you prefer that take data from cache rather than call to API for each request.  On the other hand, even if service is down you will bring data to user thanks to redis, because of that it provides time for solving errors.I would write integration test I mean I could stub api call and could mock data. I could use webmock gem for that. 

## What would you change?

I would use RestClient gem rather than HTTP gem. Because with RestClient gem you can add some params to GET request with base URL like {params: {'foo' => 'bar'}} but with HTTP I added params end of URL manually.It does not look good. 


## What would you do differently?

If I used database(actually I if need to use) I would create a model which name is Movie then I map the data from API to this model. But I chose to push the data to an array with manipulation. I mean I pushed only fields that I will show to user. Because I don't need to save data. I would use HAML. I would read APIKEY from env variables. I would not use inline styling.

## What would you look at more carefully?

Error handling. I mean, I would have handled errors more deeply. I would have separated errors according to each response code.



# movie-search
