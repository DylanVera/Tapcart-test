#  Tapcart PDP Challenge

## Configuring the Project

Configuring the Xcode project requires a few steps in Xcode to get up and running. 

1) Configure the Team for each target within the project.

Open the project in the Project navigator within Xcode and select each of the targets. Set the Team on the Signing & Capabilities tap to the team associated with your developer account.

2) Change the Bundle Identifier.

With the project's  Signing & Capabilities tab still open, update the Bundle Identifier value:

You should modify the reverse DNS portion to match the format that you use:

com.yourdomain.pdp-start


## Dependencies

Optional: close Xcode and in terminal at project path create a xcworkspace for dependencies:

`pod init`

then

`pod install`

return to the folder where the project is and open pdp-start.xcworkspace
