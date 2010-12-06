logopath = "#{RAILS_ROOT}/public/images/logo.jpg"

  
pdf.image logopath, :width => 60





pdf.text "Coupon Number ##{@coupon.id}", :size => 24, :style => :bold, :align => :right
pdf.move_down 20

pdf.text "#{number_to_currency(@coupon.deal.value)} Voucher for #{@coupon.deal.title}", :size => 30, :style => :bold
pdf.move_down 20

pdf.text "Expires on", :style => :bold, :size => 14
pdf.text "#{@coupon.expiration_date.strftime("%B %d, %Y")}" 
pdf.move_down 10

pdf.text "Fine Print:", :style => :bold, :size => 14
pdf.text "#{@coupon.deal.fine_print}"
pdf.move_down 10

pdf.text "Valid at:", :style => :bold, :size => 14
pdf.text "#{@coupon.deal.fine_print}"


