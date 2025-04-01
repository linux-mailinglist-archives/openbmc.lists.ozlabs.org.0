Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F054A784F0
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 00:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS3Ct3spLz3c8G
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 09:52:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743547926;
	cv=none; b=Y4laHx6TfnUhrohMMENPMbSDJ4oB1PukEyD5KWyQx7q3PGuv144S41nm/8Xo6Cag+ytcLivvniUDieNDM44ZjLk1WUAKDsD4Ry+R9Yr9PIB4BVFXRyXlhzIqtNcCsU8SPOuA6aLW847emflEWTs/7sbioe2T7Db8ISNF22tllApDmHqWeRaUZyEcteHoSQ6Tv4qOu15Wdh7pdAA61Xdorc6mtIYeRLWFP9vhNy/VekiShZp/buA/Cxz7xLkuubS79lceiDwaaSPIRXFt7zzG8xjpFUvoVVWLJu8aQl+ZBgiOIPRw503cvz+ginqKHBZUaDp4bjVpmaCLPvKbwzUzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743547926; c=relaxed/relaxed;
	bh=rJIBFDDeddhNhvAZmCUuJxrKMzRlE3k3+cztdQ5hpV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWOpK+wzsUOmI78uy5x80+fF94sRVCMsmv2P8ACzGJt2kkOWMfbvTBmBELT675K216o8jxcefE9e1iumOQkmqQmphN17SWLollmG5hnG0DDpXwV7pdRwQD1rSsWoguUP+tFuQ7xHDO+XJCgsIVRTiGbDV+SBRf6qB6XlyeEXCP5ChxfGxq/5F/N7S1Jv4atXXujv69+jH3yrcshS6ANmW8fcnlSjQz4oS7GumnJH1Qq2i7uBVjPs6ZJ3fPNARVDDMkf+oMWyyaSnLdIrN3fXeNnjPRdgg51IhLh/v4gAq/UgxueOJcSmQM+qEIUde4Z+hT232cMYHZCT78Jo6/E0QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mrxG3puk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mrxG3puk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS3Cn3HTBz2ySc
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 09:52:04 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2243803b776so51427505ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 01 Apr 2025 15:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743547923; x=1744152723; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rJIBFDDeddhNhvAZmCUuJxrKMzRlE3k3+cztdQ5hpV0=;
        b=mrxG3pukVIumH+joQSmRUZWM0Xli3YqmuCpacGqq7juoJAD4CLjId/ex67IPkgxQb1
         OQb0X4V6EWE32htJZmPupijagOS0vr+lNQiSolmLcg397boQBpM7hvbg3PnZJNhhL/uE
         8R/2NmzYkmwVeCtXYh0U7msyZSgEIKWaV4oCUcszTVbbZMbXHJm4hPSS4QZj+m0/n9TO
         qBCMwcCTV9Z+y6nCySp7EvAmZ38+J35lo6uMBlnjV287pZAd5Tt6D19uGZ+k5qOjT3Xa
         XjBPBFeVvUuIACsvnpmiCFSEGkwqwLixnvjK6RyZdLIaFP5YYR5Ikcg9Uty25D9hgksK
         /Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547923; x=1744152723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJIBFDDeddhNhvAZmCUuJxrKMzRlE3k3+cztdQ5hpV0=;
        b=n1GQIE10fuIUgqnFOgEdYyjh4Fu8oaUDa20p52s4j5FGOb52Q5Kd9HPHgQE+q/l7QQ
         tr8bb2J8VII0MyYGXw/AJph25bMybOt+x3YP/qaieupLo0qOcLHv1tMql7rKDXpDjoqT
         xdY1STjMs9EO+MDoq5tv/JFLpB+w4QF2ko0OG9xzDMUxXP8Alk5GqBYjKJT+HZ5ecNMJ
         kNnKXfed4MYf454G2O3NKhk8o/PgBBtDfqMhiiSb7Flktmcm07UL6+/MaxJXDeWC6EOy
         zPUJoEIftVQUs+eXrCS2mgeW28KM2+x7ctdyo7mFOetiYWKwgmunPdXmtwj8Q5GjWdOn
         ZMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH150cHqLSm1eYG0Nl0FBAaAEhf2rVK9WwC8sMEqXDwhJXzaVFffCaAG9xGf54clWM/kmr+hCD@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqOj0ffC4rMN3Ug9rdKgnAxof6gNtSAoVyEMhtgCVbX3Cv7edU
	ZyTF7hGNG6xmP2V5yTGKPMw58SNpqv8/mHv3sIrXVG4paZDbNm8wECE/gQ==
