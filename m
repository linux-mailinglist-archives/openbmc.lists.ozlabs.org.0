Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EC3ED1C1
	for <lists+openbmc@lfdr.de>; Sun,  3 Nov 2019 05:54:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475NrR4lDKzF62Q
	for <lists+openbmc@lfdr.de>; Sun,  3 Nov 2019 15:54:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WaFAH/Yq"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475NqY0hx6zF5pS
 for <openbmc@lists.ozlabs.org>; Sun,  3 Nov 2019 15:53:42 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id l24so9075355pgh.10
 for <openbmc@lists.ozlabs.org>; Sat, 02 Nov 2019 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5/13KcmLPI0bN8HRF/7zYPWlnhQwokAxPHIa/JyvfeM=;
 b=WaFAH/YqpChvdHCIf9fj1bOuaKgJUVJiZdCLc9L7GTm0+Ysoj3FE1kegXpZo3ONpH0
 IfKZtq1VgqOrI+7nRgxZiDAMbIZfNSKGekSfT46DwOojNzLCm1pjugohJUxbicHys17k
 gfmv0TfjUTP+13QJhXPUKMmwrF29jjCWkzoOs6PRx5dOfJND6VhIgDfKYYZkX2kwSta7
 bQ6Vsji75jlzdIp6Q1OJjeug1HFUkvDY4IeTXNoTBqenmgUCCHqok3K4ko3ni1zjE/nt
 KeIbYUpTGsKf9drZ+LGi/x2yOfoAqUVYoEqBTvVZdn/+4iEQMVitk/U8HZyYg333v3W+
 3ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/13KcmLPI0bN8HRF/7zYPWlnhQwokAxPHIa/JyvfeM=;
 b=KyeJjEfTqqAeMrXcmFPV4tQt6Q0qqo2gcWqj5J9uHXOkAY7BiMBM69026A63HUsqWV
 jATSyw/vdPyWAZWobzXjzHOOwPr1dxvSsjfloJThvGKrvY5D98tBqg4xTjh9ONsda6/p
 rBLW+qvXUo4JLsdCd1ZcNqGWz14MbrdU/99JN4yerhuQ9+Re5UUY68TD0dHN2aco/AnC
 Qk3fM7/torl8i0EhNKGgtn71ZBencvx5lH41TjdySJieyT4ktjqFrrVqdRRle9grdYxK
 QQbZswKs054D4M4rGhgvQH1U0ZnB+0qO3+f9MQumbBZRRd7CIALHZe/B4EeWhqCnF2sb
 4+cg==
X-Gm-Message-State: APjAAAU37/ybJQ1JjSdOwggP8M1nDI+nUgXuhhIBXSpI+eFu1Xa7Pszp
 XbtN0v/FPNrzNECZTazrD3c=
X-Google-Smtp-Source: APXvYqw0PSv3xkM313s1KctMFadu5FuMdjk59YKkKBiB7gsLzZ+QrGsGTzH8uFnN5XB7+CV0CJY6JQ==
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr23836921pfb.167.1572756819354; 
 Sat, 02 Nov 2019 21:53:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 10sm11652109pgs.11.2019.11.02.21.53.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 02 Nov 2019 21:53:38 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] docs: hwmon: Document bel-pfe pmbus driver
To: Tao Ren <rentao.bupt@gmail.com>
References: <20191029182054.32279-1-rentao.bupt@gmail.com>
 <20191029182054.32279-3-rentao.bupt@gmail.com>
 <20191102153115.GA5205@roeck-us.net>
 <20191103044432.GA3364@taoren-ubuntu-R90MNF91>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0b5c8a99-db37-5c13-ded8-f3ee611340e8@roeck-us.net>
Date: Sat, 2 Nov 2019 21:53:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191103044432.GA3364@taoren-ubuntu-R90MNF91>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-doc@vger.kernel.org, taoren@fb.com, openbmc@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/2/19 9:44 PM, Tao Ren wrote:
> On Sat, Nov 02, 2019 at 08:31:15AM -0700, Guenter Roeck wrote:
>> On Tue, Oct 29, 2019 at 11:20:54AM -0700, rentao.bupt@gmail.com wrote:
>>> From: Tao Ren <rentao.bupt@gmail.com>
>>>
>>> Add documentation for bel-pfe pmbus driver which supports BEL PFE1100 and
>>> PFE3000 power supplies.
>>>
>>> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
>>
>> Applied after adding bel-pfe to index.rst.
>>
>> Thanks,
>> Guenter
> 
> Thank you Guenter. I didn't know index.rst needs to be updated; will
> do it for my future doc patches.
> 
No worries. This is a result of the effort to convert the documentation
to .rst format, which makes everything a bit more difficult (such as
the need to add new files to the index). I am still getting used to
it myself.

Guenter

