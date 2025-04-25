Return-Path: <openbmc+bounces-8-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C04A9D541
	for <lists+openbmc@lfdr.de>; Sat, 26 Apr 2025 00:14:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZknF46MxMz2yDM;
	Sat, 26 Apr 2025 08:14:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745619256;
	cv=none; b=QQ9wIudYvus1CN6wbFLP5KSfeENH7ik/aKnJbDs0/+fzpvTF37YHsqP1ORg0mbgu7DLReCwqlOUZ4KH73YHFhVeZ1pEDs+DHwdiOER2xAq5reODIabWrVu9wuH06uivQG8oRWye0ZZOQYxPFPy8vMpi4qhNJxK1jIKIgADX6aaBdyRbZ2cVj1xhXQsFM6HchQEVzYeKwZowQVFSgNQM/QVVKF1SmYh00urmmZQjLL6gfSK+zANEodAW0l6riBBYaS1AG6xw0wTljVlQpzc2KdIW5rJx8W92kBYBvtdOoZPROQ0nx0/jj+9zT/diPBDmqCLsqQxpHW+L01HdSw79vug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745619256; c=relaxed/relaxed;
	bh=P9rkq+P8mjayzisoLVUkDsT/oFVSZ8gJxLOEbIMf1ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8z98Yg1UTutYURYnkCcYk8AVLEwuPDDxBH7zs1rG4QJf0T1/48iKbr5XPGZoCXX1LYw3nTGevLaFTY082rxJt/e1lJsKadiMbf4LNhlSsImfM5muRH51L/bfusxV7glaX+AE5CdMf8fWDJMy1aRnSHdO+H6yDCGCCMPzBL/Y+lRif7rZ7PiYih7GYhBTgiB0Jt/HCNeoIHcsdPhbxzlGWzNBfju2Tm9rAAaOHlzWxwD/kVozGlbwO9sun5wi4V34b6Ep8WbPaq3IITfqyYqCgTF1dTzmyPGC7uKqBg03+XDMP/0+LLT14j9ZyPziRF7+xPDpoGzR7zemeagp8K0QA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PQQHpyjp; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PQQHpyjp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZknF34py6z2y2B
	for <openbmc@lists.ozlabs.org>; Sat, 26 Apr 2025 08:14:14 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-736b350a22cso2494969b3a.1
        for <openbmc@lists.ozlabs.org>; Fri, 25 Apr 2025 15:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1745619252; x=1746224052; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9rkq+P8mjayzisoLVUkDsT/oFVSZ8gJxLOEbIMf1ko=;
        b=PQQHpyjpgOeCTW0q35nZqpYbjBaA9NSjvmYnN6h2dz0Nt595Itw039btspGvXsfVuP
         n9R5EVZbigU2oubqQG6lDAu/CjuICuzXgNXJBmI8TzynfidTuHg60AC5butJC4iMBApH
         gLdJ8kC4qID3uRyusEDvKIlMY614GOdTN9aJBpwhsF23SfhNaR2FIJUMPFXkGMz8+8tU
         RWPmJtUcMRm7A512NkIO84fb6/PpEFrd0sjAcdGkkGygKs7oXIXi4hgkCv3WEq5VM5Bh
         9om5xVoVPIxuLu7YyHf0Re1JUces2RzsLkjB/lVcW9ypxc6059HLYznTpr+Veq/o2hDd
         Iddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619252; x=1746224052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9rkq+P8mjayzisoLVUkDsT/oFVSZ8gJxLOEbIMf1ko=;
        b=KAu6uUfVZMRO1H8F4IkvE08KZJVl0L2IQ48KTN65YYZJ4zs5QlMWJLytzC+SfgGzNt
         BMJ4TOdbF2V/ksa2DHd2qPYSEiUoPUm+UKwgOrM2L4pPUti4vo0snUBMNBwZfq7FORVV
         23TviRA+qda6tf2NMidmO+IfMrPox2t7ZNJBgmdqIojcEqwaaW6722EEV0Za1p6EJ2mx
         PuGAXUqYHvPHuj3yucwizJjZrrH6oh5hGdCai6JkS3okhbQlPBN1Zwllbva1e3v6AYSB
         i8lLXmE1OqzsKiAzDzjniLbRHWDbDQIwA374Y2bawQB/U2cJD0FkERYAo82gXvj5EKwQ
         jDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTBGol8/j8kBZQ8M58w3SraLYmTSCYiIKMS3v6DNxEWUNvpcSCs9e6Upi8NECj9U+wz52PWIvF@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+08ik8SlxzR4AsWPdIw7DbLybU6/VI0N5OXLhGM6X+SxAhvKN
	X2GPwhn7ib1bA7nFK5+g9+0Zy6IiklFpmxDrO0RFhfQoQcJ3Q1BCqcXyFSV4NNCUODGUyeqnuh+
	GhsdlpLOya7FfCicaYvnKIN9sMvS53M0HQURMaw==
