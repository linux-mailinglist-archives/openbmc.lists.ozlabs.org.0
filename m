Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF93D84DD
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 02:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZFRZ4Nzqz30Hp
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 10:49:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XxXcSAvH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XxXcSAvH; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZFRB1pdyz303F;
 Wed, 28 Jul 2021 10:49:09 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id d3so702295qvq.6;
 Tue, 27 Jul 2021 17:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZYSkWz7X4lVExOiPJYIDBIKS/NtBt7O7x8a39WZcw3A=;
 b=XxXcSAvHMJhwvcJMawngDxrodFcL2rVGZxd02Jy4gc0VItkwXCY/5wc4zKof87q1rI
 gC6R9QO9JRWd148OyM03HUlx2p3Arz6gF4XjTLOV9Co3CGT7YwRJ4S0sybasvynrgGMk
 a2UujeghF0Y4ziZ6k1DGo/AM8u5215eD0xqdm5zpEq94N0uZiymbgBWhxxM7CLwnUdWp
 N/EfXnHNN87tcsaJ0T/wyc8cAtalWSB/du8b1rjoiQbvQU4ff2kZRRYWQ0S7ChP6AkmM
 RgkvMwreh14PxMO23goH1W/q+DjP0Ot4yRjO6CuVKDe5YojCjSC0XbAjOYgoERHmbbln
 zsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZYSkWz7X4lVExOiPJYIDBIKS/NtBt7O7x8a39WZcw3A=;
 b=iP1auB8VpmYUIL4FAQnK3sVwysH957MWpQCnQRfCGwLLY3E1XUfcQeRbg6r2u7+yHm
 pibsDoq/sqNnHQBDzwuO3h31Gcih/Zoj9vYrOX3lccCnuPgkg0F3EjUueoSty6hJ43Mv
 0+u0OyxOi8+shqmdu46tdeoGfTw+6oGJgVRcoHrsyk4qbOLA9MXz88uwqe1inBeWZcF4
 QEx8ZFxjZi5k6zlxGDw+vZF2HBVkEFwLe+M/eJEM7NRTJ7RdXPV2pQz+p0BkO+3qQXso
 /uf/FY3+1avD7RgSE6yNZkAw0rUm6qmLm7DizXPyhidZ6ztsZM68KJZvl6yd2HoM+EwX
 RdWg==
X-Gm-Message-State: AOAM5304M0HQ9jAxmANykSyQrk6XtSIKwkrqKSvIjKd3XMKH9TNTrfph
 NYWSUd8BxCJ8OQU3fRLFFQ8=
X-Google-Smtp-Source: ABdhPJxdzeFGwi00dHcakpdAEHj91b5POB/NtMklO+oyPvYZZZaVzb+xSa7UDkJ1O5U7s1PTVATRaQ==
X-Received: by 2002:ad4:58cb:: with SMTP id dh11mr8742794qvb.29.1627433345679; 
 Tue, 27 Jul 2021 17:49:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f11sm2191098qtp.85.2021.07.27.17.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 17:49:05 -0700 (PDT)
Subject: Re: [PATCH 13/14] docs: hwmon: Document PECI drivers
To: Zev Weiss <zweiss@equinix.com>, Iwona Winiarska <iwona.winiarska@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-14-iwona.winiarska@intel.com>
 <20210727225808.GU8018@packtop>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0521a076-9772-532f-2eab-8870464ca211@roeck-us.net>
