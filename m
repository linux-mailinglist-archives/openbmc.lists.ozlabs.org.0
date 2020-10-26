Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7D229858B
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 03:22:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKJWQ4hCmzDqMk
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 13:22:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Npq/+bcu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=UY82fLyq; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKJVQ1CjPzDqML;
 Mon, 26 Oct 2020 13:21:17 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7376F580174;
 Sun, 25 Oct 2020 22:21:15 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 22:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=lHjwK
 fYhqQih4rQInQIFH4vfDy6E5URUgDnkSHmvRE4=; b=Npq/+bcugHu8TqnWcBtle
 PzpaqB0fy2pGks1KI8Kv9ApEFDiHGUXSkpl5jqoSXhvmROW86o3cfYBk4LR+BXnv
 tA3XhpEkYG/q4Njz7u1PrjYAUKvxqxDRcAQEhlMh69bW1lIXwx6M/9hNKg9K+6PZ
 hDy/xBGh/unSQ/wTUzCnskj0kRZ3zu3u1UXOaYM5ghdrVcTHMbndmNgRVvyVui+a
 3LSmjdXX8zv1KUKYKd6aZ0Gpo7Puog7UbIvRpBUtR40lhfZnMHKXMlw4VS8KEBzz
 PDbhSyxgD9RTvKVmD3xtgInsrufgXZigdyj3eoe2yFsS3Vq0YF5QUhZ+/2Vrjhxq
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=lHjwKfYhqQih4rQInQIFH4vfDy6E5URUgDnkSHmvR
 E4=; b=UY82fLyqPEAG8ozw7dL/quwC+8X/eSk8/V69hbKSzqSSJtAlQUHL4DgWP
 RmFIhfBYCpeqwoxXCDBEzM4nmu9OwFJXRnR+maOaGdf6M+A0FeTnwciSUUQNXCzX
 Y5lFeXqcMJ3RrgBCZj+LSNdg2aNEfh/MvL/76WSShga6Ths6WnbUdpmnDpZhanSG
 2/Ris5DaEu90oq0LQmSMiRIlIVCx5qnkQGj3YZttiokM7XwqNVWlNRqRs94ucmSc
 0n8SjZr7vZ5odzXpoP9RKGi1gUbOF7NJgcf+szmAfmTbmBIdKlPbNoHhT8i87Uvc
 60ey1PfU4Abx+kdHx0HhAoqtkqGbw==
X-ME-Sender: <xms:lDKWX6f4L8AlcwqhL26btDiv4PDaOk3UUTn2eH57-SWva1qYtU-6JA>
 <xme:lDKWX0MFvUFWjLznVgA_f9PHWUlKTpi-vNNeSkx7ZLTSAjCAuYGlGXL_EAucIvP0e
 I1hwgdf-DsspKavUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:lDKWX7jHWbs2xkMmAsa-3ZAFDEksbrYu-j2FwW0cPUMOShBQZeJ1xQ>
 <xmx:lDKWX3_FLGEPNN0b_thBs8x_PN4IpLJbtLMKAHwbDQJdy5-zuPA89g>
 <xmx:lDKWX2v11wgT2PL28GIE8pp3_1o9ReyCgB_B7fYaGY9tr_6N60owXA>
 <xmx:mzKWXwJEikBPc5Kqohxz1nWw5sqJH2OPSovY3y0arGlFlRGKikeF5A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 165E4E0508; Sun, 25 Oct 2020 22:21:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <3fa4fda9-1ba9-4cb6-bd7f-0200bca06f52@www.fastmail.com>
In-Reply-To: <82A00921-93ED-42A8-9B93-8F1E8025BA89@aspeedtech.com>
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-4-billy_tsai@aspeedtech.com>
 <ce3dce98-1daa-47bb-a688-0d5a743e45b2@www.fastmail.com>
 <82A00921-93ED-42A8-9B93-8F1E8025BA89@aspeedtech.com>
Date: Mon, 26 Oct 2020 12:50:48 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Billy Tsai" <billy_tsai@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 3/3] pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 26 Oct 2020, at 12:33, Billy Tsai wrote:
>=20
> =EF=BB=BFOn 2020/10/26, 9:27 AM, Andrew Jeffery wrote:
>    =20
>     On Mon, 12 Oct 2020, at 14:01, Billy Tsai wrote:
>     > > At ast2600a1 we change feature of master sgpio to 2 sets.
>     > > So this patch is used to add the pinctrl setting of the new=20=