X-Gm-Gg: ASbGnctGeR9+I/MtlV5bTbZthRX1xiXf83SZxpJMl/Qg9KX1JEX88SYl1jK6DN+3Za+
	3Zv1DH7S/6yEaLfOsc4Ff0EasqnxAkI7Cmv/jYFJCsBofQn5MiUnjga/AUeHwmSbCk3+t8GQIPV
	jLOBIUd56A0zyqkJ+J0nzLpCY6mxBV4oX0kwASlgefHms1SKjlWYnM3G11
X-Google-Smtp-Source: AGHT+IFZTpWnme11BLsiPrcwXvSidsxjw3T39w0pBWnpaOhvadBjE/0Txqz4t2IWUG9KzyHeFaqSA44grQcYa9JFaXI=
X-Received: by 2002:a05:6a00:2443:b0:736:65c9:9187 with SMTP id
 d2e1a72fcca58-73fd72cdc0dmr4750282b3a.9.1745619252491; Fri, 25 Apr 2025
 15:14:12 -0700 (PDT)
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
References: <20250415232521.2049906-1-william@wkennington.com>
 <79400920-22b4-4bce-b204-c58087495c22@kernel.org> <CAP6Zq1hURTrDgScx=eN_GO5FV8vZNsaGVQLOxbZPCXSqc0Kxwg@mail.gmail.com>
In-Reply-To: <CAP6Zq1hURTrDgScx=eN_GO5FV8vZNsaGVQLOxbZPCXSqc0Kxwg@mail.gmail.com>
From: William Kennington <william@wkennington.com>
Date: Fri, 25 Apr 2025 15:14:01 -0700
X-Gm-Features: ATxdqUH-kgNXVnWhZKo-pz8xJdgdBSJB7vJqIou_QQp0LlJRjkJ91-cRCOwfLeY
Message-ID: <CAD_4BXifgETo1z1awWQbAA-BA9U=8Tdo9JHo7SM1+6J5G_s2Pg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 11:44=E2=80=AFAM Tomer Maimon <tmaimon77@gmail.com>=
 wrote:
>
> William, thanks for the patch.
>
>
> On Wed, 16 Apr 2025 at 09:55, Krzysztof Kozlowski <krzk@kernel.org> wrote=
:
> >
> > On 16/04/2025 01:25, William A. Kennington III wrote:
> > > The latest iteration of the clock driver got rid of the separate cloc=
k
> >
> > I don't see the binding deprecated.
> >
> > > compatible node, merging clock and reset devices.
> > >
> > > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > > ---
> > >  .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 16 ++++++--------=
--
> > >  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  8 ++++++++
> > >  2 files changed, 14 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi =
b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > index ecd171b2feba..4da62308b274 100644
> > > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > > @@ -47,17 +47,13 @@ ahb {
> > >               interrupt-parent =3D <&gic>;
> > >               ranges;
> > >
> > > -             rstc: reset-controller@f0801000 {
> > > +             clk: rstc: reset-controller@f0801000 {
> > >                       compatible =3D "nuvoton,npcm845-reset";
> > >                       reg =3D <0x0 0xf0801000 0x0 0x78>;
> The size of the registers offset is 0xC4 (last register is at offset 0xC0=
)
> Therefore, the reg property should be modified as well to reg =3D <0x0
> 0xf0801000 0x0 0xC4>;

Yeah, I just looked at the DS to verify this value for the last clock regis=
ter.

> >
> > So now it lacks quite a bit of address space. This must be explained in
> > commit msg.
> >
> > >                       #reset-cells =3D <2>;
> > >                       nuvoton,sysgcr =3D <&gcr>;
> > > -             };
> > > -
> > > -             clk: clock-controller@f0801000 {
> > > -                     compatible =3D "nuvoton,npcm845-clk";
> > > +                     clocks =3D <&refclk>;
> > >                       #clock-cells =3D <1>;
> > > -                     reg =3D <0x0 0xf0801000 0x0 0x1000>;
> > >               };
> > >
> > >               apb {
> > > @@ -81,7 +77,7 @@ timer0: timer@8000 {
> > >                               compatible =3D "nuvoton,npcm845-timer";
> > >                               interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEV=
EL_HIGH>;
> > >                               reg =3D <0x8000 0x1C>;
> > > -                             clocks =3D <&clk NPCM8XX_CLK_REFCLK>;
> > > +                             clocks =3D <&refclk>;
> >
> > Not explained in commit msg.
> >
> >
> > Best regards,
> > Krzysztof
>
> Best regards,
>
> Tomer

