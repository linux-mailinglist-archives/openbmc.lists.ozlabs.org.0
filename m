Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95782644
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 22:46:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462VCy1YHNzDqRP
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 06:46:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ha1kccmI"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462VBy50h4zDqMM
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 06:45:14 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id g67so70170574wme.1
 for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2019 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EgXdDmP0k1tqZgycySCKwplOmPJButNgffG4bh/ytLc=;
 b=ha1kccmItNUXTZwqjy+EwRU64TDB9oBQA9lqPCxHRWhGnbl2am4RRvu6HVyG4PEMgF
 ZhKW4zk4HMPmntg65C72XwyX8l1vH4iSYZpLoI0l5UQePQ124Hr/zbZjfT5ogAiISyGt
 9pVeNOSfNqC0qSaQorruFF8NoNxQuXalzCMaB6yAB0GulpDCkyE0TY/nsSHLZ/42IjZ1
 Jckfd6hLdnBNduvSMNkKB+HbeuHvZexGIX0MSgsSwEoyI+mL/nD2UwUqVqJeJOq0kbJW
 P/UBJ1okrlFn6yatswf5Bq+9SmyUeA8AzargfX01roOcmTP60pgADr3AstJavSE77hLA
 f30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EgXdDmP0k1tqZgycySCKwplOmPJButNgffG4bh/ytLc=;
 b=BynS+LCsdGyAzGcNxSnx2EV7Ac102Ek512caQT+MYj2e+Utf+4zIRSjCvVBF9SNcmU
 EzaIQ0gRJ/YJEiKAaiHgGmmPT+kC1kon2pkozLHmY8rOGP5tdYW4eOOPV3ynubY7D17P
 ASuAHPZDHfvuv+i4lLvaWIfZIvtSEsG3HwkDjtFrvJ8sG5KfiPs2mC3MvUQlc18UTIgy
 RbVEtEj+naNQwwImJaYj+d+BNnCjknUTSwQ3xwleXhqqUr2px6qPNrc8tQnCeBXM64us
 rnBOYHIWH64yVce6W2O3e89zrGITyGH+scnEjvYepFCIKnI45IsK2W9PkqFOWYPyIM4j
 cYZw==
X-Gm-Message-State: APjAAAUUEB9yMoo6EQX9kDwoeKGD7mbSX0I3PmII8T4IN5d2Kh54ZMRW
 lsZedGD6H/a51MbAYQ8I8iHQxH8s
X-Google-Smtp-Source: APXvYqykjkECVeegO7PV5zTexDEVC6PLGPDdBeHJMAo2IUPpo2e8tQlEZ96KnKyTBJIQ3fGN2SscRw==
X-Received: by 2002:a1c:7e90:: with SMTP id z138mr168152wmc.128.1565037909695; 
 Mon, 05 Aug 2019 13:45:09 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f05:8600:d16c:62d1:98de:d1e5?
 (p200300EA8F058600D16C62D198DED1E5.dip0.t-ipconnect.de.
 [2003:ea:8f05:8600:d16c:62d1:98de:d1e5])
 by smtp.googlemail.com with ESMTPSA id n3sm77342100wrt.31.2019.08.05.13.45.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 13:45:09 -0700 (PDT)
Subject: Re: [PATCH net-next v3] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
To: Vladimir Oltean <olteanv@gmail.com>
References: <20190802215419.313512-1-taoren@fb.com>
 <CA+h21hrOEape89MTqCUyGFt=f6ba7Q-2KcOsN_Vw2Qv8iq86jw@mail.gmail.com>
 <53e18a01-3d08-3023-374f-2c712c4ee9ea@fb.com> <20190804145152.GA6800@lunn.ch>
 <CA+h21hrUDaSxKpsy9TuWqwgaxKYaoXHyhgS=xSoAcPwxXzvrHg@mail.gmail.com>
 <f8de2514-081a-0e6e-fbe2-bcafcd459646@gmail.com>
 <CA+h21hov3WzqYSUcxOnH0DOMO2dYdh_Q30Q_GQJpxa4nFM7MsQ@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <291a3c6e-ca8f-a9b8-a0b8-735a68dc04ea@gmail.com>
Date: Mon, 5 Aug 2019 22:45:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+h21hov3WzqYSUcxOnH0DOMO2dYdh_Q30Q_GQJpxa4nFM7MsQ@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Tao Ren <taoren@fb.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 lkml <linux-kernel@vger.kernel.org>, Justin Chen <justinpopo6@gmail.com>,
 netdev <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04.08.2019 21:22, Vladimir Oltean wrote:
> On Sun, 4 Aug 2019 at 19:07, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 04.08.2019 17:59, Vladimir Oltean wrote:
>>> On Sun, 4 Aug 2019 at 17:52, Andrew Lunn <andrew@lunn.ch> wrote:
>>>>
>>>>>> The patchset looks better now. But is it ok, I wonder, to keep
>>>>>> PHY_BCM_FLAGS_MODE_1000BX in phydev->dev_flags, considering that
>>>>>> phy_attach_direct is overwriting it?
>>>>>
>>>>
>>>>> I checked ftgmac100 driver (used on my machine) and it calls
>>>>> phy_connect_direct which passes phydev->dev_flags when calling
>>>>> phy_attach_direct: that explains why the flag is not cleared in my
>>>>> case.
>>>>
>>>> Yes, that is the way it is intended to be used. The MAC driver can
>>>> pass flags to the PHY. It is a fragile API, since the MAC needs to
>>>> know what PHY is being used, since the flags are driver specific.
>>>>
>>>> One option would be to modify the assignment in phy_attach_direct() to
>>>> OR in the flags passed to it with flags which are already in
>>>> phydev->dev_flags.
>>>>
>>>>         Andrew
>>>
>>> Even if that were the case (patching phy_attach_direct to apply a
>>> logical-or to dev_flags), it sounds fishy to me that the genphy code
>>> is unable to determine that this PHY is running in 1000Base-X mode.
>>>
>>> In my opinion it all boils down to this warning:
>>>
>>> "PHY advertising (0,00000200,000062c0) more modes than genphy
>>> supports, some modes not advertised".
>>>
>> The genphy code deals with Clause 22 + Gigabit BaseT only.
>> Question is whether you want aneg at all in 1000Base-X mode and
>> what you want the config_aneg callback to do.
>> There may be some inspiration in the Marvel PHY drivers.
>>
> 
> AN for 1000Base-X still gives you duplex and pause frame settings. I
> thought the base page format for exchanging that info is standardized
> in clause 37.
> Does genphy cover only copper media by design, or is it desirable to
> augment genphy_read_status?
> 
So far we care about copper only in phylib. Some constants needed for
Clause 37 support are defined, but used by few drivers only.

ADVERTISE_1000XHALF
ADVERTISE_1000XFULL
ADVERTISE_1000XPAUSE
ADVERTISE_1000XPSE_ASYM

I think it would make sense to have something like genphy_c37_config_aneg.
Similar for read_status.

>>> You see, the 0x200 in the above advertising mask corresponds exactly
>>> to this definition from ethtool.h:
>>>     ETHTOOL_LINK_MODE_1000baseX_Full_BIT    = 41,
>>>
>>> But it gets truncated and hence lost.
>>>
>>> Regards,
>>> -Vladimir
>>>
>> Heiner
> 
Heiner
