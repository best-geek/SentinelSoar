# Creating the Azure Function App
The Azure Function is commonly referred to as the 'engine'. It exposes a HTTP endpoint that will manipulate entities within a Sentinel incident. 

## Create the resource
- Navigate to the Azure Portal
- Search for Function Apps
- Create a new Function App
- When prompted for a hosting option, is is recommended to select `Consumption`

#### Configure the Function App:
*Note when selecting the subscription and resource group, it's recommended to create a dedicated resource group for easier management as creating a Function App will also create a storage account*

**Function App Name**: can be anything of your choosing. This will determine the URL used when accessing the API endpoints.  
**Runtime Stack**: Python
**Version**: 3.10 or newer
**Region**: Select appropriate Azure Region from the dropdown
**Operating System**: Linux

Select `Next`

**Storage Account**: Leave as the default option to create a new account
**Azure Files Connection**: Checked
**Blob Diagnostics**: Don't Configure Diagnostics Settings for now

Select `Next`

**Enable Public Network Access**: On

Select `Next`

**Enable Application Insights**: No

Select `Next`

**Continuous Deployment** Disable
**Authentication Settings -> Basic Authentication**: Disable

Select `Next`

Apply Tags and Proceed to creating the resource. After the creation is submitted, you will be redirected to the deployment page. The deployment 

## Deploy Repository Connection

Before linking a repository to the Function App, it is recommended to take a fork of [the repository](https://github.com/best-geek/SentinelSoarEngine). This will allow you to control updates and review changes made. 

- Within the Function App, select `Deployment Center` under `Deployment`
- Select GitHub and proceed to authorisation your account. If you have forked the repository on behalf of an organization, you will need to select 'Grant' on the authorization screen. 
- **Authentication Type**: User-assigned identity
- **Identity**: Create New

Select `Save`

Allow the Azure Portal to create the GitHub Workflow, which will take roughly 5 minutes. You will be notified of any failed builds to the email associated with the account that has been authenticated against. 

If the deployment is successful, you should now be able to see the `MakeJob` appear in the overview for the function. 

## Allow CORS Access
The Function App gets called upon by the UI used to generate new jobs. This is hosted under the domain `https://best-geek.github.io/`. 

In the function app, select `CORS` under the `API` option. Create a new entry for `https://best-geek.github.io/` and select save. 

If you have opted to clone the base repository to host the UI yourself, you will need to enter the hostname used to access the UI. 