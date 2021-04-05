# [ActiveAdminFileImporter]()

An Importer customizable as we use at Petlove.
## Table of Contents
- [Installation](#installation)
- [Types](#types)
  - [Confirmation Page](#confirmation-page)
- [Parsers](#parsers)
  - [Csv](#csv)
- [Stores](#stores)
  - [Rails Cache](#rails-cache)
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_admin_file_importer', github: 'petlove/active_admin_file_importer'
```

```
rails generate active_admin_file_importer:install
```

## Types

These are the available types

### Confirmation Page

```ruby
file_import ActiveAdminFileImporter::Types::ConfirmationPage,
            parser: ActiveAdminFileImporter::Parsers::Csv.new(col_sep: ';'), # File parser
            store: ActiveAdminFileImporter::Stores::RailsCache.new, # Method to save parsed data
            processor: ::Payments::Updater::Processor, # Validate and process fields before importation
            importer: ::Payments::Updater::Importer, # Import items
            name: :payments_updater, # Name used to make routes
            label: 'Atualizar Pagamentos', # Label used in Active Admin pages and Link
            admin: :payment # Current admin page. It is used to make route paths and to fetch instructions
```

You should define a file `_instructions.html.erb` at `/app/views/#{admin}s/#{name}/` to be used as instructions to importation.
## Parsers

These are the available parsers

### Csv


