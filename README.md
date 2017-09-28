# Setup
Make sure that you have the correct version of Ruby, 2.4.1, and a recent
version of Bundler installed. Then run the `bundle` command to install
the necessary gems.

# Command Line App
The CLI tools interface is documented and can be accessed by running
`./bin/record_sort --help` if you are in the root of the project
directory.

It can also be invoked directly against the sample files using the below
commands:

- `./bin/record_sort spec/samples/space_delimited.txt`
- `./bin/record_sort spec/samples/pipe_delimited.txt --sortby
  "last_name,first_name"`
- `./bin/record_sort spec/samples/comma_delimited.txt --sortby
  "date_of_birth" --order ASC`

# REST API
Start the web server by running `bundle exec ruby app.rb`. It will tell
you what port it is listening on after it starts, normally this defaults
to `4567`. The endpoints as described in the specifications will be
availible at that port on your localhost.
