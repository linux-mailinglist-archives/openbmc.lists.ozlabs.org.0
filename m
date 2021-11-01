Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB044140D
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 08:17:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjPVW12J2z2xXt
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 18:17:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=aqudf0Tj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aqudf0Tj; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjPV456wsz2xXt
 for <openbmc@lists.ozlabs.org>; Mon,  1 Nov 2021 18:16:42 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id r2so13753426qtw.12
 for <openbmc@lists.ozlabs.org>; Mon, 01 Nov 2021 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=loP+hYXo3hnBagdXsJW3Jp4P66sTN540D9a+pFZRACo=;
 b=aqudf0TjjlTH0cV/fNrdt0ZF4NN9hCNdvae+ac0XILcVic3tg9bOdibQsegkv9tmML
 1JyhdvRrs3Xm7q+abrFRH7UGr+PTyBI69vAqFva6Km10blCYaI6JgyQlMYqvKfpvT72N
 xzPvn8Dtmclr80bD6TKxot/ZEhydgJ6M2Dbck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=loP+hYXo3hnBagdXsJW3Jp4P66sTN540D9a+pFZRACo=;
 b=53q+Mx9OT/Q7FnNLEX1DD81So7A/dhFlGuP4UpkiZCNjzYHs2NI6Lu3AfdzB50J1av
 5/LefboqSjpiUym3HolNwdSD2demCTTNRJUSXiIIADS2p3ILJyOFSpD043V/i2rLC4Kl
 nk8Ly75rue9anZX308hTHx5DSkEzwEyzhRqcgFUpiPb9U1+vfMbpbQzLIEGVoTR96+ez
 5Z46incrkrM4u1cpjJl2An8kPbgYBYzIul7qR1TIHWjtwy630LZSv4ArX0msWgsi2IJT
 islsF73PUKEFb0dsIRGko5SaFAdlV2EEsR5C9kW+MLxpZwdPZJxgF2dFOHbJ8zCEEmCl
 qkNw==
X-Gm-Message-State: AOAM531kL1o/L3KFVN0BAQILJoAF2SuzKMvskwreIFvJgN2e80CpVK36
 +UD1ZuFvgUX0KxPZa7S7BZMRsoiZVYktXsNDDBjF2XAL1AE=
X-Google-Smtp-Source: ABdhPJz/V8cfFXMfI+fAY+9xR3fCMFpXklrszr3Wf5G6I12jgF5PjE89RD7RTnVf142FxA71j3Oqlt5nqMuJzRgsswo=
X-Received: by 2002:a05:622a:1450:: with SMTP id
 v16mr18155251qtx.25.1635750998005; 
 Mon, 01 Nov 2021 00:16:38 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Nov 2021 07:16:26 +0000
Message-ID: <CACPK8XcnJ1HLgxdCVMvZ5Z82uxakeBqPWf7+J3QT_o8jp3c_qg@mail.gmail.com>
Subject: Kernel moving to Linux v5.15
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The openbmc kernel will move to a v5.15 base. There are 73 patches in
the tree, not counting changes that will be merged in v5.16 which have
been backported.

 https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48487

I have rebased all patches from dev-5.14, but have not tested or
bumped Nuvoton as no one has done any development there since the last
rebase. I assume no one is using the OpenBMC tree for Nuvoton
machines. I plan to drop the Nuvoton patches we carry in the openbmc
tree when rebasing v5.16. They can be picked up again when an upstream
submission is made.

Below is a list of the out of tree patches.

Andrew Jeffery (10):
      dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
      pmbus (max31785): Add support for devicetree configuration
      pmbus (core): Use driver callbacks in pmbus_get_fan_rate()
      pmbus (core): One-shot retries for failure to set page
      pmbus (max31785): Wrap all I2C accessors in one-shot failure handlers
      ARM: dts: aspeed: witherspoon: Update max31785 node
      ipmi: kcs_bmc: Add a "raw" character device interface
      ARM: dts: tacoma: Clean up KCS nodes
      leds: pca955x: Make the gpiochip always expose all pins
      leds: pca955x: Allow zero LEDs to be specified

Brad Bishop (3):
      ipmi: aspeed-g6: Add compatible strings
      reset: simple: Add AST2600 compatibility string
      eeprom: at25: Split reads into chunks and cap write size

