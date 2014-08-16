class MainController < UIViewController
  GRID_SIZE = 5
  MARGIN = 5

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control
    self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    build_grid
  end

  def build_grid
    random_text = [
      "Guy in a funny hat",
      "Lady with a hoola hoop",
      "fried chicken",
      "fold out chair",
      "umbrella",
      "Dog",
      "Tacos"
    ]

    # Using a hash for a multidim grid
    @grid_hits = Hash.new(false)
    #mark_free_space

    GRID_SIZE.times do |cur_row|
      rmq.append(UIView, :row).tap do |row|
        GRID_SIZE.times do |cur_column|
          cur_cell = row.append(UILabel, :cell).style do |st|
            width = rmq.device.width / GRID_SIZE - MARGIN
            st.frame = {l: cur_column * width + (MARGIN * cur_column) + 2, w: width}
            st.text = random_text.sample
            st.tag("c#{cur_column}r#{cur_row}".to_sym)
            st.view.fit(20)
          end

          cur_cell.enable_interaction.on(:tap) do |sender|
            @grid_hits[[cur_column,cur_row]] = !@grid_hits[[cur_column,cur_row]]

            if @grid_hits[[cur_column,cur_row]]
              sender.backgroundColor = rmq.color.selected
              p "BINGO!" if check_for_bingo
            else
              sender.backgroundColor = rmq.color.bingo_cell
            end

          end
        end
      end
    end

    rmq(:row).distribute(:vertical, margin: MARGIN)

  end

  def init_nav
    self.title = 'Bingo Game'

    self.navigationItem.tap do |nav|
      nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAction,
                                                                           target: self, action: :nav_left_button)
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh,
                                                                           target: self, action: :nav_right_button)
    end
  end

  def mark_free_space
    @grid_hits[[2,2]] = true
  end

  def check_for_bingo
    bingo = false
    GRID_SIZE.times do |i|
      bingo ||= check_column i
      bingo ||= check_row i
    end

    bingo ||= check_diagonals
  end

  def check_row i
    bingo = true
    GRID_SIZE.times do |x|
      bingo &= @grid_hits[[x,i]]
    end
    bingo
  end

  def check_column i
    bingo = true
    GRID_SIZE.times do |x|
      bingo &= @grid_hits[[i,x]]
    end
    bingo
  end

  def check_diagonals
    bingo = true

    # Top left to bottom right
    GRID_SIZE.times do |x|
      bingo &= @grid_hits[[x,x]]
    end
    return true if bingo

    # Top right to bottom left
    bingo = true
    GRID_SIZE.times do |x|
      bingo &= @grid_hits[[GRID_SIZE - 1 - x, x]]
    end
    bingo
  end

  def nav_left_button
    puts 'Left button'
  end

  def nav_right_button
    puts 'Right button'
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end

end
