

remote_file 'geoserver-2.8.1-gdal-plugin.zip' do
  source 'https://sourceforge.net/projects/geoserver/files/GeoServer/2.8.1/extensions/geoserver-2.8.1-gdal-plugin.zip'
  owner 'ec2-user'
  group 'ec2-user'
  mode '0755'
  action :create
end

template '/etc/yum.repos.d/OpenGeo.repo' do
    source 'OpenGeo.erb'
    owner 'ec2-user'
    group 'ec2-user'
    mode '0755'
  end

package 'opengeo-server' do
  action [:install]
end

bash 'unzipCopyMrSID' do
  cwd '/opt'
  code <<-EOH
    sudo unzip geoserver-2.8.1-gdal-plugin.zip -d geoserver-2.8.1-gdal-plugin
    sudo cp geoserver-2.8.1-gdal-plugin/* /usr/share/opengeo/geoserver/WEB-INF/lib/
    EOH
end


package 'gdal-mrsid' do
  action [:install]
end
