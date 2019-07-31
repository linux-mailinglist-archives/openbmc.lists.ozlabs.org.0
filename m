Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5E7BC8C
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 11:05:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z6vJ4sGZzDqbp
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 19:05:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZjZdMTRi"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z2fs5sm8zDqV1
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 15:53:56 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id 207so59378717wma.1
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 22:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RZKZGhRUKm32qVx6L9wGIUtZwIsOV1pW8pNma7jRm+g=;
 b=ZjZdMTRihTUS5KrNVTrh9HES33YOG4Nv3KPcjebcwbPvdI39SfCVf2FXPiqA+E3nF7
 Sxwoof6JzXR4+zwZzsDf5LVSxujbv0VosEmHGjEL6TtNN5jVG1HpHJDvLKEm8IbXvaBu
 aVtjroOEf1kmLRlkWSYaw7/ETzJaRSvyU2a1hk46vv8VTEzQVTFGOcr3p0WHa4DHRsH8
 Vp9aqQR5lvyg2lpkFzZuFFk5dAwATgM9sRnXM4BKS0vQpcEhve7kOPxaiswBmsuRZoP2
 CKTNv7KRpM4/ZPbZ025DHlgcg04uMp2p1a6eDq1oTZFOabJoA8+KB3LqS4Euf4mzcYdz
 VoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RZKZGhRUKm32qVx6L9wGIUtZwIsOV1pW8pNma7jRm+g=;
 b=DLtGwsA72NUWg3wrhhtIFvrRwGPKetTF5NybCo88VyzyufGAolDCsaBMc/84JX8RIu
 xvBIl10lkbE6moXhORsD0LPEhpGsK2qLd8cTIIQvDXwwMCB6KLgUlNIXXrFDvqkEOx4m
 eLMqIuR1Q8GXLPIFvjDlZtTHeoJEg/PNSUC9lUWcbiAo5gQd7czMZATt7fBqMYEBk+vM
 nhNo9gXR18I/m+Zs0Myt9oElJ7X5IhVwUfypyBzNmb+TY0EUgAAAQeb6V24D1Gz4+1uv
 4Zst/YVqMGx38Gbxqr26sE26FWh0gvfmLm52pRbe+qBA570f3ZU7xX81Vu2ClqenizBP
 KXaA==
X-Gm-Message-State: APjAAAXlr/UKoZBYPppP/tIqwxqE6d5nGquzf1qTbsu7Al6q3bkDWOWu
 qwr10W+1uhFzjpAKNe8z3HfloMvt
X-Google-Smtp-Source: APXvYqy9kIQV6RrRdwgRng1A2y1wC+r61hrtqhs00ZxtlPT2UeZ3mo46NyLIWCayILUtnie1h/MjfQ==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr67887905wmj.133.1564552431983; 
 Tue, 30 Jul 2019 22:53:51 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f43:4200:f423:8074:ec73:3cf8?
 (p200300EA8F434200F4238074EC733CF8.dip0.t-ipconnect.de.
 [2003:ea:8f43:4200:f423:8074:ec73:3cf8])
 by smtp.googlemail.com with ESMTPSA id g19sm76215914wmg.10.2019.07.30.22.53.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 22:53:51 -0700 (PDT)
Subject: Re: [PATCH net-next 1/2] net: phy: broadcom: set features explicitly
 for BCM54616S
To: Tao Ren <taoren@fb.com>, Andrew Lunn <andrew@lunn.ch>
References: <20190730002532.85509-1-taoren@fb.com>
 <20190730033558.GB20628@lunn.ch>
 <aff2728d-5db1-50fd-767c-29b355890323@fb.com>
 <bdfe07d3-66b4-061a-a149-aa2aef94b9b7@gmail.com>
 <f59c2ae9-ef44-1e1b-4ae2-216eb911e92e@fb.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <41c1f898-aee8-d73a-386d-c3ce280c5a1b@gmail.com>
Date: Wed, 31 Jul 2019 07:53:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f59c2ae9-ef44-1e1b-4ae2-216eb911e92e@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 31 Jul 2019 19:03:00 +1000
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Justin Chen <justinpopo6@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 31.07.2019 02:12, Tao Ren wrote:
> On 7/29/19 11:00 PM, Heiner Kallweit wrote:
>> On 30.07.2019 07:05, Tao Ren wrote:
>>> On 7/29/19 8:35 PM, Andrew Lunn wrote:
>>>> On Mon, Jul 29, 2019 at 05:25:32PM -0700, Tao Ren wrote:
>>>>> BCM54616S feature "PHY_GBIT_FEATURES" was removed by commit dcdecdcfe1fc
>>>>> ("net: phy: switch drivers to use dynamic feature detection"). As dynamic
>>>>> feature detection doesn't work when BCM54616S is working in RGMII-Fiber
>>>>> mode (different sets of MII Control/Status registers being used), let's
>>>>> set "PHY_GBIT_FEATURES" for BCM54616S explicitly.
>>>>
>>>> Hi Tao
>>>>
>>>> What exactly does it get wrong?
>>>>
>>>>      Thanks
>>>> 	Andrew
>>>
>>> Hi Andrew,
>>>
>>> BCM54616S is set to RGMII-Fiber (1000Base-X) mode on my platform, and none of the features (1000BaseT/100BaseT/10BaseT) can be detected by genphy_read_abilities(), because the PHY only reports 1000BaseX_Full|Half ability in this mode.
>>>
>> Are you going to use the PHY in copper or fibre mode?
>> In case you use fibre mode, why do you need the copper modes set as supported?
>> Or does the PHY just start in fibre mode and you want to switch it to copper mode?
> 
> Hi Heiner,
> 
> The phy starts in fiber mode and that's the mode I want.
> My observation is: phydev->link is always 0 (Link status bit is never set in MII_BMSR) by using dynamic ability detection on my machine. I checked phydev->supported and it's set to "AutoNeg | TP | MII | Pause | Asym_Pause" by dynamic ability detection. Is it normal/expected? Or maybe the fix should go to different places? Thank you for your help.
> 

Not sure whether you stated already which kernel version you're using.
There's a brand-new extension to auto-detect 1000BaseX:
f30e33bcdab9 ("net: phy: Add more 1000BaseX support detection")
It's included in the 5.3-rc series.

If a feature can be read from a vendor-specific register only,
then the preferred way is: Implement callback get_features in
the PHY driver, call genphy_read_abilities for the basic features
and complement it with reading the vendor-specific register(s).

> 
> Thanks,
> 
> Tao
> 
Heiner
