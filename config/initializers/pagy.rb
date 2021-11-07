
Pagy::DEFAULT[:items] = 10
Pagy::DEFAULT[:cycle] = true

require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :last_page
