#
# Cookbook:: Install_apache 
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

template '/etc/ssh/sshd_config' do
  source 'sshd_config'
  owner 'root'
  group 'root'
  mode '0644'
end


package 'apache2' do
  action :install
end


template '/etc/apache2/apache2.conf' do
  source 'apache2.conf'
  owner 'root'
  group 'root'
  mode '0755'
end

directory '/var/www/prod' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/www/qa' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/www/dev' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/var/www/prod/index.html' do
  content '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Site de Produção</title></head><body><p>RM 49890 Norton de Castro e Pinho</p><p>RM 33197 Uelington Silva Santos</p><p>RM 31806 Alexandre Pereira Cesar</p><p>RM 31462 Leonardo D Angelo Gonçalves</p><p>RM 32751 William Lima da Silva de Almeida</p><p>RM 31210 Euclides Pereira da Silva</p></body></html>'
  mode '0755'
  owner 'root'
  group 'root'
end

file '/var/www/qa/index.html' do
  content '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Site de QA</title></head><body><p>RM 49890 Norton de Castro e Pinho</p><p>RM 33197 Uelington Silva Santos</p><p>RM 31806 Alexandre Pereira Cesar</p><p>RM 31462 Leonardo D Angelo Gonçalves</p><p>RM 32751 William Lima da Silva de Almeida</p><p>RM 31210 Euclides Pereira da Silva</p></body></html>'
  mode '0755'
  owner 'root'
  group 'root'
end

file '/var/www/dev/index.html' do
  content '<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Site de Dev</title></head><body><p>RM 49890 Norton de Castro e Pinho</p><p>RM 33197 Uelington Silva Santos</p><p>RM 31806 Alexandre Pereira Cesar</p><p>RM 31462 Leonardo D Angelo Gonçalves</p><p>RM 32751 William Lima da Silva de Almeida</p><p>RM 31210 Euclides Pereira da Silva</p></body></html>'
  mode '0755'
  owner 'root'
  group 'root'
end

service 'apache2' do
  action [:enable,:restart]
  supports :reload => true
end


user 'bruno' do
  comment 'Bruno Emer'
  home '/home/bruno'
  shell '/bin/bash'
  password '15CLD@2018'
  gid 'sudo'
end

service "ssh" do
  action :restart
end

service 'apache2' do
  action [:enable,:start]
  supports :reload => true
end 

service "apache2" do
  action :restart
end