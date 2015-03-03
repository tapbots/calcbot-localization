# calcbot-localization
Localization for Calcbot

This repository was set up to help us localize our apps for your native language. We have gotten many requests to help us localize, but coordinating everything has always been a pain. To help with this process, you must have a basic understanding of GitHub and editing files in Xcode.

We are testing this new process with **German** conversion only at the moment. We will do more languages if this works out well. Please use the **Issues** tab to coordinate.

There's 4 types of files

* **\*.strings**: The various localizable strings in XML plist format
* **Localizable.stringsComments**: Mostly the same strings as above, but with comments, don't edit these directly, they are just for reference for some of the weirder strings
* **Localizable.stringsIgnore**: A list of strings that don't need to be localized for this language
* **Missing.plist**: Contains only the strings that are currently not localized and not in the .stringsIgnore file

You should either edit the **\*.strings** file directly or the **Missing.plist** file, but not both. I have scripts that'll fill in/remove details from the files as needed. Assuming this works, I'll clean up their ugly code and upload them with instructions.

I'd highly recommend using Xcode to edit these or if not at least run a plutil -lint on any modified files to make sure they are formatted properly.

Thanks in advance!
