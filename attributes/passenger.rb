node.default['passenger_nginx_repo']['version'] = '4.0.20'

if node['languages'].attribute?('ruby')
  node.default['passenger_nginx_repo']['root'] = "#{node['languages']['ruby']['gems_dir']}/gems/passenger-#{node['passenger_nginx_repo']['version']}"
  node.default['passenger_nginx_repo']['ruby'] = node['languages']['ruby']['ruby_bin']
else
  Chef::Log.warn("node['languages']['ruby'] attribute not detected in #{cookbook_name}::#{recipe_name}")
  Chef::Log.warn("Install a Ruby for automatic detection of node['nginx']['passenger'] attributes (root, ruby)")
  Chef::Log.warn('Using default values that may or may not work for this system.')
  node.default['passenger_nginx_repo']['root'] = "/usr/lib/ruby/gems/1.8/gems/passenger-#{node['nginx']['passenger']['version']}"
  node.default['passenger_nginx_repo']['ruby'] = '/usr/bin/ruby'
end

node.default['passenger_nginx_repo']['spawn_method']          = 'smart-lv2'
node.default['passenger_nginx_repo']['buffer_response']       = 'on'
node.default['passenger_nginx_repo']['max_pool_size']         = 6
node.default['passenger_nginx_repo']['min_instances']         = 1
node.default['passenger_nginx_repo']['max_instances_per_app'] = 0
node.default['passenger_nginx_repo']['pool_idle_time']        = 300
node.default['passenger_nginx_repo']['max_requests']          = 0
node.default['passenger_nginx_repo']['gem_binary']            = nil
