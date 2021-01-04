Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29E2E9F07
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 21:50:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8nnT256KzDqPG
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 07:50:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uyQhA1uO; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8nmG1YpqzDqNJ;
 Tue,  5 Jan 2021 07:48:56 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id y23so496466wmi.1;
 Mon, 04 Jan 2021 12:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BRM9BzjeAFWjl1pR2n3iRc4+aNsc/ikIOGAtDOI9KFA=;
 b=uyQhA1uOBkk/c5MOEmyz2FkFnRLfJTKmkTG0E/ragudWkTP4HSgPz5dImFqveUP9Te
 jAr9RGextMp/o09/zaF3dk5b1dEr86oWR9c7SqEkRn7wKRKwivQcoABFC6xmyF/Lw8Ox
 /b+/YCGEU26cvrXqX/1lBsR6Fjv5GwAeaNKItWgndCVQDv8p76SIYDBTZjsaB+E5yhOQ
 +UW2EbzgzUyi6ilxz0CbqljHHHmLgu265ns4UxsYbwi2CSrznuPxtf9YiZz7Ut5kv743
 JPTMlphevQ2WjRFOYa1/v/gbzoBZGLaQFI3wPcxO0c3lUbqkauW7j7q2JpFJATpSaXGW
 68Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BRM9BzjeAFWjl1pR2n3iRc4+aNsc/ikIOGAtDOI9KFA=;
 b=gNgajkEpKIS6mhYDLHBA0MZsl+Z0xRy4QDqOMSE32XiT/PmhOssXrUs5nlvLLWR4qf
 mLcEr8IBw4aIpm1VZhcqrwAAAI7Zw8+THPgILerNjPs9rXw0fGpUynmzgAWJxR2DYuZM
 GWvZtbwgAbQgRSxKTUIKGv8b3i9a3ibp7OQBuRkRxPcu2AVUyyeAVhftaPYk6AQh2Eq6
 IFB70y5/Rn7s0nWHfCwNiHWiNlGUHzJq2iZrJdQuNbqekkm49LjKGvmxCE7BOPqn+WRi
 CocAO94LXceeK0kRO+XCcYoNrzcWhNQ09odwx5T2WTkdSwFUzgdqKK0DDnRqEmZxSe5w
 Iu7A==
X-Gm-Message-State: AOAM5300WBezo0C1qXzBTjI7ftJRxvEZH+u4oW+6fnjth0mLOFEdBK+2
 OxavtZTRZ77QQeDo9D/d3Hc=
X-Google-Smtp-Source: ABdhPJyrmSsz9yrnAaWAcLqURuJW8dc5qgDZTgNVqd3ZHYzIENPTIrUnKQh7q1wQ5NIksOJDxbjVrg==
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr555559wml.99.1609793329671;
 Mon, 04 Jan 2021 12:48:49 -0800 (PST)
Received: from ?IPv6:2003:ea:8f06:5500:7409:b966:5a79:f8df?
 (p200300ea8f0655007409b9665a79f8df.dip0.t-ipconnect.de.
 [2003:ea:8f06:5500:7409:b966:5a79:f8df])
 by smtp.googlemail.com with ESMTPSA id c4sm831916wmf.19.2021.01.04.12.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 12:48:49 -0800 (PST)
Subject: Re: [Aspeed, v1 1/1] net: ftgmac100: Change the order of getting MAC
 address
To: Hongwei Zhang <hongweiz@ami.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jakub Kicinski <kuba@kernel.org>, David S Miller <davem@davemloft.net>,
 Andrew Lunn <andrew@lunn.ch>
References: <20201221205157.31501-2-hongweiz@ami.com>
 <20210104172807.20986-1-hongweiz@ami.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <398f22ee-62ed-5fd6-1d4d-119c405d7f34@gmail.com>
