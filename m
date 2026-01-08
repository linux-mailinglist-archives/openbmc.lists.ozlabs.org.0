Return-Path: <openbmc+bounces-1110-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9841D03A0B
	for <lists+openbmc@lfdr.de>; Thu, 08 Jan 2026 16:02:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn7Rq1Tjsz2yGl;
	Fri, 09 Jan 2026 02:02:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767884551;
	cv=none; b=XvYnZOeBRo0Xl8WCUX4P6KORIRebmYUfzr+xSKO45xxAEYQN/AgskBxtGeKjmacE+i+twr134pORqnxNQ5KIzlntywu0Pg61LFejfnMfUM+f0GN9HxEdf1FEfp1X9531RA8Jj3mURgTrWV6qwarEQh6DDPTU0KD3oaZYu78PrmLGoVCB5/QCsPQAxJ+CHgokAYKRnndOvsCz+XdETau/jHDNyQyw12uxRskjOYt2s+yVsBQQz7DYAXJx0LxVTSEaKN0tYns2oybFDurjtuwrPghqnZi+9uWNJyRQNPGdXqIOusYh3Aa4Sn9aSbwoAf52JNIAzS0g3oS9bXQs1FO38g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767884551; c=relaxed/relaxed;
	bh=An3xzYfyUSARVe7TFBctBKyGe6/0WjGOSv+NTnLBkxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aycb8ga2i7mQB89rQaMU80EupJeqE53ht46rboBzF0GdkN04Q9/2kmugAGSo8oEiV10mnXrUsxOkmwwKJm6ZVZtfJMms7irnPrbyG5O2o7P/QOyH5W58+BCsZ1O7cfZknbQQTJ6YpOq2dhy6unN5DQJ2RplfD1X2CX8DdXn3+fKhxJZF7cPeKEWzELj5cbNsb6spiBZNT62o8R22kNSd8KEOl7Dx0rbozBjByhbiHbcsVL8HHjl6AzIM8nKjOKc10J3/25vQ2hfpxlGHeXFHmkjWfwTC+ZISB7UFry0JIsxgETjJn7ix84QqcbqqaYO/FEXt8tn5nGBRNh2PKbgIyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=thl9mPw2; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=thl9mPw2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn7Rp1WMnz2xjN
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 02:02:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC06060135
	for <openbmc@lists.ozlabs.org>; Thu,  8 Jan 2026 15:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609DBC2BC9E
	for <openbmc@lists.ozlabs.org>; Thu,  8 Jan 2026 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884547;
	bh=6Ycbt0WRFOzd22dkj9KdYWmrxAjeojzg19QbPUzXTdw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=thl9mPw2JoikB9apIm0Ss5L0Ro/SXVeH8gzuyHh+KChuz3SEgd0+UU7Sl7V0g9JcF
	 y58s9ZWVhHK4QyZrGkPP+By9sIy0ob9++D5UwEl7NcgsWk2q4T55kiF0jNStJkV2SL
	 +HBm9y659Xg0ZAqvSPCTIrmUuGE2rpTlWFzB/JPMgLWlYFFQWzacwv3MkqPvmoFTuL
	 V0mLYZM7cE2iK5bAsBWaAkoa1+RmrpM1ZNEBMqPvXX1Yrw8ZUHXY+qHo0onyIGtHuI
	 SCIPuoYjutzNhfMqd3aPYWtFHVYWS6VS+7RCm0iouz5Hqom/02khzRQLoFkCcgOOh/
	 Owl6lB4ZFy8MA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so5134154a12.2
        for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 07:02:27 -0800 (PST)
X-Gm-Message-State: AOJu0Yx7iD4Rltya940rkTtRT1A5h1ZrtPOjEkc8IVqDsfIz5BnZREKU
	puyGvGtT+m8zWz2zsVPD+XMJTHgZ4JWjiFRkWjkkb+mB5dzFwZ9Xg3vgTcoCA5mRe3zwmr2f6eZ
	U2ESx4x1LwYl/krQMztUK8MO3ZKfGpg==
