Return-Path: <openbmc+bounces-1054-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCADCC9C0D
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 23:59:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWq4g14WQz2xqj;
	Thu, 18 Dec 2025 09:59:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766012387;
	cv=none; b=oprWlAd6akZal2Nc5kozsc703hKx3xhIY5664w5P/nEn8ClHQVpitHLddY73x9RAvgS/8ntB5TXbW3b7I1k1wmFTJUDEegjLL+0eXHKghyDO9i4S+T/c9KQPRW8YEe0SU5uhUckd6504e491Iv3pyj6gaCWm2CwrbmVAes0MfUlAOQfCQMmf8U1FaJwqLs7hvqX9fnBU0k8nb5PSplhq/w1F6MNDGbz4heA2gIZQ9g5s8qkMYeN2TkGpWBRFfzVf33VdFKSIiJOmpNZ8xoRPUgBMcgngVocg1kGginX74q4PYSl9C0M1SH8H61DwkXS4g4puYz4G88Qs1EwbCHC78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766012387; c=relaxed/relaxed;
	bh=h0ZQpPnP6V0VHVG4T/qTaG7HGafVff3MtURtDkNB+7o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QpZ+wMA1tjAfrz3myS52IJ8uabUzoGRGIC/ceeMEWKV9vZIEFjhiKlbxrD3ZExh9+MYCpqnbwScGwgNX0gg7ch8wqSs1lFGnLbFNen+0f1xXVMrZm1Nn4hM2fG3O7NGw9HVWwp0wD37FqzaIBBOdiOf3w0p7mTc3I9XjQ9+pX2GjRtmqcprNggQzh8LWj08pYTQR7T2sDH8bgBz4/9gfn+Ruf7uaqIXEbFGOcu5gD19Bmn0KjWzgXDxS5Tmvk1ShXtldEflq4VTRGP1hahQWu0EZ2XxEJipnr6H0cWysGnNYsJsFcyhPKyIRvVE4EnLjilVEO690GbtFj2m5pTvh9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D6L574Kl; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D6L574Kl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWq4f0Cxsz2x99;
	Thu, 18 Dec 2025 09:59:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1766012385;
	bh=h0ZQpPnP6V0VHVG4T/qTaG7HGafVff3MtURtDkNB+7o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D6L574KlgyqzSiWjJnQy9D8H7anarJ75r5sI+bRpxh5ii3G2KVXGenqFNpIFW03G3
	 9chSFdeSExk1LhJTLixQa0Rtkp4mZ2cTamqmy5LpgLXeYrixa0LPPmSt8Xgo7IcBW9
	 MK6vkDTNKvWpvhFM5H2RA2XD1EdhQkSbudltYdehH/6CuVxo0WKxqJNreLhyRLeoS7
	 HdcZ3w01f1DmE7Zc8BDo9aqKFP6S9R0wg6Ffq/A5LT+r2YltNEcbfMBYYjA9pvqxZZ
	 pmpJW+MRqyE3y8C38vClToSpNSfFpu+Cb2dENC6tga6iEcr6qT4j2gSgDdz6jSsf55
	 z7DKlQOWcuHVw==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 03A677C1B2;
	Thu, 18 Dec 2025 06:59:44 +0800 (AWST)
Message-ID: <61f561d95af86a46f1e1075df39e1ce0f1324098.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: dts: aspeed: add an alt 128M flash layout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 18 Dec 2025 09:29:44 +1030
In-Reply-To: <20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com>
References: <20251211-alt-128-layout-v1-1-100f57d2bc4a@nvidia.com>
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

On Thu, 2025-12-11 at 13:35 -0800, Marc Olberding wrote:
> Add a 128M layout for the BMC flash chip we didn't boot from.
> Including
> this allows the user to write to each partition on the alternate spi
> chip. This dtsi follows the existing standard of using the same
> layout
> as non alt version and prepending `alt` to each partition's name.
>=20
> Testing: Include this in msx4 and cat size, offsets and name
> ```
> for devdir in /sys/class/mtd/mtd*; do
> > =C2=A0=C2=A0=C2=A0 [[ -d $devdir && -r $devdir/name ]] || continue
> > =C2=A0=C2=A0=C2=A0 name=3D$(<"$devdir/name")
> > =C2=A0=C2=A0=C2=A0 [[ $name =3D=3D alt* ]] || continue
> >=20
> > =C2=A0=C2=A0=C2=A0 size=3D$(<"$devdir/size")
> > =C2=A0=C2=A0=C2=A0 offset=3D0
> > =C2=A0=C2=A0=C2=A0 [[ -r $devdir/offset ]] && offset=3D$(<"$devdir/offs=
et")
> >=20
> > =C2=A0=C2=A0=C2=A0 dev=3D$(basename "$devdir")
> > =C2=A0=C2=A0=C2=A0 printf "%s name=3D%s offset=3D0x%X size=3D0x%X\n" "$=
dev" "$name" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "$offset" "$size"
> > done
> mtd10 name=3Dalt-rofs offset=3D0xA00000 size=3D0x5600000
> mtd11 name=3Dalt-rwfs offset=3D0x6000000 size=3D0x2000000
> mtd7 name=3Dalt-u-boot offset=3D0x0 size=3D0xE0000
> mtd8 name=3Dalt-u-boot-env offset=3D0xE0000 size=3D0x20000
> mtd9 name=3Dalt-kernel offset=3D0x100000 size=3D0x900000
> ```
>=20
> Also ran dtbs_check on an existing dts with this included.
>=20
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
> Add a layout for an alternate 128M flash layout. This is
> useful for the aspeed ast2500[2] and ast2600[1] SoCs,
> where it has the ability to boot from one of two spi chips,
> nominally the primary and backup SPIs. Adding a layout allows
> userspace
> to flash the alternate spi by partition and switch over to it,
> allowing
> lower downtime for firmware flash, or for updating the primary
> flash from the golden backup flash. This is already an established
> scheme for the 32M and 64M layouts, where the layout is the same
> but each partition has `alt` prepended to its name. This allows
> userspace to just prepend alt to the images in the update process
> to specify which flash chip to update.
>=20
> References:
>=20
> [1] https://www.aspeedtech.com/server_ast2600/
> [2] https://www.aspeedtech.com/server_ast2500/
> ---
> =C2=A0.../dts/aspeed/openbmc-flash-layout-128-alt.dtsi=C2=A0=C2=A0 | 32
> ++++++++++++++++++++++
> =C2=A01 file changed, 32 insertions(+)

This may be fine, but please add it in a series that also introduces a
board that consumes it.

Andrew

