# calcbot-localization
Localization for Calcbot

#### Testing out German conversion only, will do more if this works well. Please use the [German Localization](https://github.com/tapbots/calcbot-localization/issues/1) issue to coordinate.

There's 4 types of files

* **\*.strings**: The various localizable strings in XML plist format
* **Localizable.stringsComments**: Mostly the same strings as above, but with comments, don't edit these directly, they are just for reference for some of the weirder strings
* **Localizable.stringsIgnore**: A list of strings that don't need to be localized for this language
* **Missing.plist**: Contains only the strings that are currently not localized and not in the .stringsIgnore file

You should either edit the **\*.strings** file directly or the **Missing.plist** file, but not both. I have scripts that'll fill in/remove details from the files as needed. Assuming this works, I'll clean up their ugly code and upload them with instructions.

I'd highly recommend using Xcode to edit these or if not at least run a plutil -lint on any modified files to make sure they are formatted properly.

Thanks in advance!
