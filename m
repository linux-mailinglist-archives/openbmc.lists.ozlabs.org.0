Return-Path: <openbmc+bounces-644-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00918B56F67
	for <lists+openbmc@lfdr.de>; Mon, 15 Sep 2025 06:34:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQByB3Lpvz3d2w;
	Mon, 15 Sep 2025 14:34:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757910866;
	cv=none; b=LGTkPn0AiVakKW4Ta0aI3kOsUvA1JqSwAc4mgkG0bysc4S6BYifa4GBmgWKwS0ktz5lCQlJvHxhdFkn3o4j5mNofjmUcIy8kuEJ+3nBaNqLohVU6MCgmciimQkTS8iYcKlbN+nTLZhxULyeFXnptL6RnBNFYLztQazbhM6qEvDqJvgnfaPYOMhT+Oh4ebEwpnCa+8vaNFEd5s0GNMdlxNyhp/w9hbVHymzEgkIIbK3q3YyhZdPjxFsGtnblj0yAkAeGk/16+xCTMiH+2WSPh9iohI/fuV3PjliCBxjHCSvTh3R5MfHJus4f79EEGqVCJcQCHAazGu0FzvDPpRH063A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757910866; c=relaxed/relaxed;
	bh=jGd9kLzjDaoi+l0HOQu5KE2dhKkmGdqUdNlJgfKDaQ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XbE9ovRLi1xzKQdocgH6ITar2HL22pBm+OTOeqpKtTwTmieDoSJSyLHprTkeXKQdAaapt0FvI9dpX4Nn50MC7NyKlsv8vdSOcr5oS+Zo0n9EKSG1rcZctf9bBmglCpvv7oLEV1ITWc/mo7iWodhzHv6tfBU0ffQ2kYFCAUnWy8+oE/9jdhY9Pvp/RusZK9FwfTrKscOkLCaiNV6PVX3cZhT6QOQmK6w21pAD4IrAHxdjjip4Dk3XASRu75hHO5tW3CtS/dyajgPBbJSZeuEnM+qe5G1RPhe6SFcbV42KlItk+PG+lnqKpLffeHIJo3bmZ/eYlHlF4YRMGxJPSoWmKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j9l6rePl; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j9l6rePl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQBy94zhRz3d2g;
	Mon, 15 Sep 2025 14:34:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757910865;
	bh=jGd9kLzjDaoi+l0HOQu5KE2dhKkmGdqUdNlJgfKDaQ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j9l6rePl1LUachlMBzH84pJ4kBHHVvbIl05HfsxlWo/BECrz1cj/oTJUcTE+mwMxJ
	 1zhFaWpOsMOT+ws5vGcBytUoqpX60OAE2NGwm7D45vwRgVNN0oHUYMe/MVhyC4KyTz
	 WDq4LX4lbyF+4K/MdLmV2a5A1ag5A27ZrLDtKbHgyBhHaS/1eNp1XLeS7bCD4Au4HZ
	 Z5K6pTKPx4A9glzNAfLgQutJM+RqCu1DPmf9H3q+8nKyicoSF2LckL67+bC/qWSkN3
	 ij1vnEAI/uYsdu3Q8/nv4/oQRdRwiZDEd1crElwzz5MlsqhSSMsGMvotAV+bRScjPa
	 78Ag7Bu3F/cUA==
Received: from [IPv6:2405:6e00:2430:fb15:b2b4:1872:3690:c682] (unknown [120.20.190.44])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0452B64CF0;
	Mon, 15 Sep 2025 12:34:21 +0800 (AWST)
Message-ID: <ae46aa8e57d01208deb56a8fd01f26a9a0bf359b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Donald Shannon <donalds@nvidia.com>, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, etanous@nvidia.com
Date: Mon, 15 Sep 2025 14:04:19 +0930
In-Reply-To: <f0b75151-d355-4d03-a356-dfbfb7a9e803@nvidia.com>
References: <20250822203818.4062595-1-donalds@nvidia.com>
	 <20250822203818.4062595-3-donalds@nvidia.com>
	 <f9cd6015c47d390eef9c689d2cb4fcd301c4d123.camel@codeconstruct.com.au>
	 <fcd64668-4232-4d7b-98ec-5326d40d19d7@nvidia.com>
	 <f0b75151-d355-4d03-a356-dfbfb7a9e803@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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

Hi Donald,

On Wed, 2025-09-10 at 09:46 -0700, Donald Shannon wrote:
> On 9/9/25 16:05, Donald Shannon wrote:
> > On 9/3/25 00:07, Andrew Jeffery wrote:
> >=20
> > > Hi Donald,
> > >=20
> > > On Fri, 2025-08-22 at 13:38 -0700, Donald Shannon wrote:
> > > > This is an Aspeed AST2600 based BMC board for the NVIDIA VR144NVL
> > > > Platform.
> > > >=20

*snip*

> > > > +
> > > > +&mdio0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethphy0: ethernet-phy@0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 reg =3D <0>;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > +};
> > > > +
> > > > +&mac0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-mode =3D "rgmii-id";=20
> > > Is this correct, in the context of the query here?
> > >=20
> > > https://lore.kernel.org/all/6a3d7eb4-c091-437f-98f8-2b8577e539a7@lunn=
.ch/
> > >=20
> > > If not, please drop the node from the patch until the MAC driver is
> > > fixed with respect to the RGMII delays.
> > >=20
> > > Andrew=20
> >=20
> > Hi Andrew,
> >=20
> > I will change this to alphabetical order.
> >=20
> > The extra space in our flash is for root of trust application. I will n=
ote this in the next patch.
> >=20
> > I see that the ftgmac100 drivers do not use the phy-mode parameter so I=
 will leave it out.
> >=20
> > Thanks,
> > Don
> >=20
>=20
> Hi Andrew,
>=20
> I am getting conflicting messages in my v3 patch series and want to confi=
rm what the consensus
> is for removing or keeping the unused phy-mode parameter.
>=20

The background is that there's been some concerns over phy-mode wrt to
where the RGMII delays are inserted, and the impact on the phy
configuration. My intent was that if you were unsure that you would
remove the entire mac node rather than just the phy-mode property. That
way there's no networking that can break when ASPEED sort out issues
with the ftgmac100 driver. You would have to carry a downstream patch
to add the node back for networking, but I feel that's an improvement
on carrying the entire devicetree downstream.

However:

>  There is some inconsistency in
> the existing dts-es as well.

Yes, this is part of the problem.

>=20
> Our board phy implements tx and rx delay, so -id would be the appropriate=
 one to use if we
> decide to use it.

Right, so long as there's no delay configured for the MAC in the SCU
(see SCU340-35C) and networking functions for your board then I think
it's fine to keep the node and specify `phy-mode =3D "rgmii-id";`. Any
fixes to the driver shouldn't break that arrangement (as in this
configuration it should deconfigure any delays for the MAC in the SCU).

There's some good documentation here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/net/ethernet-controller.yaml?h=3Dv6.16#n264

and relevant discussion here:

https://lore.kernel.org/all/f28736b5-f4e4-488e-8c9b-55afc7316c5e@lunn.ch/

Sorry for the confusion.

Andrew

