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

default['kairosdb']['config']['kairosdb.service.telnet']="org.kairosdb.core.telnet.TelnetServerModule"
default['kairosdb']['config']['kairosdb.service.http']="org.kairosdb.core.http.WebServletModule"
default['kairosdb']['config']['kairosdb.service.reporter']="org.kairosdb.core.reporting.MetricReportingModule"
default['kairosdb']['config']['kairosdb.datapoints.factory.long']="org.kairosdb.core.datapoints.LongDataPointFactoryImpl"
default['kairosdb']['config']['kairosdb.datapoints.factory.double']="org.kairosdb.core.datapoints.DoubleDataPointFactoryImpl"
default['kairosdb']['config']['kairosdb.datapoints.factory.string']="org.kairosdb.core.datapoints.StringDataPointFactory"
default['kairosdb']['config']['kairosdb.reporter.schedule']="0 */1 * * * ?"
default['kairosdb']['config']['kairosdb.jetty.port']="8080"
default['kairosdb']['config']['kairosdb.jetty.static_web_root']="webroot"
default['kairosdb']['config']['kairosdb.service.datastore']="org.kairosdb.datastore.h2.H2Module"
default['kairosdb']['config']['kairosdb.datastore.concurrentQueryThreads']="5"
default['kairosdb']['config']['kairosdb.datastore.h2.database_path']="build/h2db"
default['kairosdb']['config']['kairosdb.datastore.cassandra.host_list']="localhost:9160"
default['kairosdb']['config']['kairosdb.datastore.cassandra.keyspace']="kairosdb"
default['kairosdb']['config']['kairosdb.datastore.cassandra.replication_factor']="1"
default['kairosdb']['config']['kairosdb.datastore.cassandra.write_delay']="1000"
default['kairosdb']['config']['kairosdb.datastore.cassandra.write_buffer_max_size']="500000"
default['kairosdb']['config']['kairosdb.datastore.cassandra.single_row_read_size']="10240"
default['kairosdb']['config']['kairosdb.datastore.cassandra.multi_row_size']="1000"
default['kairosdb']['config']['kairosdb.datastore.cassandra.multi_row_read_size']="1024"
default['kairosdb']['config']['kairosdb.datastore.cassandra.row_key_cache_size']="10240"
default['kairosdb']['config']['kairosdb.datastore.cassandra.string_cache_size']="5000"
default['kairosdb']['config']['kairosdb.datastore.cassandra.increase_buffer_size_schedule']="0 */5 * * * ?"
default['kairosdb']['config']['kairosdb.datastore.cassandra.read_consistency_level']="ONE"
default['kairosdb']['config']['kairosdb.datastore.cassandra.write_consistency_level']="QUORUM"
default['kairosdb']['config']['kairosdb.datastore.hbase.timeseries_table']="tsdb"
default['kairosdb']['config']['kairosdb.datastore.hbase.uinqueids_table']="tsdb-uid"
default['kairosdb']['config']['kairosdb.datastore.hbase.zoo_keeper_quorum']="localhost"
default['kairosdb']['config']['kairosdb.datastore.hbase.zoo_keeper_base_dir']=""
default['kairosdb']['config']['kairosdb.datastore.hbase.auto_create_metrics']="true"
default['kairosdb']['config']['kairosdb.datastore.remote.data_dir']="."
default['kairosdb']['config']['kairosdb.datastore.remote.remote_url']="http://10.92.1.41:8080"
default['kairosdb']['config']['kairosdb.datastore.remote.schedule']="0 */30 * * * ?"
default['kairosdb']['config']['kairosdb.datastore.remote.random_delay']="0"
default['kairosdb']['config']['kairosdb.query_cache.cache_file_cleaner_schedule']="0 0 12 ? * SUN *"
default['kairosdb']['config']['kairosdb.carbon.tagparser']="org.kairosdb.core.carbon.HostTagParser"
default['kairosdb']['config']['kairosdb.carbon.text.port']="2003"
default['kairosdb']['config']['kairosdb.carbon.pickle.port']="2004"
default['kairosdb']['config']['kairosdb.carbon.pickle.max_size']="2048"
default['kairosdb']['config']['kairosdb.carbon.hosttagparser.host_pattern']="[^.]*\.([^.]*)\..*"
default['kairosdb']['config']['kairosdb.carbon.hosttagparser.host_replacement']="$1"
default['kairosdb']['config']['kairosdb.carbon.hosttagparser.metric_pattern']="([^.]*)\.[^.]*\.(.*)"
default['kairosdb']['config']['kairosdb.carbon.hosttagparser.metric_replacement']="$1.$2"