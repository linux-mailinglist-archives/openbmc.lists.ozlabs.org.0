Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 929538FCEA6
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 15:13:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rTf14Xd6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvSZz4tvzz30VM
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 23:13:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rTf14Xd6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvSYB5F0Pz3bmY
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 23:12:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 00C3CCE17D4;
	Wed,  5 Jun 2024 13:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14FBC3277B;
	Wed,  5 Jun 2024 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717593097;
	bh=iqvcQEv+paa/cggNCpvdqjj6yuhApzPX0A6+Dv8DSVI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rTf14Xd6MisFKrrsXdeHsKq7tFFw97rscH5WJ2JP56PqO9G9/OuAmTjHi/3iVBc5y
	 5k5x/HaOLdx7zgHBFBqkNU1zBIxZF+dn8MVbaG+CASaqtcdLXEJ+aZ33dQM2kHOUCh
	 f8/9lvX7PolCjFXM3GmuotN1rMcwy6+RB136YjsKvNc2+u4Usny5J7yaf1H8n5enql
	 uckZGjPDpuqOT4Z4Fd8jMhh11FmwpUsntMPJ0DZWFfttmfdAB0JrLJ0B3TIQxVQYqv
	 OSjDw80cNuXKGx/zQeEnhEkikLiA9OwzBbvUhX+L00EQp7WqCV10MIA4lGH0BXWevB
	 BZUbCGEqUnnbw==
