Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B846180B9A
	for <lists+openbmc@lfdr.de>; Sun,  4 Aug 2019 18:07:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461m5C2f2pzDqYL
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 02:07:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=hkallweit1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F4a5J3Ck"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461m4b18C4zDqTl
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 02:07:10 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id 31so82004384wrm.1
 for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2019 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jt0SLAU5Fp8gNQ2ASv10+ox91avJ4X0iIVC5PETCfcM=;
 b=F4a5J3CkTLTlUeJ7ZSjRRWlRm3xfNF62p7kg9fcLJPjINSNsMUCaSd6LfRfN9FKlUr
 Du646eJUBxkhWz+BgJNqflVKzlA/amZcWhy5z2fzveonn8Bmb9Aahb20ruB07Miwb4d8
 6ltckFtmN+nf5N8lZqbJa27J1zTPzE1+yn5MB8M86HrmdHTIQALwSJ7twmMEAJzUau74
 aht9WlP13jONznd2Rf5TXVyPS330ioedLTjTcgUdo+9Bo75aOzTqqknW4FQJgk39Qu/s
 lHMhUMUH+YQtAUquK7Xmjit78G729SDIDLaBpsOaiYGaJO4K9eSMReLLS4GzEKNqKRbF
 7JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jt0SLAU5Fp8gNQ2ASv10+ox91avJ4X0iIVC5PETCfcM=;
 b=C+5RqdU3gxr/JwFTwGsiizGRQEfmznDZ4nxhredGN3KlNTOxUlDdPAzGtnwoltaCDR
 2h9/l5M0NRFg8M2JASQ7ybwKzLr0ruKeBd3NmRqKf3TQiNXirImgoSlOdyFYV5RknptC
 e78rCaIi0U86YuLmYTc4tGdlG+j8Wuh1M/1glthFOcFSnoO5dN7qBkVMQmj+vyDB2v0t
 zySGLyTiTA6LLqBdqoWQtvd9Gb9GmGwLvw2ygxST83Ptg9nSjXRr+v+G+zKflfBeqSFP
 A2PIemR4k/wFaQlWejtOhBR6lO7pWixieCr9GhhB0gTzmXOBX8KiBTtZl5O5QMQlqPec
 28YA==
X-Gm-Message-State: APjAAAVfYWXAdfNePup2TpaCiMeHO0xT/w/0Fc33485yxkWb7mJVVxaq
 /4qGBF1aPs37LJgDnDwNUucw4Vma
X-Google-Smtp-Source: APXvYqyH8GACPxbDrF5MNtZvmWC4XkSICwVCQZbHjd5eRZG/orYvKyQa7Tsq83S/QbCS/8hgGcOY0A==
X-Received: by 2002:a05:6000:118a:: with SMTP id
 g10mr40693555wrx.175.1564934825862; 
 Sun, 04 Aug 2019 09:07:05 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f28:9900:a1a9:917d:36ea:d474?
 (p200300EA8F289900A1A9917D36EAD474.dip0.t-ipconnect.de.
 [2003:ea:8f28:9900:a1a9:917d:36ea:d474])
 by smtp.googlemail.com with ESMTPSA id l2sm55537066wmj.4.2019.08.04.09.07.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2019 09:07:05 -0700 (PDT)
Subject: Re: [PATCH net-next v3] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
To: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>
References: <20190802215419.313512-1-taoren@fb.com>
 <CA+h21hrOEape89MTqCUyGFt=f6ba7Q-2KcOsN_Vw2Qv8iq86jw@mail.gmail.com>
 <53e18a01-3d08-3023-374f-2c712c4ee9ea@fb.com> <20190804145152.GA6800@lunn.ch>
 <CA+h21hrUDaSxKpsy9TuWqwgaxKYaoXHyhgS=xSoAcPwxXzvrHg@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <f8de2514-081a-0e6e-fbe2-bcafcd459646@gmail.com>
Date: Sun, 4 Aug 2019 18:06:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+h21hrUDaSxKpsy9TuWqwgaxKYaoXHyhgS=xSoAcPwxXzvrHg@mail.gmail.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Tao Ren <taoren@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 lkml <linux-kernel@vger.kernel.org>, Justin Chen <justinpopo6@gmail.com>,
 netdev <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04.08.2019 17:59, Vladimir Oltean wrote:
> On Sun, 4 Aug 2019 at 17:52, Andrew Lunn <andrew@lunn.ch> wrote:
>>
>>>> The patchset looks better now. But is it ok, I wonder, to keep
>>>> PHY_BCM_FLAGS_MODE_1000BX in phydev->dev_flags, considering that
>>>> phy_attach_direct is overwriting it?
>>>
>>
>>> I checked ftgmac100 driver (used on my machine) and it calls
>>> phy_connect_direct which passes phydev->dev_flags when calling
>>> phy_attach_direct: that explains why the flag is not cleared in my
>>> case.
>>
>> Yes, that is the way it is intended to be used. The MAC driver can
>> pass flags to the PHY. It is a fragile API, since the MAC needs to
>> know what PHY is being used, since the flags are driver specific.
>>
>> One option would be to modify the assignment in phy_attach_direct() to
>> OR in the flags passed to it with flags which are already in
>> phydev->dev_flags.
>>
>>         Andrew
> 
> Even if that were the case (patching phy_attach_direct to apply a
> logical-or to dev_flags), it sounds fishy to me that the genphy code
> is unable to determine that this PHY is running in 1000Base-X mode.
> 
> In my opinion it all boils down to this warning:
> 
> "PHY advertising (0,00000200,000062c0) more modes than genphy
> supports, some modes not advertised".
> 
The genphy code deals with Clause 22 + Gigabit BaseT only.
Question is whether you want aneg at all in 1000Base-X mode and
what you want the config_aneg callback to do.
There may be some inspiration in the Marvel PHY drivers.

> You see, the 0x200 in the above advertising mask corresponds exactly
> to this definition from ethtool.h:
>     ETHTOOL_LINK_MODE_1000baseX_Full_BIT    = 41,
> 
> But it gets truncated and hence lost.
> 
> Regards,
> -Vladimir
> 
Heiner
