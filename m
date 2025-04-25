Return-Path: <openbmc+bounces-7-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ABBA9D419
	for <lists+openbmc@lfdr.de>; Fri, 25 Apr 2025 23:23:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zkm6y6Vwcz2yST;
	Sat, 26 Apr 2025 07:23:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745616234;
	cv=none; b=n2RNclqjTMQDVphW0Oy11mBznhmCNchdZ90ieQ8N+uudtuar3+10JepqPIH7m9Yl7yXGXcYpgg7/PFC9v1hJCZcRkrGhhad0HiKJASs/AVLKjtJNCv9B7woNLsb0G2pHcali4gpKcjwf2TVgMlhMwKVZE9tqDB6QIpLUTPcz3Nc510uTxqc2oGgXlZo2o1rsEchLgNTCh+3Q/Qv9uNqo1NzHl4yeLub2e9q3dVFViFrUR/rfDXnAeBgt2K7a961oA5g8XtrcjnpvywEcFRjpzAu4wlS21jC7dT0nZBFF3lkwb1KvgeqI4p1seWEsDrY3lLPFzujgX9P4ZtyxN2YWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745616234; c=relaxed/relaxed;
	bh=+N5ZXuPJmZuQc99xAAjLNXn6gwTktfd4X1GnPJKgrTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b768SvqofAYLzzi6ym+H5+c/0n2j1/ah9tX3HC8udNaZCNOqMFRtmXB6FQKBHTokpzKaKfgwCdnPUajKQoXKKU2o26PGey/jFx/QbYkpxtms6DwnMtUrmWrgyFq5bTcplsK6QpfZ+HKu/jmfhYieT70NKBcUiVp3SvxXYVLyqi4Y1UWBmA9vdIdK3/lfPm/oc7C82NPlEqBMtf6WDTCk7M+eksoRQjgKcHiSVnhAJ4r+ZMf1Ot/OSWvU0rMlpX9hULRNjlRxY3ixcaDbP5e33uR5uTOZWb3gQ5H3cTAATM8w7bRTt7qeIVYrzukcNWEQhSFIhVCqPjOrDrdAzTgODw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=zaVWFcyO; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=zaVWFcyO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zkm6y1BJxz2xmZ
	for <openbmc@lists.ozlabs.org>; Sat, 26 Apr 2025 07:23:54 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7376e311086so3722647b3a.3
        for <openbmc@lists.ozlabs.org>; Fri, 25 Apr 2025 14:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1745616232; x=1746221032; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N5ZXuPJmZuQc99xAAjLNXn6gwTktfd4X1GnPJKgrTQ=;
        b=zaVWFcyO3ZSoERpcbjIxGOC1QgKGDo3z6VVi3PQOo4UV2KGVyMeyrcGCmFoxYHRBZm
         bZzni2t0bQcc+NgGWJibd1gJAt0oT8OH3Pf1FvxiWn9vYpH+SP97GEr667E9irHeZFbj
         oRGSiAnYOhXusHg8yCXF5N2m4C4ynSVa89FaNBzOa0EVp9Nrb4X69bm+cM4E+gzkvbPr
         QGi41cqab4hCKd6EkKS6TmkHeP9fEAhFOPvAMXzdS8JPjIsTxHM9y/K7ngmxdKw47Lp/
         t5b8qY41WvNO0PwGD6LjieF2fG/ByF1ZNmKLplB1IKo8TShEBlwf953AtJ3cHNuMWg6F
         AwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745616232; x=1746221032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N5ZXuPJmZuQc99xAAjLNXn6gwTktfd4X1GnPJKgrTQ=;
        b=T4w4SuaMt+IjfxiYof6Cjjn8SsgQomH6G07lOYYTxN1O9u7Hqlt3boZTPSie3W+YVU
         FdMeR/p7MXvT2rl4S6zkOqLMynLIbly5Gw5A913lGaY9VIX/V1+Jd0D7s1ijPXJaVgUy
         GK8G8FRFiC8bi9ubKHa0X+vRXQQzZyBYQrqqSIfqNgCwXBa16RRzMZoqXVS6DU3D/b/h
         83xcKfjnNnLa6MYDvGJgX8mg0zDubS0HwcvduemBzw1EEu4msGdMykAlEcqwRfiUQpKS
         enqNVLwTJbvB5FFmEVz15Qtm/EcnPDlpUsAeTE+Q0wN6H1EX5lksekDMbf+xuILfAtCA
         cAiw==
