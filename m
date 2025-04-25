Return-Path: <openbmc+bounces-9-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C013FA9D54D
	for <lists+openbmc@lfdr.de>; Sat, 26 Apr 2025 00:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZknHq34hTz2ySJ;
	Sat, 26 Apr 2025 08:16:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745619397;
	cv=none; b=Y4yZjZx5t4sq3rDvXPo9i0SxaQl6w4ieRZtrFfHaR2AMGejQw3ZHg7Dds9l2HyLvzufpDD9M9sNIe4vESE4uaoKIR1uGgsDr31jYv8HEaFk5NlqEk9LjyEacvkujyZNcx1pymT4jQuiao2KARJ9Hym4+I5tf3ZbDc5+sly4a1CKU+gjAF86ZMJsx1oLQeQGH/MFsBnEh/1yD3JRJP8xTRLjdEy3F3mIhaZvdiwCWSw8YwpgiIuCKlt/c1cSVM+hETkx6KgrFdYAqWFYaPkTXpaaaogVC1tPFeTZNKzinLjeeO8RKCA29bYbFDUP0EgnPEDUN5XQAY2S1hbaN4QPI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745619397; c=relaxed/relaxed;
	bh=WgXD6hkPKUGRTdY1zhGVp/H0Rv3gRoc0tuevqLhxiZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3rS731ZgYlWjkc8BODMfw+un6hFwdxG5jw7d7BbgJVSpcPWI4RRUlhh6BLgejQNLh+lOW1jVmB1os7wweCDGcHeczHHMaxt2c6H3d9PuIVB9Cg14zuhOj14IKPSPk2WWDzF2hKp4M6eTw56sn2QdlYX9Nwr5PNR2N343R4FpMjezFzQrSS1MI4gC8zcjirg7YUDVFjwwlPPxZS+hFU3rlCGUeiBic/P3oV7bP3SLOV+NZpxRZpj3ClIWUrBKlOMELvsMvaTtzEuJKfZT4hI+qSCGPt1XdYnvNtRj43JP/YXACqwMXFGONGltRsxjYlrBp0XhXBUnU3V6KkPETSzAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=foCGxrGN; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=foCGxrGN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZknHm5cg9z2y2B
	for <openbmc@lists.ozlabs.org>; Sat, 26 Apr 2025 08:16:36 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso3848938b3a.2
        for <openbmc@lists.ozlabs.org>; Fri, 25 Apr 2025 15:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1745619394; x=1746224194; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgXD6hkPKUGRTdY1zhGVp/H0Rv3gRoc0tuevqLhxiZs=;
        b=foCGxrGNXrpFw9AM1gz69sgIZbI8a3ez80LoAPgHGFBlvYqRind59Okm1+G4zSOiaQ
         F8a+U/5JkqgrRWK2piTF3xNLxtMy6ujmJhy5XJoFfgXKdnhoSEJg4jcG+MH+ZxelrmAm
         7VapMwPo2hK/0Hf2u7nGIwDL6TX4KcuV3dIKqSmDn9lGpC2Ngu60sWoPHfu2YC43eIfL
         VQRTqEfc/k+OfuyCFZy/m5LO9G/k/sVP1N9hVNDItdh8jMDLjCw+f55PGff3yeFrlZok
         JCgTuwjSm+UFxNOQ75N6sLzxYE2JOCBypRB1K1NSVy6iz4sUxMw63QKj2DRf17dI4vV4
         ZuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619394; x=1746224194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgXD6hkPKUGRTdY1zhGVp/H0Rv3gRoc0tuevqLhxiZs=;
        b=xMQapbxv+yYCZpvXZWs6kZnC8SpRpGUFGDx6oABeZ8Ihury4ZzR/vl6fnGyKW2qN0j
         CsypgwYgwQwg8AajYioz2rbTcvQJccul3iy9AxJKzbbwPIWNQz/7dl0kIcrGjtWQ3YBX
         pCfEFOCqAEGSqCYrJsBanRtSXzAfpV5W7DoGbEpx7bT4xPfG/lduvJe4Ej2tRHSAfvOv
         RKAcCA6Q/lq+ObiSUcRcWR0W2yStW8mRyOWvIKFgo0cEUDi45xo2qa88iCDA4UNIquLt
         A4RWWAkKjXe9izbm/JGSlHrFsvyj/ML3eao70zSDmAiBGS2qwT507dLY0W6B5IC+EylD
         /T6g==
