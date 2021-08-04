Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484B03E0727
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 20:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg06d0x5Kz3cK9
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 04:06:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TsQLFAb5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TsQLFAb5; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg06F5qcGz3bjG;
 Thu,  5 Aug 2021 04:05:56 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id
 g5-20020a9d6b050000b02904f21e977c3eso2436816otp.5; 
 Wed, 04 Aug 2021 11:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=662mfXKtv4dSIf5beuNHT3DDXWaZbtj0U5V1Quf/Cqo=;
 b=TsQLFAb5BCoWxD1Y2wgcJGTIN7EP2e93teQo9ELdOtG3JOvr/Y3zRBwD0WFB1kOzRY
 jOkeOW8BcYKRFJgvnnOT0sz6cGil12qyuXKAv09qUokQmiCWj20asPOQ1PI1BqvFjgez
 cPVIIhd6/M6ponIGM58P+5KnevAUetIqSk9KhNYPEAfUVHB0ko0IryjGbVwxF3IK5fTm
 OqlhFPyeVh914SibViA+dpwsaGUGsBgltFpn25sQn+9+YIfdDl+w/Ke+9yaFpFJC0os+
 Y05RD6wUnzCa6cf270QE6ZFez0Lr6v0E9pJqBZ2QmsoMR6uSGOS32+spj9sHUXExEk9h
 pPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=662mfXKtv4dSIf5beuNHT3DDXWaZbtj0U5V1Quf/Cqo=;
 b=uZ4DDUfyePs3VmpLriEz/OjsqUVKoH65o987+uHpJL3EbT93IhygO4HNj2e8kmvck6
 pErRMtNjdEQnPbRuPkg3W57fkBcop1Qz9NXDPCsS8MGGYlzesCx3Wuxl/5ICyfvy2ZG7
 iAzKN9TjiC33xvBh4biQGGS8eCF68KqtB89PJxKI6QuJWZhYotrosVr662L/nRxAGX6J
 sei4Cz4m+ut06SWuMJfenUsBbWcYP97IHwFbcQzJp/mkN68QnPLwEbVcGSIq1p2PVOcA
 XWmACKzOBpqdUi6YiRBqxB7JIke26sjBr5yJKsY1jy/RKXyeshqmi40c/R+BOFR4j5LQ
 VvvQ==
X-Gm-Message-State: AOAM533Pfq+Ve3W8cVfpTW6/pv7mbhaNeeTNZbB/Kasqn+wDo17f9lxQ
 PPm5iUfB/LGaoW/zE57K5jY=
X-Google-Smtp-Source: ABdhPJwV2GGK2AFelwSidL571RaM1UkeRO7cCy4fNQ3gajiTq4DQjj4ju9lo9QV4O7WpRUROwB5WyA==
X-Received: by 2002:a05:6830:25ce:: with SMTP id
 d14mr715144otu.87.1628100352271; 
 Wed, 04 Aug 2021 11:05:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f14sm516494ote.64.2021.08.04.11.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 11:05:51 -0700 (PDT)
Subject: Re: [PATCH 13/14] docs: hwmon: Document PECI drivers
To: Zev Weiss <zweiss@equinix.com>,
 "Winiarska, Iwona" <iwona.winiarska@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-14-iwona.winiarska@intel.com>
 <20210727225808.GU8018@packtop>
 <ea5621698508a800cea59b5533f8845b9f0befc6.camel@intel.com>
 <20210804175203.GY8018@packtop>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4e840768-0315-6241-e988-9a3165a31a86@roeck-us.net>
