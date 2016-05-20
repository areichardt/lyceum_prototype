class CirclePdf < Prawn::Document
  
  def initialize(circle, view)
    super()
    @circle = circle
    @view = view
    
    text "#{@circle.lesson_plan}"
  
  end  
    


end