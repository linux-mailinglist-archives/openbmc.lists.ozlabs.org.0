Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29045129CA
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 10:19:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wQ6J17pNzDqDc
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 18:19:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="KOwMT0Cl"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wPmx1DcJzDql8
 for <openbmc@lists.ozlabs.org>; Fri,  3 May 2019 18:04:48 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id l2so6602458wrb.9
 for <openbmc@lists.ozlabs.org>; Fri, 03 May 2019 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TpXqJQI7PVBHDytg+IGA8i8m1/XYj0MrND3X98mgWRU=;
 b=KOwMT0Cl9efaAA08+DXGflf+klv1sSVEHKxtGUL+CBB2gxt07xyd+GyRUCCFVKzsBF
 vKFUzaTq0/DOqlmb39mbYs9iH9RkOcgL/KAAeaSaMlUscaGj/bjbj+P1qApNVwESdscJ
 g+1LJrqUlO8vcWihy8sZ39L1L6LS1ajt0o5fzIYYJaQhvca+WfuJGXFbdFR2rcym4b4t
 zBYkf1Llb/Z3r2f2Mqm8DStMLgaZcHBFBYpuH2Uow5/FZOaBijtEgoGFhaFs2w3Lbcsf
 fUx7d6Qd9AwY90DycZfziK6toE6kMAjg8Mx+cK1CNVyDwdMXuzYcxD1e3vRmAV6UcGSV
 1pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TpXqJQI7PVBHDytg+IGA8i8m1/XYj0MrND3X98mgWRU=;
 b=iKWzb5zqwubmmNhDLhBPMeIj76dQ6Bjw0klyFbyT8lOtckDGfO8F6qLD0zMWKzq4mh
 DUAdY2jeyI4REAtytXB6OjmLiLejkQQGVsBU17I5LvbUDmr+qd5YvcZneP8pfCVy4GZx
 DFmua75PsHlovLn66lJ4WREpSZP0dDVUAGXkskqFT35PNiN7EY/L3lj07AJfsbmprOWK
 IPDT/wzIszR7lTxLEXil8k0WAUCJY6KUS1tHCUJ+FWEbbuzP0i5kRTuB4jYWewMdFOEG
 +f/Q0FvmD7hl6B7jxi4pb9/Yx2DZVPIklb/DxRAijXcSomRZruU+VexaWb0SwEnOCnDG
 u0JQ==
X-Gm-Message-State: APjAAAXCI3ZqA2UbZLa5XXqOTb8wJCNDHLfioFmsyJrTUTHn7hu0Rw07
 rv3+c9BJSTKifoqGaXqI9ZKBIg==
X-Google-Smtp-Source: APXvYqzRH5TpkdzGloadzIxAtQZsM2JgxqfDy9oibY2Qrd4ctA1Tpc85qqJ9ZfJamG8tTMt5Vi3YIQ==
X-Received: by 2002:a5d:430f:: with SMTP id h15mr5756534wrq.132.1556870681778; 
 Fri, 03 May 2019 01:04:41 -0700 (PDT)
Received: from [192.168.0.41] (223.235.129.77.rev.sfr.net. [77.129.235.223])
 by smtp.googlemail.com with ESMTPSA id k1sm1159060wmi.48.2019.05.03.01.04.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 01:04:41 -0700 (PDT)
Subject: Re: [PATCH 1/6] thermal: Introduce
 devm_thermal_of_cooling_device_register
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-pm@vger.kernel.org
References: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
 <1555617500-10862-2-git-send-email-linux@roeck-us.net>
 <20190501164843.GA16333@roeck-us.net>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c8a26b7d-2775-e13f-21b7-dbc901ea3b0b@linaro.org>
Date: Fri, 3 May 2019 10:04:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501164843.GA16333@roeck-us.net>
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
Cc: Jean Delvare <jdelvare@suse.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kamil Debski <kamil@wypas.org>, Tali Perry <tali.perry1@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 01/05/2019 18:48, Guenter Roeck wrote:
> On Thu, Apr 18, 2019 at 12:58:15PM -0700, Guenter Roeck wrote:
>> thermal_of_cooling_device_register() and thermal_cooling_device_register()
>> are typically called from driver probe functions, and
>> thermal_cooling_device_unregister() is called from remove functions. This
>> makes both a perfect candidate for device managed functions.
>>
>> Introduce devm_thermal_of_cooling_device_register(). This function can
>> also be used to replace thermal_cooling_device_register() by passing a NULL
>> pointer as device node. The new function requires both struct device *
>> and struct device_node * as parameters since the struct device_node *
>> parameter is not always identical to dev->of_node.
>>
>> Don't introduce a device managed remove function since it is not needed
>> at this point.
>>
> 
> Any feedback / thoughts / comments ?

Hi Guenter,

I have comments about your patch but I need some time to double check in
the current code how the 'of' and 'devm' are implemented.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

