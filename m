Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D127AF6B3
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 01:22:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Nc1pzZmu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwG4c6ZCPz3cDT
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 09:22:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Nc1pzZmu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwG3w4hmmz300f;
	Wed, 27 Sep 2023 09:22:20 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-175-231.adl-adc-lon-bras34.tpg.internode.on.net [118.210.175.231])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6B2562017B;
	Wed, 27 Sep 2023 07:22:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1695770536;
	bh=3xy3oYvGG7Rgvu7rXIPqMIaHFUEefO32BL/5JeivFsM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Nc1pzZmuL8BIfPa9WmVMAMK3q2oPyV6epmFy5ihSOS5smQ+L7+AvhVpWriHV8/ZLh
	 uwSAqCUSfyLQ0xjfIj+vnu82oGAWij+2M3B2+zL1W/seZW/cqQHT6ST4I1+8hPC4XX
	 Mdh6X04rt5eSwtTilUak5akhIQdszckz7bT2nTcbGco+CTlM1GBDShPol1EvR0ujCT
	 tQY6fR69A9K80khCkl/Sl/e02bi+59zFMnyMllUCSmiNtqNSPEiNicMBTjSPerc4Xa
	 erf4KHlO8DG2rj61hMoz2nnTmU3GdAci354zUOMDSndkpfgRveeh5GE7MUA2FWxBsd
	 I3MhVR3d7j5tg==
Message-ID: <7a7d5a7f19fc793f157508fec7fbc09ca8c4cc4b.camel@codeconstruct.com.au>
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Sep 2023 08:52:09 +0930
In-Reply-To: <CAPDyKFrFxYxSTa=z2VnCk4m_d-wEgd17wBokzyNCCRLtSUnFKw@mail.gmail.com>
References: <20230925030647.40283-1-andrew@codeconstruct.com.au>
	 <CAPDyKFrFxYxSTa=z2VnCk4m_d-wEgd17wBokzyNCCRLtSUnFKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2023-09-26 at 17:03 +0200, Ulf Hansson wrote:
> On Mon, 25 Sept 2023 at 05:07, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > I've changed employers, have company email that deals with patch-based
> > workflows without too much of a headache, and am trying to steer some
> > content out of my personal mail.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
> I guess it doesn't really matter what tree this gets funneled through,
> so I decided to pick this up via my mmc tree.
>=20
> So, applied for next, thanks!

Ah, thanks for being so prompt! However, Joel has sent a PR to Arnd
with the patch:

https://lore.kernel.org/all/CACPK8Xc+D=3DYBc2Dhk-6-gOuvKN0xGgZYNop6oJVa=3DV=
NgaEYOHw@mail.gmail.com/

I thought I'd left a note under the fold asking Joel to do that so
people knew how it would get into the tree, but that clearly isn't the
case. Sorry about that, I must have rolled the patch off again after I
put the note into the original.

Andrew

>=20
> Kind regards
> Uffe
>=20
>=20
> > ---
> >  MAINTAINERS | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b19995690904..1965cee433b0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1963,7 +1963,7 @@ F:        drivers/irqchip/irq-aspeed-i2c-ic.c
> >=20
> >  ARM/ASPEED MACHINE SUPPORT
> >  M:     Joel Stanley <joel@jms.id.au>
> > -R:     Andrew Jeffery <andrew@aj.id.au>
> > +R:     Andrew Jeffery <andrew@codeconstruct.com.au>
> >  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscri=
bers)
> >  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> >  S:     Supported
> > @@ -3058,7 +3058,7 @@ F:        Documentation/devicetree/bindings/peci/=
peci-aspeed.yaml
> >  F:     drivers/peci/controller/peci-aspeed.c
> >=20
> >  ASPEED PINCTRL DRIVERS
> > -M:     Andrew Jeffery <andrew@aj.id.au>
> > +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
> >  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> >  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
> >  L:     linux-gpio@vger.kernel.org
> > @@ -3075,7 +3075,7 @@ F:        drivers/irqchip/irq-aspeed-scu-ic.c
> >  F:     include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
> >=20
> >  ASPEED SD/MMC DRIVER
> > -M:     Andrew Jeffery <andrew@aj.id.au>
> > +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
> >  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> >  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
> >  L:     linux-mmc@vger.kernel.org
> > --
> > 2.39.2
> >=20

