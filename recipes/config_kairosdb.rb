# Cookbook Name:: kairosdb
# Recipe:: config_kairosdb.rb
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

# Check if autodiscover cassandra cluster is enabled
node.default['kairosdb']['config']['kairosdb.datastore.cassandra.host_list']=discover_cassandra_seed_nodes if node['kairosdb']['cassandra_seed_discovery']

service "kairosdb" do
	action :nothing
end

template '/opt/kairosdb/conf/kairosdb.properties' do
  source 'kairosdb.properties.erb'
  mode '0644'

  # Remove empty configuration entries 
  node['kairosdb']['config'].select { |k,v| v == '' }.each do |k,v|
  	node.rm("kairosdb","config",k)
  end

  variables(:config => node['kairosdb']['config'])
  notifies :restart, 'service[kairosdb]'
end