C=C3=A9dric Le Goater (19):
      mtd: spi-nor: aspeed: use command mode for reads
      mtd: spi-nor: aspeed: add support for SPI dual IO read mode
      mtd: spi-nor: aspeed: link controller with the ahb clock
      mtd: spi-nor: aspeed: optimize read mode
      mtd: spi-nor: aspeed: limit the maximum SPI frequency
      mtd: spi-nor: aspeed: introduce a aspeed_smc_default_read() helper
      mtd: spi-nor: aspeed: clarify 4BYTE address mode mask
      mtd: spi-nor: aspeed: use memcpy_fromio() to capture the
optimization buffer
      mtd: spi-nor: aspeed: add support for the 4B opcodes
      mtd: spi-nor: Add support for w25q512jv
      mtd: spi-nor: aspeed: Introduce a field for the AHB physical address
      mtd: spi-nor: aspeed: Introduce segment operations
      mtd: spi-nor: aspeed: add initial support for ast2600
      mtd: spi-nor: aspeed: Check for disabled segments on the AST2600
      mtd: spi-nor: aspeed: Introduce training operations per platform
      mtd: spi-nor: aspeed: Introduce a HCLK mask for training
      mtd: spi-nor: aspeed: check upper freq limit when doing training
      mtd: spi-nor: aspeed: add support for AST2600 training
      /dev/mem: add a devmem kernel parameter to activate the device

Eddie James (8):
      soc: aspeed: Add XDMA Engine Driver
      soc: aspeed: xdma: Add user interface
      soc: aspeed: xdma: Add reset ioctl
      dt-bindings: input: Add documentation for IBM Operation Panel
      input: misc: Add IBM Operation Panel driver
      ARM: dts: aspeed: tacoma: Remove CFAM reset GPIO
      spi: fsi: Print status on error
      spi: fsi: Fix contention in the FSI2SPI engine

Fran Hsu (2):
      ARM: dts: nuvoton: npcm730: Add UDC device
      ARM: dts: nuvoton: gsj: Add non-mainline nodes

George Hung (4):
      dt-binding: edac: add NPCM ECC documentation
      edac: npcm: Add Nuvoton NPCM7xx EDAC driver
      ARM: dts: nuvoton: gbs: split SPI flash partition
      ARM: dts: nuvoton: gbs: Change the name of the partitions

Jae Hyun Yoo (1):
      clk: ast2600: enable BCLK for PCI/PCIe bus always

Joel Stanley (4):
      net: ftgmac100: Ensure tx descriptor updates are visible
      ARM: dts: ast2600evb: Enable EHCI controller
      ARM: configs: aspeed: Add openbmc kernel options
      ipmi: bt-bmc: Use registers directly

Tomer Maimon (21):
      dt-binding: bmc: Add NPCM7xx LPC BPC documentation
      misc: npcm7xx-lpc-bpc: add NPCM7xx BIOS post code driver
      dt-binding: bmc: add npcm7xx pci mailbox document
      misc: mbox: add npcm7xx pci mailbox driver
      dt-binding: net: document NPCM7xx EMC DT bindings
      net: npcm: add NPCM7xx Ethernet MAC controller
      ARM: dts: npcm7xx: Add out of tree nodes
      ARM: dts: olympus: Add non-mainline nodes
      ARM: dts: npcm750: Add fuse regmap support node
      ARM: dts: npcm7xx: Link fuse syscon to adc and wdt
      clk: npcm7xx: add read only flag to divider clocks
      iio: adc: Add calibration support to npcm ADC
      watchdog: npcm: Add DT restart priority and reset type support
      pinctrl: npcm7xx: Add HGPIO pin support to NPCM7xx pinctrl driver
      pinctrl: pinconf: add pin persist configuration
      pinctrl: npcm7xx: Add pin persist configuration support
      spi: npcm-pspi: Add full duplex support
      dt-binding: bmc: add NPCM7XX JTAG master documentation
      misc: Add NPCM7xx JTAG master driver
      watchdog: npcm: Modify get reset status function
      ARM: configs: add defconfig for Nuvoton NPCM7xx BMC

William A. Kennington III (1):
      net: npcm: Support for fixed PHYs