Date: Wed, 05 Jun 2024 07:11:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Liu <liuxiwei1013@gmail.com>
In-Reply-To: <20240605013017.38885-1-liuxiwei@ieisystem.com>
References: <20240605013017.38885-1-liuxiwei@ieisystem.com>
Message-Id: <171759284895.2200935.5190489495652440270.robh@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: aspeed: Add IEISystems FP5280G3 BMC
 machine
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
Cc: openbmc@lists.ozlabs.org, wangzhiqiang02@ieisystem.com, suxiao@ieisystem.com, banht@ieisystem.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Wed, 05 Jun 2024 09:30:17 +0800, George Liu wrote:
> The IEISystems FP5280G3 is a power platform server with an
> AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
> 
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>
> ---
> v2 -> v3
>   - NO_CHANGE
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed/aspeed-bmc-ieisystems-fp5280g3.dts | 966 ++++++++++++++++++
>  2 files changed, 967 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb' for 20240605013017.38885-1-liuxiwei@ieisystem.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:269.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:272.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1/tmp112@49:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:277.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1/tmp112@4a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:282.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:285.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2/tmp112@49:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:290.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2/tmp112@4a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:392.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:396.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdda@60:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:400.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vddb@61:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:404.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdn@72:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:408.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vio@73:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:412.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vpci@74:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:416.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:420.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddc@60:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:424.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddd@61:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:428.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vdn@72:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:432.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vio@73:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:436.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vpci@74:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:440.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:444.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/pxe1610@6c:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:448.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/rdimm@74:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:452.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/mdimm@54:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:456.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/ldimm@44:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:460.5-15: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:544.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/pca9548@71/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:549.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/pca9548@71/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:576.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/pca9548@71/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:581.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/pca9548@71/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:771.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:774.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/tmp112@48:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:780.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/eeprom@50:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:785.4-17: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/pca9555@24:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:804.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:807.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:810.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:819.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:822.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/tmp112@48:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:828.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/eeprom@50:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:833.4-17: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/pca9555@24:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:851.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:854.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:866.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:869.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/tmp112@48:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:875.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/eeprom@50:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:880.4-17: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/pca9555@24:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:899.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:902.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:905.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:268.19-280.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:268.19-280.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:281.19-293.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:281.19-293.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:391.20-414.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:391.20-414.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:415.19-438.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:415.19-438.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:439.19-458.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:439.19-458.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:770.20-802.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:770.20-802.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:818.20-849.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:818.20-849.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:865.20-897.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:865.20-897.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:268.19-280.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:268.19-280.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:270.13-274.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1/tmp112@49: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:270.13-274.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1/tmp112@49: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:275.13-279.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1/tmp112@4a: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:275.13-279.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1/tmp112@4a: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:281.19-293.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:281.19-293.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:283.13-287.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2/tmp112@49: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:283.13-287.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2/tmp112@49: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:288.13-292.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2/tmp112@4a: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:288.13-292.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2/tmp112@4a: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:391.20-414.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:391.20-414.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:394.16-397.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdda@60: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:394.16-397.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdda@60: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:398.16-401.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vddb@61: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:398.16-401.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vddb@61: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:402.15-405.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdn@72: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:402.15-405.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdn@72: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:406.15-409.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vio@73: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:406.15-409.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vio@73: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:410.16-413.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vpci@74: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:410.16-413.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vpci@74: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:415.19-438.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:415.19-438.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:418.16-421.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddc@60: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:418.16-421.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddc@60: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:422.16-425.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddd@61: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:422.16-425.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddd@61: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:426.15-429.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vdn@72: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:426.15-429.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vdn@72: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:430.15-433.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vio@73: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:430.15-433.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vio@73: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:434.16-437.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vpci@74: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:434.16-437.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vpci@74: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:439.19-458.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:439.19-458.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:442.15-445.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/pxe1610@6c: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:442.15-445.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/pxe1610@6c: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:446.13-449.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/rdimm@74: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:446.13-449.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/rdimm@74: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:450.13-453.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/mdimm@54: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:450.13-453.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/mdimm@54: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:454.13-457.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/ldimm@44: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:454.13-457.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/ldimm@44: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:459.19-461.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:459.19-461.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:541.22-545.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/pca9548@71/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:541.22-545.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/pca9548@71/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:546.22-550.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/pca9548@71/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:546.22-550.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/pca9548@71/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:573.22-577.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/pca9548@71/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:573.22-577.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/pca9548@71/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:578.22-582.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/pca9548@71/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:578.22-582.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/pca9548@71/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:770.20-802.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:770.20-802.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:772.13-776.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/tmp112@48: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:772.13-776.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/tmp112@48: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:778.14-781.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/eeprom@50: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:778.14-781.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/eeprom@50: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:783.15-801.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/pca9555@24: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:783.15-801.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/pca9555@24: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:803.20-805.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:803.20-805.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:806.20-808.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:806.20-808.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:809.20-811.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:809.20-811.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:818.20-849.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:818.20-849.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:820.13-824.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/tmp112@48: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:820.13-824.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/tmp112@48: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:826.14-829.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/eeprom@50: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:826.14-829.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/eeprom@50: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:831.15-848.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/pca9555@24: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:831.15-848.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/pca9555@24: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:850.20-852.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:850.20-852.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:853.20-855.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:853.20-855.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:865.20-897.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:865.20-897.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:867.13-871.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/tmp112@48: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:867.13-871.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/tmp112@48: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:873.14-876.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/eeprom@50: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:873.14-876.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/eeprom@50: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:878.15-896.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/pca9555@24: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:878.15-896.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/pca9555@24: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:898.20-900.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:898.20-900.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:901.20-903.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:901.20-903.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:904.20-906.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:904.20-906.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /: failed to match any schema with compatible: ['ieisystems,fp5280g3-bmc', 'aspeed,ast2600']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not match '^ethernet(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not match '^ethernet(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: ftgmac@1e670000: $nodename:0: 'ftgmac@1e670000' does not match '^ethernet(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: ftgmac@1e670000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: ftgmac@1e690000: $nodename:0: 'ftgmac@1e690000' does not match '^ethernet(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: ftgmac@1e690000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pinctrl: usb11bhid_default:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3
 ', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP'
 , 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pinctrl: i3c1_default:function:0: 'I3C1' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4',
  'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP', 'USB2BD'
 , 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pinctrl: i3c1_default:groups:0: 'I3C1' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMCG1', 'EMMCG4', 'EMMCG8', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'HVI3C3', 'HVI3C4', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 
 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10G0', 'PWM10G1', 'PWM11G0', 'PWM11G1', 'PWM12G0', 'PWM12G1', 'PWM13G0', 'PWM13G1', 'PWM14G0', 'PWM14G1', 'PWM15G0', 'PWM15G1', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8G0', 'PWM8G1', 'PWM9G0', 'PWM9G1', 'QSPI1', 'QSPI2', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10G0', 'SALT10G1', 'SALT11G0', 'SALT11G1', 'SALT12G0', 'SALT12G1', 'SALT13G0', 'SALT13G1', 'SALT14G0', 'SALT14G1', 'SALT15G0', 'SALT15G1', 'SALT16G0', 'SALT16G1', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9G0', 'SALT9G1', 'SD1', 'SD2', 'SD3', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH1
 4', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12G0', 'UART12G1', 'UART13G0', 'UART13G1', 'UART6', 'UART7', 'UART8', 'UART9', 'USBA', 'USBB', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pinctrl: usb2ad_default:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NR
 I4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP', 'USB
 2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pinctrl: i3c2_default:function:0: 'I3C2' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4',
  'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP', 'USB2BD'
 , 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pinctrl: i3c2_default:groups:0: 'I3C2' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMCG1', 'EMMCG4', 'EMMCG8', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'HVI3C3', 'HVI3C4', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 
 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10G0', 'PWM10G1', 'PWM11G0', 'PWM11G1', 'PWM12G0', 'PWM12G1', 'PWM13G0', 'PWM13G1', 'PWM14G0', 'PWM14G1', 'PWM15G0', 'PWM15G1', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8G0', 'PWM8G1', 'PWM9G0', 'PWM9G1', 'QSPI1', 'QSPI2', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10G0', 'SALT10G1', 'SALT11G0', 'SALT11G1', 'SALT12G0', 'SALT12G1', 'SALT13G0', 'SALT13G1', 'SALT14G0', 'SALT14G1', 'SALT15G0', 'SALT15G1', 'SALT16G0', 'SALT16G1', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9G0', 'SALT9G1', 'SD1', 'SD2', 'SD3', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH1
 4', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12G0', 'UART12G1', 'UART13G0', 'UART13G1', 'UART6', 'UART7', 'UART8', 'UART9', 'USBA', 'USBB', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2600-xdma']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: crypto@1e6fa000: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2600-video-engine']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sgpiom@1e780500: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sgpiom@1e780600: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: lpc@1e789000: lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: lpc@1e789000: reg-io-width: [[4]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@70: $nodename:0: 'pca9548@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@70: Unevaluated properties are not allowed ('i2c@1', 'i2c@2' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@20: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@21: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@22: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@23: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@70: $nodename:0: 'pca9548@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: $nodename:0: 'pca9546@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: Unevaluated properties are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdda@60: failed to match any schema with compatible: ['infineon,xdpe132g5c']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vddb@61: failed to match any schema with compatible: ['infineon,xdpe132g5c']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdn@72: failed to match any schema with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vio@73: failed to match any schema with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vpci@74: failed to match any schema with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddc@60: failed to match any schema with compatible: ['infineon,xdpe132g5c']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddd@61: failed to match any schema with compatible: ['infineon,xdpe132g5c']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vdn@72: failed to match any schema with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vio@73: failed to match any schema with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vpci@74: failed to match any schema with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/pxe1610@6c: failed to match any schema with compatible: ['infineon,pxe1610']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/rdimm@74: failed to match any schema with compatible: ['infineon,pxe1610']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/mdimm@54: failed to match any schema with compatible: ['infineon,pxe1610']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/ldimm@44: failed to match any schema with compatible: ['infineon,pxe1610']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/tmp1413@4c: failed to match any schema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@1/tmp1413@4c: failed to match any schema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@2/tmp1413@4c: failed to match any schema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/tmp1413@4c: failed to match any schema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@71: $nodename:0: 'pca9548@71' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@71: Unevaluated properties are not allowed ('i2c@0', 'i2c@1' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/tmp1413@4c: failed to match any schema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@71: $nodename:0: 'pca9548@71' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@71: Unevaluated properties are not allowed ('i2c@0', 'i2c@1' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@5/tmp1413@4c: failed to match any schema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@24: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@20: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@22: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@23: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: $nodename:0: 'pca9546@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: Unevaluated properties are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@24: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@71: $nodename:0: 'pca9546@71' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@71: Unevaluated properties are not allowed ('i2c@0', 'i2c@1', 'i2c@2' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@24: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: $nodename:0: 'pca9546@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: Unevaluated properties are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@24: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@0/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@0/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@1/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@1/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@a/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@a/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@b/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@b/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@c/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@c/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@d/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@d/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@40: '#address-cells', '#size-cells', 'eeprom@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@60: '#address-cells', '#size-cells', 'eeprom@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@2/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@2/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@3/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@3/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@a/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@a/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@b/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@b/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@40: '#address-cells', '#size-cells', 'eeprom@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@60: '#address-cells', '#size-cells', 'eeprom@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@0/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@0/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@1/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@1/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@a/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@a/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@b/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@b/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@c/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@c/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@d/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@d/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@40: '#address-cells', '#size-cells', 'eeprom@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@60: '#address-cells', '#size-cells', 'eeprom@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@2/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@2/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@3/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@3/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@a/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@a/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@b/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@b/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 was expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: '#address-cells', '#size-cells', 'spi@0', 'spi@20', 'spi@40', 'spi@60' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@40: '#address-cells', '#size-cells', 'eeprom@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@60: '#address-cells', '#size-cells', 'eeprom@0' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a required property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: gpio-keys: 'cpld' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: leds: 'bmc-bootup', 'bmc-heart-beat', 'bmc-init-ok', 'chassis-power-on', 'fan-watchdog' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#





