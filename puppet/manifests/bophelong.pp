Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ] }

# Base classes shared by all Bophelong network nodes
class bophelong::base {
  class { 'apt': always_apt_update => true }
  include security
  include mail
  include ntpdate
  include maintenance
  include wget
  include unzip
  include maven_setup
  include java
  include tomcat
  include tomcat::fix_java
  include docker
  include mysql_setup::percona
  include openmrs
  include openmrs::backup
  include openmrs::initial_setup
}

# Hub: Bophelong MDR-TB Hospital — runs central OpenMRS + IDGen
class bophelong::hub {
  include bophelong::base
}

# Satellite: all other sites — connect to hub for patient identifiers
class bophelong::satellite {
  include bophelong::base
}
