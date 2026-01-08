Return-Path: <openbmc+bounces-1107-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E9DD01B22
	for <lists+openbmc@lfdr.de>; Thu, 08 Jan 2026 09:58:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmzMn6BRqz2xcB;
	Thu, 08 Jan 2026 19:58:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767862709;
	cv=none; b=OcuslGShW6C+LNV+vVOimZT7kCPfFLqyBVOXWdJVWSEkrsLNyU5rdfvUE1DI2yDr1FPxcEFaEp+/q8YcLDd07xYUZKKCAqDnPPeITsNCSEUujIeIM63jaMVmVoLxRYoqHAZh4xijSnyekBdIlY8C07yp4PBXdD9g8u1X79m0IE3rvMjc76UTx5M67XBje0I5Z5djcayAKpjUe9q/fGXCzXL9S0qXZZoNOlQd3JYIqOFFC13zLuxfy/igoZpzBa10SBhlJajNUd9zIlVmeVM/7raShFNuEDUBdgNMdtW3VU6+5yOdMEP1woh0iBwufxzm9IdRrVEQ3hsGVDCykfs/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767862709; c=relaxed/relaxed;
	bh=R1YVWqFT14aajrU8NomY7blt6pzz0A0j+Gh5vTz+QFo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QjX4mgr+r/y5j3Epvp1CAXbWKwCvd+zSBtBcKAU99w7/xa9AtjdJtR0OXbwY125xMJ1PDZOtl6RNzXgvMlB1skfLXTBl0dUfE78jAv2BJy+maQEg4LOdPfmL0X1T6OqQTNecUQb0Z4m6Q0oN5j0UvVscNuxl8STf63BoTqZTKh7l8Xvz1wcWfnq3cHcFHDED7mWUzRcoRA430MFeadLBVdOCL4+74Hd8gre2WDf/R9qFtWe8+5/MP5xMojszM+ZXRAmh8A5pHNa65qTaSvbarLy9Quefa+o6U/sFRc2YKr6B4BZYXepEXrgWqqS6JQaxoP1T9E3Zpxb+tLsM36ufLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NtX6E90V; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NtX6E90V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmzMm2QK1z2xZK
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 19:58:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767862706;
	bh=R1YVWqFT14aajrU8NomY7blt6pzz0A0j+Gh5vTz+QFo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NtX6E90VRts1BpslEkR/LrcMeLsX9mJCEl0PbGdIGjzqq3QgZSl8BWv+uHesGem5r
	 cmcgNipH1BccS8u9WolVMloXsT+yhR1eTGrqiX14w+kMai29bSXomqM06yb8IgR01z
	 W7zzbUrfOLwmRxHt2Um7UIQBbR27nrIyck667oQa7Sz1HfhtOHTPiomqX66JtQnnff
	 2FA4q1jxoQAyiOXEF6skiSqEaCrbYbrRZjuvpEJutJ8GBma7pTEi7x25J/mu0zhuLw
	 6HyRjbbv/WTrBKgOUFwjinVXrkTgUDJ0/hAo4yCNCCpYg7ihKMHaMRulrlb6dfZYig
	 PK+iQ9g1WacRQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 747BE79F8C;
	Thu,  8 Jan 2026 16:58:25 +0800 (AWST)
Message-ID: <909110018686854d129ec579cd3852d29ab60be6.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add missing "device_type" property
 on memory node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Tomer
 Maimon	 <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick
 Venture	 <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair
	 <benjaminfair@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Thu, 08 Jan 2026 19:28:24 +1030
In-Reply-To: <7e20473324c8da16fa86f72af950b8e8eac92a1b.camel@codeconstruct.com.au>
References: <20260105193232.3167128-1-robh@kernel.org>
	 <7e20473324c8da16fa86f72af950b8e8eac92a1b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Thu, 2026-01-08 at 17:39 +1030, Andrew Jeffery wrote:
> On Mon, 2026-01-05 at 13:32 -0600, Rob Herring (Arm) wrote:
> > "device_type" is required for memory nodes, but is missing on Nuvoton
> > npcm845-evb.
> >=20
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > =C2=A0arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch=
/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index 2638ee1c3846..5edf5d13342d 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > @@ -17,6 +17,7 @@ chosen {
> > =C2=A0	};
> > =C2=A0
> > =C2=A0	memory@0 {
> > +		device_type =3D "memory";
> > =C2=A0		reg =3D <0x0 0x0 0x0 0x40000000>;
> > =C2=A0	};
> > =C2=A0
>=20
> Hmm, we have quite a few other offenders under arch/arm/boot/dts/aspeed
> too. I expect this should be caught by CHECK_DTBS=3Dy?
>=20
> Digging back through my build archives, warnings have cropped up, but
> only for when I'm building the arm64 or arm multi_v{5,7} defconfigsm
> and seemingly not the aspeed_g5 defconfig.

Ah the aspeed dtsis define a memory node with it and some zero-length
memory, and the node properties are updated by the dts files.

False alarm.

Andrew

