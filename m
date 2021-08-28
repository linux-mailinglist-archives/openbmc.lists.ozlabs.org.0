Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3AC3FA699
	for <lists+openbmc@lfdr.de>; Sat, 28 Aug 2021 17:53:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gxh2B1Rtpz2yJ7
	for <lists+openbmc@lfdr.de>; Sun, 29 Aug 2021 01:53:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f4ulNnMg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34;
 helo=mail-oo1-xc34.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f4ulNnMg; dkim-atps=neutral
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gxh1j6NCtz2xY0
 for <openbmc@lists.ozlabs.org>; Sun, 29 Aug 2021 01:52:56 +1000 (AEST)
Received: by mail-oo1-xc34.google.com with SMTP id
 s21-20020a4ae495000000b0028e499b5921so3019645oov.12
 for <openbmc@lists.ozlabs.org>; Sat, 28 Aug 2021 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q+Ocg9t6n66QWfzQb63Nyh3M8znI6gaQbrcqs3sFG/4=;
 b=f4ulNnMg+aI9qV4pCNJZC7VZQtHA93fzhZVWNgpAzJ/i6sW7sRa56cCDHjpgKYtKKn
 6+k9LLk+2w1OR0VFRkZfW57W4WXvS3PPiMXTUkLPsV6etbFZhE7o1qu0uAZ7sWQDPr1R
 SyOpQ5celoypcz9BG2EE/POllienjPY1dGwjS8ugihZt0lzMB0eqJMNL5PgMNSiy59ya
 dj6HtkH4UYDWOa0URFq6c+FZCGZ4rZbHpGP3K8Cu3UMJemLF4tsrW/BXLXGPjXPteDNd
 wC2oexf4VgA8+vEm8wDEkcmQHTwE4i8xmTZ9qTThoV53njGqREodbXUdyJyezvJoWMYg
 69+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=q+Ocg9t6n66QWfzQb63Nyh3M8znI6gaQbrcqs3sFG/4=;
 b=q+xq4IRxYc3CQT+UP+HxDFravakStRGqClgTY7S1u+uWPmEYuHFc4Z3pscZutKdmzR
 KOgCPfgMsr3He1IBWzo69XDAVxsKLwfgMXErjWu0eiz0OHmeu5124pfp0zdS9zdDlMO5
 mPSCaKO4gVfNBAcXzPTQrDL4YMB3j/v1uQqH9cCou5PI6ktyK8bFoGLfW/gWxWr2ryn5
 3tR0Xz/Hz7YFh46f+lFBLQShGXpFSfZ5PoUEsI2fLPN2qkPnZHymGXzklDIqy5Yi1AtT
 Pt5ajTtucnHgkwOejzwZ9KmV/MkhTISNWjyITQBCNtLfTMYAvY4H/NeUQdQZReM5FoId
 CHgg==
X-Gm-Message-State: AOAM530b0c2BxvGEsEv0JNcwzEgbxt9HtliYv4o87wmqnCGZOdidZT0n
 dSxactgDk9HJvsrHxG4E86w=
X-Google-Smtp-Source: ABdhPJxHlYAg1s4un4jIGGBmp8Yg6VwhNOlYd1jxnpZgBIJcRkdBmH0NrUhf4L4FyoIl7rugyFsyDw==
X-Received: by 2002:a4a:ba0f:: with SMTP id b15mr3739989oop.31.1630165972124; 
 Sat, 28 Aug 2021 08:52:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a4sm354649otv.49.2021.08.28.08.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 08:52:51 -0700 (PDT)
Date: Sat, 28 Aug 2021 08:52:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brandon Wyman <bjwyman@gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
Message-ID: <20210828155250.GA820265@roeck-us.net>
References: <20210827230433.3596370-1-bjwyman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827230433.3596370-1-bjwyman@gmail.com>
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

On Fri, Aug 27, 2021 at 11:04:33PM +0000, Brandon Wyman wrote:
> The bytes for max_power_out from the ibm-cffps devices do not need to be
> swapped.
> 
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>

Eddie, can you confirm this ?

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index df712ce4b164..29b77f192c9e 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -171,7 +171,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
>  		cmd = CFFPS_SN_CMD;
>  		break;
>  	case CFFPS_DEBUGFS_MAX_POWER_OUT:
> -		rc = i2c_smbus_read_word_swapped(psu->client,
> +		rc = i2c_smbus_read_word_data(psu->client,
>  						 CFFPS_MAX_POWER_OUT_CMD);
>  		if (rc < 0)
>  			return rc;
> -- 
> 2.25.1
> 
