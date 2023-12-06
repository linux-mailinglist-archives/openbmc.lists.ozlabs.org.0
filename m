Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D298067E0
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 08:00:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jxNiOopA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlSwZ6fTvz3c13
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 18:00:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jxNiOopA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlSw03y5Qz2y1l
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 18:00:15 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so5491700a12.3
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 23:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701846011; x=1702450811; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aVyeV6ROTmbZaj5YI5jkLNQKIJ8Hzdk60wevd17dhlM=;
        b=jxNiOopAkhogb4ahC40HgNuzGmtLgQYC9VgyQnZi3ff3hdFdKbe9ClPjIaycMUTSkj
         wyclw4rbkd/Tna27YzKo5oppf0B4e52WHVsdKF/uInXXkjW+oiIYGDdLElAPY/x30v3u
         PaSDU2cWjCt4S3b8JAZxbGs/6MKGjynGdrzDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701846011; x=1702450811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVyeV6ROTmbZaj5YI5jkLNQKIJ8Hzdk60wevd17dhlM=;
        b=VRmWA2cN3k+M7dcv9IsQmUZ6Fhw/FZQjIN2Fr5uUfZ2VF+giHbnnXr/dCii+8bAu3S
         OifgdB81Ni/QTSUbcayLJRkW8jVTC+rlpdxxjgg7VPZbJWV8H3hgn+SyPiraYTslj09S
         IZgq1m2KP+2LkYWwX5r3ENUXcSptbm9X0Toks9NqLhRTV/MoKmgdjiB5f3zpAJo/k+XA
         cVgs2IMpjNBdkXLXdK+mi99H+boH/K4oBm/8AZ6WSBPNTe78ZWGW+C0GibTbwKfUODBT
         ha9JUnHbZADDx9PaPlVkQ+Gh9lh5EmR+mOrgVnP+P8CtCkZ37hAx9BTXumrhv1tZLkQr
         hSiQ==
X-Gm-Message-State: AOJu0YzFDMwQN6KhcFPFnG+p9FbXwVinnOXJduXV10bE9IhXFSPNkCjO
	/lByN+S3XAuDR69HSRTOh8DqgBWgcHlBaT4IEDLuho+JrMc=
X-Google-Smtp-Source: AGHT+IFryeqAtMa/gDT5oR+LcS95NT0+H64nI5AzUoF+0K6VC71lK2WAPUYLFbcMjlF4Ec66G32W109k4U7OXwFHIWY=
X-Received: by 2002:a17:906:4ac1:b0:a19:9b79:8b51 with SMTP id
 u1-20020a1709064ac100b00a199b798b51mr188270ejt.98.1701846010639; Tue, 05 Dec
 2023 23:00:10 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Dec 2023 17:29:59 +1030
Message-ID: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
Subject: OpenBMC Linux 6.6
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hot on the heels of the last bump, here is the latest kernel base for
the aspeed machines.

  https://gerrit.openbmc.org/c/openbmc/openbmc/+/67772

If you're able to test, please comment on gerrit and give the change a +1.

There was a config regression due to CONFIG_EMBEDDED going away, which
is fixed separately here:

  https://gerrit.openbmc.org/c/openbmc/openbmc/+/68117

Commit message for the bump follows:

There are 56 patches in the tree, with 36 of those patches not
yet queued for merging in v6.7.

v6.6 is an LTS kernel as decreed by the kernel.org maintainers. The
OpenBMC kernel maintainers encourage everyone to ship the latest kernel
as it has the most code review and upstream code.

Andrew Jeffery (6):
      dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
      pmbus (max31785): Add support for devicetree configuration
      pmbus (core): One-shot retries for failure to set page
      pmbus (max31785): Wrap all I2C accessors in one-shot failure handlers
      ARM: dts: aspeed: witherspoon: Update max31785 node
      ipmi: kcs_bmc: Add a "raw" character device interface

C=C3=A9dric Le Goater (1):
      /dev/mem: add a devmem kernel parameter to activate the device

Eddie James (19):
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
      ARM: dts: aspeed: Rainier: Add fan controller properties
      ARM: dts: aspeed: Everest: Add fan controller properties
      ARM: dts: aspeed: Bonnell: Add fan controller properties
      ARM: dts: aspeed: Rainier 4U: Delete fan dual-tach properties

Jae Hyun Yoo (1):
      clk: ast2600: enable BCLK for PCI/PCIe bus always

Joel Stanley (7):
      net: ftgmac100: Ensure tx descriptor updates are visible
      ARM: aspeed: Add debugfs directory
      ARM: soc: aspeed: Add secure boot controller support
      dt-bindings: trivial-devices: Remove Infineon SLB9673 TPM
      ARM: dts: nuvoton: npmc750-evb: Add default console
      tpm: tis-i2c: Add more compatible strings
      leds: pca955x: Revert "Remove the unused function pca95xx_num_led_reg=
s()"

Johannes Holland (1):
      dt-bindings: tpm: Add schema for TIS I2C devices

Potin Lai (1):
      mtd: spi-nor: winbond: Add support for w25q01jvq

Change-Id: I8b756421a7da84c0070e2ad4ac84a93984703457
Signed-off-by: Joel Stanley <joel@jms.id.au>
