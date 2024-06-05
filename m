Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5C8FCE9D
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 15:12:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NyRkdlcu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvSYZ29fNz30fM
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 23:12:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NyRkdlcu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvSXb1HbTz3bt2
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 23:11:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 999EE617C4;
	Wed,  5 Jun 2024 13:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F5EC32782;
	Wed,  5 Jun 2024 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717593100;
	bh=3ecZrru2/GYzQqcDBXDGNVE+/+Ok2fQq5FhD3jeyUuY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NyRkdlcu6uGXHn3Sr/TCEIqGbE64+koxiNjqV2RbhQbFIGE7YaFTQyD5g8DcIVeq/
	 aIAq4QNlahHiOGL9SQEH6KSAXacdoLlV+33LkJRV8EIZ9pDRzyBIKcMcxQzNkc0gGc
	 p5zAU7L0GjqLqZFSkSfcaJEAgZ2VnG7a+LowQ9aLYk9a8KT/Ii7smrcWoCexIKLAt+
	 eIcu8HpefXrD+wfybaOHLGZPjeP7nHz6RFHHi23YkPBOYQJoCw8gQd/pTnZtuiyQzx
	 AjKtNWyMyIo5lMZdb7ZoAP+6T/skkLlfVmx4WEUud75uHy3vJOwN513Mf8g6SNRxtj
	 w7kUXHmt2cU8A==