Date: Tue, 27 Jul 2021 17:49:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727225808.GU8018@packtop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/27/21 3:58 PM, Zev Weiss wrote:
> On Mon, Jul 12, 2021 at 05:04:46PM CDT, Iwona Winiarska wrote:
>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>
>> Add documentation for peci-cputemp driver that provides DTS thermal
>> readings for CPU packages and CPU cores and peci-dimmtemp driver that
>> provides DTS thermal readings for DIMMs.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>> Documentation/hwmon/index.rst         |  2 +
>> Documentation/hwmon/peci-cputemp.rst  | 93 +++++++++++++++++++++++++++
>> Documentation/hwmon/peci-dimmtemp.rst | 58 +++++++++++++++++
>> MAINTAINERS                           |  2 +
>> 4 files changed, 155 insertions(+)
>> create mode 100644 Documentation/hwmon/peci-cputemp.rst
>> create mode 100644 Documentation/hwmon/peci-dimmtemp.rst
>>
>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>> index bc01601ea81a..cc76b5b3f791 100644
>> --- a/Documentation/hwmon/index.rst
>> +++ b/Documentation/hwmon/index.rst
>> @@ -154,6 +154,8 @@ Hardware Monitoring Kernel Drivers
>>     pcf8591
>>     pim4328
>>     pm6764tr
>> +   peci-cputemp
>> +   peci-dimmtemp
>>     pmbus
>>     powr1220
>>     pxe1610
>> diff --git a/Documentation/hwmon/peci-cputemp.rst b/Documentation/hwmon/peci-cputemp.rst
>> new file mode 100644
>> index 000000000000..d3a218ba810a
>> --- /dev/null
>> +++ b/Documentation/hwmon/peci-cputemp.rst
>> @@ -0,0 +1,93 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +Kernel driver peci-cputemp
>> +==========================
>> +
>> +Supported chips:
>> +	One of Intel server CPUs listed below which is connected to a PECI bus.
>> +		* Intel Xeon E5/E7 v3 server processors
>> +			Intel Xeon E5-14xx v3 family
>> +			Intel Xeon E5-24xx v3 family
>> +			Intel Xeon E5-16xx v3 family
>> +			Intel Xeon E5-26xx v3 family
>> +			Intel Xeon E5-46xx v3 family
>> +			Intel Xeon E7-48xx v3 family
>> +			Intel Xeon E7-88xx v3 family
>> +		* Intel Xeon E5/E7 v4 server processors
>> +			Intel Xeon E5-16xx v4 family
>> +			Intel Xeon E5-26xx v4 family
>> +			Intel Xeon E5-46xx v4 family
>> +			Intel Xeon E7-48xx v4 family
>> +			Intel Xeon E7-88xx v4 family
>> +		* Intel Xeon Scalable server processors
>> +			Intel Xeon D family
>> +			Intel Xeon Bronze family
>> +			Intel Xeon Silver family
>> +			Intel Xeon Gold family
>> +			Intel Xeon Platinum family
>> +
>> +	Datasheet: Available from http://www.intel.com/design/literature.htm
>> +
>> +Author: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements a generic PECI hwmon feature which provides Digital
>> +Thermal Sensor (DTS) thermal readings of the CPU package and CPU cores that are
>> +accessible via the processor PECI interface.
>> +
>> +All temperature values are given in millidegree Celsius and will be measurable
>> +only when the target CPU is powered on.
>> +
>> +Sysfs interface
>> +-------------------
>> +
>> +======================= =======================================================
>> +temp1_label		"Die"
>> +temp1_input		Provides current die temperature of the CPU package.
>> +temp1_max		Provides thermal control temperature of the CPU package
>> +			which is also known as Tcontrol.
>> +temp1_crit		Provides shutdown temperature of the CPU package which
>> +			is also known as the maximum processor junction
>> +			temperature, Tjmax or Tprochot.
>> +temp1_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
>> +			the CPU package.
>> +
>> +temp2_label		"DTS"
>> +temp2_input		Provides current DTS temperature of the CPU package.
> 
> Would this be a good place to note the slightly counter-intuitive nature
> of DTS readings?  i.e. add something along the lines of "The DTS sensor
> produces a delta relative to Tjmax, so negative values are normal and
> values approaching zero are hot."  (In my experience people who aren't
> already familiar with it tend to think something's wrong when a CPU
> temperature reading shows -50C.)
> 

All attributes shall follow the ABI, and the driver must translate reported
values to degrees C. If those sensors do not follow the ABI and report something
else, I won't accept the driver.

Guenter

