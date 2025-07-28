Return-Path: <openbmc+bounces-407-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86866B13A41
	for <lists+openbmc@lfdr.de>; Mon, 28 Jul 2025 14:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brHS95x9mz307K;
	Mon, 28 Jul 2025 22:13:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753704793;
	cv=none; b=YnMT+5eq02g7iHP0OBDNyef4UOe9twGxlrH0WQFJaNrdoPpD8MXGesjwKnXsTth4kuElgj81qfZx+XACb8GXLeCuDT9MFvpxNaqiOxT0NVpnzkZwF0+D50SkbLP9Arh6gWIWGMlx8gGiUFD7ddYiePlyvwP6Qm4OYxzSkw3ruiPnlpmd89YaXr61hCJSNxYogve8zst9uOApHQlgoB04qW10C1yWHs1MowfTD8fEJxvBpF6JAgFoK4y1JUE+5dPh6Jt7O9UGFG9VW9l5QHR7BZtRC0gndMDozus3qGb4dXWDU+hatZ6i7PVnlZAbvj4DE5pQEK/dWi7T74re/GD8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753704793; c=relaxed/relaxed;
	bh=Zsezd7035FWrqFWuFHCh68rbnE7LES6kmMFx8Udf+XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wkzj9fRmJ8MmkFcGV1uYPFpALM4Vy/8PEwm9ffszesQl1MnGVkyKviimGb1kj5/Gt+HQ4qPW22HDb3niDvSRpimzc3CksxCPTHXOvehaEkm+NYehpvUNfmffAojk/VOWllw4wWVjOjrm2n/OqlaNDCswAEe/C8Jqcs+ythE6nKhz9JabcvR5crK7U196X4k4YAxd0DqnrxARa+KYDJDA0T9q/9pQed36WhqyShwQJ0rdwA1vSdg8uvk8zfUIHfk+oxnZX968U+2x/UWyHvNOaBrsLBofNd9Z+ghm14G52fX4Ap9r12+NvPs6pT163UXkGCBXRPLTjYC6tFQnx0UmkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aMU7VFCF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aMU7VFCF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brHS76Kzrz2xRq
	for <openbmc@lists.ozlabs.org>; Mon, 28 Jul 2025 22:13:10 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e8986a25cbfso2816357276.0
        for <openbmc@lists.ozlabs.org>; Mon, 28 Jul 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753704788; x=1754309588; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zsezd7035FWrqFWuFHCh68rbnE7LES6kmMFx8Udf+XY=;
        b=aMU7VFCFnjjR975Ko1TYWTMuFCMUCxTa0VDkhOfUJpYDnwo73gshmAozXfDvnBS2r1
         DIVwmP1XPclq4rVU5YCS9PmxfRTC2AaaoVmJ3oIw/8yxSYKFFIVh2O/vf2r+rp6a2qYw
         nysXNWF9u6onDz7PiL/dYXXjIvakoz15LTpGKGZwSmbL37HFTJGUKutfIx5pGi1AD9NC
         bzc5jlLyTJJskGaXPyz5LsqjIuaI+XX4PALEt/GHYH8oC48Hf9uofAN/zUbFHSZVP2yl
         Vxl0CRWBYnZO9tOohEGTDCUQ7ckXHRMHXJDj/XkEasVRx0PSuJ5Dy//A9xs21aISR3WW
         Hjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753704788; x=1754309588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zsezd7035FWrqFWuFHCh68rbnE7LES6kmMFx8Udf+XY=;
        b=DrP0vetnimBO2YjOFPy78vyAWEZUtpKf1yMMe2roe16Zxy11qtKGDxIENEZdv7hyKn
         nomDZ8xYGc0Y8o8sNe2SXUrvmRVBPiCCzNTzpPwdJVUD1EgiZQ9lhbspz3IBmPAvEqE2
         lBLMksniCxcJfuZXn8RlKRPhW27xe0UkV5N4h0Q1lsqygcQhhglb8xm5YivFfB4iyFPr
         JaB3MNanHBWUcUWDZPy2TRGodC23HODl0NMbFsUu3AIU4D3GdH/6agNAMkpKhmo9ioHf
         SZ//xnuQ7AMv0fTGP+e3uauSRPw7hX11642BLirK54bP6IV66mu8UPNCcUdsAxKbRpJl
         nHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW3evZvtiOUHskGred2WnZwg5Or1EquX/hmZztEkwfryoO+hzgf1eD7PK0nVQqRVCaOKHumOt1@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBP+RUJu7LUWbAZgBeqswWHgVP5BIIjXTTfj3I5Jtxaf8M0Nkb
	ihe6P00/n4mvFlj8xcytHMZHEsHMxEmSGxBlOlL2mAVNiBWDM0MB0Q53jBCpeO4kkNIfD2zjV0Z
	EKhcomtGte14inxatGf9k5EV0DpHOyoE=
X-Gm-Gg: ASbGncuWQTcd6vw5u6Hrhh520NHrGUmZZp8auFjUY8OGffw0VDDsy+f5FKECfoWmI8j
	DNQFHH4+yYFLy7oxZuyUk+sNvDzwff7TewwvN1PWoWhNlorqJWALEwAi+LlOq/+9fTEez5njHLk
	Y4Qgi7x0hL/FUqVrqfQFej827nBuCxbQojnznQKzXJjvpSuHeawd9astErLOgLJ+Nst5kvPRTsK
	BQD3gB6TfbM5b0IdNo=
