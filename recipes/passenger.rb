package 'apt-transport-https'

apt_repository 'passenger' do
  uri          'https://oss-binaries.phusionpassenger.com/apt/passenger'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          '561F9B9CAC40B2F7'
end

package 'nginx-extras'
package 'passenger'

template "/etc/nginx/conf.d/passenger.conf" do
  source 'modules/passenger.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

node['passenger_nginx_repo']['apps'].each do |app|
  template( File.join(node["nginx"]["dir"], "sites-available", app["appname"]) ) do
    source 'nginx_vhost.conf.erb'
    owner  'root'
    group  'root'
    mode   '0644'
    variables(
      root_path:   ::File.join(app['app_dir'], 'public'),
      log_dir:     node["nginx"]["log_dir"],
      appname:     app['appname'],
      hostname:    app['hostname'],
      listen_port: app['listen_port'],
      ssl_key:     app['ssl_key'],
      ssl_cert:    app['ssl_cert'],
      rails_env:   app['rails_env']
    )
    notifies :reload, 'service[nginx]'
  end
end