> 
> Cheers,
> 
> Tao
> 
>>> ---
>>>   No change in v2.
>>>
>>>   Documentation/hwmon/bel-pfe.rst | 112 ++++++++++++++++++++++++++++++++
>>>   1 file changed, 112 insertions(+)
>>>   create mode 100644 Documentation/hwmon/bel-pfe.rst
>>>
>>> diff --git a/Documentation/hwmon/bel-pfe.rst b/Documentation/hwmon/bel-pfe.rst
>>> new file mode 100644
>>> index 000000000000..4b4a7d67854c
>>> --- /dev/null
>>> +++ b/Documentation/hwmon/bel-pfe.rst
>>> @@ -0,0 +1,112 @@
>>> +Kernel driver bel-pfe
>>> +======================
>>> +
>>> +Supported chips:
>>> +
>>> +  * BEL PFE1100
>>> +
>>> +    Prefixes: 'pfe1100'
>>> +
>>> +    Addresses scanned: -
>>> +
>>> +    Datasheet: https://www.belfuse.com/resources/datasheets/powersolutions/ds-bps-pfe1100-12-054xa.pdf
>>> +
>>> +  * BEL PFE3000
>>> +
>>> +    Prefixes: 'pfe3000'
>>> +
>>> +    Addresses scanned: -
>>> +
>>> +    Datasheet: https://www.belfuse.com/resources/datasheets/powersolutions/ds-bps-pfe3000-series.pdf
>>> +
>>> +Author: Tao Ren <rentao.bupt@gmail.com>
>>> +
>>> +
>>> +Description
>>> +-----------
>>> +
>>> +This driver supports hardware monitoring for below power supply devices
>>> +which support PMBus Protocol:
>>> +
>>> +  * BEL PFE1100
>>> +
>>> +    1100 Watt AC to DC power-factor-corrected (PFC) power supply.
>>> +    PMBus Communication Manual is not publicly available.
>>> +
>>> +  * BEL PFE3000
>>> +
>>> +    3000 Watt AC/DC power-factor-corrected (PFC) and DC-DC power supply.
>>> +    PMBus Communication Manual is not publicly available.
>>> +
>>> +The driver is a client driver to the core PMBus driver. Please see
>>> +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
>>> +
>>> +
>>> +Usage Notes
>>> +-----------
>>> +
>>> +This driver does not auto-detect devices. You will have to instantiate the
>>> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
>>> +details.
>>> +
>>> +Example: the following will load the driver for an PFE3000 at address 0x20
>>> +on I2C bus #1::
>>> +
>>> +	$ modprobe bel-pfe
>>> +	$ echo pfe3000 0x20 > /sys/bus/i2c/devices/i2c-1/new_device
>>> +
>>> +
>>> +Platform data support
>>> +---------------------
>>> +
>>> +The driver supports standard PMBus driver platform data.
>>> +
>>> +
>>> +Sysfs entries
>>> +-------------
>>> +
>>> +======================= =======================================================
>>> +curr1_label		"iin"
>>> +curr1_input		Measured input current
>>> +curr1_max               Input current max value
>>> +curr1_max_alarm         Input current max alarm
>>> +
>>> +curr[2-3]_label		"iout[1-2]"
>>> +curr[2-3]_input		Measured output current
>>> +curr[2-3]_max           Output current max value
>>> +curr[2-3]_max_alarm     Output current max alarm
>>> +
>>> +fan[1-2]_input          Fan 1 and 2 speed in RPM
>>> +fan1_target             Set fan speed reference for both fans
>>> +
>>> +in1_label		"vin"
>>> +in1_input		Measured input voltage
>>> +in1_crit		Input voltage critical max value
>>> +in1_crit_alarm		Input voltage critical max alarm
>>> +in1_lcrit               Input voltage critical min value
>>> +in1_lcrit_alarm         Input voltage critical min alarm
>>> +in1_max                 Input voltage max value
>>> +in1_max_alarm           Input voltage max alarm
>>> +
>>> +in2_label               "vcap"
>>> +in2_input               Hold up capacitor voltage
>>> +
>>> +in[3-8]_label		"vout[1-3,5-7]"
>>> +in[3-8]_input		Measured output voltage
>>> +in[3-4]_alarm           vout[1-2] output voltage alarm
>>> +
>>> +power[1-2]_label	"pin[1-2]"
>>> +power[1-2]_input        Measured input power
>>> +power[1-2]_alarm	Input power high alarm
>>> +
>>> +power[3-4]_label	"pout[1-2]"
>>> +power[3-4]_input	Measured output power
>>> +
>>> +temp[1-3]_input		Measured temperature
>>> +temp[1-3]_alarm         Temperature alarm
>>> +======================= =======================================================
>>> +
>>> +.. note::
>>> +
>>> +    - curr3, fan2, vout[2-7], vcap, pin2, pout2 and temp3 attributes only
>>> +      exist for PFE3000.
> 