>> +temp2_max		Provides thermal control temperature of the CPU package
>> +			which is also known as Tcontrol.
>> +temp2_crit		Provides shutdown temperature of the CPU package which
>> +			is also known as the maximum processor junction
>> +			temperature, Tjmax or Tprochot.
>> +temp2_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
>> +			the CPU package.
>> +
>> +temp3_label		"Tcontrol"
>> +temp3_input		Provides current Tcontrol temperature of the CPU
>> +			package which is also known as Fan Temperature target.
>> +			Indicates the relative value from thermal monitor trip
>> +			temperature at which fans should be engaged.
>> +temp3_crit		Provides Tcontrol critical value of the CPU package
>> +			which is same to Tjmax.
>> +
>> +temp4_label		"Tthrottle"
>> +temp4_input		Provides current Tthrottle temperature of the CPU
>> +			package. Used for throttling temperature. If this value
>> +			is allowed and lower than Tjmax - the throttle will
>> +			occur and reported at lower than Tjmax.
>> +
>> +temp5_label		"Tjmax"
>> +temp5_input		Provides the maximum junction temperature, Tjmax of the
>> +			CPU package.
>> +
>> +temp[6-N]_label		Provides string "Core X", where X is resolved core
>> +			number.
>> +temp[6-N]_input		Provides current temperature of each core.
>> +temp[6-N]_max		Provides thermal control temperature of the core.
>> +temp[6-N]_crit		Provides shutdown temperature of the core.
>> +temp[6-N]_crit_hyst	Provides the hysteresis value from Tcontrol to Tjmax of
>> +			the core.
> 
> I only see *_label and *_input for the per-core temperature sensors, no
> *_max, *_crit, or *_crit_hyst.
> 
>> +
>> +======================= =======================================================
>> diff --git a/Documentation/hwmon/peci-dimmtemp.rst b/Documentation/hwmon/peci-dimmtemp.rst
>> new file mode 100644
>> index 000000000000..1778d9317e43
>> --- /dev/null
>> +++ b/Documentation/hwmon/peci-dimmtemp.rst
>> @@ -0,0 +1,58 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Kernel driver peci-dimmtemp
>> +===========================
>> +
>> +Supported chips:
>> +	One of Intel server CPUs listed below which is connected to a PECI bus.
>> +		* Intel Xeon E5/E7 v3 server processors
>> +			Intel Xeon E5-14xx v3 family
>> +			Intel Xeon E5-24xx v3 family
>> +			Intel Xeon E5-16xx v3 family
>> +			Intel Xeon E5-26xx v3 family
>> +			Intel Xeon E5-46xx v3 family
>> +			Intel Xeon E7-48xx v3 family
>> +			Intel Xeon E7-88xx v3 family
>> +		* Intel Xeon E5/E7 v4 server processors
>> +			Intel Xeon E5-16xx v4 family
>> +			Intel Xeon E5-26xx v4 family
>> +			Intel Xeon E5-46xx v4 family
>> +			Intel Xeon E7-48xx v4 family
>> +			Intel Xeon E7-88xx v4 family
>> +		* Intel Xeon Scalable server processors
>> +			Intel Xeon D family
>> +			Intel Xeon Bronze family
>> +			Intel Xeon Silver family
>> +			Intel Xeon Gold family
>> +			Intel Xeon Platinum family
>> +
>> +	Datasheet: Available from http://www.intel.com/design/literature.htm
>> +
>> +Author: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements a generic PECI hwmon feature which provides Digital
>> +Thermal Sensor (DTS) thermal readings of DIMM components that are accessible
>> +via the processor PECI interface.
> 
> I had thought "DTS" referred to a fairly specific sensor in the CPU; is
> the same term also used for DIMM temp sensors or is the mention of it
> here a copy/paste error?
> 
>> +
>> +All temperature values are given in millidegree Celsius and will be measurable
>> +only when the target CPU is powered on.
>> +
>> +Sysfs interface
>> +-------------------
>> +
>> +======================= =======================================================
>> +
>> +temp[N]_label		Provides string "DIMM CI", where C is DIMM channel and
>> +			I is DIMM index of the populated DIMM.
>> +temp[N]_input		Provides current temperature of the populated DIMM.
>> +temp[N]_max		Provides thermal control temperature of the DIMM.
>> +temp[N]_crit		Provides shutdown temperature of the DIMM.
>> +
>> +======================= =======================================================
>> +
>> +Note:
>> +	DIMM temperature attributes will appear when the client CPU's BIOS
>> +	completes memory training and testing.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 35ba9e3646bd..d16da127bbdc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14509,6 +14509,8 @@ M:	Iwona Winiarska <iwona.winiarska@intel.com>
>> R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> L:	linux-hwmon@vger.kernel.org
>> S:	Supported
>> +F:	Documentation/hwmon/peci-cputemp.rst
>> +F:	Documentation/hwmon/peci-dimmtemp.rst
>> F:	drivers/hwmon/peci/
>>
>> PECI SUBSYSTEM
>> -- 
>> 2.31.1
>>
> 

