Return-Path: <openbmc+bounces-801-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12992C066C6
	for <lists+openbmc@lfdr.de>; Fri, 24 Oct 2025 15:14:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctNdl0ZL3z3bfQ;
	Sat, 25 Oct 2025 00:14:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761311642;
	cv=none; b=CPT/CVst57dvPqiARk+Rw/coOY/ntq9Jo6BBIS9IR7TEtYN9mvrXQ8V3BdOrn8wD6NKNrxc1JUdqxbed+R1Oqyc+yWGMaPOIjMUkNi3+K/BFoFS++UTLDO9UXEw+AxZZoQprRXtc+wvnMy7OWpGKo+rSlA0uuf9AhU5vU345raGo3lB7DTcrJxmRzrVK8BxzEjvw+cO+H72SvpgACc0Wd947WfLDUaJi6kNsTcUoqSKMl4tHsbRfdS7tX8e0SCMGZnO5wL5TbYdPjSuSus0swTPEFqRzxFXtaINHLkcTidO7ZL/LJJJbRYR9zhqHAHHTKN1aSOPwmDrybih6JUQXng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761311642; c=relaxed/relaxed;
	bh=DA/0xI9XuzSTt1Z04u/yEWZyQXZYqt/97+Wy6DIq3e8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bnc9+SbzvcACJ2N+lszhxzOrwN9v2MDZAxPGCPFXlpQ3l4aM2oiMHPGh6FPNa9ylZAqbzc8tQ20+W0yP/DeH7mmXsRQS9cLuJZIrT4/Je2uHGyIPRkk9Gv+B42TuGZiRZPvoeCu0G9C2SflxvPRa6wKK4LUorNiltmQhFhMmKe10aR/c9h2uDC4H3i9mjb/+rrKj35Ro5arRfpGvZSXIkeNhdnxAzUiOCkNPxl1rqJhtBP2C9+zVplqqqOlpj9v48tn+EO+PVEQp3oVdiS5swq1oLlff25OY2/+ykFy5IFJZDiOfOXvhXVwJG/ous2OJKFSGWUALGMrsZMr0sIfGYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AqgzCm1d; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AqgzCm1d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctNdj1Vyjz30N8;
	Sat, 25 Oct 2025 00:14:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761311639;
	bh=DA/0xI9XuzSTt1Z04u/yEWZyQXZYqt/97+Wy6DIq3e8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AqgzCm1dd0k/aUIcEdl0Hm9L6+HrivMtdltLfAdJ2V/UI101YRpopWMxclWZUsxIi
	 fdEz5ofPGQuugnuX06FonSsV3olkpSXMfKhfM7uc7Eu9G1KCURvO2lTOhSotyM/lbK
	 RQHU40m2L2xgkYBRaQ04HyxImQISWA1MEdNEuqEXdI5u3e65SGrQNdHYA4HvJn7cE3
	 rz6caVpUMvGwUJYT9M7C9vj6+LJc1grMs42vuG+HwMqgDt9VenQSzV69+AtinBJ55+
	 s3lhGGE2m3GZmBY2PByLJgrrEwe6bMTwzd4gtr0rqlYG/S6ftJgD9xuIyYDOJqzgSQ
	 Gpdu1qonxkVbg==
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B9FB37561D;
	Fri, 24 Oct 2025 21:13:56 +0800 (AWST)
Message-ID: <9c0252401fca51549cef2586e9171fa167cc0c53.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 24 Oct 2025 21:13:56 +0800
In-Reply-To: <TY2PPF5CB9A1BE6E6E8FA67CDC03A55A439F2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
	 <7a650d60cabcbd33b65c954b0c9c5918dfcabb09.camel@codeconstruct.com.au>
	 <563d6efb-966e-41e7-aade-ddec2abc7568@kernel.org>
	 <TY2PPF5CB9A1BE6E6E8FA67CDC03A55A439F2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ryan,

> I will modify with following.
> if:
> =C2=A0 properties:
> =C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2600-i=
2c-bus
> then:
> =C2=A0 required:
> =C2=A0=C2=A0=C2=A0 - aspeed,global-regs
> else:
> =C2=A0 properties:
> =C2=A0=C2=A0=C2=A0 aspeed,transfer-mode: false
> =C2=A0=C2=A0=C2=A0 aspeed,global-regs: false

I think Krzysztof was fine with your approach of the new binding file,
just with the improved commit message.

Cheers,


Jeremy

