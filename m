Return-Path: <openbmc+bounces-679-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE9CB8DDBC
	for <lists+openbmc@lfdr.de>; Sun, 21 Sep 2025 17:56:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cV9pH03jXz2yvv;
	Mon, 22 Sep 2025 01:56:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758470182;
	cv=none; b=Mgr8Azh6PJJl9g7iX0F1J2sNSy+CtpYkAxFgdT5CiskEfrrfDGWqzUeqjMlCxsB+qltehQ2z937TBBQXdhnsJ5nJV+Ra40B+6h1t3u6iYQUAtCQo092P7FgXAbQ+yMmwJUZLK6uI4nxLb0ZSaGigckxE3KJL2MJr7ab3ZTh4mXxkpLmNehmDlDYypntiHj2T/E9VHMNJ+WAhO3MVlRVU64uNzNRXOGQGtNiztoGCGpBiqA4DsNBwZC/Z7Sw7MSePpGH9OYVgx11LCbF1fAgVVV2Ye/3vn6MKHlmWbO7d3eBkDOCvyyp5IXC0SDquZkSyfhWveomaYxQYauJi21RHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758470182; c=relaxed/relaxed;
	bh=RLKMCTLJtHM1Lwpq0qmHNGY4yNV1zxLW/dk1qzk5zZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBxlEq1wDcRMI44+g8pjNMFQVTjBJWcPxS3/znDPqzoPWXUJfsayabR88CRhAKZpDB1jGkl+wr0kAVj84ws2SFx2RHo1+q1d2ELtkvj3eP7PGZiHtv7h4+veNVXnRzwgLiuordS/2liBtlm2/p9BBzE+xpGrmDvmHaUbn0t6rm8RWxBuQHJMTcgSzjnr//1kXmVEWklC+PQ6XoHASWoSoV025DYi/8/lx8jEDPmK7GEuhnGpU4HPEY51Zt8Ub7ymAankoo4H711RQFraewzV/JsfR6Crj19NP8LB+1IcomH9Zjzi+YJuaegqcJLrOqU3oXskN2um5FoemNcH62A21A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LJfyRVZ5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LJfyRVZ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cV9pF3ZgJz2xS9
	for <openbmc@lists.ozlabs.org>; Mon, 22 Sep 2025 01:56:20 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ea5d856ac28so2503658276.1
        for <openbmc@lists.ozlabs.org>; Sun, 21 Sep 2025 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758470177; x=1759074977; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RLKMCTLJtHM1Lwpq0qmHNGY4yNV1zxLW/dk1qzk5zZU=;
        b=LJfyRVZ5cRrqm3nm5N7THhvmOsYdzP7qo1vOn/EXilaioZD14upnf7laPhHSrpeQ6M
         xc/Gyayn/PGIfKoMFjkIu1plP1rK2GZNMczKmibzKHkC5fi8Xp4igzFvPTOuS55TTBuG
         k0KQVbBvSUSbz2ItKg+ceGHjdgRoRG8D1dtz/JxPgchSlB76F/PT+sxZEma8FbMpK83E
         C7lJidy/65MKx32Ne+RY+t1JE1etLn1H4ISzjACxYI8ktOmquiRaQB6JBY8NBagCMIE9
         5JZ5Lqbqc8vCR2+j3DI33iVlUHmKMOOovnwvjWxqzYi9YXGgv9G9SVXGOLTn5CMk3Mu3
         j+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758470177; x=1759074977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLKMCTLJtHM1Lwpq0qmHNGY4yNV1zxLW/dk1qzk5zZU=;
        b=aO/Of+hG26tU+9XejgnN4Qr20t8DEpKYcINb3a1gtYZ0m0eDsSwWmiPiZ7hQQen8M9
         37V9FTwxYKV7uUZMKl+Nho14ytmx8EN6X0U5Y6df9fNzt6VjQj7ZWqz+FveT3mnSF/eS
         XcLTasoLqe/HYcUqoAUXZ8JZJ9drmw4qjLL8RUQRpTUigHbpFxa2yMbdgFgzZZNR50P1
         J0HhbYfklPUF/2Dpkmcx14A6TIHwdK3KR3s2nOqAC9JHmSGeJaGfHq4Snt8yEjF3rXCf
         GoBLqpXDtMrGXQ37b/egNYh6dSc/xXTVbRJ6KttyzFQOYPIW6hF23r9WYucdB45DgKxF
         Q21Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKFp0yujJ9IGdMDTafdDSADjA7Xn1Dvhmsn3KV8hlD2cAGeoYS1vOcoyZWY0H9QDaOsh3Oh7D5@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7ZTTqzLKUW59U+lohGrJzLTWbaVIWtEZw2ldiVNOhwloKDvf1
	c3BJjLMWq5MmnEuXIpkEveoZb/mn4C2MX1KkU+ZODvLxxb1mDnuKw8C8760Ve++w4gp8dH/Jia7
	D1sRkLY+f5tegKsTFwIKIuXlzdj9r/zI=
