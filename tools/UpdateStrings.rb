#!/usr/bin/env ruby

if ARGV.count != 1
  puts "Usage: #{$0} <locale.lproj>"
  exit -1
end

begin 
  require 'CFPropertyList'
rescue LoadError
  puts "Error: make sure you have CFProperyList installed, run 'sudo gem install CFPropertyList'"
  exit -1
end

class Hash
  def self.from_plist(filename)
    return {} unless File.exist?(filename)
    CFPropertyList.native_types(CFPropertyList::List.new(:file => filename).value)
  end
  def save_plist(filename)
    plist = CFPropertyList::List.new
    plist.value = CFPropertyList.guess(self)
    plist.save(filename, CFPropertyList::List::FORMAT_XML)
  end
end

class Array
  def self.from_plist(filename)
    return [] unless File.exist?(filename)
    CFPropertyList.native_types(CFPropertyList::List.new(:file => filename).value)
  end
  def save_plist(filename)
    plist = CFPropertyList::List.new
    plist.value = CFPropertyList.guess(self)
    plist.save(filename, CFPropertyList::List::FORMAT_XML)
  end
end

require 'find'

Find.find(ARGV[0]) do | path |
  if /.*.strings$/ =~ path
    old_strings_hash = Hash.from_plist(path)
    new_strings_hash = old_strings_hash.dup

    # Loop through missing strings and update if any have been localized
    old_missing_strings_hash = Hash.from_plist(path + 'Missing')
    old_missing_strings_hash.each_pair do | key, value |
      if (key != value) && (old_missing_strings_hash[key] != nil)
        new_strings_hash[key] = value 
      end
    end

    # Remove all the strings in the ignore file
    Array.from_plist(path + 'Ignore').each do | ignore_key |
      new_strings_hash.delete(ignore_key)
    end
    
    unless File.exists?(path + 'Ignore')
      Array.new.save_plist(path + 'Ignore')
    end

    # Create new missing strings
    new_missing_strings_hash = new_strings_hash.dup
    new_missing_strings_hash.keep_if { | key, value | key == value }

    if old_strings_hash != new_strings_hash
      puts "Updating #{path}"
      new_strings_hash.save_plist(path)
    end

    if (new_missing_strings_hash.count > 0)
      if old_missing_strings_hash.count > 0
        if old_missing_strings_hash != new_missing_strings_hash
          puts "Updating #{path}Missing" 
          new_missing_strings_hash.save_plist(path + 'Missing')
        end
      else
        puts "Creating #{path}Missing" 
        new_missing_strings_hash.save_plist(path + 'Missing')
      end
    else
      if old_missing_strings_hash.count > 0
        puts "Deleting #{path}Missing, woot!"
        File.delete(path + 'Missing')
      end
    end
  end
end