X-Google-Smtp-Source: AGHT+IE6a44nzxp8DKF3vBuQKICR2Q2Gpwy14zv/pqJi6o0PWzyZzpo8zWkR8xYUq2MVn/kk9ttnYyYiRvu/oXF2zto=
X-Received: by 2002:a17:907:2d9f:b0:b4c:137d:89bb with SMTP id
 a640c23a62f3a-b8444d4eb3fmr605079566b.29.1767884545890; Thu, 08 Jan 2026
 07:02:25 -0800 (PST)
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
References: <20260105193232.3167128-1-robh@kernel.org> <7e20473324c8da16fa86f72af950b8e8eac92a1b.camel@codeconstruct.com.au>
In-Reply-To: <7e20473324c8da16fa86f72af950b8e8eac92a1b.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Jan 2026 09:02:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJsQR5JLMLQ=FnYWVsxmV+KQrpn20Juo=bZTBvwK9=AYw@mail.gmail.com>
X-Gm-Features: AQt7F2oknbve6chvB-3ZyMwku6hZ0gM-vqN_na5ZgE6XABn1xxxvphnh0zHxrPg
Message-ID: <CAL_JsqJsQR5JLMLQ=FnYWVsxmV+KQrpn20Juo=bZTBvwK9=AYw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add missing "device_type" property
 on memory node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 8, 2026 at 1:09=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2026-01-05 at 13:32 -0600, Rob Herring (Arm) wrote:
> > "device_type" is required for memory nodes, but is missing on Nuvoton
> > npcm845-evb.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch=
/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index 2638ee1c3846..5edf5d13342d 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > @@ -17,6 +17,7 @@ chosen {
> >       };
> >
> >       memory@0 {
> > +             device_type =3D "memory";
> >               reg =3D <0x0 0x0 0x0 0x40000000>;
> >       };
> >
>
> Hmm, we have quite a few other offenders under arch/arm/boot/dts/aspeed
> too. I expect this should be caught by CHECK_DTBS=3Dy?
>
> Digging back through my build archives, warnings have cropped up, but
> only for when I'm building the arm64 or arm multi_v{5,7} defconfigsm
> and seemingly not the aspeed_g5 defconfig.
>
> executions/2024Y/2024Y08m/2024Y08m13d10H09M/20240812145816.3301570-1-tmai=
mon77@gmail.com.md:      /home/andrew/src/kernel.org/linux/openbmc/build.np=
cm/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /: memory: 'device_=
type' is a required property
> executions/2025Y/2025Y04m/2025Y04m03d21H04M/baseline-build:/home/andrew/s=
rc/kernel.org/linux/origin/build.multi_v5/arch/arm/boot/dts/nuvoton/nuvoton=
-npcm750-evb.dtb: /: memory: False schema does not allow {'device_type': ['=
memory'], 'reg': [[0, 536870912]]}
> executions/2025Y/2025Y04m/2025Y04m04d00H57M/baseline-build:/home/andrew/s=
rc/kernel.org/linux/origin/build.multi_v5/arch/arm/boot/dts/nuvoton/nuvoton=
-npcm750-evb.dtb: /: memory: False schema does not allow {'device_type': ['=
memory'], 'reg': [[0, 536870912]]}
> executions/2025Y/2025Y04m/2025Y04m04d01H10M/baseline-build:/home/andrew/s=
rc/kernel.org/linux/origin/build.multi_v5/arch/arm/boot/dts/nuvoton/nuvoton=
-npcm750-evb.dtb: /: memory: False schema does not allow {'device_type': ['=
memory'], 'reg': [[0, 536870912]]}
> executions/2025Y/2025Y04m/2025Y04m08d10H18M/baseline-build:/home/andrew/s=
rc/kernel.org/linux/origin/build.multi_v7/arch/arm/boot/dts/nuvoton/nuvoton=
-npcm750-evb.dtb: /: memory: False schema does not allow {'device_type': ['=
memory'], 'reg': [[0, 536870912]]}

> executions/2025Y/2025Y07m/2025Y07m21d13H58M/baseline-build:/home/andrew/s=
rc/kernel.org/linux/origin/build.arm.multi_v7/arch/arm/boot/dts/nuvoton/nuv=
oton-npcm750-evb.dtb: / (nuvoton,npcm750-evb): memory: False schema does no=
t allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}

There's a number of problems on arm32 /memory nodes. The main one is
the lack of unit-address, but that can't necessarily be fixed because
bootloaders may depend on finding a /memory node. That unfortunately
includes our own ATAGS to FDT zImage code. If you know these platforms
don't have those issues, then yes, please update them.

Rob

