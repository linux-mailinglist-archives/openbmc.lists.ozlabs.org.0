Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C33C13253B1
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 17:43:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmdrb5zKMz3cZL
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 03:43:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mAu36UQo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mAu36UQo; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmdrJ2pYzz3cY4;
 Fri, 26 Feb 2021 03:42:55 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id 105so6299489otd.3;
 Thu, 25 Feb 2021 08:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vF7Sr8k6T1GIk11C2IVF7kon90r3481y7roC0/ZPwhg=;
 b=mAu36UQooRjl3tsctsIBh3jB6R1Omw0/dQOmKEBz636LJYpvPWvb+oUAfDIb2eMc0w
 cM798f5Bm/1ykvy5GOLMqOylxHPJbGLFkgzGwuGOHwfr72lEIA69PUqgWUmeMFvVQUYC
 iLu1H73SkK6v7Pkiey/XHSDOQjyZS+YrptvLyt8rLIl2M2oqWw21Hv5jWc3qruJtbiJk
 gHM7e3o4c849feRLbbhICd7rxeiwdNJl+788qCO9qN2qrMW5KiaTRm69d/os0JyYcxyu
 kPf+ZwpX5dyn/i5iy09DAQ14RF+LQ2PPXNxiCA+nRuyPBhYY88yuF/SbBv1Gfx0P/ias
 gsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vF7Sr8k6T1GIk11C2IVF7kon90r3481y7roC0/ZPwhg=;
 b=HxKiTqsF568UvIghqxnUERkXwd6YKYpmXrWEEbNRgVTCA2H8lM00BYVU2RO7Wgz4EV
 oa0h3MJVgMCUC9uKsCNdTqPSJYWUoa7BKsd1Km8XxVgh7NYQLt/9Iyz7YMe8ocvq15mK
 /XvUFAU3UTOjtq2X0DsCsAD398KLC8fNHHnOIW5ZCnL8imuo+7mFWboOBKellMRhrW42
 eA2OfJ6V9V1u7L5hhaDvGwD2qsIJWt29NSpDVIBrkwejJpaRZAjEaeysypuG6KFWnxJN
 hgEO0tisG73XYPTxLRGvoOg3idxAdzza9pEMEpPO9237NqLux4ZHnoj0DTEpM8bUhz4I
 GApw==
X-Gm-Message-State: AOAM533apANP0AKmNTlW5OAecEllwkkGjcTyfzIK4c2UV4uvqF6vu4YQ
 xjFSXrbnXLqYuqrSi9h1vmE=
X-Google-Smtp-Source: ABdhPJwbI7qWysZeUMz3ZE0h5wFCF7D78MHpK9XO1djLaiz1MMmG9BHm8+5LkrNLp5Ppq8T+j25VRw==
X-Received: by 2002:a9d:1465:: with SMTP id h92mr2936956oth.141.1614271371869; 
 Thu, 25 Feb 2021 08:42:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u15sm995990oiu.28.2021.02.25.08.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 08:42:51 -0800 (PST)
Subject: Re: [PATCH 4/4] docs: hwmon: (smpro-hwmon) Add documentation
To: Quan Nguyen <quan@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-5-quan@os.amperecomputing.com>
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
Message-ID: <00d6d57e-86a4-bd61-335c-3ff42c0dc1f7@roeck-us.net>
Date: Thu, 25 Feb 2021 08:42:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225101854.13896-5-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/25/21 2:18 AM, Quan Nguyen wrote:
> Add documentation for the Ampere(R)'s Altra(R) SMpro hwmon driver.
> 
> Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  Documentation/hwmon/index.rst       |   1 +
>  Documentation/hwmon/smpro-hwmon.rst | 100 ++++++++++++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/hwmon/smpro-hwmon.rst
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8d5a2df1ecb6..b48a980ed08b 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -164,6 +164,7 @@ Hardware Monitoring Kernel Drivers
>     sis5595
>     sl28cpld
>     smm665
> +   smpro-hwmon

"hwmon" seems a bit redundant here.

>     smsc47b397
>     smsc47m192
>     smsc47m1
> diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
> new file mode 100644
> index 000000000000..d546b90982e5
> --- /dev/null
> +++ b/Documentation/hwmon/smpro-hwmon.rst
> @@ -0,0 +1,100 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver Ampere(R)'s Altra(R) SMpro hwmon
> +==============================================
> +
> +Supported chips:
> +
> +  * Ampere(R) Altra(R)
> +
> +    Prefix: 'smpro'
> +
> +    Reference: Altra SoC BMC Interface Specification
> +
> +Author: Thu Nguyen <thu@os.amperecomputing.com>
> +
> +Description
> +-----------
> +This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
> +SMpro co-processor (SMpro).
> +The following sensor types are supported by the driver:
> +
> +  * temperature
> +  * voltage
> +  * current
> +  * power
> +
> +The SMpro interface provides the registers to query the various sensors and
> +their values which are then exported to userspace by this driver.
> +
> +Usage Notes
> +-----------
> +
> +SMpro hwmon driver creates two sysfs files for each sensor.
> +
> +* File ``<sensor_type><idx>_label`` reports the sensor label.
> +* File ``<sensor_type><idx>_input`` returns the sensor value.
> +
> +The sysfs files are allocated in the SMpro root fs folder.
> +There is one root folder for each SMpro instance.
> +
> +When the SoC is turned off, the driver is failed to read the registers.
> +It returns TIMEDOUT Error(-110) for the read sensors.
> +

