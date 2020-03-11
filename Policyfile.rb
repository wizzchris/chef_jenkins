# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'mongodb_cookbook'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'mongodb_cookbook::default'

# Specify a custom source for a single cookbook:
cookbook 'mongodb_cookbook', path: '.'
cookbook 'build-essential', '~> 8.2.1', :supermarket
