# calcbot-localization
Localization for Calcbot

This repository was set up to help us localize our apps for your native language. We have gotten many requests to help us localize, but coordinating everything has always been a pain. To help with this process, you must have a basic understanding of GitHub and editing files in Xcode.

We are testing this new process with **German, Arabic, Russian and Simplified Chinese** conversion only at the moment. We will do more languages if this works out well. Please use the **Issues** tab to coordinate.

There's 4 types of files

* **\*.strings**: The various localizable strings in XML plist format
* **\*.stringsMissing**: Contains only the strings that are currently not localized and not in the .stringsIgnore file
* **\*.stringsIgnore**: A list of strings that don't need to be localized for this language
* **\*.stringsComments**: Mostly the same strings as above, but with comments, don't edit these directly, they are just for reference for some of the weirder strings

You can edit the **\*.strings** or the **\*.stringsMissing** files. If a string shouldn't be localized please add it to the **\*.stringsIgnore**.

Once you are done editing a file, run the **UpdateStrings.rb** script in tools
> ./tools/UpdateStrings.rb de.lproj

This will remove/add any strings to the **\*.stringsMissing** files as well as verify that the files are properly formatted.

I'd highly recommend using Xcode to edit these and not doing too many files per pull request, will just make everything easier.

Thanks in advance!
