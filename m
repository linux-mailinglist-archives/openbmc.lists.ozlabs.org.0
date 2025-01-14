Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A6A10517
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 12:14:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXRMj3Cs8z3bnV
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 22:13:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736853231;
	cv=none; b=Q4k0a+X+hdY/tBGI+15y79ZkJ36aCiByAdgnIGNgJ5BMwyeXf6uRvPjpEzIPCaqZSyLev+JPC1PXLIYHzDARBZzdEHSeqALGguN+2+xAWV39jvm8Bn9WhDpOZsd951WE3keJp/MrO+Ap0lJUQ4TNN7J0i/VgsQNrQ7UUoRd0SKZu0wWgSErZ5r/hthq4sG1+vL28O9vPlkUi+87f5NlusHg8bY1c4G39odWc9EZkQxUqlWsdy+VEzzv+r7zK9M+4VVEGV+j/DgDqwTQTpvC5Ec+yE4wWEUJ9Nge0C8sFyszBplTynj/OIAvV7mYN2WUuxQlmRl+irBzJKvuEImlT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736853231; c=relaxed/relaxed;
	bh=JWZ/sNMf6EXjcbmGN6fw7ydS0I5WWCNmR6xpTWBm5V8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ba7qhFGvs4MBZZvzf9K5MmTWabgYRYhg5FkcbDCs8d4pSzTb/LVR5kHuB4UCKXy19Lw5LDZ0xJeAyxSAKv/7mjgMfIq4n0duQS95++Dsga37GA5vPuZSDx0K4j5UxsqarX2xfj77GcAxrja4YZBcqMqC3ERqRlb/p62P37UHa8h6ypITmbgVyg/CzRpbdcF3vA2eCE/escYaOvlDEp5Kc44x2Wordpps6HMwurhgxlGBJHNs6TNOisMBiF7/hvZ8nozH/LBaTaOxwVIHC2yhIh1t4Xcz6v3vPRjBGB/fY1nGgoEBBjcSAwLkINT2ym6ZFyz9PWv2CwRzElGN6f088w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jms.id.au; dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HKFD3N10; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HKFD3N10;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXRMc1PP8z2yxP
	for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2025 22:13:47 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso970102766b.2
        for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2025 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1736853222; x=1737458022; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JWZ/sNMf6EXjcbmGN6fw7ydS0I5WWCNmR6xpTWBm5V8=;
        b=HKFD3N10GhcA4Y64hu31jgalACNnfURF1evlbDscmJ3YxgvtJQsmZGhat6mgkht+5F
         aaHMAm2rfYU4JU0drGHbjd8DJruZp7nYBvpVr5CyTNkJSnU0cpIM8C7AYRg6VPRPhnRH
         O4XCmQCUX9iR9trsCfvOG0voRCRGjfxUzQhwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853222; x=1737458022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWZ/sNMf6EXjcbmGN6fw7ydS0I5WWCNmR6xpTWBm5V8=;
        b=BRZGvkqdoI86zru98M3fF4faCLtduz9jwwhEKlDQlqsJYGPwgNETtQSBLzF4QpNJX+
         NiiW+mIKk2siNoJYQBhq6cqTzanLX8+A0nOI9/rdQmqgWfsz+wpqGQyChl9MDgoCIIvE
         jLnZRnKJNfODkbfaVLOf/D9uGzZxRcD1XhtiRYXdNgjlA+gBPFUYeL1G2Hz5vq+TUgAm
         /rKHXf1hMmeyZhyY7U22U8YxPDuSRYH9t+Hd9fzyVIZv5lLACiX4axIcUA3yPNYVG5nG
         csws0iGpZTJwq99FGbPIpLYKylU2N5lwIWRq2vmFnHAScpZHFeuIupl9rpXgp4HrRrjx
         YJsw==
X-Gm-Message-State: AOJu0Yye2hvdLgPx5q8+82fESf6gpKhRTBsGCyq6GLUmSdMTuO0S3BVn
	ozBMQV4QxterLnlK0Jdh3Af72My4LC0h1qdWteTZvclxFNPOwf6oCfwLPjl5uMEV5SCx9/C1M6w
	dAFX9+D9xgasKTEF743yGQMp6VoeQcekH
X-Gm-Gg: ASbGncszgJGSn92K7yAiA667gHQ38iLChhzI4HibdE1t1dr8R4+sNq9paXR9uARe0cm
	H+9i09YKjIXtPD2UgU8CBZvaKy4NF+PZKMgPd7g==
