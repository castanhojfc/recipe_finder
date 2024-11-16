require "pagy/extras/overflow"

Pagy::DEFAULT[:limit] = 10
Pagy::DEFAULT[:size]  = 5
Pagy::DEFAULT[:overflow] = :last_page
