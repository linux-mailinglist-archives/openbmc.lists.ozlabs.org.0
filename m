Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDBC68746C
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 05:26:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6m2h54dJz3f3r
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 15:26:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MLoBMjnW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MLoBMjnW;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6m1D0bZTz3cdR
	for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2023 15:25:35 +1100 (AEDT)
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 22A4720009;
	Thu,  2 Feb 2023 12:25:26 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1675311930;
	bh=3a00ksI9FfaCnwNIF6Fz6sO/kXtD3TGtq1wMQcLK9F8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=MLoBMjnWXWPeC13H4DN4j/NBgrm0DXcVDGeRWcza3TiR/HERr0p+akVjEcUpBViMF
	 274YWteqCja1+khCSuHYvtwaRXgDIG1kIFM1eBBUxCNzt2siO4giedxK1m3igvY1Np
	 6xpQhHgJa6J5eezt81EJoXkDUWzcNUdNupNOvi7JHN2/YJWbc0rRqVMEFssxfoc0sJ
	 5vhrVNTne8eaBu3DpE/Mx9sxkigg8B3aaR5j8im7csuyzTbUq+evrAZeNShiNzVE9j
	 Hict9qwaZtw4/TzLYnr0meCttYcqoC8C3yPtXZJohpkTq2kmWwgnqnQ2DkBolSjEHt
	 nM9k60P52J8ng==
Message-ID: <c227fa62c1040c7c280f1a6559dcf4cf8fb40428.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c-ast2600: Add support for
 AST2600 I2C global controller
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,  Philipp Zabel
 <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Thu, 02 Feb 2023 12:25:26 +0800
In-Reply-To: <20230201103359.1742140-2-ryan_chen@aspeedtech.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
	 <20230201103359.1742140-2-ryan_chen@aspeedtech.com>
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

> AST2600 I2C global register controller, add bindings document
> to support driver of i2c global register set.

[...]

> +allOf:
> +=C2=A0 - $ref: /schemas/i2c/i2c-controller.yaml#

Are you sure about this? This particular binding doesn't describe the
i2c controller.

> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2600-i2c-global
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 minItems: 1
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: address offset and range o=
f bus
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: address offset and range o=
f bus buffer

Seems to be a duplicate here.

Cheers,


Jeremy
