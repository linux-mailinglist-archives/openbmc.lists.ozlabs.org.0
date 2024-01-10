Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E80829BA6
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 14:48:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hwe5zMTg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T98Jv37Fkz3bnK
	for <lists+openbmc@lfdr.de>; Thu, 11 Jan 2024 00:48:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hwe5zMTg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T98JG3Cfyz2xYk
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2024 00:47:56 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5f68e2e1749so35023967b3.2
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 05:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704894474; x=1705499274; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F+Dl/Il2vrbZxDbYc+SRyVGBLpDYXTxt7Tb1vd4cwvQ=;
        b=hwe5zMTgMLiLlGzLA3dKRmuCssal5yvEAkWH0iW6oALu1f1SmvG5dZkpg4fEsZNwa9
         daTBULGb0mLrKGSjzNIaLsiogs+Ozv0lD4hJZP2vv8Zedebski19CKWmfxKhWcYT2bG1
         oKdEy5VJ60OTzMOgU0HkKJYlIlfTiy5Gbs6WEup8HLL3Ez4G2mi5f40xrOseyNdT98h9
         8BxM308x4HS2Ap/+PziXna7u3JkT1G6ztNgdF2041ABcbj9WXFNJpNa7Kbtqn4B4sj6Z
         KPZSPlvt61Uuv7APWBvICNg/namwG+rSqym98PyYcJxeFUQ7RkS8N6ov3Z8E2fXfyYTV
         Qklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704894474; x=1705499274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+Dl/Il2vrbZxDbYc+SRyVGBLpDYXTxt7Tb1vd4cwvQ=;
        b=euo5C4DXtXhowyOuC4JbP/fH3Nr8bg+Tyn2AO4jgI4+h7rdFE9mNH9JyEBhSePzmKC
         IUkabKsIxpFh9gF1i0qBt/e3qdVHDcFYySp3YiLpxJ73zSzrgZT6ZuXh3JTdP2FPdhOT
         Xt/Y16/BxdwOeUUofrhAtUDc3SR+I5fu4PgXTT8PS4e9ro6DYCnawtxUK1faJKGvuc30
         8dwrqoU5atrKgGdJe3hwxuCCBoFmruKl+F5UPazQ0fJuZH+0e9Jl2qFWF8fLCeHinQhD
         LsvI0yMtKZSSXStpVSJRQbIctl6JBXB22NY71DwfmBijvaNlUQwQjI/Xy7HJENahUvb5
         2wsw==
X-Gm-Message-State: AOJu0Yw2uT+Ug1ewsiB4pvVRp+XWLyn0r8V5mK0QgaJHW8VRbnz+QZaP
	u4TwOBMmvrPZbuPhTzbKTeUPo2VlhpR4h0FGl+I=
X-Google-Smtp-Source: AGHT+IF5GSh+GAYoRYse0osNDKjpebp3XYF6+cNYz6K9Yfp6hvlCj7DACrSbLrXqYpd5qwBs2GWfV/3aVWO2g9Owgg8=
X-Received: by 2002:a0d:eb07:0:b0:5f9:25b:398b with SMTP id
 u7-20020a0deb07000000b005f9025b398bmr855139ywe.52.1704894473970; Wed, 10 Jan
 2024 05:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-2-tmaimon77@gmail.com>
 <20240109170830.GA2772086-robh@kernel.org>
In-Reply-To: <20240109170830.GA2772086-robh@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 10 Jan 2024 15:47:42 +0200
Message-ID: <CAP6Zq1jCHVrFfRa6c3DZ4t2aaJTkWukeEkia0AqhzppC0mjbfg@mail.gmail.com>
Subject: Re: [PATCH v22 1/8] dt-bindings: clock: npcm845: Add reference 25m
 clock property
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your comment.

On Tue, 9 Jan 2024 at 19:08, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 08, 2024 at 03:54:14PM +0200, Tomer Maimon wrote:
> > The NPCM8XX clock driver uses 25Mhz external clock, therefor adding
>
> therefore
>
> > refclk property.
>
> 'refclk' is not a property.
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/clock/nuvoton,npcm845-clk.yaml      | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > index b901ca13cd25..0b642bfce292 100644
> > --- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > @@ -21,6 +21,14 @@ properties:
> >    reg:
> >      maxItems: 1
> >
> > +  clocks:
> > +    items:
> > +      - description: 25Mhz referance clock
>
> reference
>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: refclk
> > +
> >    '#clock-cells':
> >      const: 1
> >      description:
> > @@ -30,12 +38,20 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > +  - clocks
> > +  - clock-names
>
> New required properties are an ABI break. That's fine if you explain why
> that's okay in the commit msg.
What do you mean?
Could I add the new required properties to the required list?
>
>
> >    - '#clock-cells'
> >
> >  additionalProperties: false
> >
> >  examples:
> >    - |
> > +    refclk: refclk-25mhz {
> > +        compatible = "fixed-clock";
> > +        #clock-cells = <0>;
> > +        clock-frequency = <25000000>;
> > +    };
>
> Examples don't need to show providers.
>
> > +
> >      ahb {
> >          #address-cells = <2>;
> >          #size-cells = <2>;
> > --
> > 2.34.1
> >

Best regards,

Tomer
