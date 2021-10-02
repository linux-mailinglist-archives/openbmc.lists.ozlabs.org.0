Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B09541FB2A
	for <lists+openbmc@lfdr.de>; Sat,  2 Oct 2021 13:40:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HM4ml6cwCz2ywQ
	for <lists+openbmc@lfdr.de>; Sat,  2 Oct 2021 21:40:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Half5KMI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Half5KMI; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HM4mL6kVCz2yN4
 for <openbmc@lists.ozlabs.org>; Sat,  2 Oct 2021 21:40:34 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso14922879otu.9
 for <openbmc@lists.ozlabs.org>; Sat, 02 Oct 2021 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mRYDN/7Zfb/X9+GCqkJ1Pbz/tDxT8mhcTJ+jdVvwAf0=;
 b=Half5KMIBST7AJ6wUUnVDBlMdou8hLEI6sp0XMK/6/5jsoNvL0GHadrmiyMME1DlOQ
 CVN9L1i1vTwPOUTGWx8T8E41nkBb+rGQ8TF/b36xft628GtZbDWNRxxASjpMuYAfaFpN
 325fjEdfkrv9vqAd45URrOVsLRSGOPgPWMi3RM48EjzubHg6TZy9XlolhJquCm2BD8Cl
 4c9hXUR6fYLTOmQ7LAyRNhdNlXUQKBnd/Y/ApNTEiXoCnLb7QGJNcv5o2IRwJPcFFn9Q
 Xn7t7UrBpNr6BdStaYpOoxEPmVkz8lIbHXv2vCor19BawJG4b46YddGzb0YT1vC6hXno
 g8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=mRYDN/7Zfb/X9+GCqkJ1Pbz/tDxT8mhcTJ+jdVvwAf0=;
 b=h3fpowGR1N6VGN0FkzGhUbisPNJdoIcc5IjDM5bJkztKjefte0vEeVfy+18OCUdSfn
 t5byY/nTlJHxQ+U8swTHdjhAx2n/AYUvtQXE0ayGpAzYDZn7jc+WlveBRlrl3RSbOaai
 rBvb9kL8M474SVnr7AtSXdeT5nH6YkY9Nx/eWbj8AREzgn9fPvaGIQ8wO3H1nX+9BPKT
 6a917IpweyfltpyCwPvXtjKy1NRtDJv9ZPyA/rU09jlUbHjI7qRjcW6oxKfVNIm0zJKD
 inqkkvXpO5uOV0GPwWKrxGWDPcs0SQpfHikkMmnhDQLASOSPdogNURMoSzEE9fmPkJn7
 cf2g==
X-Gm-Message-State: AOAM5329v7+bxeSeHwYHKnoEHceGhTVZ0Nk5/JO4N+i3Qt4Elo59Y8Jw
 K9IR2kZcjR4BTsQr383f0kQ=
X-Google-Smtp-Source: ABdhPJx6iIjnTcIW6+ptJYdtsqGBA4AciBxjGFBcibkzWzB3lC/j4q7mlhYTQi6s8Ff/qDI5Ef1BNg==
X-Received: by 2002:a9d:7f89:: with SMTP id t9mr2296505otp.143.1633174829483; 
 Sat, 02 Oct 2021 04:40:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 17sm1612077ois.45.2021.10.02.04.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 04:40:28 -0700 (PDT)
Date: Sat, 2 Oct 2021 04:40:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brandon Wyman <bjwyman@gmail.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/ibm-cffps) max_power_out swap changes
Message-ID: <20211002114027.GA1012283@roeck-us.net>
References: <20210928205051.1222815-1-bjwyman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928205051.1222815-1-bjwyman@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 28, 2021 at 08:50:51PM +0000, Brandon Wyman wrote:
> The bytes for max_power_out from the ibm-cffps devices differ in byte
> order for some power supplies.
> 
> The Witherspoon power supply returns the bytes in MSB/LSB order.
> 
> The Rainier power supply returns the bytes in LSB/MSB order.
> 
> The Witherspoon power supply uses version cffps1. The Rainier power
> supply should use version cffps2. If version is cffps1, swap the bytes
> before output to max_power_out.
> 
> Tested:
>     Witherspoon before: 3148. Witherspoon after: 3148.
>     Rainier before: 53255. Rainier after: 2000.
> 
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>

Applied, though ...

> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index df712ce4b164..79bfcd2749a6 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -171,8 +171,14 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
>  		cmd = CFFPS_SN_CMD;
>  		break;
>  	case CFFPS_DEBUGFS_MAX_POWER_OUT:
> -		rc = i2c_smbus_read_word_swapped(psu->client,
> -						 CFFPS_MAX_POWER_OUT_CMD);
> +		if (cffps1 == psu->version) {

The yoda programming replaced I did.

> +			rc = i2c_smbus_read_word_swapped(psu->client,
> +					CFFPS_MAX_POWER_OUT_CMD);
> +		} else {
> +			rc = i2c_smbus_read_word_data(psu->client,
> +					CFFPS_MAX_POWER_OUT_CMD);
> +		}
> +
>  		if (rc < 0)
>  			return rc;
>  