X-Forwarded-Encrypted: i=1; AJvYcCUc4D+rM5QIP0FW8pUeNzlY2DXT94jfz7bikn6N1en6LCldvHgdHNGb12wwRyFM6rKjtsAzKFpB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwI4tzE63v7oXEZagdQTO86oCEIAZubY8WK4p7f8nBtm7PMYeCw
	b3mp0VJvy6v0ziHG+NXOEySrUj/s3Zo2h8gSkCIdUFFbb7EMYCn6MLvTSDaYLVZnzmURVauCfgC
	Gy6CUo/mf6MMYhUTRnTF4Cz3ZgQEqDapsPWxXQQ==
X-Gm-Gg: ASbGnctCbel0k8zKQxu7ggFfMiCPIlh5ew2Mf4Z9ghsbRmmmORF5SFESH16iqVziGpU
	WfQkLOh+ekLKBiLJNWJ6SzF2oDX339WnQ5KBj+U2b7OLOjLN2kseQOdeeohB3U5Q7FMzDnq0fjU
	6R4R3fODLC2ffiJ+kJhE3fsp1R7DFCjAeNPlQHCvE/HLan5Jkj48r7uKIX
X-Google-Smtp-Source: AGHT+IH2N4ln+J9HVbv+8+sHBp1P/isBj0gkTrIzOTOJCwbUCAtU7RG/jp9P807JAV09WP22RBF21hsTQbnlFLBbfcE=
X-Received: by 2002:a05:6a00:218c:b0:736:5c8e:baaa with SMTP id
 d2e1a72fcca58-73ff7255d1fmr1386610b3a.2.1745619394656; Fri, 25 Apr 2025
 15:16:34 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250415232521.2049906-1-william@wkennington.com> <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
In-Reply-To: <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
From: William Kennington <william@wkennington.com>
Date: Fri, 25 Apr 2025 15:16:23 -0700
X-Gm-Features: ATxdqUG71cOtnC9xnSIu_N-FLI_cL9Ilck2vh1utGY_dfZmPABCB1UECKPYRuu0
Message-ID: <CAD_4BXiaqLa563LoyGsPV=C164KxREzs0H+VcXPGR9QagzKs0A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 15, 2025 at 11:55=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/04/2025 01:25, William A. Kennington III wrote:
> > The latest iteration of the clock driver got rid of the separate clock
>
> I don't see the binding deprecated.
>
> > compatible node, merging clock and reset devices.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >  .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 16 ++++++----------
> >  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  8 ++++++++
> >  2 files changed, 14 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index ecd171b2feba..4da62308b274 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -47,17 +47,13 @@ ahb {
> >               interrupt-parent =3D <&gic>;
> >               ranges;
> >
> > -             rstc: reset-controller@f0801000 {
> > +             clk: rstc: reset-controller@f0801000 {
> >                       compatible =3D "nuvoton,npcm845-reset";
> >                       reg =3D <0x0 0xf0801000 0x0 0x78>;
>
> So now it lacks quite a bit of address space. This must be explained in
> commit msg.

Can do that when i make the updated series. Basically the old value
was just never consumed by an actual driver and the chip reserves that
entire 0x1000 size address space for clock registers. However, only
0xC4 bytes (0x78 was incorrect) of that space are used for these
registers.

>
> >                       #reset-cells =3D <2>;
> >                       nuvoton,sysgcr =3D <&gcr>;
> > -             };
> > -
> > -             clk: clock-controller@f0801000 {
> > -                     compatible =3D "nuvoton,npcm845-clk";
> > +                     clocks =3D <&refclk>;
> >                       #clock-cells =3D <1>;
> > -                     reg =3D <0x0 0xf0801000 0x0 0x1000>;
> >               };
> >
> >               apb {
> > @@ -81,7 +77,7 @@ timer0: timer@8000 {
> >                               compatible =3D "nuvoton,npcm845-timer";
> >                               interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               reg =3D <0x8000 0x1C>;
> > -                             clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> > +                             clocks =3D <&refclk>;
>
> Not explained in commit msg.

Yeah, I can do that WRT using an on board refclk instead of a value
that comes from the SoC.

>
>
> Best regards,
> Krzysztof