X-Google-Smtp-Source: AGHT+IE8FetLs5kAG2M95H1SElMF1ElnmLebXhF8d1vIxkrificfFFIDGgsiSxE7aw3pmWHgxRWdkzdSkbDxAbeKrdU=
X-Received: by 2002:a05:6902:120d:b0:e8d:72e4:d9d4 with SMTP id
 3f1490d57ef6-e8df113b799mr11716674276.16.1753704788230; Mon, 28 Jul 2025
 05:13:08 -0700 (PDT)
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
References: <20250717135336.3974758-1-tmaimon77@gmail.com> <20250717135336.3974758-3-tmaimon77@gmail.com>
 <91119587-789e-485d-9cf1-da2c500f241c@linaro.org>
In-Reply-To: <91119587-789e-485d-9cf1-da2c500f241c@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 28 Jul 2025 15:12:57 +0300
X-Gm-Features: Ac12FXzZw67wcluhlx6LMwL2nF0Ah8oDkSDAC4rYqJ1oF1eanGYALYu78M07rHs
Message-ID: <CAP6Zq1gN28y-6_OwnzMbJ+EiubtABVw+FUqbmAo5bvBW-5tDdw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi Krzysztof,

On Thu, 17 Jul 2025 at 17:25, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/07/2025 15:53, Tomer Maimon wrote:
> > Enable peripheral support for the Nuvoton NPCM845 Evaluation Board by
> > adding device nodes for Ethernet controllers, MMC controller, SPI
> > controllers, USB device controllers, random number generator, ADC,
> > PWM-FAN controller, I2C controllers, and PECI interface.
> > Include MDIO nodes for Ethernet PHYs, reserved memory for TIP, and
> > aliases for device access.
> > This patch enhances functionality for NPCM845-EVB platform.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 445 ++++++++++++++++++
> >  1 file changed, 445 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index 2638ee1c3846..46d5bd1c2129 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > @@ -10,6 +10,42 @@ / {
> >
> >       aliases {
> >               serial0 = &serial0;
> > +             ethernet1 = &gmac1;
> > +             ethernet2 = &gmac2;
> > +             ethernet3 = &gmac3;
> > +             mdio-gpio0 = &mdio0;
> > +             mdio-gpio1 = &mdio1;
> > +             fiu0 = &fiu0;
> > +             fiu1 = &fiu3;
> > +             fiu2 = &fiux;
> > +             fiu3 = &fiu1;
> > +             i2c0 = &i2c0;
> > +             i2c1 = &i2c1;
> > +             i2c2 = &i2c2;
> > +             i2c3 = &i2c3;
> > +             i2c4 = &i2c4;
> > +             i2c5 = &i2c5;
> > +             i2c6 = &i2c6;
> > +             i2c7 = &i2c7;
> > +             i2c8 = &i2c8;
> > +             i2c9 = &i2c9;
> > +             i2c10 = &i2c10;
> > +             i2c11 = &i2c11;
> > +             i2c12 = &i2c12;
> > +             i2c13 = &i2c13;
> > +             i2c14 = &i2c14;
> > +             i2c15 = &i2c15;
> > +             i2c16 = &i2c16;
> > +             i2c17 = &i2c17;
> > +             i2c18 = &i2c18;
> > +             i2c19 = &i2c19;
> > +             i2c20 = &i2c20;
> > +             i2c21 = &i2c21;
> > +             i2c22 = &i2c22;
> > +             i2c23 = &i2c23;
> > +             i2c24 = &i2c24;
> > +             i2c25 = &i2c25;
> > +             i2c26 = &i2c26;
> >       };
> >
> >       chosen {
> > @@ -25,12 +61,421 @@ refclk: refclk-25mhz {
> >               clock-frequency = <25000000>;
> >               #clock-cells = <0>;
> >       };
> > +
> > +     reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             tip_reserved: tip@0 {
> > +                     reg = <0x0 0x0 0x0 0x6200000>;
> > +             };
> > +     };
> > +
> > +     mdio0: mdio@0 {
>
> Huh... this should fail checks. It's not MMIO node, is it?
No, it's MDIO node,
https://elixir.bootlin.com/linux/v6.16-rc7/source/Documentation/devicetree/bindings/net/mdio-gpio.yaml#L48
Should I modify the node name? If yes, which node name should I use?
>
>
> > +             compatible = "virtual,mdio-gpio";
>
> where is the reg?
It does not include reg in the mother node, but only in the child.
>
> Please confirm that you introduced no new dtbs_check W=1 warnings.
>
> > +             gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>,
> > +                     <&gpio1 26 GPIO_ACTIVE_HIGH>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             phy0: ethernet-phy@1 {
> > +             };
> > +     };
> > +
>
> ...
>
> > +             reg = <0x05>;
> > +             fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
> > +             cooling-levels = /bits/ 8 <127 255>;
> > +     };
> > +     fan@6 {
> > +             reg = <0x06>;
> > +             fan-tach-ch = /bits/ 8 <0x0C 0x0D>;
> > +             cooling-levels = /bits/ 8 <127 255>;
> > +     };
> > +     fan@7 {
> > +             reg = <0x07>;
> > +             fan-tach-ch = /bits/ 8 <0x0E 0x0F>;
> > +             cooling-levels = /bits/ 8 <127 255>;
> > +     };
> > +};
> > +
> > +&pspi {
> > +     cs-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
> > +     status = "okay";
> > +     Flash@0 {
>
> DTS coding style, naming...
>
>
>
> Best regards,
> Krzysztof

Thanks,

Tomer

