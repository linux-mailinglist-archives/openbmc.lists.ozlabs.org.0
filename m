Return-Path: <openbmc+bounces-537-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E88B3BD99
	for <lists+openbmc@lfdr.de>; Fri, 29 Aug 2025 16:27:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD0wS5h7yz2yqm;
	Sat, 30 Aug 2025 00:27:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756477656;
	cv=none; b=XZcyryMw/KMWlRWiuEg+tW4CaEQHQm2Zjg76X8WohckIt8OdjRPrO1mFz96M5MqYXHI7Y23wt68KyA1rDAF+8UvIC2KxPxlv7ET3hbXkAD/SUyCL4bKIXH+uEN+NgCtPuk4fpZfzm/l7Az2vg85Sl7HDoAlNQoFqKQ/3jkWFCHxU7Z+aBVd0+4SkYbaX3zuTDICJtAbml4qusmNsRiQbsL9qayVNCmdMS5zD4BYpo/fvy3T1Xx2YPf9d2o55I2kIDLfVpNoGz2Mk7AqTWSBsCP9MQBLyImMNRD/CQmkaHJk4eLgms9QPBok6hsWmu6tb5gBEQIKq8+DC+IrUaN+rZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756477656; c=relaxed/relaxed;
	bh=iAIqu1GlhMpJ08RArt8Sz2LVxQpAO7Pc1abOctlv/7k=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kL7HmPRGn8f4DBGj4FaDrIhP9Ym7mFLGUm/bX99CXcsz41uNOpTIHg03PvOaIoYIMmf9m4FaFXKlYRL2zYOtAFXpTt4ESRZma3dSnHNp5f1iSQrndHTCJgXKaVZNlpTXDoAPD8PFDTZYoijpXWhA/ok5NWqAR0zlvANmoXGurEzs34VGjseJAOigjpbx8RxNUkjuXDhY5cg6Y8j/tMwP75gCJqcfrutW5SUE6Tq1Ky5N2eLzFp3xPdw6DZBt0+3PN6kH1IKjMw0hQ3MWiYy0sCQtchN83MoUc4sigYyb3Dn4bE7Z/EpWKfwjg+HBMVIYskJDyJ+IVYHllCqbbtACQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c+B/wrzq; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c+B/wrzq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD0wR6dHPz2yqW;
	Sat, 30 Aug 2025 00:27:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 375D544E4B;
	Fri, 29 Aug 2025 14:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B4C4CEF0;
	Fri, 29 Aug 2025 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756477654;
	bh=hju7Q0uxuSGvDaWgdSvbm9C1hLSofXR34ZTyBAn5zHc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c+B/wrzqg00WSFdgQYwmioWH/awpZYdcKINrzUkM/vSlrIMkqlSffg8EnKt+oIOLa
	 H6JiI5jirYb/y2E9/+iLGYC/8LdhEaV0SJw0drk/w79xnIJ1F52vHY6lnfUOliwBPM
	 K1fCTWwkwIWkEECKJsGbbagXLefBDhlzAQT8hh34ZXyPmbjQO+OAr1++EB3KXNE/SV
	 KYjx+MjcFnZKDqgUz/j0XHmGN8YKfv3bUNKsV1q+NSyrPI1lEvCKxxrZVfjipj7MYY
	 qjeaLNx9XZCjUd5Jw2VKUuQk2zqhFTjX7YxTe8WUsSfXDECNuaoP/Eg9zok9MxrWdc
	 5E07BZmYt91Wg==
Date: Fri, 29 Aug 2025 09:27:33 -0500
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
 krzk+dt@kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linus.walleij@linaro.org, BMC-SW@aspeedtech.com
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
Message-Id: <175647746429.734506.7183662123343858780.robh@kernel.org>
Subject: Re: [PATCH v1 0/4] Add pinctrl support for AST2700 SoC
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 29 Aug 2025 15:30:26 +0800, Billy Tsai wrote:
> Document and add the pinctrl driver for AST2700 SoC.
> 
> Billy Tsai (4):
>   dt-bindings: mfd: aspeed,ast2x00-scu: Support ast2700 pinctrl
>   dt-bindings: pinctrl: aspeed: Add support for AST27xx
>   pinctrl: aspeed: Add AST2700 pinmux support
>   arm64: dts: add AST27xx pinctrl configuration nodes
> 
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    2 +
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  |  135 +
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  |  452 +++
>  .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++
>  drivers/pinctrl/aspeed/Kconfig                |    8 +
>  drivers/pinctrl/aspeed/Makefile               |    1 +
>  .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   |  503 ++++
>  .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 2523 +++++++++++++++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c       |   47 +
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h       |   11 +-
>  drivers/pinctrl/aspeed/pinmux-aspeed.h        |   35 +-
>  11 files changed, 5071 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
> 
> --
> 2.25.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250828 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/aspeed/' for 20250829073030.2749482-1-billy_tsai@aspeedtech.com:

Traceback (most recent call last):
  File "/home/rob/.local/bin/dt-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/rob/proj/dt-schema/dtschema/dtb_validate.py", line 139, in main
    sg = schema_group(args.preparse)
  File "/home/rob/proj/dt-schema/dtschema/dtb_validate.py", line 24, in __init__
    self.validator = dtschema.DTValidator([schema_file])
                     ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^
  File "/home/rob/proj/dt-schema/dtschema/validator.py", line 376, in __init__
    if '$id' in schema_cache:
       ^^^^^^^^^^^^^^^^^^^^^
TypeError: argument of type 'NoneType' is not iterable






