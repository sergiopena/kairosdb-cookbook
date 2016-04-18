# Cookbook Name:: kairosdb
# Libraries:: config_helpers
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

#
# This is heavily based on the cassandra-dse cookbook by michaelklishin
# https://supermarket.chef.io/cookbooks/cassandra-dse
# 

def discover_cassandra_seed_nodes
  # use chef search for seed nodes
  return unless node['kairosdb']['cassandra_seed_discovery']
  if node['kairosdb']['cassandra_seed_discovery']['use_chef_search']
    if Chef::Config[:solo]
      Chef::Log.warn("Chef Solo does not support search, provide the seed nodes via node attribute node['kairosdb']['config']['datastore.cassandra.host_list']")
      node['ipaddress']
    else
      Chef::Log.info('Cassandra seed discovery using Chef search is enabled')
      q = node['kairosdb']['cassandra_seed_discovery']['search_query'] ||
          "chef_environment:#{node.chef_environment} "\
          "AND role:#{node['kairosdb']['cassandra_seed_discovery']['search_role']} "\
          "AND cassandra_config_cluster_name:#{node['kairosdb']['cassandra_seed_discovery']['cluster_name']}"
      Chef::Log.info("Will discover Cassandra seeds using query '#{q}'")
      xs = search(:node, q).map(&:ipaddress).sort.uniq
      Chef::Log.debug("Discovered #{xs.size} Cassandra seeds using query '#{q}'")

      if xs.empty?
        Chef::Log.error("Not nodes found, provide cassandra host list via attribute")
        nil
      else
        xs.join(',')
      end
    end
  else
    # user defined seed nodes
    if node['kairosdb']['config']['kairosdb.datastore.cassandra.host_list'].is_a?(Array)
      node['kairosdb']['config']['kairosdb.datastore.cassandra.host_list'].join(',')
    else
      node['kairosdb']['config']['kairosdb.datastore.cassandra.host_list']
    end
  end
end