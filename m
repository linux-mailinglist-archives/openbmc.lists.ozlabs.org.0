Return-Path: <openbmc+bounces-1106-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A420BD01595
	for <lists+openbmc@lfdr.de>; Thu, 08 Jan 2026 08:09:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmwxs6JGNz2yG3;
	Thu, 08 Jan 2026 18:09:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767856161;
	cv=none; b=BWWH2ekOJBphxDSJ26jIs3w+mQIWwsC91nBl8nK2/1giilwZAUCKbP4pad01bAu1BCctP3WSBfvV/0U9geHG9xqtLvOQ1ZIbEbztY7jl/IWA/7rc1y1Rclv4Nj+EbDe4qFy2vJ5cHkcRBxg1l508YaATor2lNl+VAYVjbPBryyuSkKNtM1wwRmFebHUWolFnHhJWJdq5equaF5iBcg8RhS+TcmgE4FNEwtfjJY0beNf7FeVFKk4NnWjvibXM5WzaRyXAwf7QnEonNOv/PpvPZvk+spgTc9o2csA2j4BYaXgGmVem5C4jZRAfHEVTnTUzKwyKjg9+NHIU1Jx7D2NfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767856161; c=relaxed/relaxed;
	bh=8GWW+6oLxMPHa9OT+guxLScbnYBJSApZwZQX2MPCbhk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VXD6iT0RSu9zQTY3RUDygAMdL/v4jHmz6pkiSNyfn3+UgttZVzdVoAkd8RciNSCFNMlLOJnPvbgVpcIFvbjoTryk1GiFRnknoZq1eJNfPNSIbLHVmkiiKuGPkRK+0HY+8VNCzE4IX+W11QSH5CbUlRakO7ncsRi6X9uQtE1fVWgdKF537+qXAtwrwQR9A4JZGRWJ6Et0Lp1/PZDE755JG2Bw8AcqJNMU3D69a2yakn+zyYXNhWIujhsM9vfOI+pqM8DhNHYyhoad+PznksywREaMgwAZDFSt/H2z6RbZeON5N+KkaQzSMikCtsYfvCIDztnIMpMZPsF8XwwImSTdJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eGoDlgD/; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eGoDlgD/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmwxr5XCZz2y8c
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 18:09:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767856160;
	bh=8GWW+6oLxMPHa9OT+guxLScbnYBJSApZwZQX2MPCbhk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eGoDlgD/wJwCazsW1UU8xf5aDf6Iq5drgT1i7SptqL7SQB5b+iBx8qaEmmsZzwnxd
	 a7ZkPrv65KyAs5/PJk4AKrxIr6bCpbHY4b63WIzbp0VViWz2sTUsGnhheG0cwDG9s7
	 HJnvLPEGptRR1IUh8dwxtIK+rKE1+rPH5di3/ct16NnxwTweusNxIptfvMtufUsdN5
	 ASc+sjcf0EtmgtsmMO2dAPgIA7jvvbN9Nemlof92lASkQlUW/+eeeqvXSvddH85QW+
	 /QN8TDervAO2ybd7LicBgRLzAX1piiLZDfC/1TSI3svXGXEzjcNG59N6FiMmv86Y5I
	 2esM0IPBGjcCA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A8E077C834;
	Thu,  8 Jan 2026 15:09:19 +0800 (AWST)
Message-ID: <7e20473324c8da16fa86f72af950b8e8eac92a1b.camel@codeconstruct.com.au>
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
Date: Thu, 08 Jan 2026 17:39:19 +1030
In-Reply-To: <20260105193232.3167128-1-robh@kernel.org>
References: <20260105193232.3167128-1-robh@kernel.org>
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

On Mon, 2026-01-05 at 13:32 -0600, Rob Herring (Arm) wrote:
> "device_type" is required for memory nodes, but is missing on Nuvoton
> npcm845-evb.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/a=
rm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> index 2638ee1c3846..5edf5d13342d 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> @@ -17,6 +17,7 @@ chosen {
> =C2=A0	};
> =C2=A0
> =C2=A0	memory@0 {
> +		device_type =3D "memory";
> =C2=A0		reg =3D <0x0 0x0 0x0 0x40000000>;
> =C2=A0	};
> =C2=A0

