Path: Backend Engineering (Ruby on Rails) - January 2017  Unit: Week 5 - Welcome to Rails
Let's work with our frontend compatriots and make a Twitter clone

This week, our lab will be a cross-class collaboration. You'll be assigned a partner from our frontend class to make a social network.

You'll provide the API and they'll provide the user interface.

Deliverables

A github repo with your API
A link to the heroku instance running your api should be in the description of the repo
The URL of the repo submitted to TIYO
Requirements

Explorer Mode

To make a social network work, you're probably going to need the following things:
Models (at least): User, Post, Following (I'll mentioned a gem later that might take of this)
Endpoints: Login, Signup, Signout, Timeline (your posts plus the posts of the folks you're following), Follow, Unfollow, User list, Post a tweet
Posts should be validated that they are no longer than 160 characters long (and not empty)
Your API will need to be CORS-available so the frontend can use it
You should work with your frontend partner(s) to determine what other attributes your models might need and what data they might need to come back from the API
You should seed your data

Adventure Mode

Add pagination to your Post and user list APIs
Create an API endpoint for a user profile (just that user's posts and their profile info)
Create a search endpoint (Posts and Users)
Add email notifications (using SendGrid) and a forgot password endpoint

Epic Mode

Go nuts. Some suggestions: Hashtags! Mentions! SMS notifications! Choose your own adventure time.
Notes

Use figaro to secure any keys you might need (for SendGrid, for instance)
socialization might come in handy for your followings
Some code that you might find handy:
```
class Post
  def self.timeline(user)
    following_ids = user.followees(User).pluck(:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end
  ```
end
