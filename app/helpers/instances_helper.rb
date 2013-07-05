module InstancesHelper

  def capistrano_config
     <<-CAPCONFIG
    <pre>
load 'recipes/cleanup.rb'

set :project_roles, %w(app db web)

set :application, "#{ @instance.course.slugify }"

load 'recipes/omeka_defaults.rb'
    </pre>

    CAPCONFIG

  end

  def apache_config(stage)
    html = <<-HTTPDCONFIG
      <pre>
&lt;VirtualHost *:80>
    DocumentRoot /usr/local/projects/#{ @instance.course.slugify }/current

    ServerName #{stage}.#{ @instance.course.slugify }.#{ENV['domain'] || 'localhost' }
    ServerAlias #{stage}.#{ @instance.course.slugify }.#{ENV['domain'] || 'localhost' }

    ErrorLog logs/#{ @instance.course.slugify }.omeka-error_log
    CustomLog logs/#{ @instance.course.slugify }.omeka-access_log common

    &lt;Directory "/usr/local/projects/#{ @instance.course.slugify }/current">
      Options FollowSymlinks
      AllowOverride All
      Order allow,deny
      Allow from all
    &lt;/Directory>


&lt;/VirtualHost>
      </pre>

    HTTPDCONFIG
    html
  end

  def db_config(stage)
    html = <<-DBCONFIG
      <pre>
[database]
host     = "#{ ENV['db_host'] ||= 'localhost' }"
username = "#{ ENV['db_user'] ||= 'username' }"
password = "#{ ENV['db_password'] ||= 'password' }"
name     = "omeka_#{ stage }"
prefix   = "#{ @instance.course.slugify }_"
;port     = ""
      </pre>
    DBCONFIG
    html
  end

end
