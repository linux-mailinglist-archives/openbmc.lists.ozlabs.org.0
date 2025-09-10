Return-Path: <openbmc+bounces-616-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B9CB50F2C
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 09:25:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMBzX4vrYz3clq;
	Wed, 10 Sep 2025 17:25:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757489112;
	cv=none; b=KZsELWl+EWJmonjxkg2WKnDFxVgMpz3MOpGRf6xPI8rl9TAE9LDDtYlnARanUmReqbRg3LUju/S2BskqPIVrjnIscazOVBnAD/a8w803922px/tS0NvOV7dDpohsNeD2gNzdVoZkfAO+2qTaCPjjrCBXF+JT1KngixRxK4f0tWwEFx2LqljpEVvpVFTExAcitVfJR8Qekwofyph7PCSeHMuA1/VctRutPg0tYy4jL7DYLW0ohTFY3/wI3yEriSNWL3R4NkQngECW4LUX9JiRH+Z0LcIA/gOBou91ZtFrSUoJgy8+ZS6clKFZ0Esrv/1udGwzeAPAVSJWxhEkXjgNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757489112; c=relaxed/relaxed;
	bh=ZGA5dcZRWUigTt8GjmWGSHBP8/IP5ng6CyXB4N9opa0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gLQ9H7NYzQ6nyGfjMKiqOplJmmElHIm5YUgE2usUMRHzNewiLIZHun0ANFvqnXRvYjF+nlQS5bRVlBsSFxb9fDc23RhnUniw3pvVXxYvGF+/0deTZnMzB78+5zHQl5lAydbc9Dm4+cXw59eLp3SUZrdvrUZ7U4oVOyoHTdhBo+vqmz/JQwk0PtXKYtibJOIftM6J1lEufp3HZ2RWQPhLowB3jIAn1f67JNZRhCGTIPUZg5yy794yX0mMKYruwDvgY2SOwY+dy8egVx2GTb+aDpEzleGT7wUT6vwIo2HOT/qNQv0vEUvwHbVQiHd4LafUkF5oM3pfJ5MOBtk/k3zchQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=M/Df+4gF; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=M/Df+4gF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.org (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMBzW0LNvz3cll;
	Wed, 10 Sep 2025 17:25:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757489109;
	bh=ZGA5dcZRWUigTt8GjmWGSHBP8/IP5ng6CyXB4N9opa0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M/Df+4gFpZo2jnpBnoKNNy4pZfOibmyNCP2ItaqHQzdlNhAKBa/0O+dBS5GgBf4bN
	 5mcazSvVUOpTQK0w8gbnr0cSGCsKACMEr0oZohlttaK6NqqlncezqOJdM5TNJe4DUD
	 5IYXoF72KmeTtZlY+Ekg+QHpUdUI4h3Yb0L9VqK68wl74rD89V3tlw+fhwQWdOF1Tw
	 miNU11LDzRqh6+tvMe9MH1q7+fZdyd0tTKh13APQBm81mAHac4u2JMwhn6r46ZozlD
	 S7Hx9MvZeR1mvohCH+1YOPlhe2n+MZeBftdPi4tUmK2RlsyvjIF7AVqJTl1PSCEiSc
	 Db4UnHy8/6b1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMBzR1HQnz4w2S;
	Wed, 10 Sep 2025 17:25:07 +1000 (AEST)
Message-ID: <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From: Jeremy Kerr <jk@ozlabs.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	 <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com"
	 <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org"
	 <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"p.zabel@pengutronix.de"
	 <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	 <linux-i2c@vger.kernel.org>
Date: Wed, 10 Sep 2025 15:25:05 +0800
In-Reply-To: <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
	 <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
	 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
	 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
	 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
	 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
	 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
	 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ryan & Krzysztof,

[my response is intended to make progress on the newer v18 submission,
but we still have this item from v16 to resolve, hence picking up this
thread]

> Your compatible already expressed that there are two interfaces, so
> your drivers can just choose whichever they want. If you need to toggle a
> bit in system controller, it is fine. If you need different compatible,
> then that's a NAK.

I think the mention of "two register interfaces" is a bit misleading
here; it implies that it's just two interfaces to the same hardware.

From reading between the lines on the datasheet, it seems that this is
two completely separate IP cores, that:

 * are mapped to the same MMIO space; but
 * both happen to be I2C controllers.

- where the single "global register" (which you mention above) provides
the facility to mux the MMIO mapping between the two. Some versions of
the overall SoC have only the old core, some have only the new, and some
have both, selectable via this register.

Ryan, can you confirm whether this is the case?

Given there are actual behavioural differences between the two
peripherals - beyond just the register set - that would seem to indicate
separate binding types (+ a syscon mux control) to me, but I'm keen to
hear any other options.

Krzysztof, if that is the case, any thoughts on the representation of
separate bindings?

Cheers,


Jeremy

