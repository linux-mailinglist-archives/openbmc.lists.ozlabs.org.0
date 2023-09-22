Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C917AA9AC
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 09:05:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YBZh07S+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsNZV0Nx4z3cdx
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 17:05:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YBZh07S+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsNYw0bR4z3cDR
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 17:04:51 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso135204466b.0
        for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 00:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695366289; x=1695971089; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sfqf8cnki244xAwAdpgtaUSjmqYOiXAg9EQy8ZqTVBU=;
        b=YBZh07S+W8Y44Usi43HrP/cCoZAtIAPBNY2wJDDI821IqF4KKgIr30o2JYUZ/9d0jP
         ilASPvge+kSgW9kzmwqguZR2vedy60SzHEopAWY1kF/eSU6QObsHeeQ4TgXYubGJ+1tW
         RIjbBrJ1eZyfhF+CUIv1MkkgxH5Ly6dNgq3Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695366289; x=1695971089;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sfqf8cnki244xAwAdpgtaUSjmqYOiXAg9EQy8ZqTVBU=;
        b=jnUR+CzZfyE8lYv7Ltye63IOT1iGHjsfhcnZK50ppPtzdNOIuA9YqXj9gMMghPntkV
         OgqUMyK46kbnX2rYXWoyT4aQ6CuGRW3GDoRxpkoRRgZ5+BAbhDFoK7ZMQ4Wd8i1W9ss7
         q0h81V7Swbwp77aklnxnyPbhPOKRW87E4cTJCD04LpKq0SyEY7G1fHieECwrownyPlCy
         woezX28KR0S/NnMJQDa8C5kjWRcRi90VuN4tJqLYzQPZTi5J3d8HzmYY8xpaTQle9S8u
         y+CadZZqMShBEQjWdjF+ptZq/CbU63ztB1lvRyaNh7m/ksIOavtcyfyiHM1J05f9Snwa
         1TMA==
X-Gm-Message-State: AOJu0YxvVPTgFR61eQYAdYTt9cbFLUOVRcnG8s5wLTbxJUtvwLe/UyTn
	kvTK3ikZ/kBXVo5H2ziGgl7E6l/PI/mdy8UZO3nV7zz/jTA=
X-Google-Smtp-Source: AGHT+IEorOnPmQrLiwF/VuakKv015EkcGOFf15AVNOZDNhES9PG15S361yoEAziUvEoHMPM+mPaEhiRo22D+mdi8A/0=
X-Received: by 2002:a17:907:a428:b0:9a9:405b:26d1 with SMTP id
 sg40-20020a170907a42800b009a9405b26d1mr2229354ejc.5.1695366288612; Fri, 22
 Sep 2023 00:04:48 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Sep 2023 07:04:37 +0000
Message-ID: <CACPK8XcjcxefBL3rhx3f_TPO-TRtkxTUP07qvRniFJS4dmaNPQ@mail.gmail.com>
Subject: OpenBMC Linux 6.5
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm moving the kernel tree openbmc uses to a 6.5 base for ASPEED.

+1 party is here:

   https://gerrit.openbmc.org/c/openbmc/openbmc/+/61083

Testing is appreciated.

This tree will be short lived, as we intend to keep moving over the
next few releases until the next LTS comes out. By moving now we can
shake out any issues with the past year of upstream development.

The 6.5 kernel moved all 32-bit ARM device trees, so our BMC device
trees are now under an 'aspeed' subdirectory. This change means systems
must set KERNEL_DEVICETREE with the aspeed directory prefix. This
patch made the update for all in-tree aspeed systems.

There are 78 patches in the tree, with 40 of those patches not
yet queued for merging in v6.6.

The remaining out of tree patches include:

Andrew Jeffery (6):
      dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
      pmbus (max31785): Add support for devicetree configuration
      pmbus (core): One-shot retries for failure to set page
      pmbus (max31785): Wrap all I2C accessors in one-shot failure handlers
      ARM: dts: aspeed: witherspoon: Update max31785 node
      ipmi: kcs_bmc: Add a "raw" character device interface

C=C3=A9dric Le Goater (1):
      /dev/mem: add a devmem kernel parameter to activate the device

Eddie James (16):
      ARM: dts: aspeed: bonnell: Add reserved memory for TPM event log
      dt-bindings: soc: Add Aspeed XDMA Engine
      soc: aspeed: Add XDMA Engine Driver
      soc: aspeed: xdma: Add user interface
      soc: aspeed: xdma: Add reset ioctl
      soc: aspeed: xdma: Add trace events
      i2c: core: Add mux root adapter operations
      iio: si7020: Lock root adapter to wait for reset
      eeprom: ee1004: Enable devices on multiple busses
      dt-bindings: trivial-devices: Add Atmel AT30TSE004A serial eeprom
      eeprom: ee1004: Add OF matching support
      leds: pca955x: Refactor with helper functions and renaming
      leds: pca955x: Use pointers to driver data rather than I2C client
      leds: pca955x: Optimize probe led selection
      leds: pca955x: Add HW blink support
      leds: Ensure hardware blinking turns off when requested

Jae Hyun Yoo (1):
      clk: ast2600: enable BCLK for PCI/PCIe bus always

Joel Stanley (14):
      net: ftgmac100: Ensure tx descriptor updates are visible
      ARM: aspeed: Add debugfs directory
      ARM: soc: aspeed: Add secure boot controller support
      dt-bindings: trivial-devices: Remove Infineon SLB9673 TPM
      ARM: dts: nuvoton: npmc750-evb: Add default console
      tpm: tis-i2c: Add more compatible strings
      leds: pca955x: Revert "Remove the unused function pca95xx_num_led_reg=
s()"
      arm64: configs: Add Nuvoton NPCM defconfig
      ARM: configs: aspeed: Add new FSI drivers
      ARM: config: aspeed_g5: Enable SSIF BMC driver
      ARM: config: aspeed: Remove FIRMWARE_MEMMAP
      ARM: config: aspeed: Add Ampere SMPro drivers
      ARM: config: Add openbmc defconfig
      ARM: config: openbmc: Add HPE GPX and Nuvoton 7xx

Johannes Holland (1):
      dt-bindings: tpm: Add schema for TIS I2C devices

Potin Lai (1):
      mtd: spi-nor: winbond: Add support for w25q01jvq
