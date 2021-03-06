# Cookbook Name:: kairosdb
# Recipe:: install_kairosdb
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

case node['platform_family']
when 'rhel', 'redhat', 'centos', 'amazon', 'scientific', 'oracle'
	kairosdb_package = "kairosdb-#{node['kairosdb']['version']}-#{node['kairosdb']['release']}.rpm" 
	kairosdb_url = "https://github.com/kairosdb/kairosdb/releases/download/v#{node['kairosdb']['version']}/#{kairosdb_package}"

	remote_file 'package' do
		path "#{Chef::Config[:file_cache_path]}/#{kairosdb_package}"
		source kairosdb_url
	end

	package 'kairosdb' do
		source "#{Chef::Config[:file_cache_path]}/#{kairosdb_package}"
	end
when 'ubuntu', 'debian' 
	kairosdb_package = "kairosdb_#{node['kairosdb']['version']}-#{node['kairosdb']['release']}_all.deb"
	kairosdb_url = "https://github.com/kairosdb/kairosdb/releases/download/v#{node['kairosdb']['version']}/#{kairosdb_package}"

		remote_file 'package' do
		path "#{Chef::Config[:file_cache_path]}/#{kairosdb_package}"
		source kairosdb_url
	end

	dpkg_package 'kairosdb' do
		source "#{Chef::Config[:file_cache_path]}/#{kairosdb_package}"
	end

	package 'default-jre' do
    	action :install
    end
else 
	raise("Unsupported platform family")
end

service "kairosdb" do
	action [:enable, :start]
end
