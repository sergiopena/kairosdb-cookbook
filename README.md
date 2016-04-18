Kairosdb Cookbook
=================
This cookbook provides two recipes to install and configure a KairosDB service. It allows to configure the service and in case of using cassandra cluster as backend provisioned with cassandra-dse cookbook obtains cassandra nodes address from chef server

Requirements
------------
* CentOS >= 6.7
* Ubuntu > ?

This cookbook dependes on the following cookbooks:

* java
* yum ?
* apt ?

Recipes
----------
The cookbook contains the following recipes:
* `recipe[kairosdb]` - Install and configures KairosDB
* `recipe[kariosdb::install_kairosdb]` - Download and installs KairosDB package.
* `recipe[kairosdb::setup_kairosdb]` - Configure kairos.properties file

Attributes
----------
The following attributes and under the `node['kairosdb']` namespace.

Attribute|Description|Type|Default
---|---|---|---
`['version']`|Version package to install, obtained from KairosDB github package|String|"0.9.4"
`['release']`|KairosDB release|String|"6"
`['cassandra_seed_discovery']['use_chef_search']`|Enable lookup on Chefserver for cassandra nodes deployed with casssandra-dse cookbook|Boolean|false
`['cassandra_seed_discovery']['search_role']`|Role assigned on Chef server to Cassandra nodes|String|nil
`['cassandra_seed_discovery']['cluster_name']`|Cassandra cluster name (cassandra-dse attribute)|String|nil


All attributes for kairosdb.properties by default are listed on the attributes/config.rb file, you can override all atributes on this file or undefine them by setting them to ''.

Next configuration will install and configure KairosDB to use chef provided cassandra nodes as datastore:

```json
{
  "kairosdb": {
    "cassandra_seed_discovery": {
      "use_chef_search": true,
      "search_role": "cassandra-node",
      "cluster_name": "cass_cluster_test"
    },
    "config": {
      "service.datastore": "org.kairosdb.datastore.cassandra.CassandraModule"
    }
  }
}
```

Usage
-----
#### kairosdb::default

Just include `kairosdb` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[kairosdb]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sergio Pena <sergio.pena@abiquo.com>