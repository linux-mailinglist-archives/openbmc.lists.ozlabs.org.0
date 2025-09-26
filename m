Return-Path: <openbmc+bounces-694-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256FDBA490A
	for <lists+openbmc@lfdr.de>; Fri, 26 Sep 2025 18:11:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cYFvp0mpNz2ySm;
	Sat, 27 Sep 2025 02:11:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758903110;
	cv=none; b=C9U/7IKYJkXaLr78F5k1TXDC+8o3jKDjQaS7B+1irNKEG/MGNe9uCHk7CP+vqFaLT73tkgja4mvMZSk9SDxkStjoLeGP2Ll4WRphTysJ3hSPKqc52aTyse1dOl0qV4GM9qNf8x5XqltMsdJsSTuyTBCv7K0W6RDTNCPqGhoCzdfQrXkDOz0yvpU0YBx1W/bkztK2H1CY1gV/zATHDSB+xN7KZ7jd4wEr4XUYWKR29xKj6gmoRxTN+3ZgydS7x7mrbfVEIxvDeUhgrgzLj/UDmP/HYyrpuuVpJwL02Yf1bKYK/lt5BPpfwdSvI1Nx74IGbXJijUHBqxTWtaWmrQO7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758903110; c=relaxed/relaxed;
	bh=FpLf+2zLbL13hNRu+if7s6eIMEW4QsBhy/SBKUHd7tc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ObtRHeI8lCtmLPv8xj/6s+0r7sxe8nc0mtekDY1nhGpFVq1/MAn33I6fpuN5dSY8pU6uP8Xl8LCEILosVrlLATxa3kxeAuL7p5oT3m0D09UN2A46TNPYfCLfydtZ7qpeVF3mHYXxLEzDKOfAVD7LaD0rjexhfCiC/77qUyHPY9rJBCw7j0NdrJlzH/cyWlecCi1v9GNCrLMkKVjW64LoW+wK8VdgbO+aHVlUVSjA5YtVB4as0TuSPOKUfewBIleglA1hCFMxJFnOB1I6w6NuyqnE2yeKASXxDjqVQIp3qkuW9VUWMTFsVrhmNw70Dddx/aM8n1yyGYu9zlR0wxNVuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EdUSHO3h; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EdUSHO3h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cYFvm55lMz2yRZ
	for <openbmc@lists.ozlabs.org>; Sat, 27 Sep 2025 02:11:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DD3A41AEC;
	Fri, 26 Sep 2025 16:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2F4C4CEF4;
	Fri, 26 Sep 2025 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758903106;
	bh=yRHrfjskk6KyPsMbNFVbtbGAg1RRUPZQnBS9srhXpvg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EdUSHO3h2a1RJKHf8MMj7mPZcuufCtSoAaLqH8n0krh49mmpFo4x3CqD8QcbzYVj5
	 ZR+73ePW3C31DpO4Lu/xArmPcf2KRsXmsEQnZqzyEiSTpjWv4hUwdvN/AdSHdYSLF1
	 2S3xaQI6oRCF9x1Ul9O4qDwctXnVHjKowqnCBd1MO1PLF90gzXKNlhfRON8ZrQG6OU
	 yRHXisWEHUaZuxDi7xR+pnwqK4OsJHu892QvmsbmRrGOyLtasAqSDK04u/imiOeqai
	 yFgB8FafVjCxfc4X11D26y6/4YYCj+P8guoTtHlvKkgwkVnVGZctb34mQhxreiLhqM
	 kilQd5CrClt8g==
Date: Fri, 26 Sep 2025 11:11:39 -0500
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 venture@google.com, yuenn@google.com, openbmc@lists.ozlabs.org, 
 benjaminfair@google.com, joel@jms.id.au, krzk+dt@kernel.org, 
 tali.perry1@gmail.com, conor+dt@kernel.org, avifishman70@gmail.com
To: Tomer Maimon <tmaimon77@gmail.com>
In-Reply-To: <20250925200625.573902-1-tmaimon77@gmail.com>
References: <20250925200625.573902-1-tmaimon77@gmail.com>
Message-Id: <175890301752.880349.2331946518360447485.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: nuvoton: add NPCM845 SoC and EVB
 support
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 25 Sep 2025 23:06:22 +0300, Tomer Maimon wrote:
> This series fix warnings and adds device tree support for peripherals on
> the Nuvoton NPCM845 SoC and its Evaluation Board (EVB).
> The first patch fix warning and arrange node order.
> The second patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,
> RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device tree.
> The third patch enables these peripherals for the NPCM845-EVB, adding
> MDIO nodes, reserved memory, aliases, and board-specific configurations
> like PHY modes and SPI flash partitions.
> 
> The NPCM8XX device tree tested on NPCM845 evaluation board.
> 
> Addressed comments from:
> 	- Andrew Jeffery: https://patchwork.ozlabs.org/project/openbmc/patch/20250908125938.3584927-2-tmaimon77@gmail.com/
> 					  https://patchwork.ozlabs.org/project/openbmc/patch/20250908125938.3584927-3-tmaimon77@gmail.com/
> 
> Changes since version 2:
> 	- Fix dts warning
> 	- Arrange node order by ascending unit address.
> 
> Changes since version 1:
> 	- Fix commit message
> 	- Fix dtbs_check warnings.
> 
> Tomer Maimon (3):
>   arm64: dts: nuvoton: fix warning and nodes order
>   arm64: dts: nuvoton: npcm845: Add peripheral nodes
>   arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
> 
>  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 732 +++++++++++++++++-
>  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 440 +++++++++++
>  .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
>  3 files changed, 1160 insertions(+), 19 deletions(-)
> 
> --
> 2.34.1
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
 Base: remotes/arm-soc/for-next-12027-gf60eaa447dab (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nuvoton/' for 20250925200625.573902-1-tmaimon77@gmail.com:

arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb000000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb002000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@c0000000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/spi@fb001000: failed to match any schema with compatible: ['nuvoton,npcm845-fiu']
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/i2c@86000/tmp100@48: failed to match any schema with compatible: ['tmp100']
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/pwm-fan-controller@103000: failed to match any schema with compatible: ['nuvoton,npcm845-pwm-fan']
arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/bus@f0000000/spi@201000: failed to match any schema with compatible: ['nuvoton,npcm845-pspi']






