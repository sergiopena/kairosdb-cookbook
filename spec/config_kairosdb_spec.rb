# Cookbook Name:: kairosdb
# Specs:: config_kairosdb
#
# Copyright 2016, Abiquo
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'

describe 'kairosdb::config_kairosdb' do

    let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

    it 'renders kairosdb configuration file' do
        expect(chef_run).to create_template('/opt/kairosdb/conf/kairosdb.properties').with( :source => 'kairosdb.properties.erb') 
    end

    it 'changes default attributes values' do
        chef_run.node.set['kairosdb']['config']['jetty.port']="8888"
        chef_run.converge(described_recipe)

        expect(chef_run).to render_file('/opt/kairosdb/conf/kairosdb.properties').with_content('jetty.port=8888')
    end

    it 'removes default attributes when set to ""' do
        chef_run.node.set['kairosdb']['config']['jetty.port']=''
        chef_run.converge(described_recipe)

        expect(chef_run).not_to render_file('/opt/kairosdb/conf/kairosdb.properties').with_content('jetty.port')
    end

    it 'adds new properties passed as attributes to the configuration file' do
        chef_run.node.set['kairosdb']['config']['foo.property']='bar'
        chef_run.converge(described_recipe)

        expect(chef_run).to render_file('/opt/kairosdb/conf/kairosdb.properties').with_content('foo.property=bar')
    end

end