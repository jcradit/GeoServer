include_recipe 'aws'

aws_s3_file "/etc/yum.repos.d/OpenGeo.repo" do
  bucket "chefrepo"
  remote_path "OpenGeo.repo"
end

package 'opengeo-server' do
  action [:install]
end

package 'geoserver-jdbcconfig' do
  action [:install]
end

package 'geoserver-gdal' do
  action [:install]
end

package 'gdal-mrsid' do
  action [:install]
end

service 'tomcat6' do
  action [:enable, :start]
end
