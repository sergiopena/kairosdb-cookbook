# Cookbook Name:: KairosDB
# Attributes:: kairosdb
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


# Package version to install
default['kairosdb']['version'] = '0.9.4'
default['kairosdb']['release'] = '6'

#default['kairosdb']['cassandra_seed_discovery']['use_chef_search'] = true
#default['kairosdb']['cassandra_seed_discovery']['search_role']="cassandra-node"
#default['kairosdb']['cassandra_seed_discovery']['cluster_name']="cass_cluster_test"