X-Gm-Gg: ASbGnct8CKbyXIZvMI6hMuGZFbnVBCPKpR2VxFofmiHM8eRSpPfMgGEqadd2QA33fHK
	2jkUEm8WT5WDlM7hsAEt5llOKeJ2Kjn2IgmKg/Vjj3hbOJzQs+H9oGWde3W1vq9JyfnmiY6mWQm
	Orn2IWNRiJUUyoSK3scyAW2+SYsUsPON6EjCeAjk8Eps1BOgPWWDnJdefIPmhBs505Od183OVGD
	OHs/hsxzldVlZ3RwiYYPUU8mtc674Vkwk56izP6Nwf7vQ53MBmILMOPH14/JbkXzPRm9SGz9xAj
	VD9FB5bKdXDqzNsk5pOWLZOqAHT47AXIQgBc29lwWSkanEOyMfoQzcuiFP2c0j1qu7ysH9IQ5nK
	4yETf3Ojwsfj/Z5QGmQ==
X-Google-Smtp-Source: AGHT+IFKXn37jGxRJqYs9Z7cjgeslaYx5toXgQvIdubNYT0omtpkPxzSecRG1QF/6dIUtH6mITmLAA==
X-Received: by 2002:a17:902:f68a:b0:224:1294:1d24 with SMTP id d9443c01a7336-2296c603a02mr2311745ad.3.1743547922823;
        Tue, 01 Apr 2025 15:52:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf6e8sm94570265ad.131.2025.04.01.15.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 15:52:02 -0700 (PDT)
Message-ID: <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
Date: Tue, 1 Apr 2025 15:52:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: max34451: Workaround for lost page
To: "William A. Kennington III" <william@wkennington.com>,
 Jean Delvare <jdelvare@suse.com>
References: <20250401220850.3189582-1-william@wkennington.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250401220850.3189582-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/1/25 15:08, William A. Kennington III wrote:
> When requesting new pages from the max34451 we sometimes see that the
> firmware doesn't update the page on the max34451 side fast enough. This
> results in the kernel receiving data for a different page than what it
> expects.
> 
> To remedy this, the manufacturer recommends we wait 50-100us until
> the firmware should be ready with the new page.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
>   drivers/hwmon/pmbus/max34440.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
> index c9dda33831ff..ac3a26f7cff3 100644
> --- a/drivers/hwmon/pmbus/max34440.c
> +++ b/drivers/hwmon/pmbus/max34440.c
> @@ -12,6 +12,7 @@
>   #include <linux/init.h>
>   #include <linux/err.h>
>   #include <linux/i2c.h>
> +#include <linux/delay.h>
>   #include "pmbus.h"
>   
>   enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
> @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>   		if (rv < 0)
>   			return rv;
>   
> +		/* Firmware is sometimes not ready if we try and read the

This is not the networking subsystem. Standard multi-line comments, please.

> +		 * data from the page immediately after setting. Maxim
> +		 * recommends 50-100us delay.
> +		 */
> +		fsleep(50);

I would suggest to wait 100uS to be safe. The function is only called during probe,
so that should be ok.

Is this a generic problem with this chip when changing pages ?

Thanks,
Guenter

