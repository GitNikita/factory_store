class Order < ActiveRecord::Base
  belongs_to :client
  belongs_to :manager
  has_many :positions
  has_many :products, through: :positions

  scope :maked, -> { where(state: 'waiting') }

  def calc_price
    positions.map(&:calc_price).sum
  end

#   def make_order_workbook
#
#     book = Spreadsheet::Workbook.new
#
#     sheet1 = book.create_worksheet
#     sheet2 = book.create_worksheet :name => 'Заказ'
#
#     sheet1.name = 'Заказ номер:', order.id
#
#     sheet1.row(0).concat %w{Name Country Acknowlegement}
#     sheet1[1,0] = 'Japan'
#     row = sheet1.row(1)
#     row.push 'Creator of Ruby'
#     row.unshift 'Yukihiro Matsumoto'
#     sheet1.row(2).replace [ 'Daniel J. Berger', 'U.S.A.',
#                           'Author of original code for Spreadsheet::Excel' ]
#     sheet1.row(3).push 'Charles Lowe', 'Author of the ruby-ole Library'
#     sheet1.row(3).insert 1, 'Unknown'
#     sheet1.update_row 4, 'Hannes Wyss', 'Switzerland', 'Author'
#
#     sheet1.row(0).height = 18
#     format = Spreadsheet::Format.new :color => :blue,
#                                    :weight => :bold,
#                                    :size => 18
#     sheet1.row(0).default_format = format
#
#     bold = Spreadsheet::Format.new :weight => :bold
#     4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
#
#     book.write '/path/to/output/excel-file.xls'
#   end
end