Date: Wed, 05 Jun 2024 07:11:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Liu <liuxiwei1013@gmail.com>
In-Reply-To: <20240605034918.2459000-1-liuxiwei@ieisystem.com>
References: <20240605034918.2459000-1-liuxiwei@ieisystem.com>
Message-Id: <171759284986.2201126.6233217828669971176.robh@kernel.org>
Subject: Re: [PATCH v1] ARM: dts: aspeed: Add IEISystems NF5280M7 BMC
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
Cc: openbmc@lists.ozlabs.org, liubaoyang@ieisystem.com, wangzhiqiang02@ieisystem.com, joel@jms.id.au, wangxingkong@ieisystem.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Wed, 05 Jun 2024 11:49:18 +0800, George Liu wrote:
> The IEISystems NF5280M7 is an x86 platform server with an
> AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
> 
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed/aspeed-bmc-ieisystems-nf5280m7.dts | 658 ++++++++++++++++++
>  2 files changed, 659 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb' for 20240605034918.2459000-1-liuxiwei@ieisystem.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:162.3-16: Warning (reg_format): /ahb/apb/peci-controller@1e78b000/peci-client@30:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:167.3-16: Warning (reg_format): /ahb/apb/peci-controller@1e78b000/peci-client@31:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:305.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:308.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/tmp112@49:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:313.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/emc1413@4c:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:338.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:342.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@76:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:346.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@72:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:350.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@62:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:354.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:358.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@76:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:362.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@72:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:366.5-18: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@62:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:370.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:373.4-14: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:405.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:410.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:415.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:420.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:425.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@4:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:430.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@5:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:435.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@6:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:440.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@7:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:452.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:457.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:462.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:467.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:472.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@4:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:477.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@5:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:482.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@6:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:487.6-16: Warning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@7:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:304.22-316.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:304.22-316.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:337.21-352.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:337.21-352.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:353.20-368.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1: incorrect #address-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:353.20-368.5: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:160.17-163.4: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci-client@30: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:160.17-163.4: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci-client@30: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:165.17-168.4: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci-client@31: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:165.17-168.4: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci-client@31: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:304.22-316.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:304.22-316.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:306.13-310.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/tmp112@49: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:306.13-310.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/tmp112@49: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:311.14-315.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/emc1413@4c: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:311.14-315.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/emc1413@4c: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:337.21-352.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:337.21-352.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:340.16-343.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@76: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:340.16-343.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@76: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:344.16-347.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@72: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:344.16-347.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@72: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:348.15-351.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@62: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:348.15-351.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/vrmp2888@62: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:353.20-368.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:353.20-368.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:356.15-359.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@76: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:356.15-359.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@76: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:360.16-363.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@72: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:360.16-363.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@72: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:364.15-367.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@62: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:364.15-367.6: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/vrmp2888@62: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:369.20-371.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:369.20-371.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:372.20-374.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:372.20-374.5: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:402.22-406.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:402.22-406.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:407.22-411.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:407.22-411.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:412.22-416.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:412.22-416.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:417.22-421.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:417.22-421.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:422.22-426.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@4: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:422.22-426.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@4: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:427.22-431.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@5: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:427.22-431.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@5: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:432.22-436.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@6: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:432.22-436.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@6: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:437.22-441.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@7: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:437.22-441.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@71/i2c@7: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:449.22-453.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@0: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:449.22-453.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@0: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:454.22-458.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@1: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:454.22-458.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@1: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:459.22-463.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@2: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:459.22-463.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@2: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:464.22-468.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@3: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:464.22-468.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:469.22-473.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@4: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:469.22-473.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@4: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:474.22-478.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@5: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:474.22-478.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@5: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:479.22-483.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@6: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:479.22-483.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@6: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:484.22-488.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@7: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:484.22-488.7: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@0/pca9548@72/i2c@7: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /: failed to match any schema with compatible: ['ieisystems,nf5280m7-bmc', 'aspeed,ast2600']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not match '^ethernet(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not match '^ethernet(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: ftgmac@1e670000: $nodename:0: 'ftgmac@1e670000' does not match '^ethernet(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: ftgmac@1e670000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: ftgmac@1e690000: $nodename:0: 'ftgmac@1e690000' does not match '^ethernet(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: ftgmac@1e690000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pinctrl: usb2ad_default:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NR
 I4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP', 'USB
 2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pinctrl: i3c2_default:function:0: 'I3C2' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4',
  'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP', 'USB2BD'
 , 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pinctrl: i3c2_default:groups:0: 'I3C2' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMCG1', 'EMMCG4', 'EMMCG8', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'HVI3C3', 'HVI3C4', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 
 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10G0', 'PWM10G1', 'PWM11G0', 'PWM11G1', 'PWM12G0', 'PWM12G1', 'PWM13G0', 'PWM13G1', 'PWM14G0', 'PWM14G1', 'PWM15G0', 'PWM15G1', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8G0', 'PWM8G1', 'PWM9G0', 'PWM9G1', 'QSPI1', 'QSPI2', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10G0', 'SALT10G1', 'SALT11G0', 'SALT11G1', 'SALT12G0', 'SALT12G1', 'SALT13G0', 'SALT13G1', 'SALT14G0', 'SALT14G1', 'SALT15G0', 'SALT15G1', 'SALT16G0', 'SALT16G1', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9G0', 'SALT9G1', 'SD1', 'SD2', 'SD3', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH1
 4', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12G0', 'UART12G1', 'UART13G0', 'UART13G1', 'UART6', 'UART7', 'UART8', 'UART9', 'USBA', 'USBB', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pinctrl: usb11bhid_default:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3
 ', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP'
 , 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pinctrl: i3c1_default:function:0: 'I3C1' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4',
  'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP', 'USB2BD'
 , 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pinctrl: i3c1_default:groups:0: 'I3C1' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMCG1', 'EMMCG4', 'EMMCG8', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'HVI3C3', 'HVI3C4', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 
 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10G0', 'PWM10G1', 'PWM11G0', 'PWM11G1', 'PWM12G0', 'PWM12G1', 'PWM13G0', 'PWM13G1', 'PWM14G0', 'PWM14G1', 'PWM15G0', 'PWM15G1', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8G0', 'PWM8G1', 'PWM9G0', 'PWM9G1', 'QSPI1', 'QSPI2', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10G0', 'SALT10G1', 'SALT11G0', 'SALT11G1', 'SALT12G0', 'SALT12G1', 'SALT13G0', 'SALT13G1', 'SALT14G0', 'SALT14G1', 'SALT15G0', 'SALT15G1', 'SALT16G0', 'SALT16G1', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9G0', 'SALT9G1', 'SD1', 'SD2', 'SD3', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH1
 4', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12G0', 'UART12G1', 'UART13G0', 'UART13G1', 'UART6', 'UART7', 'UART8', 'UART9', 'USBA', 'USBB', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/xdma@1e6e7000: failed to match any schema with compatible: ['aspeed,ast2600-xdma']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: crypto@1e6fa000: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2600-video-engine']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: sgpiom@1e780500: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: sgpiom@1e780600: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: peci-controller@1e78b000: 'gpios', 'peci-client@30', 'peci-client@31' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/peci-controller@1e78b000/peci-client@30: failed to match any schema with compatible: ['intel,peci-client']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/peci-controller@1e78b000/peci-client@31: failed to match any schema with compatible: ['intel,peci-client']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: lpc@1e789000: lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: lpc@1e789000: reg-io-width: [[4]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9546@70: $nodename:0: 'pca9546@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9546@70: Unevaluated properties are not allowed ('i2c@2' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/bus@1e78a000/i2c-bus@180/pca9546@70/i2c@2/emc1413@4c: failed to match any schema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/bus@1e78a000/i2c-bus@280/ipmb0@10: failed to match any schema with compatible: ['ipmb-dev']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9546@70: $nodename:0: 'pca9546@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9546@70: Unevaluated properties are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', 'i2c@6', 'i2c@7' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9548@71: $nodename:0: 'pca9548@71' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9548@71: Unevaluated properties are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', 'i2c@6', 'i2c@7' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9548@72: $nodename:0: 'pca9548@72' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9548@72: Unevaluated properties are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', 'i2c@6', 'i2c@7' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#retries' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9555@21: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: pca9555@22: '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: gpio-keys: 'cpld' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: leds: 'fan-fault', 'heartbeat', 'memory-fault', 'psu-fault', 'system-fault', 'system-hot' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#