X-Gm-Gg: ASbGncvQgy7gHh5BPkvKQb8QQi9RmSgmHPy1mFPjumGmeO+MWJwgVpLpVdd2DJ488fs
	PtSaycvmUqoZp9PGcnSpi1LQF1bzULwDkJr/fVvuWuXDN/u3gSSXrMY5YiStm/dTI+tP0jzKy9+
	j+y6yFk6bVHBa2esHbNnzK4JaAUJ1/E17KaPmfT/OT4jmc/+oyjutTRcFu2Yc0B5dkZisr6VWFe
	8a3i0sV
X-Google-Smtp-Source: AGHT+IGgO+X7miV6LNYKAksD5CC+FlAiqo7XuJwAT3QL4jWCwKxajPkFDuayvhoiIhJp3qESyCFtQ3Frh8GV2vrPVUY=
X-Received: by 2002:a05:690c:338f:b0:73c:2f51:cac2 with SMTP id
 00721157ae682-73d3d530629mr87539337b3.45.1758470176723; Sun, 21 Sep 2025
 08:56:16 -0700 (PDT)
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
References: <20250908125938.3584927-1-tmaimon77@gmail.com> <20250908125938.3584927-2-tmaimon77@gmail.com>
 <bee023bb9b2ccb3e2437e466190dff2304268db9.camel@codeconstruct.com.au>
In-Reply-To: <bee023bb9b2ccb3e2437e466190dff2304268db9.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 21 Sep 2025 18:56:05 +0300
X-Gm-Features: AS18NWDKVTz6-nhMqj63jLLM1lEB2xxFv9djsAQVtO6xKVU4pzQViY5NfGj-uLY
Message-ID: <CAP6Zq1j83gOX0vGX3tR09c3S4_DSX4uCcM8TqbFxeP5zXNn2ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andrew,

Thanks for your comments.

On Wed, 10 Sept 2025 at 10:52, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Tomer,
>
> On Mon, 2025-09-08 at 15:59 +0300, Tomer Maimon wrote:
> > Enable peripheral support for the Nuvoton NPCM845 SoC by adding device
> > nodes for Ethernet controllers, MMC controller, SPI controllers, USB
> > device controllers, random number generator, ADC, PWM-FAN controller,
> > and I2C controllers. Include pinmux configurations for relevant
> > peripherals to support hardware operation. Add an OP-TEE firmware node
> > for secure services.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 702 +++++++++++++++++-
> >  .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
> >  2 files changed, 708 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 24133528b8e9..7f120da3310a 100644
> >
>
> *snip*
>
> > +               fiu1: spi@fb002000 {
> > +                       compatible = "nuvoton,npcm845-fiu";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <0x0 0xfb002000 0x0 0x1000>;
> > +                       reg-names = "control";
> > +                       clocks =  <&clk NPCM8XX_CLK_SPI1>;
> > +                       clock-names = "clk_spi1";
> > +                       pinctrl-names = "default";
> > +                       pinctrl-0 = <&spi1_pins>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               fiu3: spi@c0000000 {
> > +                       compatible = "nuvoton,npcm845-fiu";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <0x0 0xc0000000 0x0 0x1000>;
> > +                       reg-names = "control";
> > +                       clocks =  <&clk NPCM8XX_CLK_SPI3>;
> > +                       clock-names = "clk_spi3";
> > +                       pinctrl-names = "default";
> > +                       pinctrl-0 = <&spi3_pins>;
> > +                       status = "disabled";
> > +               };
I don't need to move the FIU3 node as ordered by ascending unit
address since the FIU3 node is a part of the FIU's group, am I
correct?
> > +
> > +               fiux: spi@fb001000 {
> > +                       compatible = "nuvoton,npcm845-fiu";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <0x0 0xfb001000 0x0 0x1000>,
> > +                       <0x0 0xf8000000 0x0 0x2000000>;
> > +                       reg-names = "control", "memory";
> > +                       clocks =  <&clk NPCM8XX_CLK_SPIX>;
> > +                       clock-names = "clk_ahb";
> > +                       status = "disabled";
> > +               };
>
> Can you please audit the patch (and the rest of the dtsi) to make sure
> all nodes are ordered by ascending unit address, as per the DTS style
> guide?
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes
>
> Andrew
>
> > +
> > +               mc: memory-controller@f0824000 {
> > +                       compatible = "nuvoton,npcm845-memory-controller";
> > +                       reg = <0x0 0xf0824000 0x0 0x1000>;
> > +                       interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +               };
> > +
>
> *snip*

I see disorder in the upstream dtsi file, for example, PECI order. Do
you suggest fixing it?

peci: peci-controller@100000 {
compatible = "nuvoton,npcm845-peci";
reg = <0x100000 0x1000>;
interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
clocks = <&clk NPCM8XX_CLK_APB3>;
cmd-timeout-ms = <1000>;
status = "disabled";
};

timer0: timer@8000 {
compatible = "nuvoton,npcm845-timer";
interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
reg = <0x8000 0x1C>;
clocks = <&clk NPCM8XX_CLK_REFCLK>;
clock-names = "refclk";
};

Thanks,

Tomer

