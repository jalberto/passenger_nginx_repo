# node.default['passenger_nginx_repo']['version']               = '4.0.20'
node.default['passenger_nginx_repo']['root']                  = "/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini"
node.default['passenger_nginx_repo']['ruby']                  = node['rvm']['root_path'] + '/rubies/default'
node.default['passenger_nginx_repo']['spawn_method']          = 'smart-lv2'
node.default['passenger_nginx_repo']['buffer_response']       = 'on'
node.default['passenger_nginx_repo']['max_pool_size']         = 6
node.default['passenger_nginx_repo']['min_instances']         = 1
node.default['passenger_nginx_repo']['max_instances_per_app'] = 0
node.default['passenger_nginx_repo']['pool_idle_time']        = 300
node.default['passenger_nginx_repo']['max_requests']          = 0
node.default['passenger_nginx_repo']['gem_binary']            = nil

node.default['passenger_nginx_repo']['listen_port']           = 80
node.default['passenger_nginx_repo']['ssl_key']               = false
node.default['passenger_nginx_repo']['ssl_cert']              = false
node.default['passenger_nginx_repo']['rails_env']             = 'production'
