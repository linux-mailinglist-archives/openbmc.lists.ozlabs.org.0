Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF976A6672
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 04:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRKMz49d6z3c73
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 14:24:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EFXUbuSe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EFXUbuSe;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRKMG3gYXz306l;
	Wed,  1 Mar 2023 14:23:38 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B7FAF2003E;
	Wed,  1 Mar 2023 11:23:33 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677641016;
	bh=IZsgVb8ZtIZq1XVBi515jr/CvL6YVLvbvd3LsvrHoaE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=EFXUbuSeAez/QolDnTxDb614EnfQLrdARAaohwkNDRkO3nIx8ogpQL9LCq11oPeYD
	 nWYH3tggxG0vVHVvASY836WVG22+I/SS8wFLjxB8EnNoiMeIbJ0zCkyxSvNkl0eRlD
	 T9mk1HDFnHiCOtX+9P8TqDFdzZ5vIu5WYLWHvvXGrKbpKBl4V7ewlpBLr2BdORnUsw
	 L8FWMT8VjY2yV4nvGaaFY0+X32eGNq8YhI19cliwEMM885RO7/amjiTp+DlNtbQDGq
	 i2gQvni+P5YR/dKi/XL/LMHeb2++aqojE/1iAkrJmXQEQ2lieiRgcpvB1PVnbjYxSV
	 J/nF2XVXYWKbw==
Message-ID: <c18b064b6b01bd547b2f03006dbf4bb6fdf9b91d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>,  "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Wed, 01 Mar 2023 11:23:33 +0800
In-Reply-To: <SEZPR06MB52695281E21B27DB57A7B2FFF2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
	 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
	 <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
	 <SEZPR06MB52699858C92383E8E07D0832F2AF9@SEZPR06MB5269.apcprd06.prod.outlook.com>
	 <f4cb3efc9825efa582aa94bd03657b1319ff38fd.camel@codeconstruct.com.au>
	 <SEZPR06MB52695281E21B27DB57A7B2FFF2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

> Sorry, Do you mean add in description like following??
> =C2=A0 aspeed,xfer-mode:
> =C2=A0=C2=A0=C2=A0 description: |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I2C bus transfer mode selection.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERRATA "I2C DMA fa=
ils when DRAM bus is busy and it can not
> take DMA write data
> Immediately", only 1 i2c bus can be enable for DMA mode.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "byte": I2C bus byte transfer mode.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "buffered": I2C bus buffer register tran=
sfer mode.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "dma": I2C bus dma transfer mode (defaul=
t)

I would suggest putting some background about the transfer mode as a
top-level description in the binding.

There has been a lot of discussion here on why the binding specifies
the transfer mode; it would be useful (for future readers) to have a
bit of context on what modes they should use.

Perhaps something like:

    description: |
      [general binding description]

      ASPEED ast2600 platforms have a number of i2c controllers, and share =
a
      single DMA engine between the set. DTSes can specify the mode of data
      transfer to/from the device - either DMA or programmed I/O - but
      hardware limitations may require a DTS to manually allocate which
      controller can use DMA mode; the enable-dma property allows control o=
f
      this.

      In cases where one the hardware design results in a specific
      controller handling a larger amount of data, a DTS would likely
      allocate DMA mode for that one controller.

- adjusted for whatever property interface we settle on here, of course.

> > So, it sounds like:
> >=20
> > =C2=A0- there's no point in using byte mode, as buffer mode provides
> > =C2=A0=C2=A0 equivalent functionality with fewer drawbacks (ie, less in=
terrupt
> > =C2=A0=C2=A0 load)
> >=20
> > =C2=A0- this just leaves the dma and buffer modes
> >=20
> > =C2=A0- only one controller can use dma mode
> >=20
> > So: how about just a single boolean property to indicate "use DMA
> > on this controller"? Something like aspeed,enable-dma? Or if DT binding
> > experts can suggest something common that might be more suitable?
>=20
> If so, just leave enable-dma and only support for buffer mode and dma
> mode, am I right?

Yes, from what you have said so far, I think just a single switch
between DMA / not-DMA is all you need here (unless there is any time
that byte mode is preferable?)

If there is already an existing DT convention for indicating/enabling
DMA capability, I would suggest using that. Otherwise, just a boolean
flag with a sensible name would seem to work fine. The DT experts
probably have a good idea of what works best here :)

Cheers,


Jeremy
