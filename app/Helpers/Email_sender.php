<?php

namespace App\Helpers;

use Config;
use Mail;
use DB;

class Email_sender
{

    public static function sendEmail($view = null, $settings = null)
    {
        if (!empty($settings) && $view != null) {
            $sent = Mail::send($view, $settings, function ($message) use ($settings) {
                $message->from($settings['from'], $settings['sender']);
                $message->to($settings['to'], $settings['receiver'])->subject($settings['subject']);
            });
        }
    }

    public static function sendAdminForgotPasswordEmail($data = null)
    {
        $setting_data  = Self::getSettingdata();

        if ($data != null) {
            $settings = [];
            $settings['data'] = $data;
            $settings['fromEmail'] = 'no-reply@ohsabai.com';
            $settings['toEmail'] = $data['email'];
            $settings['senderName'] = 'Ohsabai Team';
            $settings['receiverName'] = $data['name'];
            $settings["subject"] = "Ohsabai Password Reset";
            $settings['emailType'] = 'Forgot Password';
            $settings['url'] = $data['url'];
            $settings['facebook_url'] = $setting_data->facebook_url;
            $settings['linkedin_url'] = $setting_data->linkedin_url;
            $settings['twitter_url'] = $setting_data->twitter_url;
            $settings['insta_url'] = $setting_data->insta_url;
            $settings['from'] = $settings['fromEmail'];
            $settings['to'] = $settings['toEmail'];
            $settings['sender'] = $settings['senderName'];
            $settings['receiver'] = $settings['receiverName'];
            $settings['txtBody'] = view('emails.admin_forgot_password_email', $settings)->render();
            unset($settings['txtBody']);
            Self::sendEmail('emails.admin_forgot_password_email', $settings);
        }
    }

    public static function sendUserForgotPasswordEmail($data = null)
    {
        $setting_data  = Self::getSettingdata();

        if ($data != null) {
            $settings = [];
            $settings['data'] = $data;
            $settings['fromEmail'] = 'no-reply@ohsabai.com';
            $settings['toEmail'] = $data['email'];
            $settings['senderName'] = 'Ohsabai Team';
            $settings['receiverName'] = $data['name'];
            $settings["subject"] = "Ohsabai Password Reset";
            $settings['emailType'] = 'Forgot Password';
            $settings['url'] = $data['url'];
            $settings['facebook_url'] = $setting_data->facebook_url;
            $settings['linkedin_url'] = $setting_data->linkedin_url;
            $settings['twitter_url'] = $setting_data->twitter_url;
            $settings['insta_url'] = $setting_data->insta_url;
            $settings['from'] = $settings['fromEmail'];
            $settings['to'] = $settings['toEmail'];
            $settings['sender'] = $settings['senderName'];
            $settings['receiver'] = $settings['receiverName'];
            $settings['txtBody'] = view('emails.user_forgot_password_email', $settings)->render();
            unset($settings['txtBody']);
            Self::sendEmail('emails.user_forgot_password_email', $settings);
        }
    }

    public static function userVerificationEmail($data = null)
    {

        $setting_data  = Self::getSettingdata();
        if ($data != null) {
            $settings = [];
            $settings['data']               = $data;
            $settings['fromEmail']          = 'no-reply@ohsabai.com';
            $settings['toEmail']            = $data['email'];
            $settings['senderName']         = 'Ohsabai Team';
            $settings['receiverName']       = $data['name'];
            $settings["subject"]            = "Ohsabai Verify Account";
            $settings['emailType']          = 'Verify Account';
            $settings['url']                = $data['url'];
            $settings['facebook_url'] = $setting_data->facebook_url;
            $settings['linkedin_url'] = $setting_data->linkedin_url;
            $settings['twitter_url'] = $setting_data->twitter_url;
            $settings['insta_url'] = $setting_data->insta_url;
            $settings['from']               = $settings['fromEmail'];
            $settings['to']                 = $settings['toEmail'];
            $settings['sender']             = $settings['senderName'];
            $settings['receiver']           = $settings['receiverName'];
            $settings['txtBody']            = view('emails.verification', $settings)->render();
            unset($settings['txtBody']);
            Self::sendEmail('emails.verification', $settings);
        }
    }

    public static function bookingEmailSentToUser($data = null,$type,$email)
    {

        $setting_data  = Self::getSettingdata();

        if ($data != null) {
            $settings = [];
            $settings['data']               = $data;
            $settings['fromEmail']          = 'no-reply@ohsabai.com';
            $settings['toEmail']            = $email;
            $settings['senderName']         = 'Ohsabai Team';
            $settings['receiverName']       = $data['name'];
            $settings["subject"]            = "Ohsabai Booking";
            $settings['emailType']          = 'Booking Email';
            $settings['facebook_url'] = $setting_data->facebook_url;
            $settings['linkedin_url'] = $setting_data->linkedin_url;
            $settings['twitter_url'] = $setting_data->twitter_url;
            $settings['insta_url'] = $setting_data->insta_url;
            $settings['from']               = $settings['fromEmail'];
            $settings['to']                 = $settings['toEmail'];
            $settings['sender']             = $settings['senderName'];
            $settings['user_type']          = $type;
            $settings['receiver']           = $settings['receiverName'];
            $settings['txtBody']            = view('emails.booking', $settings)->render();
            unset($settings['txtBody']);
            Self::sendEmail('emails.booking', $settings);
        }
    }

    public static function subscribeToUser($email)
    {

        $setting_data  = Self::getSettingdata();

        if ($email != null) {
            $settings = [];
            $settings['fromEmail']          = 'no-reply@ohsabai.com';
            $settings['toEmail']            = $email;
            $settings['senderName']         = 'Ohsabai Team';
            $settings["subject"]            = "Ohsabai Subscribe";
            $settings['emailType']          = 'Subscribe Email';
            $settings['from']               = $settings['fromEmail'];
            $settings['to']                 = $settings['toEmail'];
            $settings['sender']             = $settings['senderName'];
            $settings['facebook_url'] = $setting_data->facebook_url;
            $settings['linkedin_url'] = $setting_data->linkedin_url;
            $settings['twitter_url'] = $setting_data->twitter_url;
            $settings['insta_url'] = $setting_data->insta_url;
            $settings['receiver']           = "";
            $settings['txtBody']            = view('emails.subscribe', $settings)->render();
            unset($settings['txtBody']);
            Self::sendEmail('emails.subscribe', $settings);
        }
    }

    public static function getSettingdata(){
         return DB::table('general_setting')->first();
    }
}
