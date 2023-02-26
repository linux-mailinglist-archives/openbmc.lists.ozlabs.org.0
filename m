Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B66A2EB4
	for <lists+openbmc@lfdr.de>; Sun, 26 Feb 2023 08:05:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPZQ660pVz3cXl
	for <lists+openbmc@lfdr.de>; Sun, 26 Feb 2023 18:05:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eRUwOOoH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eRUwOOoH;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPZPP4YMJz3c7Q;
	Sun, 26 Feb 2023 18:04:25 +1100 (AEDT)
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BD3A2022A;
	Sun, 26 Feb 2023 15:04:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677395063;
	bh=Y7NTv+s/hWLeamtCbWmhn/7LKRoNqR/n38OfE9hBxlM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=eRUwOOoHuKdrRpkN6k32TqeYuPJ2qpo8OHbVCzKlNi0EcrDheEyrUr7y8e7GJXNED
	 PQwzOSmmsOInezLa2c5lLpi0j0qRe3tda/GrHsp2InsAdUhXEerdjAFXxWoH3gbzHx
	 dDYrnKPJZbqCtAng1kR86tfWvHG2oOa/oQ++PKP+19xVZuawP0azjT98V5dNiTSadq
	 8v3A5ynMhOdk7FvEZgoSv2pABRqqkeW8E9fVYdE31uRXt2MdT0XYrVjXoNgBFxY/g5
	 m8O0EWEC04qfEIQ3kBcIl0LGlDNYvh+ThCamAIPZWrpyTkS307I3ZcU/ECJeppcfGd
	 6BwTzPiVu4NkQ==
Message-ID: <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>,  linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Sun, 26 Feb 2023 15:04:16 +0800
In-Reply-To: <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
	 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
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

> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -49,6 +49,25 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 states that there is another master =
active on this bus
> =C2=A0
> +=C2=A0 aspeed,timeout:
> +=C2=A0=C2=A0=C2=A0 type: boolean
> +=C2=A0=C2=A0=C2=A0 description: I2C bus timeout enable for master/slave =
mode
> +
> +=C2=A0 aspeed,xfer-mode:
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I2C bus transfer mode selection.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "byte": I2C bus byte transfer mode.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "buffered": I2C bus buffer register tra=
nsfer mode.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "dma": I2C bus dma transfer mode (defau=
lt)
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum: [byte, buffered, dma]
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/non-unique-str=
ing-array

There are still unresolved questions about this xfer-mode property from
previous submissions of this binding. We don't yet have a justification
on why the mode configuration is needed in the device tree rather than
something that is specified in a driver implementation.

By now, I think we well understand what the modes are, and how a driver
implementation might configure them, but none of that has (so far)
provided sufficient rationale on why this belongs in the device tree.

The previous threads had a couple of pending discussions, following up on
those here:

A) You mentioned in [1] that the DMA controller is shared between all i3c
devices, does that have any consequence on which modes individual
devices might want to choose?

B) You implied in [2] that the different transfer modes might be related
to whether there are other masters present on the bus, but the logic
behind that is not clear.

C) In [3] you mentioned that there might be some DRAM savings by using a
particular mode.

and, most importantly:

D) unanswered from [4] and [5]: what are the hardware-specified reasons
why a DT author would chose one mode over another?

If you can write this out in some format like:

 - in hardware situation X, you should use DMA mode
 - in hardware situation Y, you should use byte mode
 - [...]

that might help us to understand where this configuration belongs, or
what a reasonable DT representation should look like, or even if
existing DT schema can already provide the information required to
decide.

Cheers,


Jeremy

[1]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009876.h=
tml
[2]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009892.h=
tml
[3]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009880.h=
tml
[4]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009871.h=
tml
[5]: https://lists.ozlabs.org/pipermail/linux-aspeed/2023-February/009884.h=
tml
