# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create([
    { name: 'Portal', description: 'Company Portal' },
    { name: 'Dispatching', description: 'Ag Dispatching' },
    { name: 'Crop Budget', description: 'Crop Budgets' },
    { name: 'Main Website', description: 'Main Company Website' },
    { name: 'CQIQ Website', description: 'CQIQ Full Staff Meeting website' },
    { name: 'Hardware/Software', description: 'Any issues related to hardware or software malfunctions, ie: lines in screen, failed HDD, Blue Screens, etc.' },
    { name: 'SST Summit', description: 'Issues related to SST Summit' },
    { name: 'Paramount Reports', description: 'Issues related to Paramount Reports' },
    { name: 'Carbonite', description: 'Issues related to online backups and storage' },
    { name: 'Phones', description:  'Issues related to Androids or Iphones' },
    { name: 'CQ HelpDesk', description:  'Issues or requests related to CQ HelpDesk' }
])

User.create([
  { first_name: 'Josh', last_name: 'DaVee', email: 'jdavee@cropquest.com', password: 'cqpassword' },
  { first_name: 'Bryce', last_name: 'Johnston', email: 'bjohnston@cropquest.com', password: 'cqpassword' },
  { first_name: 'Paul', last_name: 'Stamy', email: 'pstamy@cropquest.com', password: 'cqpassword' },
  { first_name: 'Jason', last_name: 'Hooper', email: 'jhooper@cropquest.com', password: 'cqpassword' },
  { first_name: 'Nathan', last_name: 'Woydziak', email: 'nwoydz@cropquest.com', password: 'cqpassword' },
  { first_name: 'John', last_name: 'Gibson', email: 'jgibson@cropquest.com', password: 'cqpassword' }
])

IssueType.create([
  { name: 'Feature Request' },
  { name: 'Software Bug' },
  { name: 'Purchasing Request' },
  { name: 'Log-in Issues' },
  { name: 'Email' },
  { name: 'Internet'},
  { name: 'Other/General' }
])

IssueStatus.create([
  { name: 'New' },
  { name: 'Pending'},
  { name: 'In Progress' },
  { name: 'Resolved' }
])
