module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

      when /the home\s?page/
        '/'
      when /the page for "([^"]*)"/
        page_path(Page.find_by_title($1) || Page.find_by_url_slug($1))

      when /the user sign in page/
        new_user_session_path
      when /the user sign out page/
        destroy_user_session_path
      when /my own profile page/
        user_profile_path(@current_user)
      when /the registration page/
        new_user_registration_path
      when /the add new hospital page/
        new_hospital_path

      else
        begin
          page_name =~ /the (.*) page/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue Object => e
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                  "Now, go and add a mapping in #{__FILE__}\n" +
                  "Fyi, your current url is: #{current_url}"
        end
    end
  end
end

World(NavigationHelpers)
