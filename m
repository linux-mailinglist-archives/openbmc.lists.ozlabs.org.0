Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C149080A08
	for <lists+openbmc@lfdr.de>; Sun,  4 Aug 2019 10:41:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461ZBG2WPlzDqhF
	for <lists+openbmc@lfdr.de>; Sun,  4 Aug 2019 18:41:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lyNBhwGX"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461Z9Y1HpyzDqd0
 for <openbmc@lists.ozlabs.org>; Sun,  4 Aug 2019 18:40:46 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id p13so6793731wru.10
 for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2019 01:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jHyKGF97oHLx8vmo+i9ilQ31BEkYlwMC/EOcdvIhgqE=;
 b=lyNBhwGX5ZVs5N1BzYhR5twQUujSfeUmpa3GT3UkR6qqvj1K6bs6A73sPMrbEdvqtJ
 zzdl5BCbieNZOFM5ygUemTkC95MVTIlId3hfBDZEuaCZSt13Rmn00kg+nXLyxPx37hjE
 cPY6fy6oYr32L6CWic8KzbbC7KyS7QQmnytJICt/tml5O9yjXN6ehNd3xAPR2KdZclP+
 BnBAa8QvDPlzCSHHOYHRZrEnN7lCqRHAz4S7HaKNcOwoNzFQyah9zNPL/I1s5GnzWGXu
 JFWwYORk2NPxYjvTPP8DEke97JyhEp5YQgi5wyyMbJbkCECpdv5ac2lPfqn8p7fibzkW
 bSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jHyKGF97oHLx8vmo+i9ilQ31BEkYlwMC/EOcdvIhgqE=;
 b=goX8pe7N0kGEic0wXouzbnVgxDRVfLpxTLXHoYbCSU3WNqNlYS66jh7m29MQg4QG+i
 I2eNz+gntxYsOjEoWq4GvDU3kgkggua7bIFRR5WejdVtjBZZOGjaos2rG/1pqIFMkkgS
 TbUd2g1V0AS33nCx8eGWk/PF4L7wfgAn8x+Zis7Lz7BYjiD9ER/6QzBbOH7x30OBeHtl
 xhsBS5bQIGGPigpk+Gmiqjz1dwFUQPNpywuOApy2WpSBEH09gBukmrP+yx2Asju7oiQp
 Fha60lha+SPngXSV0cQ4UM/QK/euf4spWjrPJoQZlNO99PbxTpqru9eT19Hd7p+O3qlm
 Y/wQ==
X-Gm-Message-State: APjAAAW5hRdHCfW5WQ+bnydpb0p0ncKV/XDpBW/W79wI9yaD9M2wF5U/
 owPgmfp9TQOTizp7GcU/fNhtXvx7
X-Google-Smtp-Source: APXvYqxSpGppNunbyzWK5brcrf+R0WbZ6FVxWzIhSdZvwM7dj6yTTDJiQs1yMkZW3ZKA1He0pg8ZWA==
X-Received: by 2002:adf:b195:: with SMTP id q21mr11938356wra.2.1564908039280; 
 Sun, 04 Aug 2019 01:40:39 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f28:9900:d80f:58c5:990d:c59b?
 (p200300EA8F289900D80F58C5990DC59B.dip0.t-ipconnect.de.
 [2003:ea:8f28:9900:d80f:58c5:990d:c59b])
 by smtp.googlemail.com with ESMTPSA id o20sm213884416wrh.8.2019.08.04.01.40.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2019 01:40:38 -0700 (PDT)
Subject: Re: [PATCH net-next 1/2] net: phy: broadcom: set features explicitly
 for BCM54616S
To: Tao Ren <taoren@fb.com>, Andrew Lunn <andrew@lunn.ch>
References: <20190730002532.85509-1-taoren@fb.com>
 <20190730033558.GB20628@lunn.ch>
 <aff2728d-5db1-50fd-767c-29b355890323@fb.com>
 <bdfe07d3-66b4-061a-a149-aa2aef94b9b7@gmail.com>
 <f59c2ae9-ef44-1e1b-4ae2-216eb911e92e@fb.com>
 <41c1f898-aee8-d73a-386d-c3ce280c5a1b@gmail.com>
 <fd179662-b9f9-4813-b9b5-91dbd796596e@fb.com>
 <88f4d709-d9bb-943c-37a9-aeebe8ca0ebc@fb.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <e4eb6ef6-5536-612e-49c8-d144fc8eb386@gmail.com>
