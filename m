Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AB69C69E
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 09:29:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKwZN56Fqz3bwQ
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 19:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=R6tfCZuH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=R6tfCZuH;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKwYf6MZ8z3bh6;
	Mon, 20 Feb 2023 19:28:54 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 46AC620061;
	Mon, 20 Feb 2023 16:28:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676881733;
	bh=fXFu0XLA13XF+cazWWGEf49HqJUOQDfKQ9JtzfT9Ba4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=R6tfCZuHDsBmU4JIqHwzq6TVoxUP5OKOYzxMjwI3REytm3t9sDxp5y7fTkYw5/r36
	 THL+vY5NpIIOZABqwkpUeZiqROEgiUy8dcj8ALOcTnROSmM2iV+PZK9Mq+fCcoBGsr
	 MVsHF+olsTZv/ff8bwBQIwf188QSIv9nbvD4C+RmoC8qNejQ9z2zwkzXpV0WmsDCaC
	 FzXEl7R8+4dGl35MPnd7MeyhjjcEBp3ZN1Jg9NVSDe+3ucE8pqK0I+v2uxDp+qJFpm
	 Om+8AHw+nwGmeoe4CF76gk6xd3ZQQCpZb2HFWFlWU6/9VLabnrgJIlPJhv7zsOktOf
	 5syRHwBwvabmg==
Message-ID: <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,  Philipp Zabel
 <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Mon, 20 Feb 2023 16:28:47 +0800
In-Reply-To: <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
	 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
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

> AST2600 support new register set for I2Cv2 controller, add bindings
> document to support driver of i2cv2 new register mode controller.

Some comments inline:

> +=C2=A0 clock-frequency:
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Desired I2C bus clock frequency in Hz. de=
fault 100khz.
> +
> +=C2=A0 multi-master:
> +=C2=A0=C2=A0=C2=A0 type: boolean
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 states that there is another master activ=
e on this bus

These are common to all i2c controllers, but I see that
i2c-controller.yaml doesn't include them (while i2c.text does).

I assume we're OK to include these in the device bindings in the
meantime. But in that case, you may also want to include the common
"smbus-alert" property, which you consume in your driver.

> +=C2=A0 timeout:
> +=C2=A0=C2=A0=C2=A0 type: boolean
> +=C2=A0=C2=A0=C2=A0 description: Enable i2c bus timeout for master/slave =
(35ms)
> +
> +=C2=A0 byte-mode:
> +=C2=A0=C2=A0=C2=A0 type: boolean
> +=C2=A0=C2=A0=C2=A0 description: Force i2c driver use byte mode transmit
> +
> +=C2=A0 buff-mode:
> +=C2=A0=C2=A0=C2=A0 type: boolean
> +=C2=A0=C2=A0=C2=A0 description: Force i2c driver use buffer mode transmi=
t

These three aren't really a property of the hardware, more of the
intended driver configuration. Do they really belong in the DT?

[and how would a DT author know which modes to choose?]

> +=C2=A0 aspeed,gr:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description: The phandle of i2c global register node.

We'll probably want this to be consistent with other instances of aspeed
global register references. I've used "aspeed,global-regs" in the
proposed i3c binding:

  https://lore.kernel.org/linux-devicetree/cover.1676532146.git.jk@codecons=
truct.com.au/T/#mda2d005f77ca0c481b1f1edadb58fc1b007a5cc3

I'd argue that "global-regs" is a little more clear, but I'm okay with
either way - that change has been Acked but not been merged yet.
Whichever we choose though, it should be consistent.

Cheers,


Jeremy
