Return-Path: <openbmc+bounces-340-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9AB062D2
	for <lists+openbmc@lfdr.de>; Tue, 15 Jul 2025 17:25:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhNKn1fSnz2xYl;
	Wed, 16 Jul 2025 01:25:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752593117;
	cv=none; b=XQQ1WarSQ2D3CHCRJbkF/wQxOA4t9hXsfdM2gxjF1dmSCmeG8ckyKXBMqi/wjFF8ol5sPqIAMidD9qv+4Ir6iDyk6hzbQyMK4hYeFaNUcOYGfm6qsXM/IkNxL4cwnAMj0iOvjxAdBySDorc9foQ4+m+Ew2r99zxYgCAIH9lMRvEUIU/cXjx1lNCDEXcDD+zhOuUEcaHvIuXrZfzPYhlBLYy9YBfmvM+XdgR2YN2qCng2AF2cGVNtTzAnoWMWwQLrRMIOKqs/4xWatnZUgMkqThG/r/U+7hnTCPVbfEh4rGj0xQLEGpf7zz8ZFIKfx6RH/PV4Bnt+1Ex6vqaqTDZ4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752593117; c=relaxed/relaxed;
	bh=GA5gdyFg1uZV5+jdJaA/+N++eUsrCQesqrVksX5qS1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFfMR2py33zSrySoQ8BXnseuo/xH0JOjvYovmLHXZK7X+cHsMNH/Z//i1N+iJPYppjtMTh3ma53cC0oc08y4uFN8jGo6Kb2UO2rj/tkEWCJVN9Vejr/1DRNdGE5lAoGB6sCJhlArJeDMNgJSJ+iZomgMQNBHl8ZQ7GYvA+5zbpPS+Go15nF1n3Q+Pu6DS1a8nX3uvOQZkQ3R1kv9GWLYxssaRMPWsKci1hvVEm/yxLI9lqZOIDsOxdBc9oRo3DdFD0HM1uMPnFFr1WZUGj92BBNWIzi9WcCto1zmrpohfEPTH2axtFq3HOpeneWIXdFFjKkuWCTRJ+fBBZEqtbQMUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YoOGDjgF; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YoOGDjgF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhNKm2mRZz2xQ6;
	Wed, 16 Jul 2025 01:25:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF31D46A9C;
	Tue, 15 Jul 2025 15:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC899C4CEF9;
	Tue, 15 Jul 2025 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752593113;
	bh=+iZhsBUWZSulP41RkMskAokjoebc7RkoZj+v+sID3+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YoOGDjgFRp7HK1g5v9jpXVwss1E7P+fld3vFuN3PW900mdZ2CIwKK2cp5ZcvL7d0y
	 9rRd/bpND3G2dqZehY4LWofXABaXOQgm/nb+1xttzDLiQjJdi5jL7ugbavQg82q+3b
	 AGBvubAtgWiE5n5to9Jx9ziV0YD1VxPMz4+BkxJn+IGMoVDb1XsES5DIOQuW/g9a5t
	 duyU3WBsecV2D7qMPMaSHGSfgsD4D9rm3fTl6t2UqTys7O3DyAr/2W7dAETILAdjRa
	 qEMQr+XDIkQVK93cS4IC2Fftunhcd514xknZWlivvD4vvMxF9CcGIbO9BGGbOCqsBs
	 9dEzTc4bNiYtA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so10304766a12.0;
        Tue, 15 Jul 2025 08:25:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFf8o+qac4ORDILXZdwZDvNMIKJ3rWVL2ccORXPxY1xThebN8l5+WWN68tSBPzE5coTHG6zZSDCA==@lists.ozlabs.org, AJvYcCVV4ENN5RDc43M7i6UUUdoAmxNTDzU69oTjw7D+b410lxRxxgEWnB11LjJ2g9ZtH0Q0Drlcv9HKRVephVQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzTtoPfsAsTQAs7AvXaEgA8f4pKk+A0sypvf60HqG9dh/rzsel
	igmaA12yhGTi1xVGbu9nOVBVqRA6YKH+md3EiVPPsSGNmtzou+jFDracMEfIbOnep+J9aZW0gWj
	UEI8agXQ1AOZ+Bq0Vp6YXxyYBU0IIcw==
