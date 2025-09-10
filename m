Return-Path: <openbmc+bounces-625-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74086B51143
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 10:31:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMDRs0qrLz3d8x;
	Wed, 10 Sep 2025 18:31:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757493081;
	cv=none; b=eevFIo8QrL03A1CfBewsHXHGtzT/sCdJSuD96cfKgWxZ50YiqoiHopCLVa7FLByFTkmlpotFyG86e6Pl3hc7OXRoDU6zZfSVukUZemV2csNXEKhKAH7QiSYjWm2Q2V5TMRM8nAyjrdL9aRDlTHwHqLwtJV5FQsb4abRUyuWgMj5Y56rSr3c6u5EBtJEqYZN6RChAaCgp7Z2wIMn5SoQxILyA1lJA1E2XjO7hRNTwnv/j/bNvuseDhl5heEF1Nq1NuowoA4CbIrj/dDdImXhXEz5KwV8MYmcn4DHlEI/0Qz/r0YZfzeCdNbIsfliajkr8bfFhwPc8062nRCVZg3mnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757493081; c=relaxed/relaxed;
	bh=a7gl1yA8FosrECQLRFjm2EwEpzMLXBdUuHFs7UBoYns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XRP2+dJtXdq3SnMpm1rlZceTm+X5eDH74jlCznPpJnaUNh+iuEzdJ+Fdf4hn43LO7ydjSC4U26K5tftHJkdOL+M+MBlbkg4mGjQm8XSM+Moc+0CrCgtM62aCxBzCjLAritAl/Li9dMLHcEP0WBmEMPk5qlgZB1R+atJI8aqZx0QzcQmL0FmDKc8YfYlTeqgqxIcKgFyZr4qufMAIYEINRtsR0uR2tdKGsnSblvMT0gAouZWkMFtTcamge+ZdTbadgqWIAX8mCPfyLXMiddrnp6eml54GwwXaHoTAcgL3mG0M1l8nxITi+B8N0vEy5Zv5sn225ddfCiwuDivZQiBoSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Gpqpnhtt; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Gpqpnhtt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.org (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMDRq5qy3z3d8Z;
	Wed, 10 Sep 2025 18:31:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757493077;
	bh=a7gl1yA8FosrECQLRFjm2EwEpzMLXBdUuHFs7UBoYns=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GpqpnhttBFZ3t7+EYAY8r50I5QXZ+3f71OrC7eF312pWWb0TnmG76HKmlIt51Vehs
	 Cb90rtCtW+C4EBcCElvH4SgJxieVNCsxBJ0Rc9NlSjdIYO+3HMuCNHf5HGb2LVIAos
	 52rQtXuJqEvyAxJGvW3tk5VLu0qWRVQNXvgsWmrhE7EHJN6A1ut1negsdt+0jif3Wd
	 Gy/uwXR+DNzEOO3qohcoqC3C3JgCjFCzI5aezlOPgxtgJ1X4STR0F29DzzXPiUBo18
	 vG07Lv1ol6zRZx58ubvHTMWgJ7e9lzzKnQFFyY/DLHavFjV68cXQRa5wkqp2ffKnoa
	 6ALJK6cL2D6XA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMDRl1Cmlz4w1l;
	Wed, 10 Sep 2025 18:31:15 +1000 (AEST)
Message-ID: <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
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
Date: Wed, 10 Sep 2025 16:31:12 +0800
In-Reply-To: <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
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
	 <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
	 <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
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

Hi Krzysztof,

> You trimmed response and brought some very old thread which does not
> exist in my inbox.
>=20
> I have absolutely no clue what this refers to.

OK, reconstructing the relevant parts of that thread - Ryan providing
background on the old/new register interfaces (trimmed a little for
brevity; original context at [1] if you need):

>On 24/03/2025 09:30, Ryan Chen wrote:
>>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>>> AST2600-i2cv2
>>>
>>> On 19/03/2025 12:12, Ryan Chen wrote:
>>>>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>>>>> AST2600-i2cv2
>>>>>
>>>>> On 17/03/2025 10:21, Ryan Chen wrote:
>>>>>>> Neither this.
>>>>>>>
>>>>>>> So it seems you describe already existing and documented I2C, but
>>>>>>> for some reason you want second compatible. The problem is that you
>>>>>>> do not provide reason from the point of view of bindings.
>>>>>>>
>>>>>>> To summarize: what your users want - don't care. Start properly
>>>>>>> describing hardware and your SoC.
>>>>>>
>>>>>> OK, for ast2600 i2c controller have two register mode setting.
>>>>>> One, I call it is old register setting, that is right now
>>>>>> i2c-aspeed.c .compatible =3D "aspeed,ast2600-i2c-bus", And there
>>>>>> have a global register that can set i2c controller as new mode
>>>>>> register set. That I am going to drive. That I post is all
>>>>>> register in new an old register list.
>>>>>>
>>>>>> For example,
>>>>>> Global register [2] =3D 0 =3D> i2c present as old register set Globa=
l
>>>>>> register [2] =3D 1 =3D> i2c present as new register set
>>>>> It's the same device though, so the same compatible.
>>>>
>>>> Sorry, it is different design, and it share the same register
>>>> space. So that the reason add new compatible "aspeed,ast2600-i2cv2"
>>>> for this driver. It is different register layout.
>>>
>>> Which device is described by the existing "aspeed,ast2600-i2c-bus"
>>> compatible? And which device is described by new compatible?
>>>
>> On the AST2600 SoC, there are up to 16 I2C controller instances (I2C1 ~ =
I2C16).
>
> So you have 16 same devices.
>
>> Each of these controllers is hardwired at the SoC level to use either
>> the legacy register layout or the new v2 register layout. The mode is
>> selected by a bit in the global register, these represent two
>> different hardware blocks: "aspeed,ast2600-i2c-bus" describes
>> controllers using the legacy register layout. "aspeed,ast2600-i2cv2"
>> describes controllers using the new register layout
>=20
> Which part of "same device" is not clear? You have one device, one
> compatible. Whatever you do with register layout, is already defined by
> that compatible. It does not matter that you forgot to implement it in
> the Linux kernel.

So, I'm trying to pick up (from Ryan) on whether we're actually dealing
with separate devices here; that was ambiguous in his responses.

To me, it seems like we do have separate IP cores, just multiplexed to
the same MMIO space. And if so, what the preference on binding
implementation is, particularly with different SoCs having either only
the "old", only the "new", or a switchable set of both.

Hence my query:

> Given there are actual behavioural differences between the two
> peripherals - beyond just the register set - that would seem to indicate
> separate binding types (+ a syscon mux control) to me, but I'm keen to
> hear any other options.
>
> Krzysztof, if that is the case, any thoughts on the representation of
> separate bindings?

- given we may not be dealing with "the same device" in actual hardware,
in reference to Ryan's proposed compatible split between the two.

Cheers,


Jeremy

[1]: https://lore.kernel.org/all/20250224055936.1804279-2-ryan_chen@aspeedt=
ech.com/t/#u