Hmm, we have quite a few other offenders under arch/arm/boot/dts/aspeed
too. I expect this should be caught by CHECK_DTBS=3Dy?

Digging back through my build archives, warnings have cropped up, but
only for when I'm building the arm64 or arm multi_v{5,7} defconfigsm
and seemingly not the aspeed_g5 defconfig.

executions/2024Y/2024Y08m/2024Y08m13d10H09M/20240812145816.3301570-1-tmaimo=
n77@gmail.com.md:      /home/andrew/src/kernel.org/linux/openbmc/build.npcm=
/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /: memory: 'device_ty=
pe' is a required property
executions/2025Y/2025Y04m/2025Y04m03d21H04M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.multi_v5/arch/arm/boot/dts/nuvoton/nuvoton-n=
pcm750-evb.dtb: /: memory: False schema does not allow {'device_type': ['me=
mory'], 'reg': [[0, 536870912]]}
executions/2025Y/2025Y04m/2025Y04m04d00H57M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.multi_v5/arch/arm/boot/dts/nuvoton/nuvoton-n=
pcm750-evb.dtb: /: memory: False schema does not allow {'device_type': ['me=
mory'], 'reg': [[0, 536870912]]}
executions/2025Y/2025Y04m/2025Y04m04d01H10M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.multi_v5/arch/arm/boot/dts/nuvoton/nuvoton-n=
pcm750-evb.dtb: /: memory: False schema does not allow {'device_type': ['me=
mory'], 'reg': [[0, 536870912]]}
executions/2025Y/2025Y04m/2025Y04m08d10H18M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.multi_v7/arch/arm/boot/dts/nuvoton/nuvoton-n=
pcm750-evb.dtb: /: memory: False schema does not allow {'device_type': ['me=
mory'], 'reg': [[0, 536870912]]}
executions/2025Y/2025Y05m/2025Y05m07d11H43M/03-diff-ref-curr: /home/andrew/=
src/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton=
/nuvoton-npcm845-evb.dtb: /: memory@0: 'device_type' is a required property
executions/2025Y/2025Y05m/2025Y05m07d11H43M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nu=
voton-npcm845-evb.dtb: /: memory@0: 'device_type' is a required property
executions/2025Y/2025Y06m/2025Y06m13d11H17M/03-diff-ref-curr: /home/andrew/=
src/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton=
/nuvoton-npcm845-evb.dtb: / (nuvoton,npcm845-evb): memory@0: 'device_type' =
is a required property
executions/2025Y/2025Y06m/2025Y06m13d11H17M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nu=
voton-npcm845-evb.dtb: / (nuvoton,npcm845-evb): memory@0: 'device_type' is =
a required property
executions/2025Y/2025Y07m/2025Y07m21d10H53M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nu=
voton-npcm845-evb.dtb: / (nuvoton,npcm845-evb): memory@0: 'device_type' is =
a required property
executions/2025Y/2025Y07m/2025Y07m21d10H53M/make-dtbs-check: /home/andrew/s=
rc/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/=
nuvoton-npcm845-evb.dtb: / (nuvoton,npcm845-evb): memory@0: 'device_type' i=
s a required property
executions/2025Y/2025Y07m/2025Y07m21d12H20M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nu=
voton-npcm845-evb.dtb: / (nuvoton,npcm845-evb): memory@0: 'device_type' is =
a required property
executions/2025Y/2025Y07m/2025Y07m21d12H20M/make-dtbs-check: /home/andrew/s=
rc/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/=
nuvoton-npcm845-evb.dtb: / (nuvoton,npcm845-evb): memory@0: 'device_type' i=
s a required property
executions/2025Y/2025Y07m/2025Y07m21d13H58M/baseline-build:/home/andrew/src=
/kernel.org/linux/origin/build.arm.multi_v7/arch/arm/boot/dts/nuvoton/nuvot=
on-npcm750-evb.dtb: / (nuvoton,npcm750-evb): memory: False schema does not =
allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}

I don't yet understand why that is, but I'll do some digging. I expect
there will be some fixes to send once I figure it out.

Andrew