X-Google-Smtp-Source: AGHT+IFhI1Gf1QWnLIvPSTSWf4gnALh46fJcdiVacHnkECq+ju3RTb7CbKGPKrz2qlxBZ7zAD9wzoI4qtasBTfMiC+U=
X-Received: by 2002:a17:907:8689:b0:ae4:85d:76fc with SMTP id
 a640c23a62f3a-ae6fcbc35bfmr1706242066b.30.1752593112041; Tue, 15 Jul 2025
 08:25:12 -0700 (PDT)
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
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com> <20250715034320.2553837-7-jacky_chou@aspeedtech.com>
In-Reply-To: <20250715034320.2553837-7-jacky_chou@aspeedtech.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jul 2025 10:25:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
X-Gm-Features: Ac12FXx6Zdty1kF4V51gulFmHIQBgnZZ8rlts-SPK0sS7WQh8WbpLuYAl_mXY8I
Message-ID: <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] ARM: dts: aspeed-g6: Add PCIe RC node
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jul 14, 2025 at 10:43=E2=80=AFPM Jacky Chou <jacky_chou@aspeedtech.=
com> wrote:
>
> The AST2600 has one PCIe RC, and add the relative configure regmap.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 61 +++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 8ed715bd53aa..ed99780b6860 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -379,6 +379,67 @@ rng: hwrng@1e6e2524 {
>                                 quality =3D <100>;
>                         };
>
> +                       pcie_phy1: syscon@1e6ed200 {
> +                               compatible =3D "aspeed,pcie-phy", "syscon=
";
> +                               reg =3D <0x1e6ed200 0x100>;

This looks like part of something else? It should be a child of that.

If this is the controls for the PCIe PHY, then use the PHY binding
instead of your own custom phandle property.

> +                       };
> +
> +                       pcie_cfg: syscon@1e770000 {
> +                               compatible =3D "aspeed,pcie-cfg", "syscon=
";
> +                               reg =3D <0x1e770000 0x80>;

Looks like this is really part of the PCIe block as a h/w block isn't
going to start at offset 0xc0.


> +                       };
> +
> +                       pcie0: pcie@1e7700c0 {
> +                               compatible =3D "aspeed,ast2600-pcie";
> +                               device_type =3D "pci";
> +                               reg =3D <0x1e7700c0 0x40>;
> +                               linux,pci-domain =3D <0>;

No need for this. You only have 1 PCI host.

> +                               #address-cells =3D <3>;
> +                               #size-cells =3D <2>;
> +                               interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVE=
L_HIGH>;
> +                               bus-range =3D <0x80 0xff>;

Does this h/w not support bus 0-0x7f for some reason?

> +
> +                               ranges =3D <0x01000000 0x0 0x00018000 0x0=
0018000 0x0 0x00008000
> +                                         0x02000000 0x0 0x70000000 0x700=
00000 0x0 0x10000000>;
> +
> +                               status =3D "disabled";
> +
> +                               resets =3D <&syscon ASPEED_RESET_H2X>;
> +                               reset-names =3D "h2x";
> +
> +                               #interrupt-cells =3D <1>;
> +                               msi-parent =3D <&pcie0>;
> +                               msi-controller;
> +
> +                               aspeed,ahbc =3D <&ahbc>;
> +                               aspeed,pciecfg =3D <&pcie_cfg>;
> +
> +                               interrupt-map-mask =3D <0 0 0 7>;
> +                               interrupt-map =3D <0 0 0 1 &pcie_intc0 0>=
,
> +                                               <0 0 0 2 &pcie_intc0 1>,
> +                                               <0 0 0 3 &pcie_intc0 2>,
> +                                               <0 0 0 4 &pcie_intc0 3>;
> +                               pcie_intc0: interrupt-controller {
> +                                       interrupt-controller;
> +                                       #address-cells =3D <0>;
> +                                       #interrupt-cells =3D <1>;
> +                               };
> +
> +                               pcie@8,0 {
> +                                       reg =3D <0x804000 0 0 0 0>;
> +                                       #address-cells =3D <3>;
> +                                       #size-cells =3D <2>;
> +                                       device_type =3D "pci";
> +                                       resets =3D <&syscon ASPEED_RESET_=
PCIE_RC_O>;
> +                                       reset-names =3D "perst";
> +                                       clocks =3D <&syscon ASPEED_CLK_GA=
TE_BCLK>;
> +                                       pinctrl-names =3D "default";
> +                                       pinctrl-0 =3D <&pinctrl_pcierc1_d=
efault>;
> +                                       aspeed,pciephy =3D <&pcie_phy1>;
> +                                       ranges;
> +                               };
> +                       };
> +
>                         gfx: display@1e6e6000 {
>                                 compatible =3D "aspeed,ast2600-gfx", "sys=
con";
>                                 reg =3D <0x1e6e6000 0x1000>;
> --
> 2.43.0
>

