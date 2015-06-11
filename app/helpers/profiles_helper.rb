module ProfilesHelper

  def seen_last time
    if time < Date.today
      time.strftime("Last seen on  %a, %e %b '%y. %l:%M %p ")
    else
      time.strftime("Last seen at  %I:%M%p")
    end
  end
end
