# Move-away sale coffeescript
Posts = new Meteor.Collection "posts"
Users = new Meteor.Collection "users"
UserSessions = new Meteor.Collection "userSessions"
Requests = new Meteor.Collection "requests"

# Initialize user database
initialize_users = ->
    Users.remove {}
    
    # User collection
    approvedUsers = [
    ]
        
    # Insert into collection
    for user in approvedUsers
       Users.insert user


# Clear cookie
deleteAllCookies = -> 
    cookies = document.cookie.split(";");
    
    len = cookies.length
    
    for i in [0..len]
        cookie = cookies[i]
        eqPos = cookies.indexOf "="
        name = if eqPos > -1 then cookie.substr(0, eqPos) else cookie
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT"


# Reset all data
reset_data = ->
    
    # Remove everything
    Posts.remove {}
    
    # Populate the collection
    # -----------------------
    
    # Array of all posts
    myStuffs = [
        
        # bed
        {
            caption: "Bed",
            description: "Queen-sized bed. ",
            profilePic: "/img/items/bed2.JPG",
            restOfImages: ["/img/items/bed3.JPG"],
            startingBid: 30,
            currentBid: 31,
            mult: true,
            largeImg: true,
            bidHistory: [
              
              {
                bid: 30,
                user: "sinnee_ng@hotmail.com"
              },
              
              {
                bid: 31,
                user: "sayakurt@gmail.com"
              }
              
              ],
            sold: false,
            id: 1
        },
        
        # table
        {
            caption: "Table",
            description: "Black table. Only 2 years old. Bought new from Target.",
            profilePic: ["/img/items/table2.JPG"],
            startingBid: 30,
            currentBid: 30,
            mult: false,
            bidHistory: [
              
              {
                bid: 30,
                user: "sinnee_ng@hotmail.com"
              }
              
              
              ],
            sold: false,
            largeImg: true,
            id: 2
        }
        
        # bookstand
        {
            caption: "Book Stand",
            description: "Bookstand. Have 2 of them actually.",
            profilePic: ["/img/items/bookstand.JPG"],
            startingBid: 1,
            currentBid: 2,
            mult: false,
            bidHistory: [
              
              {
                bid: 1,
                user: "sinnee_ng@hotmail.com"
              },
              
              {
                bid: 2,
                user: "sayakurt@gmail.com"
              }
              
              ],
            sold: false,
            largeImg: false,
            id: 3
        },
        
        # chair
        {
            caption: "Chair",
            description: "Steelcase chair. Built-in with a lot of functions. Bought it for $100 (original price is $700 -> http://goo.gl/HKYlt) ",
            profilePic: ["/img/items/chair1.JPG"],
            startingBid: 30,
            currentBid: 30,
            sold: false,
            mult: false,
            bidHistory: [
              
              {
                bid: 30,
                user: "sinnee_ng@hotmail.com"
              }
              
              
              ],
            largeImg: false,
            id: 4
        },
        
        # container
        {
            caption: "Container",
            description: "Transparent container. Have 3 of them.",
            profilePic: ["/img/items/container.JPG"],
            startingBid: 1,
            currentBid: 1,
            sold: false,
            mult: false,
            bidHistory: [
              
              {
                bid: 1,
                user: "sinnee_ng@hotmail.com"
              }
              
              ],
            largeImg: false,
            id: 5
        },
        
        # corner-light
        {
            caption: "Wall Light",
            description: "Will sell with everything you see in this picture (except the wall) Bought new.",
            profilePic: "/img/items/corner-light.JPG",
            restOfImages: ["/img/items/corner-light2.JPG"],
            startingBid: 5,
            currentBid: 5,
            sold: false,
            mult: true,
            bidHistory: [
              
              {
                bid: 5,
                user: "brianloh91@gmail.com"
              }
              
              
              ],
            largeImg: false,
            id: 6
        },
        
        # desk light
        {
            caption: "Desk Light",
            description: "Old desk light (unused)",
            profilePic: ["/img/items/desk-light1.JPG"],
            startingBid: 5,
            currentBid: 5,
            sold: false,
            bidHistory: [],
            mult: false,
            largeImg: false,
            id: 7
        },
        
        # shelf light
        {
            caption: "Shelf Light",
            description: "Shelf light + shelf",
            profilePic: "/img/items/deskbulbs.JPG",
            restOfImages: ["/img/items/deskbulbs2.JPG"],
            startingBid: 20,
            sold: true,
            currentBid: 20,
            mult: true,
            bidHistory: [],
            largeImg: true,
            id: 8
        },
        
        # fake plant
        {
            caption: "Fake Plant",
            description: "Yes a fake plant.",
            profilePic: ["/img/items/fake-plant.JPG"],
            startingBid: 1,
            currentBid: 1,
            sold: false,
            mult: false,
            bidHistory: [],
            largeImg: false,
            id: 9
        },
        
        # cooler
        {
            caption: "Laptop Cooler",
            description: "Targus laptop cooler.",
            profilePic: "/img/items/fan1.JPG",
            restOfImages: ["/img/items/fan2.JPG"],
            startingBid: 5,
            sold: false,
            currentBid: 5,
            bidHistory: [],
            mult: true,
            largeImg: false,
            id: 10
        },
        
        # folder
        {
            caption: "Folder",
            description: "(See pic)",
            profilePic: "/img/items/folder1.JPG",
            restOfImages: ["/img/items/folder2.JPG", "/img/items/folder3.JPG"],
            startingBid: 1,
            currentBid: 1,
            sold: false,
            bidHistory: [
              
              {
                bid: 1,
                user: "sinnee_ng@hotmail.com"
              }
              
              ],
            mult: true,
            largeImg: false,
            id: 11
        },
        
        # heater
        {
            caption: "Heater",
            description: "2-year-old mini heater. Still works. Bought new.",
            profilePic: ["/img/items/heater.JPG"],
            startingBid: 15,
            currentBid: 15,
            sold: false,
            bidHistory: [],
            mult: false,
            largeImg: false,
            id: 12
        },
        
        # holder
        {
            caption: "Stationery Holder",
            description: "(See pic)",
            profilePic: "/img/items/holder1.JPG",
            restOfImages: ["/img/items/holder2.JPG", "/img/items/holder3.JPG"],
            startingBid: 1,
            currentBid: 1,
            sold: false,
            bidHistory: [
              
              {
                bid: 1,
                user: "munkongwong@live.com"
              }
              
              
              ],
            mult: true,
            largeImg: false,
            id: 13
        },
        
        # humidifier
        {
            caption: "Air Purifier",
            description: "1-year-old air purifier. Bought new from Target for $40.",
            profilePic: ["/img/items/humidifier.JPG"],
            startingBid: 15,
            currentBid: 15,
            sold: false,
            bidHistory: [],
            mult: false,
            largeImg: false,
            id: 14
        },
        
        # nexus
        {
            caption: "Nexus S (rooted)",
            description: "Bought for doing Android development. Don't need it anymore. (negotiable)",
            profilePic: "/img/items/nexus1.JPG",
            restOfImages: ["/img/items/nexus2.JPG", "/img/items/nexus3.JPG", "/img/items/nexus4.JPG", "/img/items/nexus5.JPG"],
            startingBid: 100,
            currentBid: 100,
            bidHistory: [],
            sold: false,
            largeImg: false,
            mult: true,
            id: 15
        },
        
        # picture frame
        {
            caption: "Picture Frame",
            description: "(See pic)",
            profilePic: ["/img/items/picture-frame.JPG"],
            startingBid: 5,
            sold: false,
            currentBid: 5,
            bidHistory: [],
            mult: false,
            largeImg: false,
            id: 16
        },
        
        # pinboard
        {
            caption: "Pinboard",
            description: "(See pic)",
            profilePic: "/img/items/pinboard.JPG",
            restOfImages: ["/img/items/pinboard2.JPG"],
            startingBid: 1,
            sold: false,
            currentBid: 3,
            bidHistory: [
              
              {
                bid: 1,
                user: "linsz_forcrush@msn.com"
              },
              
              {
                bid: 2,
                user: "munkongwong@live.com"
              },
              
              {
                bid: 3,
                user: "linsz_forcrush@msn.com"
              }
              
              
              ],
            largeImg: false,
            mult: true,
            id: 17
        },
        
        # rack
        {
            caption: "Rack",
            description: "Just the rack (alcohol not included)",
            profilePic: ["/img/items/rack.JPG"],
            startingBid: 5,
            sold: false,
            bidHistory: [
              
              {
                bid: 5,
                user: "linsz_forcrush@msn.com"
              }
              
              
              ],
            currentBid: 5,
            largeImg: true,
            mult: false,
            id: 18
        },
        
        # vacumn
        {
            caption: "Vacumn Cleaner",
            description: "1-year-old vacumn cleaner. Comes with 2 free bags. Bought new from Target.",
            profilePic: ["/img/items/vacumn.JPG"],
            startingBid: 15,
            currentBid: 15,
            sold: false,
            largeImg: false,
            bidHistory: [
              
              {
                bid: 15,
                user: "munkongwong@live.com"
              }
              
              
              ],
            mult: false,
            id: 19
        }
        
        ]
        
    # Insert into collection
    for stuff in myStuffs
       Posts.insert stuff


