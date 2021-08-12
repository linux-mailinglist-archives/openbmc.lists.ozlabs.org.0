Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0822E3E9DA1
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 06:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlYmx6Xbdz30G8
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 14:36:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VIGNX7lX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VIGNX7lX; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlYmV5BdRz2yLk
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 14:36:26 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id v1so2442728qva.7
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 21:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jpZ0477C5cf3o49NC+s1PqZcr5VpzD9GwW2JUzF4Esc=;
 b=VIGNX7lXtRH+fbiLDv8GZQsTQBtM61/hRQB4WlWwIfHR5v+z4adEzVbAwmF2ZJRdQp
 0TafmiJceYrSr1J1uh8qb18PiVpKRMujCQruk6D7f+M+NO5aoElMRd7OM8dX+jTwIVOy
 JL3medSFGsSxjSPTP5O3YIVaBb2pymmAdNizhGdBAwo6etys79jzF33xm06YKrjouy5D
 25yKAWus9tOf6UnYVKIpPdXgw1K7zcaUM0tOPy/abZkM7kCaKbDo1lV+R44SyKf36qNz
 HHVBvDBTlVVrKZdrpl/KvBTQ1m0rO39p17isoqf1e2T/hBuLS64em5GHrZJsbxiSO4lq
 aiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=jpZ0477C5cf3o49NC+s1PqZcr5VpzD9GwW2JUzF4Esc=;
 b=SYmpBIEuGtYGIbx9mqd5SRlfZyxnLi7trLgbjl3L1GaOuKJ522UvTVbs19hj/3hqhm
 i207BxCpANNDRVDFQwKKbz9xHQQEUJSlcUqNcNT8Zv8gPaPc7UFsbNXL98Fra05v1fWY
 LDIoojb5TZ/p9V1OTBfUudiknWxW581hvbxHuVZhkEjPM2CC/uRna3JKjUdm7fRc6hNN
 sop8cp3Un+5lGXQAEmb//mI42od3QL59/2iiq6RvpF+IfnBgyFG+yAmJJIQApD7+9IYa
 x5a0wCScldkCcWQFy7P07Jv2B77QLFhhC+KRhTw32miPM8YaULzBXOUiFUCUz4p6a174
 ri4w==
X-Gm-Message-State: AOAM5334D383s0F0J7GuJrF+AsJUDcvfmbUR2g/wHuLGBttHjl/dPQ1a
 oQJ6Ywm7a8IToUQC/dF1U4o=
X-Google-Smtp-Source: ABdhPJxXTmu10YgComYrKxSwN+Azc2Fes+HG7vUAU4AW67kaceFtqrErJyaRenVQ7lIAyFB3Pt5mfA==
X-Received: by 2002:a0c:e883:: with SMTP id b3mr2178998qvo.23.1628742983133;
 Wed, 11 Aug 2021 21:36:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 18sm683769qkm.128.2021.08.11.21.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 21:36:22 -0700 (PDT)
Date: Wed, 11 Aug 2021 21:36:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brandon Wyman <bjwyman@gmail.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/ibm-cffps) Fix write bits for LED control
Message-ID: <20210812043621.GA1115124@roeck-us.net>
References: <20210806225131.1808759-1-bjwyman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806225131.1808759-1-bjwyman@gmail.com>
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

On Fri, Aug 06, 2021 at 10:51:31PM +0000, Brandon Wyman wrote:
> When doing a PMBus write for the LED control on the IBM Common Form
> Factor Power Supplies (ibm-cffps), the DAh command requires that bit 7
> be low and bit 6 be high in order to indicate that you are truly
> attempting to do a write.
> 
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>

Applied.

Thanks,
Guenter

> ---
> V1 -> V2: Use full name instead of initials in Signed-off-by line.
> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index 5668d8305b78..df712ce4b164 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -50,9 +50,9 @@
>  #define CFFPS_MFR_VAUX_FAULT			BIT(6)
>  #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
>  
> -#define CFFPS_LED_BLINK				BIT(0)
> -#define CFFPS_LED_ON				BIT(1)
> -#define CFFPS_LED_OFF				BIT(2)
> +#define CFFPS_LED_BLINK				(BIT(0) | BIT(6))
> +#define CFFPS_LED_ON				(BIT(1) | BIT(6))
> +#define CFFPS_LED_OFF				(BIT(2) | BIT(6))
>  #define CFFPS_BLINK_RATE_MS			250
>  
>  enum {
