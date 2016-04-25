# Cookbook Name:: kairosdb
# Specs:: install_kairosdb_spec
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

describe 'kairosdb::install_kairosdb' do

    context 'Centos 6.7' do
        let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos').converge(described_recipe) }

        let(:pkg) { "kairosdb-#{chef_run.node['kairosdb']['version']}-#{chef_run.node['kairosdb']['release']}.rpm" }
        let(:url) { "https://github.com/kairosdb/kairosdb/releases/download/v#{chef_run.node['kairosdb']['version']}/#{pkg}" }

        it 'downloads the kairosdb package' do
            chef_run.converge(described_recipe)

            expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/#{pkg}").with({
                :source => url
                })
        end

        it 'installs the kairosdb package' do
            chef_run.converge(described_recipe)

            expect(chef_run).to install_package('kairosdb').with({
                :source => "#{Chef::Config[:file_cache_path]}/#{pkg}"
                })
        end

        it 'enables the kairosdb service' do
            expect(chef_run).to enable_service('kairosdb')
        end

        it 'starts the kairosdb service' do
            expect(chef_run).to start_service('kairosdb')
        end
    end

    context 'Ubuntu 14.04' do
        let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }

        let(:pkg) { "kairosdb_#{chef_run.node['kairosdb']['version']}-#{chef_run.node['kairosdb']['release']}_all.deb" }
        let(:url) { "https://github.com/kairosdb/kairosdb/releases/download/v#{chef_run.node['kairosdb']['version']}/#{pkg}" }

        it 'downloads the kairosdb package' do
            chef_run.converge(described_recipe)

            expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/#{pkg}").with({ :source => url })
        end

        it 'installs the kairosdb package' do
            chef_run.converge(described_recipe)

            expect(chef_run).to install_dpkg_package('kairosdb').with({ :source => "#{Chef::Config[:file_cache_path]}/#{pkg}" })
        end

        it 'enables the kairosdb service' do
            expect(chef_run).to enable_service('kairosdb')
        end

        it 'starts the kairosdb service' do
            expect(chef_run).to start_service('kairosdb')
        end
    end

    context 'Unsupported platform' do
        let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2012') }

        it 'fails with Unsupported platform message' do
            expect { chef_run.converge(described_recipe) }.to raise_error(RuntimeError)
        end
    end
end