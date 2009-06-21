set :application, "Synoptic"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
 set :deploy_to, "synoptic.dressageinsight.com"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:

role :app, "synoptic.dressageinsight.com"
role :web, "synoptic.dressageinsight.com"
role :db,  "synoptic.dressageinsight.com", :primary => true

 ############################

 # Based on the original DreamHost deploy.rb recipe

 #

 #

 # GitHub settings #######################################################################################

 default_run_options[:pty] = true


set :repository,  "git@github.com:georgeredinger/synoptic.git"
 set :scm, "git"

 set :scm_passphrase, "pa$$w0rd" #This is the passphrase for the ssh key on the server deployed to

 set :branch, "master"

 set :scm_verbose, true

 #########################################################################################################

 set :user, 'gredinger' #Dreamhost username

 set :domain, 'synoptic.dressageinsight.com'  # Dreamhost servername where your account is located

 set :project, 'synoptic' # Your application as its called in the repository

 set :application, 'synoptic.dressageinsight.com' # Your app's location (domain or sub-domain name as setup in panel)

 set :applicationdir, "/home/#{user}/#{application}" # The standard Dreamhost setup


 # Don't change this stuff, but you may want to set shared files at the end of the file ##################

 # deploy config

 set :deploy_to, applicationdir

 set :deploy_via, :remote_cache
  

 # roles (servers)

 role :app, domain

 role :web, domain

 role :db, domain, :primary => true

  

 namespace :deploy do

 [:start, :stop, :restart, :finalize_update, :migrate, :migrations, :cold].each do |t|

 desc "#{t} task is a no-op with mod_rails"

 task t, :roles => :app do ; end

 end

 end

  

 # additional settings

 default_run_options[:pty] = true # Forgo errors when deploying from windows

 #ssh_options[:keys] = %w(/Path/To/id_rsa) # If you are using ssh_keys

 #set :chmod755, "app config db lib public vendor script script/* public/disp*"

 set :use_sudo, false

  

 #########################################################################################################

  

 #for use with shared files (e.g. config files)

 after "deploy:update_code" do

 run "ln -s #{shared_path}/database.yml #{release_path}/config"

 run "ln -s #{shared_path}/environment.rb #{release_path}/config"

 end

 
