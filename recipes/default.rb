#
# Cookbook:: mongodb_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
include_recipe 'apt'
include_recipe 'build-essential::default'
apt_repository 'mongodb-org' do
  arch 'amd64'
  components ["multiverse"]
  distribution 'xenial/mongodb-org/3.6'
  keyserver 'hkp://keyserver.ubuntu.com:80'
  key '2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5'
  uri  'https://repo.mongodb.org/apt/ubuntu'
end
include_recipe 'apt'

package 'mongodb-org'

template '/home/ubuntu/mongod.conf' do
  source 'mongod.conf.erb'
  variables(
     :DBIP => node['db_port_ip'],
     :DBPORT => node['db_port']
   )
end

link '/etc/mongod.conf' do
  to '/home/ubuntu/mongod.conf'
end

template '/lib/systemd/system/mongod.service' do
  source 'mongod.service.erb'
end

link '/etc/mongod.service' do
  to '/lib/systemd/system/mongod.service'
end


service "mongod" do
  action [:enable, :start, :restart]
  subscribes :reload, '/home/ubuntu/mongod.conf]', :immediately
end