# Check if session is valid
checkSession = ->
    sessionsIds = _.pluck UserSessions.find().fetch(), "sessionId"
    
    arr = document.cookie.split ";"
    
    for a in arr
      b = a.split "="
      if b[0].trim() == "sessionsId"
        cookie = b[1]
    
    # if _.include sessionsIds, parseInt document.cookie.split("=")[1]
    if _.include sessionsIds, parseInt cookie
        return true
    else
        return false


# Login function
login = ->
    retrieveUser = Users.findOne({email: $("#email").val()})
    if retrieveUser == undefined
        # Tell user try again
        $("#email").addClass("error")
        $("#password").addClass("error")
    else
      if retrieveUser.password == $("#password").val()
        # Log in the user
        # Generate a session id
        sessionId = Math.floor((Math.random()*1000000) + 1);
        UserSessions.insert {
            "sessionId" : sessionId,
            "email": $("#email").val()
        }
        deleteAllCookies() # delete all cookies
        timeNow = new Date()
        document.cookie = "sessionsId=" + sessionId + "; expires=" + timeNow.setDate(timeNow.getDate() + 1) + "; path=/"
        # clear input and hide form
        $("#login").modal("hide")
        $("#email").val("")
        $("#password").val("")
        
        # notify
        $(".success").show().animate({top:"0"}, 1500).hide("slow")
        
      else
        # Re enter password
        $("#email").addClass("error")
        $("#password").addClass("error")


# On client side
if Meteor.is_client
    
    # Handlebar helpers
    # Carousels
    Handlebars.registerHelper "navId",
        (id) ->
          return "#" + id

    # Bid History Modals
    Handlebars.registerHelper "modalId",
        (caption) ->
          return caption.replace(" ", "")

    Handlebars.registerHelper "modalLaunchId",
        (caption) ->
          return "#" + caption.replace(" ", "")

    # Find length of array
    Handlebars.registerHelper "empty",
        (bidHistory) ->
          if bidHistory.length == 0
            return true
          else
            return false

    Handlebars.registerHelper "mask",
        (user) ->
          actual = user.split("@")[0]
          firstChar = actual.charAt 0
          secondChar = actual.charAt 1
          thirdChar = actual.charAt 2
          # lastChar = actual.charAt actual.length-1
          masked = actual.substring(3, user.length-1).replace /\w/g, "*"
          return firstChar + secondChar + thirdChar + masked

    Handlebars.registerHelper "getCurrentBid",
        (bidHistory, currentBid) ->
          if bidHistory.length == 0
            return "-"
          else
            return "$" + currentBid

    Handlebars.registerHelper "getNextBidPrice",
        (bidHistory, currentBid) ->
          if bidHistory.length == 0
            return currentBid
          else
            return currentBid + 1

    Handlebars.registerHelper "getHighestBidder",
        (bidHistory) ->
          sorted = _.sortBy bidHistory, (bid) ->
            return bid.bid
          reversed = sorted.reverse()
          first = _.first reversed
          if first
            return first.user
          else
            return "-"
    Handlebars.registerHelper "getCaption",
        (src) ->
          post = Posts.findOne({restOfImages: src})
          return post.caption

    Handlebars.registerHelper "getDescription",
        (src) ->
          post = Posts.findOne({restOfImages: src})
          return post.description

    Handlebars.registerHelper "orderDesc",
        (bidHistory) ->
          return bidHistory.reverse()
          
    Handlebars.registerHelper "loggedIn",
      () ->
          checkSession()
        
    # Load content into template
    _.extend Template.content,
      posts: ->
        Posts.find {}, {sort: {caption:1}}

    Meteor.defer -> 
                    $("#login").on "shown", () ->
                        $("#email").focus()
    
    # Add events
    $.extend Template.listing,
        events:             
            'click button.small.green.nice.button.radius.yes': (e) ->
              $(e.currentTarget).find("button.large.green.nice.button.radius.bid").show()
              $($(e.currentTarget).find("p.sure")).addClass("hide")
              # If first bid, bid the starting bid
              if @bidHistory.length == 0
                Posts.update @_id, $set : {currentBid: @startingBid}
              else # Otherwise, increase bid by $1
                Posts.update @_id, $inc : {currentBid: 1}

              latestBid = Posts.findOne(_id:@_id).currentBid

              # Get user email
              
              arr = document.cookie.split ";"

              for a in arr
                b = a.split "="
                if b[0].trim() == "sessionsId"
                  cookie = b[1]
              
              
              user = UserSessions.findOne({sessionId: parseInt cookie}).email

              # Track user into bid history
              Posts.update @_id, $addToSet : {
                bidHistory : {
                     "user" : user,
                     "bid"  : latestBid
                }
              }
              # $("#confirmToBid").modal "show"
            'click button.large.green.nice.button.radius.bid': (e) ->
              
                # If user is logged in
                if checkSession()
                  
                  # Are you sure message
                  $(e.currentTarget).find("button.large.green.nice.button.radius.bid").hide()
                  $($(e.currentTarget).find("p.hide.sure")).removeClass("hide")

                else # User not logged in
                    $("#login").modal "show"
            'click button.small.red.nice.button.radius.no': (e) ->
              $(e.currentTarget).find("button.large.green.nice.button.radius.bid").show()
              $($(e.currentTarget).find("p.sure")).addClass("hide")
            
            # 'click #yes': (e) ->
            #     $("#confirmToBid").modal "hide"
            #     
            # 'click #no': () ->
            #     $("#confirmToBid").modal "hide"
    
    $.extend Template.loginForm,
      events:
          'click input': () ->
              $("span.help-inline").hide()
              $("#email").removeClass("error")
              $("#password").removeClass("error")
          'keydown input': (e) ->
              $("#email").removeClass("error")
              $("#password").removeClass("error")
              if e.keyCode == 13
                  login()
          'click button.login': (e) ->
              login()
              
    $.extend Template.navbar,
      events:
          'click #logout': (e) ->
              # Clear session
              
              arr = document.cookie.split ";"

              for a in arr
                b = a.split "="
                if b[0].trim() == "sessionsId"
                  cookie = b[1]
              
              
              UserSessions.remove {sessionId: parseInt cookie}
              deleteAllCookies()
              $(".info").show().animate({top:"0"}, 1500).hide("slow")
    
    
    $.extend Template.raForm,
      events:
          'click #submit-ra': (e) ->
              
              if $("#emailra").val().indexOf("@") <  $("#emailra").val().indexOf(".") 
                  # Request access
                  emailra = $("#emailra").val()
                  namera = $("#namera").val()
                  msgra = $("#msgra").val()
              
                  Requests.insert {
                      "email": emailra,
                      "name": name,
                      "msg": msgra
                  }
                  $("#ra-form").modal("hide")
                  $("#login").modal("hide")
                  $("#notify").modal("show")
              else 
                  $("#emailra").addClass("error")
    
    # Activate carousel
    Meteor.defer -> 
        $(".carousel").carousel({
            interval: 1000
        })
        $("#rapopover").popover()
        deadline = new Date(2012, 5 - 1, 31);
        $(".timer").countdown({
          until: deadline,
          timeSeparator: ":",
          compact: true,
          # compactLabels: ['y', 'm', 'w', 'd'],
          onExpiry: () ->
            # disable bidding
            $("large green nice button radius bid").attr("disabled", true);
        });
        
        # // scroll back to top indicator
        # // hide #back-top first
        $("#back-top").hide();

        # // fade in #back-top
        $ () ->
              $(window).scroll () ->
                                    if $(this).scrollTop() > 100 
                                        $('#back-top').fadeIn();
                                    else 
                                        $('#back-top').fadeOut();
                                    

        # // scroll body to 0px on click
        $('#back-top a').click(() ->
          $('body,html').animate({
              scrollTop: 0
          },
          800);
          return false;
        );

        
    

        









