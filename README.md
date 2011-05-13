# RubyAck

This gem abstracts the usage of ack (http://betterthangrep.com/) so it
can be used in a ruby program.

## Pre-requisites

ack must be installed and available somewhere at the path.

## Example

The following code finds any ocurrencies of "Jackpot" , ignoring the
"specs" directory, following any symlinks

        @searcher = RubyAck::Core::TextSearcher.new
        @searcher.search("Jackpot") do |s|
          s.ignore_directory "specs"
          s.follow_symlink
        end


For more examples, check spec/integration/full_stack_specs.rb


## Options supported

* Non Recursive  (recursive by default)
* Follow Symlinks (don't follow by default)
* Ignore a directory

## Important aspects

* spec/integration/full_stack_specs.rb is an integration test
* spec/*.spec are unit tests, mocking external calls
