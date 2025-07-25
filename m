Return-Path: <openbmc+bounces-404-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71182B1170B
	for <lists+openbmc@lfdr.de>; Fri, 25 Jul 2025 05:25:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpCv46HNkz30FR;
	Fri, 25 Jul 2025 13:25:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753413952;
	cv=none; b=cvd7OxD0bNbQhjIkBrn58UsKRo6zpkY4OAFdxdk4GC0Dn1nvyoNg8C60IizVMf5snzXt3elTwTPTGAVsYBItXyYn288qC1fXGKz0kxICXDTbNsGAlQLZvZajLhKy5v1k9vO9WK56IGB4dmthYgvZXX4pgvHZ2R8hNtOnPLyNJfs8/cxt7SLw24IVxWzrfATEeS3RUUnsjwhfjrPFBeiyWc0vYdUO+bBs8mCZc59a6uuIL7TWB+9sGlqcm31aBNoPqBXWY0zjo8qJrubZRyD8djLceMywPJZu1SRDtdXzHAnHsR5mumsM/FbZJs68xwfIOOGPzUfxPPmIwwlxfCoD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753413952; c=relaxed/relaxed;
	bh=9UYcYfEpz91xIVNypVXsLI6j/0gs/bOqw0AQ4GM0MxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvM3sq3M803DXcuwGeJ1VMcC5N5QahrH5e+wNmSkH956qUUEyuBVh0RwBPFG5niaPjEUorZNUIL5gLb4Y7pKPIpxcHZZ9GqFOrpr2fRTyx9QUbHWeogTv/t3VEcgOqDhuvnKoHzO0hEp5JWML/XlFWqJZORLSguhVGTqZhT2hdO+vnJb1Efz9mlBw9s26xYUT5MKqQ90V5WlGEQE/udlMMYgpd7NUnsnu/TArp+4N6JMKSJpvguV0uYXxEo+yTDzTgOCR6jXIyfs4AzuEAMwpF+rhz9I40Qd1GtfZsofa9JWDR0dhzrkPMnmru8WdxL/S4YXhC++E0dR8CrzQmlYbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f61OXOAU; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f61OXOAU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpCv35NLMz2xS2;
	Fri, 25 Jul 2025 13:25:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0C7CA526B2;
	Fri, 25 Jul 2025 03:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97898C4CEF6;
	Fri, 25 Jul 2025 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753413948;
	bh=ru9P5gglzGYtzMPAbAWQEENrZ3jfJKcYTMOz5gRV4B8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f61OXOAUm4yu2i5SKlz1YbYUB/BJzT9xGyvRxuVAGpzMT2tDvuopfOeA2lt2AJq6H
	 GO4hFY30r+74hR2G6F1XglBB81gpeoJv2ezLyr3gHTupBauZk+ZMyCnNK3VDLhnmgY
	 iqSA96N4PdCN4z5WsILRSnOIUkBfXE9inizK0EMdnUUJJVzQn31X/Z0jEEZ0GqXylq
	 hpTa7KIZx40iC5g/mqrezzq6hIPhAPalha6Qwd/GSO48LT6tOEssoSgsOGgqQEgqn2
	 IcjNnUWy7jdVo9bZy9l0hAH9cGAGoxbgroTuketDtkWr3xHc6pI7jl1FFrnXOqp5Gw
	 1kRRq6HqJAjdw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae360b6249fso279348666b.1;
        Thu, 24 Jul 2025 20:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFDVAio2k44CiA/KMkZp9zq2w3jfKzJ8hz7i2AdYQfFSgkk5GKv2BGdt/95/4gUeSNOQI1i2Rk1Q==@lists.ozlabs.org, AJvYcCXlw2UswYVeN1nqujbsV692VKJ06EJkqkWXSWhM8I6nEaoKEVruSGB7Qf5hmGh/bHosUUrx7+Em9GJNphQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysC28w5o2dlWJCQsxtuJdnMQIg1EqorqmEzMWNwMOHf7U14Lvp
	ISsox3lC37r3lEQr09A8y/9H38q1U8BP1q6JpYiT37GL2nFwT4FYU5TdC6G7PfaFU5Pf6s39mMz
	aNYZiCNLJAbz5H9AWmrFRJqWlbYzidg==
