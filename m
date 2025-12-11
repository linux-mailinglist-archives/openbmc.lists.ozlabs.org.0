Return-Path: <openbmc+bounces-1005-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650CCB625B
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 15:08:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRvZF0Cszz2xrk;
	Fri, 12 Dec 2025 01:08:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765462100;
	cv=none; b=VeOuGEw7DRwrAdYGB9KnXI/9X7UKw/KRY6kVvyniHvSu06vZy2IpFJQbLe5e335Uk05nAdOBJGDuw7mQ/wHLiNdrMRscsTQkJ7W3xV7pCBd5XroU9TPAE5J1JVEdyJPyahIVDF3IwOxXsn2Nf5sgtG8RAPnRutk83om7EmWa0jKXYVqYR2gPXWY5Uoz9obKLJBOlCWtXLTpWGEY2EDAF1u/MttgGd8fE+Xa4ZL/3AjShgvlvqhh4xDU3l9mY53A5TqDL4Op/hXds58y/QqrvJ2sv2XsfznUUn2avd2Yu1TwF9igFqn16Z/MCw0Hek2ZWV3IeQsUHNbw6VAoQON2P7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765462100; c=relaxed/relaxed;
	bh=ZpSWmqw3p8VllNYjzA+947ctA38mYUrYavCrKBPZoRg=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kv/DKphil0l201eIHnLWZMA9TGNupXb8Ib02N1GYOiPQxR649aR/DyESsl4L0FHT6vLL3QYUR2M9p3HEroouU1anq0gclANr7LJSYB/ldrgb7HexOCEn/be1WH51p+XyZCAK/rrGGj0qDl9oeXrzhD2kI9nfXdxuaLMbwB+oXAPJKmIrdLN5Opl/XonONm9k7Wiq6A4CdOxEW6EOqRuV8979XlaCWVxO68vhQnFplfSC6UxL7F10l1+z02Bep3euY7maDq3GWD8udfu5jekuDMnPMYpiqhqOgTynIGoKtNNWcQuc9YDtt0ostAtiXOSBoK3+LISfd1zhbnvYoBEmtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F4nRF+jI; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F4nRF+jI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRvZC74jLz2xrC;
	Fri, 12 Dec 2025 01:08:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C496443E1;
	Thu, 11 Dec 2025 14:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0558FC113D0;
	Thu, 11 Dec 2025 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765462068;
	bh=hx7b5hrK/t1h1EGBuhSZdXxMqefCkNpMbXzh1Pxl/GQ=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=F4nRF+jILoOBJXDsreY4/ec1oenpKVgurmtPrhus5kXNUIYF/WfF+26aLVpRCEnQk
	 J4bn4I+pf4emRNZ0naH44bYtNweuoB/BPCoO29fYQZW4zgjopbjuhSfMPxX8r5C9Sd
	 HwiRVfqG44YlO4jVout14vF5bi56Uq4IBV1g4d1e8jNEULYuOm9QaZbHrg4GJYPUpk
	 Ce+TKRcAdNShbHb98RYKQRWl5VNC4J8FTWcRlsMdsY0irxv1iN+gSAv0F5xjGF1tDo
	 8pyIosatEszKp+OVkMh46qLMQx878RXXrVhSFpV2S8RGMxXc1tSS1ag6GbVr2JfXPM
	 l7Gbv0noZ03iA==
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Dec 2025 08:07:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, Linus Walleij <linusw@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
Message-Id: <176546188070.971010.10583431722134708925.robh@kernel.org>
Subject: Re: [PATCH RFC 00/16] Eliminate warnings for AST2500 and AST2600
 EVB devicetrees
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 11 Dec 2025 17:45:42 +0900, Andrew Jeffery wrote:
> Hi all,
> 
> This series removes the remaining warnings produced by `make
> CHECK_DTBS=y ...` for the AST2500 and AST2600 EVBs and their related
> DTSIs. The tidy-up has the usual benefit of making it clear to
> contributors that any warnings are likely their own to fix before their
> patches will be considered for merging.
> 
> I've framed it as an RFC with all patches contained in the one series
> so the goal is clear, we can see what's needed to reach it, and we can
> decide whether and how it should be split or merged going forward.
> 
> As it stands there's little in the way of code change, except to
> pinctrl (though also not much there). As such I've included the
> binding maintainers and subsystem lists as recipients but not yet Cc'ed
> subsystem maintainers directly because there are quite a few and I hope
> to avoid mostly uninteresting patches being a source of irritation.
> 
> The patches fall into several groups:
> 
> Patch 1:
>   Rob's conversion of the PWM/tach binding to DT schema with fixes
>   applied for the license and typos identified by Krzysztof.
> 
> Patches 2-5:
>   Fixes for the warnings related to the LPC and pinctrl nodes, touching
>   relevant drivers and the devicetrees.
> 
>   I expect that if this approach is acceptable that we'll need to split
>   application of the patches across successive release cycles, with the
>   driver changes going in first.
> 
> Patches 6-8:
>   Fix MMC/SDHCI warnings, touching the relevant binding and devicetrees
> 
> Patches 9-10:
>   Clarify the relationships between the ACRY and AHB controller
> 
> Patches 11-16:
>   The remaining pieces that eliminate the warnings
> 
> I'm at plumbers so don't have hardware on hand to test with, but some
> brief smoke tests under qemu look okay. Given that it's all RFC that
> should be enough for the moment. I'll do more testing after discussions
> and when I have boards at hand.
> 
> Please review!
> 
> Andrew
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Andrew Jeffery (15):
>       pinctrl: aspeed: g5: Constrain LPC binding revision workaround to AST2500
>       pinctrl: aspeed: g5: Allow use of LPC node instead of LPC host controller
>       ARM: dts: aspeed: g5: Use LPC phandle for pinctrl aspeed,external-nodes
>       ARM: dts: aspeed: Remove unspecified LPC host controller node
>       dt-bindings: mmc: Switch ref to sdhci-common.yaml
>       ARM: dts: aspeed: Remove sdhci-drive-type property from AST2600 EVB
>       ARM: dts: aspeed: Use specified wp-inverted property for AST2600 EVB
>       dt-bindings: bus: aspeed: Require syscon for AST2600 AHB controller
>       dt-bindings: crypto: Document aspeed,ahbc property for Aspeed ACRY
>       ARM: dts: aspeed: Drop syscon compatible from EDAC in g6 dtsi
>       ARM: dts: aspeed: g6: Drop unspecified aspeed,ast2600-udma node
>       ARM: dts: aspeed: ast2600-evb: Tidy up A0 work-around for UART5
>       dt-bindings: iio: adc: Allow interrupts property for AST2600
>       ARM: dts: aspeed: g6: Drop clocks property from arm,armv7-timer
>       dt-bindings: mfd: Document smp-memram node for AST2600 SCU
> 
> Rob Herring (Arm) (1):
>       dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to DT schema
> 
>  .../bindings/bus/aspeed,ast2600-ahbc.yaml          |   8 +-
>  .../bindings/crypto/aspeed,ast2600-acry.yaml       |   7 ++
>  .../bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml   | 106 +++++++++++++++++++++
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  73 --------------
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml       |   3 +
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  18 ++++
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml      |   2 +-
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts    |   7 +-
>  .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    |   4 -
>  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            |   5 -
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            |   8 +-
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  17 +---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  32 ++++---
>  13 files changed, 165 insertions(+), 125 deletions(-)
> ---
> base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
> change-id: 20251211-dev-dt-warnings-all-bd5854b04d60
> 
> Best regards,
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: 5ce74bc1b7cb2732b22f9c93082545bc655d6547 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au:

arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@14', 'fan@15', 'fan@16', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@14', 'fan@15', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pwm-tacho-controller@1e786000 (aspeed,ast2500-pwm-tacho): 'fan@10', 'fan@11', 'fan@12', 'fan@13', 'fan@8', 'fan@9' do not match any of the regexes: '^fan@[0-7]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml






