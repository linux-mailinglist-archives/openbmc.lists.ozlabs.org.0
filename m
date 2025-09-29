Return-Path: <openbmc+bounces-695-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E79F1BA8911
	for <lists+openbmc@lfdr.de>; Mon, 29 Sep 2025 11:15:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZwXT4ZfQz304x;
	Mon, 29 Sep 2025 19:15:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759137353;
	cv=none; b=BtkFFQJjOalRfx+2p10TlGcszyVtFc7buG35vIqdLCRb9NaVI3AywQAt+K3Q7DWbvp4geg5kV9TETMDkFGDEXNaCYgG8VIwHkVwM46lACld/0aMrNEZmNtXZ9rWGoYx8ikm434+n8ISfG0vu+W82Ym0ya+4kgO0csIY9eptArYySdnrG97zwQ0mrjQk9dGgDgSPUBqUg7j9F/+EycONdUEMfNnsI/uvWie9kikELszqd2RGCZYlcmBP99gsHDDqKGiXIJAQe/TzLMErPm1O7smP7qIZOJZ59NUCQdCtDgM94lQG2lOPOODX5UAAcm0rfNKP2oo0SQTKdaLJH3WRsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759137353; c=relaxed/relaxed;
	bh=Nr+N/1oAI1pLjqU6aC2+UuJdu0NBIsxDWcVl4EdcQkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/bmKqRRyHDNHSVawOgb62q+3OM6qzh33sqp+1nl5ItJMIuY7Dgnmwwgvx8R6sv/bqyzhJbjBqYkNGv25Ntjj1pBGpJiW7GCu0c0F8i8TXzt6u0zxgv1WiHk20loUdKZ2q7v9loGAJcoyide9fOjo96F2Ig7rS3yqr+gX9z61Y+W5zntm7PBd2a653V6RSkLPgqQ7ZSAM4WYSKDxrt7x4VvemrHSt0UsbcM2FABU5aXF4Wo3SyPCsa4zCcWqQyu1aVym+4fHwHCM8wfCoEJ9Z4IAbSKgqI7m2asEtyO+XsMe9faEE1X7pl2HiUmCauzjQ02K8yeYqjKNnizCBhAifQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cpQqv9V+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cpQqv9V+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb136.google.com (mail-yx1-xb136.google.com [IPv6:2607:f8b0:4864:20::b136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZwXS2Npnz301Y
	for <openbmc@lists.ozlabs.org>; Mon, 29 Sep 2025 19:15:51 +1000 (AEST)
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6089a139396so4559984d50.0
        for <openbmc@lists.ozlabs.org>; Mon, 29 Sep 2025 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759137348; x=1759742148; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr+N/1oAI1pLjqU6aC2+UuJdu0NBIsxDWcVl4EdcQkQ=;
        b=cpQqv9V+waaWLxdP/hq74rhcFueGg0CXIwvu7kAQ33zJwdRVxPArLogZXFgnpmFc/d
         Yhju507f/wpAebns4wQR13wTyq7NcWI8GynKuU4xZMJuJUP+rHtey2u6d1w11UL9PRWQ
         rKNul6+K/7H6G54aNNvcofp35a9PFQlni1fVNsXUAQQ1AdQG8eL/yzCxRDmTUhN0rWau
         tpiHHyxSa2shikL/x61+5iG7Zvrd7mO8YKO55kkIjNH6KMdENtv/gZYHWqEiOVi3JbWP
         UdfwrvGPbxrICsHOzK1Z7R85CHdbN/P4C8tSgYaYXuNN0YdRx3UmlG+asmP3xTqQI/ca
         hoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759137348; x=1759742148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr+N/1oAI1pLjqU6aC2+UuJdu0NBIsxDWcVl4EdcQkQ=;
        b=F33TyqXRqD7gm7mfjgo58cZHt6AUlYNpVWqtEG77t62y8hqUd6fvD4qrjLCbE+4XF4
         fC2/2duRTBTyRbsdDbqeUvpaqKoARpnCMcyDqqtHPwbYlfwTTTWiuDbPFl5VfjfQY/Mc
         6pa+hazoU3MhuRbBmCgvrt680TPT8kMvF5tnERkwt2S/oFVoFuOqUDJMolS0VMTZh6Qj
         +cvfJw6BX7+cr3XrK5sDd1R4nMN7nux9DBNg5rJcrAxpW54M1FgSHbwwvaO8920xZuZO
         SI3AWQDob5UVvqn2CETM9T9f8Y5ZIVxnrnKRhjt8DTbO0MT/2oyMiQ/gG1BQVTOlkcQ4
         5v0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPUhrDrN3kC85U6Oxvz3SnyEAvxhhhZCaLMGzH3ncRl/CcBnvL6oXkEICicQlnpOpwoXkbhg6m@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6o97+/EcSG7ThNKqrALXpNcsF9XTNYldUkSY2hMhfSQA70HC6
	j7IigIb5fkbGHzuI0DzxnYoWztk5b+D7qd+t6sLUO4kaE7Oks3zrMJ3ixAVrQQpZWdxLBYZUJSw
	uwhTkiNKdZIxh269pNDSURU9AZlGaeV0=
X-Gm-Gg: ASbGncsmS2AoSD7NWSLuxi8Xi2Xol8eFwkJ0ZjC9e+d8d0C/Ugk9yGi0pqODYPcRhWj
	41Ou3izied/9L18RmwthLRe2YWyuY92ToRIiveFm4uxPj1l/UelVeOAIgzf0830XtXAiH0gpJ+a
	e6DTv8LRDL7edTxYBTSVO/56O0IWBRbcFdeP7optw9TXSnq36dCHer0fvutTtpiKEGkBj7fZnZl
	r1dCFySTGhlMbxRqAs=
X-Google-Smtp-Source: AGHT+IEqG2WiadrrFUEa9J19hGrk6/NeihwO2YF4Qsh2jTfvkmzgqzQ2Ef58HmGi3ZPxOG7NeW+IecRnhi5uJO6qQl4=
X-Received: by 2002:a05:690e:1a44:b0:637:cde3:c6f6 with SMTP id
 956f58d0204a3-637cde3c72bmr5782117d50.10.1759137347594; Mon, 29 Sep 2025
 02:15:47 -0700 (PDT)
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
References: <20250925200625.573902-1-tmaimon77@gmail.com> <175890301752.880349.2331946518360447485.robh@kernel.org>
In-Reply-To: <175890301752.880349.2331946518360447485.robh@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 29 Sep 2025 12:15:36 +0300
X-Gm-Features: AS18NWBg8PJuv0n6gCvIlMejilS28fLD8rStQueT8p0_c7fgopvArq9qbAYJTN4
Message-ID: <CAP6Zq1jmmhqYu3C7KHFK2tz9zjW352Bbw4cXeOYSjNSTELrp5Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venture@google.com, yuenn@google.com, openbmc@lists.ozlabs.org, 
	benjaminfair@google.com, joel@jms.id.au, krzk+dt@kernel.org, 
	tali.perry1@gmail.com, conor+dt@kernel.org, avifishman70@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Rob,

Thanks for your comments

Most of the warnings occur because the compatible strings are located
in .txt device tree binding rather than in the .yaml file.

The only change that needs to be done is in ti,tmp100 that

Could you approve the patches, avoiding NPCM845 compatible warnings?
Meanwhile, I will work on converting the txt to yaml

Thanks,

Tomer


On Fri, 26 Sept 2025 at 19:11, Rob Herring (Arm) <robh@kernel.org> wrote:
>
>
> On Thu, 25 Sep 2025 23:06:22 +0300, Tomer Maimon wrote:
> > This series fix warnings and adds device tree support for peripherals on
> > the Nuvoton NPCM845 SoC and its Evaluation Board (EVB).
> > The first patch fix warning and arrange node order.
> > The second patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
> > RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device tree.
> > The third patch enables these peripherals for the NPCM845-EVB, adding
> > MDIO nodes, reserved memory, aliases, and board-specific configurations
> > like PHY modes and SPI flash partitions.
> >
> > The NPCM8XX device tree tested on NPCM845 evaluation board.
> >
> > Addressed comments from:
> >       - Andrew Jeffery: https://patchwork.ozlabs.org/project/openbmc/patch/20250908125938.3584927-2-tmaimon77@gmail.com/
> >                                         https://patchwork.ozlabs.org/project/openbmc/patch/20250908125938.3584927-3-tmaimon77@gmail.com/
> >
> > Changes since version 2:
> >       - Fix dts warning
> >       - Arrange node order by ascending unit address.
> >
> > Changes since version 1:
> >       - Fix commit message
> >       - Fix dtbs_check warnings.
> >
> > Tomer Maimon (3):
> >   arm64: dts: nuvoton: fix warning and nodes order
> >   arm64: dts: nuvoton: npcm845: Add peripheral nodes
> >   arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
> >
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 732 +++++++++++++++++-
> >  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 440 +++++++++++
> >  .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
> >  3 files changed, 1160 insertions(+), 19 deletions(-)
> >
> > --
> > 2.34.1
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: remotes/arm-soc/for-next-12027-gf60eaa447dab (exact match)
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nuvoton/' for 20250925200625.573902-1-tmaimon77@gmail.com:
>
> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb000000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb002000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@c0000000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb001000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/i2c@86000/tmp100@48: failed to match any schema with compatible: ['tmp100']
> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/pwm-fan-controller@103000: failed to match any schema with compatible: ['nuvoton,npcm845-pwm-fan']
> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/spi@201000: failed to match any schema with compatible: ['nuvoton,npcm845-pspi']
>
>
>
>
>

