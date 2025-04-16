Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59FA90B8F
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 20:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd90x1RBhz3cS5
	for <lists+openbmc@lfdr.de>; Thu, 17 Apr 2025 04:44:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744829054;
	cv=none; b=L0g6U85P2B+LO6ASqv2SlwpunJvc/G5+8OPVZEbDWUo9G28/5Uu3k+mtvNDfe+m4cIow62qWL3dcDpyvo88HViZz0Hl1ABfD/QyM+IN83zoVdsjlQ3iumGJ1eUfZaQI772UOmInk02I1r60F2r+FYEMIt9jWYIughUywwvbCiz/fTcOTHyNm9yFNxR/sULjfHC8wjBtg0+qvvJK9D+sBMMuPrVe8DCmPmJi3Z/UiiJfXRTBia5Ey3+IKimfLvHhBpnD248fJ3qP9Fo83G/nBUfzV5Onjw0gUBg7Yx4E786MXhOZsfn3Iqi+GC7o0C0JxnUb0QUXbqW3DczMOjoMyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744829054; c=relaxed/relaxed;
	bh=9L7mgnCNt3Zcj27rYN9qHZPaxHK5LZvqb/g7txzNM8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIuZ4gImex0imVG0tz2dGrYS9NMh1ticUIVzx1l5BOMW7ndipsAZmYbl1t7K80q5vmRJkieI9c4/xJ+RnvKc0ot6xFvr+hHTb5qOd/lwBKbg0LUlYWLbpgxKVEWFyrlsuCRJvfSMiWF8ezNItGrE0pNi2LQaYiHu5poyotpF08gad1lhpWX/DTj0v6YI+hP8Eg98iWiccLi/6c0Rd9HuAGqjmZav7mp2FNbxkwu7mglER14YQnhjKUAmhNTuw7WWYYFuWjPnYoXH6zAfQAb1EwtDUra4qAmUd3AjuwCdYXPjtuZbNzIm7WJr4WFpoMIMYfTaMHomR5ZFVuk9ltiXQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JQp1HhnX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JQp1HhnX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd90s3zp1z3bvf
	for <openbmc@lists.ozlabs.org>; Thu, 17 Apr 2025 04:44:12 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e461015fbd4so2696276.2
        for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744829049; x=1745433849; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9L7mgnCNt3Zcj27rYN9qHZPaxHK5LZvqb/g7txzNM8o=;
        b=JQp1HhnX4ybMXa0SA1l16AE9+fXvzRCE4p1G1z7rPYE/32fwW9aFfA/GgSALMq5pEY
         kQGtxfwd3kx5ifCeiLeHfjeGxkgNh/s+MW0r68ZyDQidlzdl812QLVElhxf/U+FlcNxD
         wBKv8CSD9WcQKGLGX7UA3Shko079OiXX5Q1EmyRuaCzLvTxcwUwXbnU9BKm73SH+KgLh
         AOWDobwGNC3zyAp3tyPHKmUChhiy+x4QQC2thtWO90peEWmWv6/H6p9KSAlKu8FFoPYy
         xlUgLq0KVR+SUhtCRncxKsJ3yyWhJ6MigbQEtKYQNwP/UPguFoGAs5BdYlIGUiQMWCSl
         TccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829049; x=1745433849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L7mgnCNt3Zcj27rYN9qHZPaxHK5LZvqb/g7txzNM8o=;
        b=IbQ470ZKgQJZxpcrHAMk4bBUqIljGXMb415ANjDw+Yo9Wdl/akqrknw+OdxS+YoBx0
         NFUYL8v1LKmmzQyzfTbHJJ+WSMxE+npF3AhQmCNiQ5+MW7XYx+Q0tNTv5qu11+H60LzA
         Uff83AC3uQJXK99j5ARJWaDjpKSJ+93VCPRjn57Y1qL619pK0UtgcT1INTthYxiD+FnZ
         ibqfqfBVrUJIKomobrEPE982Xs3Z+3wXMltYAeRWLY2CpbiarcqsoTZE+ZysUw0xeXSv
         tvKFwsC9eMQTIsssPOMxonadfweeQKBRvsA64FEzqvesp0yh+B4tmmgLoHPMf5vAyHuq
         nKPw==
