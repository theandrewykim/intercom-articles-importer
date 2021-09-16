# intercom-articles-importer

A single file script made to move any published articles from one Intercom workspace to another. It is recommended that someone with basic coding experience is involved in the process.


## Instructions

#### 1. Grabbing Articles Author ID.

This must be an authenticated admin of Intercom with a valid seat. You can grab this by going to the respective teammates "inbox" in Intercom and grabbing this part of the URL:

![image](https://user-images.githubusercontent.com/13723600/133684449-98fcb3c3-9b10-4471-822a-fc04a084bfc1.png)

This integer should replace the value for `author_id` in line 11 of the `script.rb` file: 
![image](https://user-images.githubusercontent.com/13723600/133684525-9af59dcb-ac2e-405f-8f02-e0d0d3fe3b37.png)


#### 2. Access Tokens. 
These can be grabbed from the **[Developer Hub in Intercom](https://app.intercom.com/a/apps/v2woedlx/developer-hub)**:
![image](https://user-images.githubusercontent.com/13723600/133684864-ccd1317f-5c5f-4020-9671-9d7b0d0a0df2.png)

Check out how to generate an access token using **[these directions](https://developers.intercom.com/building-apps/docs/authentication-types#section-how-to-get-your-access-token)**.

You will need to generate an access token for the Workspace you are Exporting articles from **AND** for the Workspace your are importing Articles into.
The exported access token will need the **Read and List Articles** and the imported access token, **Read and Write Articles** permissions. 

Replace the export_workspace and import_workspace with the above access tokens, respectively in lines 5 and 6 of `script.rb:

![image](https://user-images.githubusercontent.com/13723600/133685444-28644857-5d8c-43bc-9319-03c53f684205.png)

Access tokens should be wrapped in quotes("").

### 3. Naming your Collection
Name the collection in which the Articles will show up in your workspace on line 7 of `script.rb':

![image](https://user-images.githubusercontent.com/13723600/133685635-0e883614-95a8-42ae-a363-0e58f908e88c.png)
In this example, line 7 #NAME_OF_COLLECTION would be replaced with "Questions regarding deepdish" to read `imported_collection_name = "Questions regarding deepdish"`


### 4. Running the Script

After cloning this repository -- open a terminal and enter. If you do not have bundler installed run:

`gem install bundler` - Macs by default should have Ruby/gems installed. Then

```bundle install```

Finally


```ruby script.rb```

















