#
# Cookbook:: node_cookbook
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'
require 'aws-sdk'

describe 'node_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    describe package 'mongodb-org' do
      it { should be_installed.with_version('3.6.17') }
    end
    it 'should create a mongod.conf template in /home/ubuntu/environment/mongod.conf' do
      expect(chef_run).to create_template "/home/ubuntu/environment/mongod.conff"
    end

  end
end
