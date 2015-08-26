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

      when /the user confirmation page for (.*)/
        user_confirmation_path(confirmation_token:users[$1])
      when /the user sign in page/
        new_user_session_path
      when /the user sign out page/
        destroy_user_session_path
      when /my own profile page/
        user_profile_path(@current_user)

      # Regular user paths
      when /the employee registration page for (\w+)/
        "#{root_url}#{networks[$1].invitation_code}"
      when /the employee registration page/
        new_user_registration_path

      when /the latest activity page for (\w+)/
        # when /the employee dashboard page for (\w+)/
        latest_path(networks[$1])
      when /my latest activity page/
        # when /the employee dashboard page/
        latest_index_path
      when /the new employee nomination page/
        new_user_nomination_path
      when /the employee profile page for (.*)/
        user_profile_path(users[$1])
      when /the employee welcome page/
        user_welcome_path
      when /the employee account settings page/
        user_account_path
      when /the props listing page/
        awards_path
      when /the props listing page with a message/
        awards_path + "?message=true"
      when /the execution props page/
        award_path(Award['execution'])
      when /the thank you props page/
        award_path(Award['thank-you'])
      when /the people page for (\w+)/
        network_people_path(networks[$1])

      when /the last nomination/
        user_nomination_path(Nomination.last.id)

      # Admin paths
      when /the admin network settings page for (\w+)/
        network_settings_path(networks[$1])

      # Superadmin paths
      when /superadmin dashboard/
        admin_dashboard_path
      when /superadmin networks page/
        admin_networks_path
      when /superadmin sign\s?in page/
        new_superadmin_session_path

      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))

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
