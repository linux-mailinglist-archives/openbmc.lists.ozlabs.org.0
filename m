Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51A69C9C4
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 12:24:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PL0Sd5zbHz3c81
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 22:24:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=F9/04s3M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=F9/04s3M;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PL0Rx3np4z3bnP;
	Mon, 20 Feb 2023 22:24:13 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 327FD20009;
	Mon, 20 Feb 2023 19:24:09 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676892251;
	bh=2CrjEgYe8SBTNfJBvAZ15H122fXa8P+V4hEaKlRMaeU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=F9/04s3MmpTCAHOgUEYcZAf1ovz/oB7zy9S9v7vYz2BvEBkzMJOAsD5NFxDCDN+XA
	 IOcPegwDjeRPDzWo3GegjETA7YBPcO2keRbo0pYxmFk2iJqvXCgwqms83wvqpqDoCs
	 UtHjJ8v4qgHiQF2ew8kkRxpbQUvQAli8XS86a9TY16ikbHeaQ0RSHhiU099QNZxwKr
	 q6RyRMlVt0wGLNKxq1oDPozTcrYmYU4+cS0JWXDsudQy+tSpzvYRha8zB5tetPU6bj
	 C9KMCICL+5eRUFlObId47XekZId6X+Llxh53w6mjqpZHA5MZHrVylGpQ8YRwuaXmCu
	 Bg/ElQqASFFjg==
Message-ID: <dfc2c2c442af55f64e147c920585cb7e6a74939f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,  Philipp Zabel
 <p.zabel@pengutronix.de>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Mon, 20 Feb 2023 19:24:08 +0800
In-Reply-To: <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
	 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
	 <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
	 <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

> > > +=C2=A0 clock-frequency:
> > > +=C2=A0=C2=A0=C2=A0 description:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Desired I2C bus clock frequency in Hz=
. default 100khz.
> > > +
> > > +=C2=A0 multi-master:
> > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > +=C2=A0=C2=A0=C2=A0 description:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 states that there is another master a=
ctive on this bus
> >=20
> > These are common to all i2c controllers, but I see that i2c-controller.=
yaml
> > doesn't include them (while i2c.text does).
> >=20
> > I assume we're OK to include these in the device bindings in the meanti=
me.
> > But in that case, you may also want to include the common "smbus-alert"
> > property, which you consume in your driver.
> >=20
> Since i2c.text have multi-master, smbus-alert. I don't need those two rig=
ht?

Depends whether the maintainers consider i2c.text as part of the
schema, I figure. Might be best to get their input on this.


> > > +=C2=A0 timeout:
> > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > +=C2=A0=C2=A0=C2=A0 description: Enable i2c bus timeout for master/sl=
ave (35ms)
> > > +
> > > +=C2=A0 byte-mode:
> > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > +=C2=A0=C2=A0=C2=A0 description: Force i2c driver use byte mode trans=
mit
> > > +
> > > +=C2=A0 buff-mode:
> > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > > +=C2=A0=C2=A0=C2=A0 description: Force i2c driver use buffer mode tra=
nsmit
> >=20
> > These three aren't really a property of the hardware, more of the inten=
ded
> > driver configuration. Do they really belong in the DT?
> >=20
> Sorry, I am confused.=20
> This is hardware controller mode setting for each i2c transfer.=20
> So I add it in property for change different i2c transfer mode.
> Is my mis-understand the property setting?

It depends what this is configuration is for.

Would you set the transfer mode based on the design of the board? Is
there something about the physical i2c bus wiring (or some other
hardware design choice) that would mean you use one setting over
another?

On the other hand, if it's just because of OS behaviour, then this
doesn't belong in the DT.

Maybe to help us understand: why would you ever *not* want DMA mode?
Isn't that always preferable?

Cheers,


Jeremy