Date: Sun, 4 Aug 2019 10:40:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <88f4d709-d9bb-943c-37a9-aeebe8ca0ebc@fb.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Justin Chen <justinpopo6@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 01.08.2019 07:20, Tao Ren wrote:
> On 7/30/19 11:00 PM, Tao Ren wrote:
>> On 7/30/19 10:53 PM, Heiner Kallweit wrote:
>>> On 31.07.2019 02:12, Tao Ren wrote:
>>>> On 7/29/19 11:00 PM, Heiner Kallweit wrote:
>>>>> On 30.07.2019 07:05, Tao Ren wrote:
>>>>>> On 7/29/19 8:35 PM, Andrew Lunn wrote:
>>>>>>> On Mon, Jul 29, 2019 at 05:25:32PM -0700, Tao Ren wrote:
>>>>>>>> BCM54616S feature "PHY_GBIT_FEATURES" was removed by commit dcdecdcfe1fc
>>>>>>>> ("net: phy: switch drivers to use dynamic feature detection"). As dynamic
>>>>>>>> feature detection doesn't work when BCM54616S is working in RGMII-Fiber
>>>>>>>> mode (different sets of MII Control/Status registers being used), let's
>>>>>>>> set "PHY_GBIT_FEATURES" for BCM54616S explicitly.
>>>>>>>
>>>>>>> Hi Tao
>>>>>>>
>>>>>>> What exactly does it get wrong?
>>>>>>>
>>>>>>>      Thanks
>>>>>>> 	Andrew
>>>>>>
>>>>>> Hi Andrew,
>>>>>>
>>>>>> BCM54616S is set to RGMII-Fiber (1000Base-X) mode on my platform, and none of the features (1000BaseT/100BaseT/10BaseT) can be detected by genphy_read_abilities(), because the PHY only reports 1000BaseX_Full|Half ability in this mode.
>>>>>>
>>>>> Are you going to use the PHY in copper or fibre mode?
>>>>> In case you use fibre mode, why do you need the copper modes set as supported?
>>>>> Or does the PHY just start in fibre mode and you want to switch it to copper mode?
>>>>
>>>> Hi Heiner,
>>>>
>>>> The phy starts in fiber mode and that's the mode I want.
>>>> My observation is: phydev->link is always 0 (Link status bit is never set in MII_BMSR) by using dynamic ability detection on my machine. I checked phydev->supported and it's set to "AutoNeg | TP | MII | Pause | Asym_Pause" by dynamic ability detection. Is it normal/expected? Or maybe the fix should go to different places? Thank you for your help.
>>>>
>>>
>>> Not sure whether you stated already which kernel version you're using.
>>> There's a brand-new extension to auto-detect 1000BaseX:
>>> f30e33bcdab9 ("net: phy: Add more 1000BaseX support detection")
>>> It's included in the 5.3-rc series.
>>
>> I'm running kernel 5.2.0. Thank you for the sharing and I didn't know the patch. Let me check it out.
> 
> I applied above patch and ca72efb6bdc7 ("net: phy: Add detection of 1000BaseX link mode support") to my 5.2.0 tree but got following warning when booting up my machine:
> 
> "PHY advertising (0,00000200,000062c0) more modes than genphy supports, some modes not advertised".
> 
It's genphy_config_advert complaining which is called from genphy_config_aneg.
genphy_config_aneg deals with the standard Base-T modes. Therefore in your case
most likely you want to provide an own config_aneg callback (in case autoneg
is applicable at all).

> The BCM54616S PHY on my machine only reports 1000-X features in RGMII->1000Base-KX mode. Is it a known problem?
> 
> Anyways let me see if I missed some dependency/follow-up patches..
> 
> 
> Cheers,
> 
> Tao
> 

Heiner
