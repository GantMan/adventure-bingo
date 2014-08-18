class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_image = rmq.image.resource("boat")
  end

  def row(st)
    st.frame = {w: app_width, h: 80, t: 40}
  end

  def cell(st)
    st.number_of_lines = 4
    st.frame = [[0,0], [30, 80]]
    st.text_alignment = NSTextAlignmentCenter
    st.view.lineBreakMode = NSLineBreakByWordWrapping
    st.background_color = rmq.color.bingo_cell
    st.masks_to_bounds = true
    st.corner_radius = 5
  end

end