X-Forwarded-Encrypted: i=1; AJvYcCXgrkl+OVmPr0L35hURRE5PSZzDAOeXeqyx5PAggrY+TfY31ZX3hR+P6qNvE2zXtrc+WqfcRsxY@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZ4tfrtMr9jDht4WRni3wyLjv6z0AFUTNDQZ7KR/KLhhwQRn7f
	d4/00l6femOaCpRChjGFThkcmRqA/SwsBvYjJM2unIzFPMqGjGJpH26cR32Y6ANoNS6UmJXKblZ
	/pc3gcGqweJQkNF2nsF7G7GoCTN4wBPXxLw8zeg==
X-Gm-Gg: ASbGncvuT6U5Of1BYoA1Ti8JhVA6sr9xYJjiS4vYdiFBj0TexwAlwUyhDMVmUsQL0o3
	aHFwcRRS8/KaJq+8dnGIaUEwXNnqB6fUHuvVucBMgavUfGGe5AuHH1Icf8yTNNpVJ6fxWZsYeMA
	OIUfNS+Saapc2LyfYsalEI1iWbv5r9oEhQRTIUEzrmyLEgU5O+lw/wvmmT
X-Google-Smtp-Source: AGHT+IH+WQDBB3Fu5VlR8Kv3UYAY96aM8bor7T9EYDlIflZy5YU3g1UQDmsgBf7vxIY/GCfD/PZwqaR5JdJt/p7ts+g=
X-Received: by 2002:a05:6a00:3914:b0:736:ab21:8a69 with SMTP id
 d2e1a72fcca58-73fc7a58aacmr5584385b3a.0.1745616232120; Fri, 25 Apr 2025
 14:23:52 -0700 (PDT)
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
References: <20250416001350.2066008-1-william@wkennington.com> <9dc96af3-239f-4cb6-b095-875b862be493@kernel.org>
In-Reply-To: <9dc96af3-239f-4cb6-b095-875b862be493@kernel.org>
From: William Kennington <william@wkennington.com>
Date: Fri, 25 Apr 2025 14:23:40 -0700
X-Gm-Features: ATxdqUGHYVrfCeHb0u0tZuF5aEnGBbC2V4MOthFhY_gHe1B20A9hf7mCdE6-_C4
Message-ID: <CAD_4BXhMs4sopska1=czqWDM8nY6gswXv3LBeUGNzFWn1+7V8g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add EDAC controller
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

On Tue, Apr 15, 2025 at 11:53=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/04/2025 02:13, William A. Kennington III wrote:
> > We have the driver support but need a common node for all the 8xx
> > platforms that contain this device.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
>
> You just sent it, so this is v2? If so, then use v2 in subject (see
> other patches) and provide changelog under ---.
>
> >  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 4da62308b274..ccebcb11c05e 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -56,6 +56,13 @@ clk: rstc: reset-controller@f0801000 {
> >                       #clock-cells =3D <1>;
> >               };
> >
> > +             mc: memory-controller@f0824000 {
> > +                     compatible =3D "nuvoton,npcm845-memory-controller=
";
> > +                     reg =3D <0x0 0xf0824000 0x0 0x2000>;
> > +                     interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status =3D "disabled";
>
> Why is this disabled? What resources are missing?
>

I was avoiding enabling anything would not be used in the most minimal
kernel configuration (Kdump). Anyone actually using the EDAC data from
the memory controller could enable it. The np]cm7xx common dts also
has this node disabled, so it would be consistent with that SoC.

>
> Best regards,
> Krzysztof