> sgpio.
>     > >=20
>     > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>     > > ---
>     > >  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   |  5 ++++
>     > >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 30=20
> +++++++++++++++++++---
>     > >  2 files changed, 31 insertions(+), 4 deletions(-)
>     > >=20
>     > > diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi=20
>     > > b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
>     > > index 7028e21bdd98..a16ecf08e307 100644
>     > > --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
>     > > +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
>     > > @@ -862,6 +862,11 @@
>     > >  		groups =3D "SGPM1";
>     > >  	};
>     > > =20
>     > > +	pinctrl_sgpm2_default: sgpm2_default {
>     > > +		function =3D "SGPM2";
>     > > +		groups =3D "SGPM2";
>     > > +	};
>     > > +
>     > >  	pinctrl_sgps1_default: sgps1_default {
>     > >  		function =3D "SGPS1";
>     > >  		groups =3D "SGPS1";
>     > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c=20
>     > > b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>     > > index 34803a6c7664..b673a44ffa3b 100644
>     > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>     > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>     > > @@ -46,8 +46,10 @@
>     > >  #define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 *=
/
>     > >  #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 *=
/
>     > >  #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 *=
/
>     > > +#define SCU690		0x690 /* Multi-function Pin Control #24 */
>     > >  #define SCU694		0x694 /* Multi-function Pin Control #25 */
>     > >  #define SCU69C		0x69C /* Multi-function Pin Control #27 */
>     > > +#define SCU6D0		0x6D0 /* Multi-function Pin Control #28 */
>     > >  #define SCUC20		0xC20 /* PCIE configuration Setting Control *=
/
>     > > =20
>     > >  #define ASPEED_G6_NR_PINS 256
>     > > @@ -81,13 +83,21 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
>     > >  #define K26 4
>     > >  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1,=20
> SIG_DESC_SET(SCU410, 4));
>     > >  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13,=20
> SIG_DESC_SET(SCU4B0, 4));
>     > > -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
>     > > +/*SGPM2 is A1 Only */
>     > > +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2,=20
> SIG_DESC_SET(SCU6D0, 4),
>     > > +			  SIG_DESC_CLEAR(SCU410, 4), SIG_DESC_CLEAR(SCU4B0, 4),
>     > > +			  SIG_DESC_CLEAR(SCU690, 4));
>     > > +PIN_DECL_3(K26, GPIOA4, SGPM2CLK, MACLINK1, SCL13);
>     > >  FUNC_GROUP_DECL(MACLINK1, K26);
>     > > =20
>     > >  #define L24 5
>     > >  SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2,=20
> SIG_DESC_SET(SCU410, 5));
>     > >  SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13,=20
> SIG_DESC_SET(SCU4B0, 5));
>     > > -PIN_DECL_2(L24, GPIOA5, MACLINK2, SDA13);
>     > > +/*SGPM2 is A1 Only */
>     > > +SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2,=20
> SIG_DESC_SET(SCU6D0, 5),
>     > > +			  SIG_DESC_CLEAR(SCU410, 5), SIG_DESC_CLEAR(SCU4B0, 5),
>     > > +			  SIG_DESC_CLEAR(SCU690, 5));
>     >=20
>     > A few things:
>     >=20
>     > 1. It looks like the Multi-function Pins Mapping and Control=20
> table in section 5.1 of the datasheet only tells part of the story. It=
=20
> lists SGPS2 on the pins you've modified in this patch but not SGPM2.=20=

> However, the table in section 2.1 (Pin Description) does outline SGPM2=
=20
> and SGPS2 are routed via the same pins, though this does not listed th=
e=20
> associated registers and bit fields. Can we fix the table in 5.1 so=20=

> it's easier to review this patch?

> You can see section 5.2 to find SGPIO master interface table. It lists=
=20
> balls and register setting information of the SGPIOM1 and SGPIOM2.

Yep, though typically I use the table in 5.1 to figure out the pinctrl d=
etails.=20
It appears you'd need to add another two columns to the table to capture=
 the=20
info - is Aspeed planning to do that in a future release of the datashee=
t?

>     >=20
>     > 2. We don't need to specify the _CLEAR() behaviour here as this=20=

> is implied by the process to disable the higher priority mux=20
> configurations. It should be enough to do:
>     >=20
>     > SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0=
,=20
> 5));
>     >=20
>     > However, this requires that we also define the priorities=20
> correctly, so:
>     >=20
>     > 3. Can we add both the SGPS2 and SGPM2 configurations so we have=
=20
> a complete definition for the pins?
>     >=20
> Thank you for your advice. I will complete the full configurations and=
=20
> send the V2 patch.

Thanks!

Andrew
