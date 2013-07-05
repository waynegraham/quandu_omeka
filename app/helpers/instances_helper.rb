module InstancesHelper

  def capistrano_config
     <<-CAPCONFIG
    <pre>
load 'recipes/cleanup.rb'

set :project_roles, %w(app db web)

set :application, "#{ @instance.course.downcase }"

load 'recipes/omeka_defaults.rb'
    </pre>

    CAPCONFIG

  end

  def apache_config(stage)
    html = <<-HTTPDCONFIG
      <pre>
&lt;VirtualHost *:80>
    DocumentRoot /usr/local/projects/#{ @instance.course.downcase }/current

    ServerName #{stage}.#{ @instance.course.downcase }.#{ENV['domain'] || 'localhost' }
    ServerAlias #{stage}.#{ @instance.course.downcase }.#{ENV['domain'] || 'localhost' }

    ErrorLog logs/#{ @instance.course.downcase }.omeka-error_log
    CustomLog logs/#{ @instance.course.downcase }.omeka-access_log common

    &lt;Directory "/usr/local/projects/#{ @instance.course.downcase }/current">
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
prefix   = "#{ @instance.course.downcase }_"
;port     = ""
      </pre>
    DBCONFIG
    html
  end

end
