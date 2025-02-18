Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3725A39024
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2025 02:08:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxhGJ5ydMz3cC6
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2025 12:07:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739840869;
	cv=none; b=mxDfKTCDERqfC/y/UFcWi2qi/oOatGzhp1p6LVR1IoQ8i5EuR/tBrSkWWMazdtQspOKEV7PweWF+NSqWsE/ObLFFXzM97r9KimZQGeEKdBQyXRCzSFu6gU9yYnAj4LIPet5jmocOxqgGrsBjNqHqJ/t8d6492kePl8w5gwcxHH6JUGktiDK2JmkyllscaOLBPxig+JgcUxA+hMqOWID3yI/GVcPE8lVxLFAIeHHHPe1FKK+L4M2PDT1qzpokHksfXtxhjBPhDMDLunxXR922Anu2NKcB7O9ErJIntfPeEcSwZ+HfD40kTBY6kcSBhBLvhUIre2dqDVVWFP5Niz6gzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739840869; c=relaxed/relaxed;
	bh=uj40kfo5LTXmVRg+URNHrrqgZztW7N+flpz//iXaH54=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jEorb/s0q1grMSbFrdgLc6QIuozPzL2wX1DzgML8iQGZoDfDYWStQLQKw/xBxy19p5Ps+22nSlJba4TiIrkeaVbTA8Z6YYUgYdJw+lYWbRnkt2b22orKVS4HrAz2k6u5718BpXj/sZWteoJa80D/AQGu5GeybOjODLEzda0luAfwD2owzNYgck3fpRQutW/OSJp6BpBnhsKhZNN9lGsnD+PSShX7shm7awn/9aR33uYKz0EFh0AIgZlGZ38fpJe77eVlkbPCMnYanT+2M/B0COlhbt2omlnPKGm3JyVR/xgK+mNE4in0yDU6f9+I8eTrzYY3QyoOS769aHfVSmhpgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I6aW0j/Q; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I6aW0j/Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxhGD5hXHz2xPL;
	Tue, 18 Feb 2025 12:07:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739840868;
	bh=uj40kfo5LTXmVRg+URNHrrqgZztW7N+flpz//iXaH54=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=I6aW0j/Q7wosLhgwWVgS2ECPPxJu0Jz5eA+x22jBTYj9oIDxRj0FBplmhlWK8By0V
	 cs53Kda7flynNbNsRNveiFnXSyouKwqp6kKuUiYHNkxHMQtJQOppXaT41G5fbUhGvF
	 nqP9xFALQGgh4jMBFpedK0oE4DYmcS/nghS32kdsni7oVy2DYHgNj6bVuRC8czWgef
	 Qok189hdfmtVLn3cIH+ytCjNyMt81Zeht6hDfg02nqyLLi8/2NbRTIstrGNChAVJpy
	 FCpsFwNlmLu9sJ4dqQCdUcbO3tU/o+hn2NutXREhRWOzEHi+2oymvBxf4ppsW5CdXS
	 W2pCgR5F49Nmg==
Received: from [192.168.68.112] (ppp118-210-165-49.adl-adc-lon-bras34.tpg.internode.on.net [118.210.165.49])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DA66B759DD;
	Tue, 18 Feb 2025 09:07:46 +0800 (AWST)
Message-ID: <a8ff6545da9dceb2b745e6301e1f997ba97776fe.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, "eajames@linux.ibm.com"
 <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Tue, 18 Feb 2025 11:37:46 +1030
In-Reply-To: <TYZPR06MB656841B1071626B0B684B49AF1FB2@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
	 <31c7189bc04ed8c5cce463951b717bed6a2ccf9a.camel@codeconstruct.com.au>
	 <TYZPR06MB656841B1071626B0B684B49AF1FB2@TYZPR06MB6568.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

On Mon, 2025-02-17 at 02:11 +0000, Jammy Huang wrote:
> Hi Andrew,
>=20
> Thanks for your feedback, please find my explanation below.
>=20
> >=20
> > On Thu, 2025-02-13 at 09:53 +0800, Jammy Huang wrote:
> > > Convert aspeed-video.txt to yaml format.
> > > Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER fil=
e.
> > >=20
> > > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > >=20
...
> > > +
> > > +required:
> > > +=C2=A0 - compatible
> > > +=C2=A0 - reg
> > > +=C2=A0 - clocks
> > > +=C2=A0 - clock-names
> > > +=C2=A0 - interrupts
> >=20
> > This should list `resets` as well, as that wasn't optional in the text =
binding.
> >=20
> 'resets' is not listed as required here is because ASPEED handle reset in=
 the clock driver
> in ast2600/ast2500/..., etc. So I keep this part identical as previous as=
peed-video.txt.

It's not identical though. The text binding listed the _optional_
properties, while the yaml binding lists the _required_ properties. The
reset property appears in neither list across two binding definitions,
but it has to be in one or the other for consistency.

However, it sounds like the text binding was not accurate, and this is
reflected in the video nodes in the SoC DTSIs. The yaml binding
definition at least matches that reality.

Andrew