Date: Mon, 4 Jan 2021 21:48:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104172807.20986-1-hongweiz@ami.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Andrew Jeffery <andrew@aj.id.au>, netdev <netdev@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04.01.2021 18:28, Hongwei Zhang wrote:
> 
>> From: Jakub Kicinski <kuba@kernel.org>
>> Sent: Monday, December 28, 2020 5:01 PM
>>
>> On Tue, 22 Dec 2020 22:00:34 +0100 Andrew Lunn wrote:
>>> On Tue, Dec 22, 2020 at 09:46:52PM +0100, Heiner Kallweit wrote:
>>>> On 22.12.2020 21:14, Hongwei Zhang wrote:
>>>>> Dear Reviewer,
>>>>>
>>>>> Use native MAC address is preferred over other choices, thus change the order
>>>>> of reading MAC address, try to read it from MAC chip first, if it's not
>>>>>  availabe, then try to read it from device tree.
>>>>>
>>>>> Hi Heiner,
>>>>>
>>>>>> From:  Heiner Kallweit <hkallweit1@gmail.com>
>>>>>> Sent:  Monday, December 21, 2020 4:37 PM
>>>>>>> Change the order of reading MAC address, try to read it from MAC chip
>>>>>>> first, if it's not availabe, then try to read it from device tree.
>>>>>>>
>>>>>> This commit message leaves a number of questions. It seems the change isn't related at all to the
>>>>>> change that it's supposed to fix.
>>>>>>
>>>>>> - What is the issue that you're trying to fix?
>>>>>> - And what is wrong with the original change?
>>>>>
>>>>> There is no bug or something wrong with the original code. This patch is for
>>>>> improving the code. We thought if the native MAC address is available, then
>>>>> it's preferred over MAC address from dts (assuming both sources are available).
>>>>>
>>>>> One possible scenario, a MAC address is set in dts and the BMC image is
>>>>> compiled and loaded into more than one platform, then the platforms will
>>>>> have network issue due to the same MAC address they read.
>>>>>
>>>>
>>>> Typically the DTS MAC address is overwritten by the boot loader, e.g. uboot.
>>>> And the boot loader can read it from chip registers. There are more drivers
>>>> trying to read the MAC address from DTS first. Eventually, I think, the code
>>>> here will read the same MAC address from chip registers as uboot did before.
> 
> Thanks for your review, Heiner,
> 
> I am working on a platform and want to use the method you said, reading from DTS
> is easy, but overwrite the MAC in DTS with chip MAC address, it will change the
> checksum of the image. Would you please provide an implementation example?
> 
One example is the igb driver. That's the relevant code snippet:

if (eth_platform_get_mac_address(&pdev->dev, hw->mac.addr)) {
	/* copy the MAC address out of the NVM */
	if (hw->mac.ops.read_mac_addr(hw))
		dev_err(&pdev->dev, "NVM Read Error\n");
}

And I'm not sure the image checksum is relevant here. The boot loader
dynamically replaces the MAC address before handing over the DTS to
Linux kernel. At that time an image checksum shouldn't be relevant.
Who would be supposed to check it?

> Thanks!
>>>
>>> Do we need to worry about, the chip contains random junk, which passes
>>> the validitiy test? Before this patch the value from DT would be used,
>>> and the random junk is ignored. Is this change possibly going to cause
>>> a regression?
> 
> Hi Andrew,
> 
> Thanks for your review. Yes, yours is a good point, as my change relies on
> the driver's ability to read correct MAC from the chip, or the check of
> is_valid_ether_addr(), which only checking for zeros and multicasting MAC.
> On the other hand, your concern is still true if no MAC is defined in DTS
> file.
> 
> Thanks!
>>
>> Hongwei, please address Andrew's questions.
>>
>> Once the discussion is over please repost the patches as
>> git-format-patch would generate them. The patch 2/2 of this
>> series is not really a patch, which confuses all patch handling
>> systems.
>>
>> It also appears that 35c54922dc97 ("ARM: dts: tacoma: Add reserved
>> memory for ramoops") does not exist upstream.
>>
> 
> Hi Jakub,
> 
> Thanks for your review; I am quite new to the contribution process. I will resubmit my
> patch with the SHA value issue fixed. Please see my response at above.
> 
> --Hongwei
> 

