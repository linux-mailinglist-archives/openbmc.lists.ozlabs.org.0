Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DDE80B91
	for <lists+openbmc@lfdr.de>; Sun,  4 Aug 2019 18:00:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461lxB6ZTzzDqdn
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 02:00:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XDlk/958"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461lwL4q88zDqTl
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 02:00:01 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id s49so41710383edb.1
 for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2019 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LKEPVn9o+LbP/zEqacWA6Cm2RJzPdDZCIdvvzhFGTHI=;
 b=XDlk/958/bFLgKwtLuUmlqrc2kYHa79lwZh5zp/TvNdQbm9qZyuZxhyyTtJXKQROpt
 1RQACh8Xpa91K8TBhY0VOmaVR2TUi/L5DXKUSQXjMQcibulz7uzushV/zWym2AcqFj6u
 b5a50kYjAVcIyrLKoSRyedDF7FDlcj31bUHWNZ7unS/WgP+daql5V/Fj2bJPKUjni4Sp
 u5kZCLoYtzn7MSmD3I5AQfJkK9mw3eVvxJ+aDgD4+QynRAUMyt/la/NDev8Y9maqAN3U
 Zi9i4ieF+GxzX2uIwZkN7XacqV5hQZuRBVuqu6SK4Bd2gTfwPOwA+RvLA/36N57/nU2j
 eggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKEPVn9o+LbP/zEqacWA6Cm2RJzPdDZCIdvvzhFGTHI=;
 b=N88oFGpL/e6V5XvtmO3TApVsogq/vHFz/awnQKgEd3PZwNRtaWR2EOD1Wjrevwka/G
 vppccWE30hVGppmaFw+RryMPjeSNT1XCqtH2/4ilBx+K5uuNKvSgXWX2VVN0UwH7YVW/
 6p/lqGtwb+62zOajsGS9k1Kg/NZjSvYcacN40ph07jIBBiBMmYhC+5/CcETLlRXrGXbj
 HTbV9pk8eFv/8drgzk7oBPv4hhn+9IQIvX5PcrWpsrcg65/3LW9HSIYJp6nfNRwXrmuw
 77Pk58QuBbTnseJY7OE03iKvVzOs73tV6R0HW2azsmexNSLFbTXpB2i84gjFY3+1Zcuz
 VHGA==
X-Gm-Message-State: APjAAAX6eYlqG8FJG9I3AEo2G1C7zLKgTBiv9g7jlN5pImBKv0++Xr9h
 MDB+9A/oDj9kOn76IckXrlqM227o9XQM2fWabyw=
X-Google-Smtp-Source: APXvYqwreSvMloqehil39KDrhBN9AS+72g3Fz7y8sj6sX+5ARUrwWyOmiRFQReqPP4rDwtFjwHcDG5plDPzyti8rAKs=
X-Received: by 2002:a05:6402:1285:: with SMTP id
 w5mr130982149edv.36.1564934395692; 
 Sun, 04 Aug 2019 08:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190802215419.313512-1-taoren@fb.com>
 <CA+h21hrOEape89MTqCUyGFt=f6ba7Q-2KcOsN_Vw2Qv8iq86jw@mail.gmail.com>
 <53e18a01-3d08-3023-374f-2c712c4ee9ea@fb.com> <20190804145152.GA6800@lunn.ch>
In-Reply-To: <20190804145152.GA6800@lunn.ch>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Sun, 4 Aug 2019 18:59:44 +0300
Message-ID: <CA+h21hrUDaSxKpsy9TuWqwgaxKYaoXHyhgS=xSoAcPwxXzvrHg@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
To: Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
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
 netdev <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 4 Aug 2019 at 17:52, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > The patchset looks better now. But is it ok, I wonder, to keep
> > > PHY_BCM_FLAGS_MODE_1000BX in phydev->dev_flags, considering that
> > > phy_attach_direct is overwriting it?
> >
>
> > I checked ftgmac100 driver (used on my machine) and it calls
> > phy_connect_direct which passes phydev->dev_flags when calling
> > phy_attach_direct: that explains why the flag is not cleared in my
> > case.
>
> Yes, that is the way it is intended to be used. The MAC driver can
> pass flags to the PHY. It is a fragile API, since the MAC needs to
> know what PHY is being used, since the flags are driver specific.
>
> One option would be to modify the assignment in phy_attach_direct() to
> OR in the flags passed to it with flags which are already in
> phydev->dev_flags.
>
>         Andrew

Even if that were the case (patching phy_attach_direct to apply a
logical-or to dev_flags), it sounds fishy to me that the genphy code
is unable to determine that this PHY is running in 1000Base-X mode.

In my opinion it all boils down to this warning:

"PHY advertising (0,00000200,000062c0) more modes than genphy
supports, some modes not advertised".

You see, the 0x200 in the above advertising mask corresponds exactly
to this definition from ethtool.h:
    ETHTOOL_LINK_MODE_1000baseX_Full_BIT    = 41,

But it gets truncated and hence lost.

Regards,
-Vladimir
