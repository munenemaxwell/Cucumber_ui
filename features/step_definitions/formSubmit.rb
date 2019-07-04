require 'selenium-cucumber'

# Do Not Remove This File
# Add your custom steps here
# $driver is instance of webdriver use this instance to write your custom code


def get_sum()

    expression=$driver.find_element(xpath: '//*[@id="et_pb_contact_form_1"]/div[2]/form[1]/div[1]/div[1]/p[1]/span[1]').text
    
    ##explode string to array using +
    string_array=expression.split("+") 
    
    #convert string array to int array
    num_array=string_array.map!{|e| e.to_i}
    
    #get array sum
    sum=num_array.reduce(0, :+)

    return sum
    
  
  end

Given(/^I am on website$/) do 

    navigate_to("https://www.ultimateqa.com/filling-out-forms/")

end

When("I enter my username as {string}") do |string|
    $driver.find_element(id: "et_pb_contact_name_1").send_keys(string)
end

When("I enter message as {string}") do |string|
    $driver.find_element(id: "et_pb_contact_message_1").send_keys(string)
end
  
When("I click on submit button") do
    # $driver.find_element(xpath: '//*[@id="et_pb_contact_form_0"]/div[2]/form[1]/div[1]/button[1]').click()
    
    sum=get_sum()
    
    #use sum as captcha
    $driver.find_element(name: 'et_pb_contact_captcha_1').send_keys(sum)

    #click on submit
    $driver.find_element(xpath: '//*[@id="et_pb_contact_form_1"]/div[2]/form[1]/div[1]/button[1]').click()

    
end
  
Then("I see {string}") do |string|
    wait = Selenium::WebDriver::Wait.new(timeout: 15) 
    wait.until { 

        # success_msg=$driver.find_element(xpath:'//*[@id="et_pb_contact_form_0"]/div[1]/p[1]').text
        # expect(success_msg).to eq('Form filled out successfully')

        

        success_msg=$driver.find_element(xpath:'//*[@id="et_pb_contact_form_1"]/div[1]/p[1]').text

        expect(success_msg).to eq(string)

        
    }
    
end

Then("I see a username validation error") do

    wait = Selenium::WebDriver::Wait.new(timeout: 10) 
    wait.until { 

        # username_val_err=$driver.find_element(xpath:'//*[@id="et_pb_contact_form_0"]/div[1]/ul[1]/li[1]').text
        # expect(username_val_err).to eq('Name')

        username_val_err=$driver.find_element(xpath:'//*[@id="et_pb_contact_form_1"]/div[1]/ul[1]/li[1]').text
        expect(username_val_err).to eq('Name')

        
    }

end


Then("I see a message validation error") do

    wait = Selenium::WebDriver::Wait.new(timeout: 10) 
    wait.until {


        msg_val_err=$driver.find_element(xpath:'//*[@id="et_pb_contact_form_1"]/div[1]/ul[1]/li[1]').text
        expect(msg_val_err).to eq('Message')
    }

end


Then("I see a username and message validation error") do 

    wait = Selenium::WebDriver::Wait.new(timeout: 10) 
    wait.until { 

        username_val_err=$driver.find_element(xpath:'//*[@id="et_pb_contact_form_0"]/div[1]/ul[1]/li[1]').text
        expect(username_val_err).to eq('Name')

        msg_val_err=$driver.find_element(xpath:'//*[@id="et_pb_contact_form_0"]/div[1]/ul[1]/li[2]').text
        expect(msg_val_err).to eq('Message')

        
    }

end

And("I submit without captcha") do

    #click on submit
    $driver.find_element(xpath: '//*[@id="et_pb_contact_form_1"]/div[2]/form[1]/div[1]/button[1]').click()

end

Then("I should see a captcha validation error") do
    wait = Selenium::WebDriver::Wait.new(timeout: 10) 
    wait.until { 

        captcha_val_err=$driver.find_element(xpath:'//*[@id="et_pb_contact_form_1"]/div[1]/ul[1]/li[1]').text
        expect(captcha_val_err).to eq('Captcha')
        
    }

    
end