X-Forwarded-Encrypted: i=1; AJvYcCUmMVj3vI9kt0FzUWV5VJ95qoXQJk0t0q5KsaJ11uRnBrLoxelnZv4bHLrxv0A5LEOIkc2iJYB0@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxn7l6Aj5g0qGyhagRNHCxdc9KDjkVFVcSs5dHaugGgQgvR4mNp
	XVvujVXfxikuU0ZCrF4JRO5OBVutzqELVJ2ZTv4mK+E4Q+n47cflcxQso1yMRkfpy81zWbvDLEQ
	bjFERhb7wFUY6ezbe5+ScIkabJUw=
X-Gm-Gg: ASbGncttRTRUlg1hOXy6K7mczaepwmZtjBQZG+CO+ysibZN37ks1dZxCAzVT6QWaWGf
	l3CQpcyVjwaBNtfL0ZaToGovi6uX+n6X5678UE/BtdIn5iLDvnNS31cRs/BLp2KXYGeou/Ba8rd
	f65xUxJBIjOvG/P+SXTtTKVmY=
X-Google-Smtp-Source: AGHT+IEEBGywpXm1UW45uwOGqb7UdYKdiM+qbWRcwxBFHDyQXsY3vRbyD9GoL5p+AQKSEba/9aW56/65sg2UtuDOAQ8=
X-Received: by 2002:a05:6902:2e0f:b0:e60:b04f:c191 with SMTP id
 3f1490d57ef6-e72757ec530mr3998015276.16.1744829049649; Wed, 16 Apr 2025
 11:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250415232521.2049906-1-william@wkennington.com> <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
In-Reply-To: <79400920-22b4-4bce-b204-c58087495c22@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 21:43:58 +0300
X-Gm-Features: ATxdqUFPu4JepknFDDO-V4GlcrbJC_4d8VB1hYrlUJdQoMVkkJLheWUWjlaMw8A
Message-ID: <CAP6Zq1hURTrDgScx=eN_GO5FV8vZNsaGVQLOxbZPCXSqc0Kxwg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, "William A. Kennington III" <william@wkennington.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

William, thanks for the patch.


On Wed, 16 Apr 2025 at 09:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
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
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index ecd171b2feba..4da62308b274 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -47,17 +47,13 @@ ahb {
> >               interrupt-parent = <&gic>;
> >               ranges;
> >
> > -             rstc: reset-controller@f0801000 {
> > +             clk: rstc: reset-controller@f0801000 {
> >                       compatible = "nuvoton,npcm845-reset";
> >                       reg = <0x0 0xf0801000 0x0 0x78>;
The size of the registers offset is 0xC4 (last register is at offset 0xC0)
Therefore, the reg property should be modified as well to reg = <0x0
0xf0801000 0x0 0xC4>;
>
> So now it lacks quite a bit of address space. This must be explained in
> commit msg.
>
> >                       #reset-cells = <2>;
> >                       nuvoton,sysgcr = <&gcr>;
> > -             };
> > -
> > -             clk: clock-controller@f0801000 {
> > -                     compatible = "nuvoton,npcm845-clk";
> > +                     clocks = <&refclk>;
> >                       #clock-cells = <1>;
> > -                     reg = <0x0 0xf0801000 0x0 0x1000>;
> >               };
> >
> >               apb {
> > @@ -81,7 +77,7 @@ timer0: timer@8000 {
> >                               compatible = "nuvoton,npcm845-timer";
> >                               interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg = <0x8000 0x1C>;
> > -                             clocks = <&clk NPCM8XX_CLK_REFCLK>;
> > +                             clocks = <&refclk>;
>
> Not explained in commit msg.
>
>
> Best regards,
> Krzysztof

Best regards,

Tomer
