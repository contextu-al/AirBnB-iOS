 

## List Row Insertion

The Apps' existing code can be now orchestrated for Product Team to make use of. This powerful but simple example shows how you can add engagement for promotional content in existing app lists without cluttering screen realestate. Do engagemet just like Twitter or Facebook does and no need for Appstore releases! (after the initial low code work is done)

This example illustrates how you can extend your existing lists with engagement messaging, inline. Your App developer can add this and with a few lines of code extend your application so that a new row can be targeted to specific users with promotional or explanatory content entered from the Contextual Dashboard - no code!

This row example is based on a standard Contextual Announcement template. The steps are:
1. Create an account at [Contextual Dashboard](https://dashboard.contextu.al/ "Contextual Dashboard").
2. Install the Contextual SDK following the instructions for IOS or Android.
3. Your developer:
 *  adds your existing row content creation to this source code example.
 * Add the sample wrapper code for example, *AdhocRowInsertion*
4. In the Dashboard, create or edit a Guide.
5. Choose an Announcement Template that best shows the design of a row in your app. For example, do you have Titles, Content, Pictures.
6. Copy-Paste the instantiation of the Guide Component AFTER the Contextual SDK registration. 
 * Now go to the Extensibility section in the sidebar and paste in the JSON as follows:

 `
 {
  "guideBlockKey": "AdhocRowInsertion",
  "position": 1,
  "cellID": "customCellID",
  "rowHeight": 300,
  "name": "Feature"
}
`

7. In the sidebar under the relevent sections: Edit the title, content, image location (upload images etc)
8. Save the guide and show to your Product Team, once you release this version of the App they can launch List Row Insertion to whoever they want, whenever they want.

 <img src="https://raw.githubusercontent.com/contextu-al/AirBnB-iOS/main/airbnb-main/img/Inline-Feature-Announcement.gif" alt="Adding your Extra JSON" width="200"/>
 
