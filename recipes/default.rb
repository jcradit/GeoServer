

file '/etc/yum.repos.d/OpenGeo.repo' do
  content '
    [opengeo]
    name=opengeo
    baseurl=http://yum.opengeo.org/suite/v4/rhel/6/$basearch
    enabled=1
    gpgcheck=0'
  mode '0755'
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
