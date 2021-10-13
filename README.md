# intercom-articles-importer

A single file script made to move any published articles from one Intercom workspace to another. It is recommended that someone with basic coding experience is involved in the process.

There is also the option to transform any references to other Articles in your Help center, to make sure they point at the NEW corresponding article in your Help Center. This will NOT correctly transform links to collections -- this feature may be added on later.

Feel free to open any issues with feature requests or problems


## Instructions


### 1. Grabbing Articles Author ID.

This must be an authenticated admin of Intercom with a valid seat. You can grab this by going to the respective teammates "inbox" in Intercom and grabbing this part of the URL:

![image](https://user-images.githubusercontent.com/13723600/133684449-98fcb3c3-9b10-4471-822a-fc04a084bfc1.png)

This integer should replace the value for `AUTHOR_ID` in line 4 of the `init.rb` file.


### 2. Access Tokens. 
These can be grabbed from the **[Developer Hub in Intercom](https://app.intercom.com/a/apps/v2woedlx/developer-hub)**:
![image](https://user-images.githubusercontent.com/13723600/133684864-ccd1317f-5c5f-4020-9671-9d7b0d0a0df2.png)

Check out how to generate an access token using **[these directions](https://developers.intercom.com/building-apps/docs/authentication-types#section-how-to-get-your-access-token)**.

You will need to generate an access token for the Workspace you are Exporting articles from **AND** for the Workspace your are importing Articles into.
The exported access token will need the **Read and List Articles** and the imported access token, **Read and Write Articles** permissions. 

Replace the EXPORT_ACCESS_TOKEN and IMPORT_ACCESS_TOKEN with the above access tokens, respectively in lines 1 and 2 of `script.rb:

![image](https://user-images.githubusercontent.com/13723600/137180005-cc12a808-3656-4327-82bb-0bd27c3ab03a.png)



### 3. Naming your Collection
Name the collection in which the Articles will show up in your workspace on line 3 of `script.rb':

![image](https://user-images.githubusercontent.com/13723600/137180280-509e1f85-b3ad-4a78-8174-7e9e892b9dbf.png)

In this example, line 7 COLLECTION_NAME would be replaced with "Questions regarding deepdish" to read `imported_collection_name = "Questions regarding deepdish"`


### 4.OPTIONAL -- fixing article references in Help Center

If your Help Center links out to other Articles in your Help center -- set REPLACE_ARTICLE_URLS to true on line 8

You'll need to make sure you set an EXPORT_CUSTOM_DOMAIN and IMPORT_CUSTOM_DOMAIN value as well -- corresponding with the FULL URL of your root help center.

For example, if my original help center is hosted at `docs.deepdishisnotpizza.com` and I am moving to `docs.yesitis.com` -- those values would be my EXPORT_CUSTOM_DOMAIN and IMPORT_CUSTOM_DOMAIN values respectively

### 4. Running the Script

After cloning this repository -- open a terminal and enter. If you do not have bundler installed run:

`gem install bundler` - Macs by default should have Ruby/gems installed. Then

```bundle install```

Finally


```ruby script.rb```

















