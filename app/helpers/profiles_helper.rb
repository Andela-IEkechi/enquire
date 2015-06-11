module ProfilesHelper

  def seen_last time
    if time < Date.today
      time.strftime("Last seen on  %A, %d %b %Y %l:%M %p")
    else
      time.strftime("Last seen at  %I:%M%p")
    end
  end
end
