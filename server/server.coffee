Meteor.startup ->
    # Posts
    if Posts.find().count() == 0
        reset_data()
        
    # User
    initialize_users()
        
        
        
