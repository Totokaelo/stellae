module Stellae
  StatusCodes = {
    1 => 'success',
    2 => 'Bad login information',
    3 => 'Login points to multiple databases',
    5 => 'Invalid order type must be OO or CM',
    6 => 'Error creating order header',
    7 => 'Bad UPC/EAN13',
    8 => 'Duplicate order – order number exists in database',
    9 => 'Problem with line item import'
  }
end
