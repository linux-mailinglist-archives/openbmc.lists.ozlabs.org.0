Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC1D92A4D0
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 16:35:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZdyR/HZW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHmqn6fM4z3cSN
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 00:35:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZdyR/HZW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHmq951Ccz30VP;
	Tue,  9 Jul 2024 00:34:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49F9260DEB;
	Mon,  8 Jul 2024 14:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E50C4AF0D;
	Mon,  8 Jul 2024 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720449282;
	bh=/LShjeGtrMmHUULqWRnLZxuzvWh0G7kz3v+Nwj3y9zo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZdyR/HZWIswiYZwYI7CevZT+Iq4hzg1OZVoJZwaHXVxujfIhXs/zqRJ6msOaMEO8s
	 vLsRzVBCIcvW4h2yXp7lKWaxFOIchgyuXHnhU0J8Tb8riY1hWSZEIJnBCEaZCNW7/x
	 mIM1kp9Kyzn1Wz2c3pAzN76vHQjIGl45qmc8tiNBg9Dep3a+4PC7SNZPoAuxEppoek
	 YP/8RnXo2FAEs1/Pb7LdW2qZqjCz8b/1c6gFrb+7PI2gYakPK6yMpaoJc59pBAPLIW
	 ACtsVocm5s5UuD7ZenetTOR54WYfC/tqw8kcz6nkUu2ByYfXhaXD+PboFqceeAUSQm
	 9Eg3KIAVDwsSg==
Date: Mon, 08 Jul 2024 08:34:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Liu <liuxiwei1013@gmail.com>
In-Reply-To: <20240708062316.208383-1-liuxiwei@ieisystem.com>
References: <20240708062316.208383-1-liuxiwei@ieisystem.com>
Message-Id: <172044909462.3146303.7635761790191924717.robh@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add IEISystems NF5280M7 BMC
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Mon, 08 Jul 2024 14:23:16 +0800, George Liu wrote:
> The IEISystems NF5280M7 is an x86 platform server with an
> AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
> 
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed/aspeed-bmc-ieisystems-nf5280m7.dts | 697 ++++++++++++++++++
>  2 files changed, 698 insertions(+)
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb' for 20240708062316.208383-1-liuxiwei@ieisystem.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:169.3-16: Warning (reg_format): /ahb/apb/peci-controller@1e78b000/peci-client@30:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:174.3-16: Warning (reg_format): /ahb/apb/peci-controller@1e78b000/peci-client@31:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:167.17-170.4: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci-client@30: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:167.17-170.4: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci-client@30: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:172.17-175.4: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci-client@31: Relying on default #address-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts:172.17-175.4: Warning (avoid_default_addr_size): /ahb/apb/peci-controller@1e78b000/peci-client@31: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	'ieisystems,nf5280m7-bmc' is not one of ['delta,ahe50dc-bmc', 'facebook,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
	'ieisystems,nf5280m7-bmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-bmc']
	'ieisystems,nf5280m7-bmc' is not one of ['ampere,mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchley-bmc', 'facebook,cloudripper-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc', 'ibm,blueridge-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
	'aspeed,ast2400' was expected
	'aspeed,ast2500' was expected
	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
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
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/bus@1e78a000/i2c@180/i2c-mux@70/i2c@2/temperature-sensor@4c: failed to match any schema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: /ahb/apb/bus@1e78a000/i2c@280/ipmb0@10: failed to match any schema with compatible: ['ipmb-dev']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c-switch@70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c-switch@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4', 'i2c@5', 'i2c@6', 'i2c@7' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dtb: i2c@400: Unevaluated properties are not allowed ('#retries' was unexpected)
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





