Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC180C2B
	for <lists+openbmc@lfdr.de>; Sun,  4 Aug 2019 21:22:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461rQS4GM7zDqY3
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 05:22:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gPsfzmbW"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461rPg2Mb6zDqW8
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 05:22:15 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id x19so70830392eda.12
 for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2019 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pj0ikRyiM2M9/CD5d5FXd58Pei1+6t41sEsA8s09Pcw=;
 b=gPsfzmbWFNebo/r/tjyKdRsMpRqU7/GEJfVm12iwmr3CNve3wsyxGbCCPz/l4auW7j
 JPHC/iGCWCazjhXUo/D9KqaSGNBR1FDgiuaMKXJ7csIm6LSP9oPszFw2+rn5MwDyTxes
 8RkOp2C3q/x1XIognnm732OGX1WYSZVsDKzM0Ct+yCeSh5C79g8D/sS5rphnKHMvFmkx
 LTZkHNeAr3L62qSi4W6sgffugyxMDLgSu1QnB4jR6VZsLDcA4i1j82xcpWm8Yswl5T6P
 khPBEn4QQNyuy+ZXFDUDoarTya3UGTurgdSA6k/salgjZ7FMA22rOKhSfc1U8YbQ90ib
 GvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pj0ikRyiM2M9/CD5d5FXd58Pei1+6t41sEsA8s09Pcw=;
 b=gF9S78bdualGnKpBT+iyzpwpHnDRAvVLUSDkBi2OTcPD9v4w/GzWyw5fv3wetPmm1C
 hkQbSoFfLRKlTjMC5yyg+sxA3NszkonLSkoevanu+XKqc1iQmgjZ7Eq4b6ZNvWPYkJg9
 jCJUE9itE3S2VCxWhnHClyo0qFKEOfyzbisgkd4iqzwwnOXAmdltiV9pxsi1LIAY8PLD
 +UMBXQ0QGLYznNTwZRcseuuQIJj2TC243yXwiRa0zkqhkatnFziQW6ilRrhkrJu0Q6ex
 MtNAqYtprZPKjne1Vj5DAQcP2cZNC98B/Nm/lLrS0rC7SzdE4ctJEvN34iwLW0sX0lmq
 DZIg==
X-Gm-Message-State: APjAAAVsVMGiquH6xVy74oiuwXfVsX02GciqA5jshWTGhCFciPjCywA3
 A5dleYyhdkYhfthLDOjD/Ze3bLncBWIfB2pD3aM=
X-Google-Smtp-Source: APXvYqySJFhDQZLNHXF8JQtrbX7ltOk9v6vkJxguWkKjYjXZq6sNO150ER/Wv1dGCfkPRz29WtcXiXs6SnoLaT60K5s=
X-Received: by 2002:a17:906:19d3:: with SMTP id
 h19mr13839881ejd.300.1564946532348; 
 Sun, 04 Aug 2019 12:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190802215419.313512-1-taoren@fb.com>
 <CA+h21hrOEape89MTqCUyGFt=f6ba7Q-2KcOsN_Vw2Qv8iq86jw@mail.gmail.com>
 <53e18a01-3d08-3023-374f-2c712c4ee9ea@fb.com> <20190804145152.GA6800@lunn.ch>
 <CA+h21hrUDaSxKpsy9TuWqwgaxKYaoXHyhgS=xSoAcPwxXzvrHg@mail.gmail.com>
 <f8de2514-081a-0e6e-fbe2-bcafcd459646@gmail.com>
In-Reply-To: <f8de2514-081a-0e6e-fbe2-bcafcd459646@gmail.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Sun, 4 Aug 2019 22:22:01 +0300
Message-ID: <CA+h21hov3WzqYSUcxOnH0DOMO2dYdh_Q30Q_GQJpxa4nFM7MsQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
To: Heiner Kallweit <hkallweit1@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Tao Ren <taoren@fb.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 lkml <linux-kernel@vger.kernel.org>, Justin Chen <justinpopo6@gmail.com>,
 netdev <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 4 Aug 2019 at 19:07, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 04.08.2019 17:59, Vladimir Oltean wrote:
> > On Sun, 4 Aug 2019 at 17:52, Andrew Lunn <andrew@lunn.ch> wrote:
> >>
> >>>> The patchset looks better now. But is it ok, I wonder, to keep
> >>>> PHY_BCM_FLAGS_MODE_1000BX in phydev->dev_flags, considering that
> >>>> phy_attach_direct is overwriting it?
> >>>
> >>
> >>> I checked ftgmac100 driver (used on my machine) and it calls
> >>> phy_connect_direct which passes phydev->dev_flags when calling
> >>> phy_attach_direct: that explains why the flag is not cleared in my
> >>> case.
> >>
> >> Yes, that is the way it is intended to be used. The MAC driver can
> >> pass flags to the PHY. It is a fragile API, since the MAC needs to
> >> know what PHY is being used, since the flags are driver specific.
> >>
> >> One option would be to modify the assignment in phy_attach_direct() to
> >> OR in the flags passed to it with flags which are already in
> >> phydev->dev_flags.
> >>
> >>         Andrew
> >
> > Even if that were the case (patching phy_attach_direct to apply a
> > logical-or to dev_flags), it sounds fishy to me that the genphy code
> > is unable to determine that this PHY is running in 1000Base-X mode.
> >
> > In my opinion it all boils down to this warning:
> >
> > "PHY advertising (0,00000200,000062c0) more modes than genphy
> > supports, some modes not advertised".
> >
> The genphy code deals with Clause 22 + Gigabit BaseT only.
> Question is whether you want aneg at all in 1000Base-X mode and
> what you want the config_aneg callback to do.
> There may be some inspiration in the Marvel PHY drivers.
>

AN for 1000Base-X still gives you duplex and pause frame settings. I
thought the base page format for exchanging that info is standardized
in clause 37.
Does genphy cover only copper media by design, or is it desirable to
augment genphy_read_status?

> > You see, the 0x200 in the above advertising mask corresponds exactly
> > to this definition from ethtool.h:
> >     ETHTOOL_LINK_MODE_1000baseX_Full_BIT    = 41,
> >
> > But it gets truncated and hence lost.
> >
> > Regards,
> > -Vladimir
> >
> Heiner