Date: Wed, 4 Aug 2021 11:05:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804175203.GY8018@packtop>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/4/21 10:52 AM, Zev Weiss wrote:
> On Mon, Aug 02, 2021 at 06:37:30AM CDT, Winiarska, Iwona wrote:
>> On Tue, 2021-07-27 at 22:58 +0000, Zev Weiss wrote:
>>> On Mon, Jul 12, 2021 at 05:04:46PM CDT, Iwona Winiarska wrote:
>>>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>>
>>>> Add documentation for peci-cputemp driver that provides DTS thermal
>>>> readings for CPU packages and CPU cores and peci-dimmtemp driver that
>>>> provides DTS thermal readings for DIMMs.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>>> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>> Documentation/hwmon/index.rst         |  2 +
>>>> Documentation/hwmon/peci-cputemp.rst  | 93 +++++++++++++++++++++++++++
>>>> Documentation/hwmon/peci-dimmtemp.rst | 58 +++++++++++++++++
>>>> MAINTAINERS                           |  2 +
>>>> 4 files changed, 155 insertions(+)
>>>> create mode 100644 Documentation/hwmon/peci-cputemp.rst
>>>> create mode 100644 Documentation/hwmon/peci-dimmtemp.rst
>>>>
>>>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>>>> index bc01601ea81a..cc76b5b3f791 100644
>>>> --- a/Documentation/hwmon/index.rst
>>>> +++ b/Documentation/hwmon/index.rst
>>>> @@ -154,6 +154,8 @@ Hardware Monitoring Kernel Drivers
>>>>     pcf8591
>>>>     pim4328
>>>>     pm6764tr
>>>> +   peci-cputemp
>>>> +   peci-dimmtemp
>>>>     pmbus
>>>>     powr1220
>>>>     pxe1610
>>>> diff --git a/Documentation/hwmon/peci-cputemp.rst
>>>> b/Documentation/hwmon/peci-cputemp.rst
>>>> new file mode 100644
>>>> index 000000000000..d3a218ba810a
>>>> --- /dev/null
>>>> +++ b/Documentation/hwmon/peci-cputemp.rst
>>>> @@ -0,0 +1,93 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +Kernel driver peci-cputemp
>>>> +==========================
>>>> +
>>>> +Supported chips:
>>>> +       One of Intel server CPUs listed below which is connected to a PECI
>>>> bus.
>>>> +               * Intel Xeon E5/E7 v3 server processors
>>>> +                       Intel Xeon E5-14xx v3 family
>>>> +                       Intel Xeon E5-24xx v3 family
>>>> +                       Intel Xeon E5-16xx v3 family
>>>> +                       Intel Xeon E5-26xx v3 family
>>>> +                       Intel Xeon E5-46xx v3 family
>>>> +                       Intel Xeon E7-48xx v3 family
>>>> +                       Intel Xeon E7-88xx v3 family
>>>> +               * Intel Xeon E5/E7 v4 server processors
>>>> +                       Intel Xeon E5-16xx v4 family
>>>> +                       Intel Xeon E5-26xx v4 family
>>>> +                       Intel Xeon E5-46xx v4 family
>>>> +                       Intel Xeon E7-48xx v4 family
>>>> +                       Intel Xeon E7-88xx v4 family
>>>> +               * Intel Xeon Scalable server processors
>>>> +                       Intel Xeon D family
>>>> +                       Intel Xeon Bronze family
>>>> +                       Intel Xeon Silver family
>>>> +                       Intel Xeon Gold family
>>>> +                       Intel Xeon Platinum family
>>>> +
>>>> +       Datasheet: Available from http://www.intel.com/design/literature.htm
>>>> +
>>>> +Author: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> +
>>>> +Description
>>>> +-----------
>>>> +
>>>> +This driver implements a generic PECI hwmon feature which provides Digital
>>>> +Thermal Sensor (DTS) thermal readings of the CPU package and CPU cores that
>>>> are
>>>> +accessible via the processor PECI interface.
>>>> +
>>>> +All temperature values are given in millidegree Celsius and will be
>>>> measurable
>>>> +only when the target CPU is powered on.
>>>> +
>>>> +Sysfs interface
>>>> +-------------------
>>>> +
>>>> +=======================
>>>> =======================================================
>>>> +temp1_label            "Die"
>>>> +temp1_input            Provides current die temperature of the CPU package.
>>>> +temp1_max              Provides thermal control temperature of the CPU
>>>> package
>>>> +                       which is also known as Tcontrol.
>>>> +temp1_crit             Provides shutdown temperature of the CPU package
>>>> which
>>>> +                       is also known as the maximum processor junction
>>>> +                       temperature, Tjmax or Tprochot.
>>>> +temp1_crit_hyst                Provides the hysteresis value from Tcontrol
>>>> to Tjmax of
>>>> +                       the CPU package.
>>>> +
>>>> +temp2_label            "DTS"
>>>> +temp2_input            Provides current DTS temperature of the CPU package.
>>>
>>> Would this be a good place to note the slightly counter-intuitive nature
>>> of DTS readings?  i.e. add something along the lines of "The DTS sensor
>>> produces a delta relative to Tjmax, so negative values are normal and
>>> values approaching zero are hot."  (In my experience people who aren't
>>> already familiar with it tend to think something's wrong when a CPU
>>> temperature reading shows -50C.)
>>
>> I believe that what you're referring to is a result of "GetTemp", and we're
>> using it to calculate "Die" sensor values (temp1).
>> The sensor value is absolute - we don't expose "raw" thermal sensor value
>> (delta) anywhere.
>>
>> DTS sensor is exposing temperature value scaled to fit DTS 2.0 thermal profile:
>> https://www.intel.com/content/www/us/en/processors/xeon/scalable/xeon-scalable-thermal-guide.html
>> (section 5.2.3.2)
>>
>> Similar to "Die" sensor - it's also exposed in absolute form.
>>
>> I'll try to change description to avoid confusion.
>>
> 
> When I tested the patch series by applying it to my OpenBMC kernel, the
> temp2_input sysfs file produced negative numbers (as has been the case
> with previous iterations of the PECI patchset).  Is that expected?  From
> what Guenter has said it sounds like that's going to need to change so
> that the temperature readings are all in "normal" millidegrees C
> (that is, relative to the freezing point of water).
> 

Correct, the temperature is expected to be reported in millidegrees C
per hwmon ABI. Everything else is unacceptable. That makes me wonder what
"raw" and "absolute" means. Negative numbers suggest that, whatever is
reported today, it is not millidegrees C.

Guenter