X-Google-Smtp-Source: AGHT+IE0nebc1/Ook/QXeCZEuS30TClVWGCSirCWkM7A4eLthhv8smZcugAzuNdVkPNX6K+TuSCrLl3adZhlMFTMd0E=
X-Received: by 2002:a17:907:9410:b0:aae:8495:e064 with SMTP id
 a640c23a62f3a-ab2abc78b52mr1938404466b.40.1736853222076; Tue, 14 Jan 2025
 03:13:42 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Jan 2025 21:43:29 +1030
X-Gm-Features: AbW1kvahde-k7_-C9ftsFA6wpHoLsgKVhDjeGXBGQuotHCNkZs_JxzJfsePJ8SY
Message-ID: <CACPK8Xfo4UAxjOq5__9ijK0ct0ibFLf6O8M_0Aoc1VbTHKCgfQ@mail.gmail.com>
Subject: OpenBMC Linux v6.12
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Ninad Palsule <ninad@linux.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here's the new kernel tree, based on the upstream LTS v6.12 release.

  https://gerrit.openbmc.org/c/openbmc/openbmc/+/77224

Please test your machines and +1 the patch. Note that two of the
machines didn't pass CI as the kernel is too big for the image.

The tree contains most of the patches that were in 6.6. A large amount
of code has been merged upstream, which is great. Congratulations if
you landed a patch over the past year, it makes for an easier to
maintain openbmc tree, and means you get security backports for free.

Notably these patches didn't make it in the rebase:

pmbus (core): One-shot retries for failure to set page
pmbus (max31785): Wrap all I2C accessors in one-shot failure handlers

-> now uses pmbus_wait, which is the upstream solution to slow to
respond i2c devices

i2c: core: Add mux root adapter operations
iio: si7020: Lock root adapter to wait for reset

-> Eddie, please resubmit if still required as the core patch does not
apply. Ideally speak with upstream about a long term solution.

eeprom: ee1004: Enable devices on multiple busses
dt-bindings: trivial-devices: Add Atmel
AT30TSE004A serial eeprom

-> Eddie, please resubmit if still required, as it does not apply cleanly

leds: pca955x: Add HW blink support
 -> Eddie, please resend upstream now that the led maintainer seems to
be active again. You don't need to resend as the patches are in
dev-6.12.

ARM: aspeed_g5_defconfig: Enable G6 sensors, PWM and regulators
 -> Andrew to send upstream

Eddie and Ninad, the various IBM systems that used XDMA went upstream.
The revert that Andrew sent to keep the nodes in place is still in the
tree, some machines might still be missing them. Please submit your
downstream patches while you work on a long term solution there.

The gerrit commit message for the bump follows:

There are 92 patches in the tree, with 30 of those patches not yet
queued for merging in mainline.

v6.12 is an LTS kernel as decreed by the kernel.org maintainers. The
OpenBMC kernel maintainers encourage everyone to ship the latest
kernel as it has the most code review and upstream code.

    Andrew Geissler (1):
          ARM: dts: aspeed: Revert "Remove undocumented XDMA nodes"

    Andrew Jeffery (6):
          ARM: dts: aspeed: Rework APB nodes
          dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
          pmbus (max31785): Add support for devicetree configuration
          ARM: dts: aspeed: witherspoon: Update max31785 node
          ipmi: kcs_bmc: Add a "raw" character device interface
          ARM: aspeed_g5_defconfig: Enable G6 sensors, PWM and regulators

    C=C3=A9dric Le Goater (1):
          /dev/mem: add a devmem kernel parameter to activate the device

    Eddie James (14):
          dt-bindings: soc: Add Aspeed XDMA Engine
          soc: aspeed: Add XDMA Engine Driver
          soc: aspeed: xdma: Add user interface
          soc: aspeed: xdma: Add reset ioctl
          soc: aspeed: xdma: Add trace events
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

    Joel Stanley (4):
          ARM: aspeed: Add debugfs directory
          ARM: soc: aspeed: Add secure boot controller support
          ARM: dts: nuvoton: npmc750-evb: Add default console
          leds: pca955x: Revert "Remove the unused function
pca95xx_num_led_regs()"

    Karthikeyan Pasupathi (1):
          ARM: dts: aspeed: Yosemite V2: Enable OCP debug card

    Ninad Palsule (1):
          ARM: dts: aspeed: system1: Add fan controller properties

    Zev Weiss (1):
          ARM: dts: aspeed: asrock: Add BIOS SPI flash chips
