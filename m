Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6992E0F7C
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 21:47:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0pLk4T0DzDqRm
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 07:47:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PgLKPYpZ; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0pKz2jp6zDqNS;
 Wed, 23 Dec 2020 07:47:02 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id cm17so14207821edb.4;
 Tue, 22 Dec 2020 12:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e7CXBCcrPKIQsc3r8jYzWjstSIIKZ5ePIODHJXTON8o=;
 b=PgLKPYpZotcmlM54p4+vEvRXDPGAM4sLUieycdmuLoGsRbJQSiQz5tuXYNnwDHhWSC
 mk6stdUrbkJUPukEz1Vmc7RLimb2bEfXVifjKhB4GEvdDHjLIAfsnmO2aA/fvemnFfd7
 Igvz92uupbPZT3YbiYnlsUzFNWYOMe/Q1iHM8nFj0YbCHXn+bJeCPJjePUHJd/AcVEw7
 tSh3f8KBNQcEUJPju252bFTbSMgwV9hx0DNTsM1umQ5J/Qv/2indThVo9SqufA705+c4
 OfZoBp3YjRxZkB3fe+C3t3OLHu9oLdQsdYzTwT97fFAqg6fN3MotjtjSDvHrq3vX9PL5
 ePaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e7CXBCcrPKIQsc3r8jYzWjstSIIKZ5ePIODHJXTON8o=;
 b=fZ0LPUtFDJqAx0BpHnOyLhF9vIavFKtyeGunsSSmPE5JosAvLOmkGfgCBqD7soDlsL
 X/wgo4DN9HAT3rfEldlIp5CVIv+1xyQu9+gM1QwkMk3a/ztcwGpqeHdlkn/JATz3hJAo
 7sF2+79IQDd0Z/0Pq3o3wjflk7Mz0EehgXoxrN+t1p57g9OZ5mQpAmGVBs26Y5y9aBv4
 JXWCHx/IWMNNPeFjEgDFEA4eIBWTgmzShgVujzyyF82WMNfWb97seVl899BAFGsBMEkB
 yyDsgVzHftdDUg/zm3I7ma7pxb4TX6D4CZLs+cwpVOj/dl+WhOJoZsAm954Lgba8SLg4
 rtLg==
X-Gm-Message-State: AOAM5333HWVHY0905YBHmRCISoGSgErwfbVpyOGuLGgIke643Xsz5Jfp
 YBTo8Vk9jP3RPFoTJnoLkXM=
X-Google-Smtp-Source: ABdhPJzdZW1LjSMBcunMTun0V0jqEQJGgdpP+1uUJK5SmYQ6MR8bNwz0NDm+Za4eCy48lbT+riDXDA==
X-Received: by 2002:a05:6402:45:: with SMTP id
 f5mr21793304edu.273.1608670017538; 
 Tue, 22 Dec 2020 12:46:57 -0800 (PST)
Received: from ?IPv6:2003:ea:8f06:5500:dc3c:aa51:b1e8:8e1d?
 (p200300ea8f065500dc3caa51b1e88e1d.dip0.t-ipconnect.de.
 [2003:ea:8f06:5500:dc3c:aa51:b1e8:8e1d])
 by smtp.googlemail.com with ESMTPSA id v18sm29819463edx.30.2020.12.22.12.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 12:46:56 -0800 (PST)
Subject: Re: [Aspeed, v2 2/2] net: ftgmac100: Change the order of getting MAC
 address
To: Hongwei Zhang <hongweiz@ami.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jakub Kicinski <kuba@kernel.org>, David S Miller <davem@davemloft.net>
References: <20201221205157.31501-2-hongweiz@ami.com>
 <20201222201437.5588-3-hongweiz@ami.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <96c355a2-ab7e-3cf0-57e7-16369da78035@gmail.com>
Date: Tue, 22 Dec 2020 21:46:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222201437.5588-3-hongweiz@ami.com>
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

On 22.12.2020 21:14, Hongwei Zhang wrote:
> Dear Reviewer,
> 
> Use native MAC address is preferred over other choices, thus change the order
> of reading MAC address, try to read it from MAC chip first, if it's not
>  availabe, then try to read it from device tree.
> 
> 
> Hi Heiner,
> 
>> From:	Heiner Kallweit <hkallweit1@gmail.com>
>> Sent:	Monday, December 21, 2020 4:37 PM
>>> Change the order of reading MAC address, try to read it from MAC chip 
>>> first, if it's not availabe, then try to read it from device tree.
>>>
>> This commit message leaves a number of questions. It seems the change isn't related at all to the 
>> change that it's supposed to fix.
>>
>> - What is the issue that you're trying to fix?
>> - And what is wrong with the original change?
> 
> There is no bug or something wrong with the original code. This patch is for
> improving the code. We thought if the native MAC address is available, then
> it's preferred over MAC address from dts (assuming both sources are available).
> 
> One possible scenario, a MAC address is set in dts and the BMC image is 
> compiled and loaded into more than one platform, then the platforms will
> have network issue due to the same MAC address they read.
> 

Typically the DTS MAC address is overwritten by the boot loader, e.g. uboot.
And the boot loader can read it from chip registers. There are more drivers
trying to read the MAC address from DTS first. Eventually, I think, the code
here will read the same MAC address from chip registers as uboot did before.

> Thanks for your review, I've update the patch to fix the comments.
>>
>>> Fixes: 35c54922dc97 ("ARM: dts: tacoma: Add reserved memory for 
>>> ramoops")
>>> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
>>> ---
>>>  drivers/net/ethernet/faraday/ftgmac100.c | 22 +++++++++++++---------
>>>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> --Hongwei
> 