X-Google-Smtp-Source: AGHT+IF+agF7WZFSJUlrP9ySUL34Tt9kNJbk0LHlMHXBUQFUAyaxgmcWaEQcfUno6qyj6AQ9mOBZFrHznA/URFmzSWo=
X-Received: by 2002:a17:907:8691:b0:ae3:7113:d6f1 with SMTP id
 a640c23a62f3a-af61cf9830fmr42823366b.25.1753413947121; Thu, 24 Jul 2025
 20:25:47 -0700 (PDT)
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
References: <20250723222350.200094-1-donalds@nvidia.com> <175341328135.3754696.5873094296930738476.robh@kernel.org>
In-Reply-To: <175341328135.3754696.5873094296930738476.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Jul 2025 22:25:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJwgbWa0sPVgdxMchPfa1hR8o-=wRh4UgoK3QfDdW+S+g@mail.gmail.com>
X-Gm-Features: Ac12FXzNXNpCRi5fyD7BKC9WuufjuvbhZvOU4OiUZdjanN-WVw0Xe6BrUFww0vw
Message-ID: <CAL_JsqJwgbWa0sPVgdxMchPfa1hR8o-=wRh4UgoK3QfDdW+S+g@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Adding device tree and binding for NVIDIA GB200-UT3.0b
To: Donald Shannon <donalds@nvidia.com>
Cc: conor+dt@kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	krzk+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 24, 2025 at 10:19=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
>
> On Wed, 23 Jul 2025 15:23:48 -0700, Donald Shannon wrote:
> > Patch 1 adds the binding for the NVIDIA GB200-UT3.0b platform.
> > Patch 2 adds the device tree for the NVIDIA GB200-UT3.0b platform.
> >
> > This is an Aspeed AST2600 based unit testing platform for GB200.
> > UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
> > differences, additional gpio expanders, and voltage regulator gating
> > some devices.
> >
> > Reference to Ast2600 SOC [1].
> > Reference to Blackwell GB200NVL Platform [2].
> >
> > Link: https://www.aspeedtech.com/server_ast2600/ [1]
> > Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 =
[2]
> > Signed-off-by: Donald Shannon <donalds@nvidia.com>
> > ---
> > Changes v1 -> v2:
> >   - Changed phy-mode to rgmii-id [Lunn]
> >   - Removed redundant max-speed for mac0 [Lunn]
> >   - Fixed typo from gb200nvl to gb200 in Makefile
> > Changes v2 -> v3:
> >  - Fixed whitespace issues [Krzysztof]
> >  - Fixed schema validation issues from my end ( there are still issues
> >  with the aspeed dtsi file that are not related to this new dts)
> >  [Herring]
> >  - Reordered to follow style guide [Krzysztof]
> >  - Removed redundant status okays
> >  - Changed vcc to vdd for the power gating on the gpio expanders
> > Changes v3 -> v4:
> >   - Added changelog [Krzysztof]
> >   - Added nvidia,gb200-ut30b board binding [Krzysztof]
> >   - Removed unused imports
> >   - Reordered a couple other style guide violations
> >   - Added back in a couple needed "status okay"s
> > Changes v4 -> v5:
> >  - Resumed my patch after a pause
> >  - Don't plan to make this include of nvidia-gb200nvl-bmc due to some
> >  platform differences
> >  - Fixed io expanders that weren't gated by the 3.3V standby regulator
> >  - Fixed incorrect interrupt pin for one IO expander
> >  - Removed some IO expanders and I2C busses
> > Changes v5 -> v6:
> >  - Fixed subject line
> >  - Added missing gpio-key compatible type to buttons
> > Changes v6 -> v7:
> >   - Removed Acked-by Krzysztof
> > ---
> >
> > Donald Shannon (2):
> >   dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
> >   ARM: dts: aspeed: Add NVIDIA GB200 UT3.0b board
> >
> >  .../bindings/arm/aspeed/aspeed.yaml           |    1 +
> >  arch/arm/boot/dts/aspeed/Makefile             |    1 +
> >  .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1028 +++++++++++++++++
> >  3 files changed, 1030 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut=
30b.dts
> >
> >
> > base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
> > --
> > 2.43.0
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
>  Base: using specified base-commit 05adbee3ad528100ab0285c15c91100e19e101=
38
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/aspeed/' =
for 20250723222350.200094-1-donalds@nvidia.com:
>
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: timer (arm,ar=
mv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/timer/arm,arch_tim=
er.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /sdram@1e6e00=
00: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac=
', 'syscon']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: bus@1e600000 =
(aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too=
 long
>         from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600=
-ahbc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: syscon@1e6e20=
00 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes=
: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(=
@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
>         from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00=
-scu.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/sysc=
on@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['a=
speed,ast2600-smpmem']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/disp=
lay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-=
gfx', 'syscon']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: adc@1e6e9000 =
(aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast=
2600-adc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: adc@1e6e9100 =
(aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast=
2600-adc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: crypto@1e6fa0=
00 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2=
600-acry.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: lpc@1e789000 =
(aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
>         from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yam=
l#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: lpc@1e789000 =
(aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yam=
l#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@24 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast240=
0-kcs-bmc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@28 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast240=
0-kcs-bmc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@2c (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast240=
0-kcs-bmc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: kcs@114 (aspe=
ed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast240=
0-kcs-bmc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/lpc@=
1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2=
600-ibt-bmc']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: sdc@1e740000 =
(aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600=
-sdhci', 'sdhci'] is too long
>         from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.y=
aml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: sdc@1e740000 =
(aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600=
-sdhci', 'sdhci'] is too long
>         from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.y=
aml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/sdc@=
1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspe=
ed,ast2600-sdhci', 'sdhci']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/sdc@=
1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspe=
ed,ast2600-sdhci', 'sdhci']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: fsi@1e79b000 =
(aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi=
-master'] is too long
>         from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600=
-fsi-master.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/fsi@=
1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-=
master', 'fsi-master']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: fsi@1e79b100 =
(aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi=
-master'] is too long
>         from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600=
-fsi-master.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/fsi@=
1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-=
master', 'fsi-master']
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: /ahb/apb/dma-=
controller@1e79e000: failed to match any schema with compatible: ['aspeed,a=
st2600-udma']

All of the below warnings you are introducing...

And yeah, all the ones above are existing, but I don't see a lot of
progress fixing them. It seems no one adding their board cares about
the SoC warnings given the lack of progress on aspeed stuff. Maybe new
boards need to be rejected without some improvements...

> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: buttons (gpio=
-keys): button-power: 'anyOf' conditional failed, one must be fixed:
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: buttons (gpio=
-keys): button-power: 'oneOf' conditional failed, one must be fixed:
>                 'interrupts' is a required property
>                 'interrupts-extended' is a required property
>         'gpios' is a required property
>         from schema $id: http://devicetree.org/schemas/input/gpio-keys.ya=
ml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: buttons (gpio=
-keys): button-power: 'linux,code' is a required property
>         from schema $id: http://devicetree.org/schemas/input/gpio-keys.ya=
ml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: buttons (gpio=
-keys): button-power: Unevaluated properties are not allowed ('gpio' was un=
expected)
>         from schema $id: http://devicetree.org/schemas/input/gpio-keys.ya=
ml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: buttons (gpio=
-keys): button-uid: 'anyOf' conditional failed, one must be fixed:
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: buttons (gpio=
-keys): button-uid: 'oneOf' conditional failed, one must be fixed:
>                 'interrupts' is a required property
>                 'interrupts-extended' is a required property
>         'gpios' is a required property
>         from schema $id: http://devicetree.org/schemas/input/gpio-keys.ya=
ml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: buttons (gpio=
-keys): button-uid: 'linux,code' is a required property
>         from schema $id: http://devicetree.org/schemas/input/gpio-keys.ya=
ml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dtb: buttons (gpio=
-keys): button-uid: Unevaluated properties are not allowed ('gpio' was unex=
pected)
>         from schema $id: http://devicetree.org/schemas/input/gpio-keys.ya=
ml#

'gpio' has been deprecated for only about 10 years. Maybe 15...

Rob

