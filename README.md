# [ActiveAdminFileImporter]()

An Importer customizable as we use at Petlove.
## Table of Contents
- [Installation](#installation)
- [Importers](#importers)
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

## Importers

These are the available importers

### Confirmation Page

```ruby
file_import importer: ActiveAdminFileImporter::Importers::ConfirmationPage,
            store: ActiveAdminFileImporter::Stores::RailsCache,
            parser: ActiveAdminFileImporter::Parsers::Csv,
            processor: PaymentProcessor,
            importer: PaymentImporter,
            name: :payments_import,
            label: 'Importar Pagamentos',
            view: :payments
```



## Parsers

These are the available parsers

### Csv