Maybe better something like

When the SoC is turned off, the driver will fail to read registers
and return -ETIMEDOUT.

Can that indeed happen ? That seems to be highly undesirable.

> +Sysfs entries
> +-------------
> +
> +The following sysfs files are supported:
> +
> +* Ampere(R) Altra(R):
> +
> +===============    =============   ======= ===============================================
> +Name        Unit        Perm    Description
> +temp1_input     mili Celsius     RO    SoC temperature

s/mili/milli/ throughout

> +temp2_input     mili Celsius     RO    Highest temperature reported by the SoC VRDs
> +temp3_input     mili Celsius     RO    Highest temperature reported by the DIMM VRDs
> +temp4_input     mili Celsius     RO    Highest temperature reported by the Core VRDs

What does "highest" stand for here ? Is it the _current_ highest
temperature, added up by the hardware/firmware, or is it the historic
highest temperature ? Historic data should be reported as tempX_highest.

> +temp5_input     mili Celsius     RO    Highest temperature of DIMM Channel 0 to 3

drop; reported individually.

> +temp6_input     mili Celsius     RO    Temperature of DIMM0 on CH0
> +temp7_input     mili Celsius     RO    Temperature of DIMM0 on CH1
> +temp8_input     mili Celsius     RO    Temperature of DIMM0 on CH2
> +temp9_input     mili Celsius     RO    Temperature of DIMM0 on CH3
> +temp10_input     mili Celsius     RO    Highest temperature of DIMM Channel 4 to 7

drop; reported individually.

> +temp11_input     mili Celsius     RO    Temperature of DIMM0 on CH4
> +temp12_input     mili Celsius     RO    Temperature of DIMM0 on CH5
> +temp13_input     mili Celsius     RO    Temperature of DIMM0 on CH6
> +temp14_input     mili Celsius     RO    Temperature of DIMM0 on CH7
> +temp15_input     mili Celsius     RO    MEM HOT Threshold
> +temp16_input     mili Celsius     RO    SoC VRD HOT Threshold

Report as tempX_max or tempX_crit, as appropriate (eg temp2_max or
temp2_crit for SoC VRD HOT Threshold). If there is a single threshold
temperature for all DIMMs, report the same limit value for all DIMM
temperature sensors.

> +temp17_input     mili Celsius     RO    Highest temperature reported by the RCA VRD

Same question about "highest" as above. Either "highest" is
inappropriate, or there are multiple RCA VRDs and only the
highest temperature of those is reported (which should be
explicitly stated).

> +in0_input     mili Volt     RO    Core voltage
> +in1_input     mili Volt     RO    SoC voltage
> +in2_input     mili Volt     RO    DIMM VRD1 voltage
> +in3_input     mili Volt     RO    DIMM VRD2 voltage
> +in4_input     mili Volt     RO    Maximum voltage of DIMM VRD1 and VRD2

drop; reported individually.

> +in5_input     mili Volt     RO    RCA VRD voltage
> +cur1_input     mili Ampere     RO    Core VRD current
> +cur2_input     mili Ampere     RO    SoC VRD current
> +cur3_input     mili Ampere     RO    DIMM VRD1 current
> +cur4_input     mili Ampere     RO    DIMM VRD2 current
> +cur5_input     mili Ampere     RO    RCA VRD current
> +power1_input     nano Wat     RO    Core VRD power

Expected scale is micro-Watt.

> +power2_input     nano Wat     RO    SoC VRD power
> +power3_input     nano Wat     RO    DIMM VRD1 power
> +power4_input     nano Wat     RO    DIMM VRD2 power
> +power5_input     nano Wat     RO    CPU VRD power, total of SoC and Core VRD power

drop

> +power6_input     nano Wat     RO    Total of DIMM VRD1 and VRD2 power

drop

> +power7_input     nano Wat     RO    RCA VRD power
> +power8_input     nano Wat     RO    Socket TDP

Report as max attribute

> +===============    =============   ======= ===============================================
> +
> +Example::
> +
> +    # cat in0_input
> +    830
> +    # cat temp1_input
> +    37000
> +    # cat curr1_input
> +    9000
> +    # cat power5_input
> +    19500000
> 

