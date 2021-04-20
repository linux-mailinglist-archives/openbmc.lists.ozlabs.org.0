Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 512F0365287
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:47:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ4732Ljz2yR4
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:47:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bqHJTPZa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bqHJTPZa; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ3w1LpHz2xYl
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:05 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id h11so7220973pfn.0
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UUn2nKDfLIqSCuFFNc0E0ZN49Yrg1MRtRilIr16PQhA=;
 b=bqHJTPZaMVZEs/N572wxZZDYN/OXrsh3VCde5sAyQzt5aIuz92cLWDVcSkYtH2kYy1
 N/zPJsqg5aqW575NSnm1RpJ239q8ZUWZx2D4brNerAjLxVVeixTddihuThw+K9MS43Ac
 Eo0VJQCldV49eBXn+PCg/dYMO4IBTcJWKuIjWgt8yhZ7Gk9n/hxIql6u1Oenr2sSIgXv
 0sih4UcBvFyc78y8xinC9EAXszy+UDnfaJXp3z11eAf2Pg3TWVHc6tyt0AoNqv5xx8bI
 JMohT5gAmC/OVdJrR05nO/EBecFf5xIolQ7ouATio41QW4l16xWh2kZxYiHkYtJWrdl3
 ormg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UUn2nKDfLIqSCuFFNc0E0ZN49Yrg1MRtRilIr16PQhA=;
 b=iQhJx7+xItou+2n8fQBiRwD+IYXJMGphpoxTckKGt3cNbLzFP1rBah5vYmEFIwDQ6T
 7Uo0OxsFYZzhoKBW2Nwm4b0ZMKuwgeWXPP+0tAnDMup6MDMQe5w08zmQd36P3eHCla8p
 qNmL1AbqIMB+wYrQ98gnDCYK8aOpRYYTXTaRP0dtt4T1IXi/EZDY+rOlFWoUziiQ39gm
 MuxafldZ4OjZyV1+hmoDXQ8jSASeY6ZZffcM5tLWlpFhF8E51JZf7uWWW//n+6Yel9Zo
 b19g8Ybe7xfxbOV3JXrCEivn1YWDPDG2gJadCXYCZ/xpFLyJvgaMFK0r2ki7PnQbwD4a
 TwxA==
X-Gm-Message-State: AOAM533RV/LMRjEY9BiikcOh4c7M4x2R7cbuVhdH5Ydow9r/6Jqb8A51
 D7AIlAPLIVFftAC3a8SKMkW6Hy4rcFc=
X-Google-Smtp-Source: ABdhPJy7EhJgkPt4IlLuhwEV4bSnliiA+PL0l229GTcrDZwLYzCykumvUoDKqcIIGH76KvQLyp2Bvg==
X-Received: by 2002:a63:6ec1:: with SMTP id
 j184mr15425453pgc.364.1618901221666; 
 Mon, 19 Apr 2021 23:47:01 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:00 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 00/10] Use HACE to
 accelerate sha512
Date: Tue, 20 Apr 2021 16:16:38 +0930
Message-Id: <20210420064648.994075-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds support to u-boot to using the HACE hardware in the
AST2600 to perform SHA hashing during boot, and enable the SPL features
to load u-boot as a signed FIT.

This is only applicable for MMC booting, as the HACE cannot be used to
hash directly from the memory mapped SPI NOR.

These have been tested with Cédric's aspeed-6.0 Qemu tree. You can
reproduce using the script in this repository:

 https://github.com/shenki/qemu-boot-test

Joel Stanley (10):
  configs/ast2600: Make early malloc pool larger
  crypto: Add driver for Aspeed HACE
  ast2600: Enable HACE probing in SPL
  ast2600: Add HACE to device tree
  ast2600: spl: Remove SECBOOT BL2 kconfig option
  ast2600: spl: Add ASPEED_LOADERS option
  ast2600: spl: Support common boot loader features
  config: ast2600: Configure common MMC SPL loader
  configs: ast2600: Enable FIT SHA512 support
  config: ast2600: Disable SPL raw image support

 arch/arm/dts/ast2600-rainier.dts           |   5 +
 arch/arm/dts/ast2600-tacoma.dts            |   5 +
 arch/arm/dts/ast2600.dtsi                  |   9 +
 arch/arm/dts/ast2600a1-evb.dts             |   4 +
 arch/arm/mach-aspeed/Kconfig               |  15 ++
 arch/arm/mach-aspeed/ast2600/Kconfig       |  12 -
 arch/arm/mach-aspeed/ast2600/Makefile      |   6 +-
 arch/arm/mach-aspeed/ast2600/spl.c         |  30 +++
 arch/arm/mach-aspeed/ast2600/spl_boot.c    |  17 +-
 configs/ast2600_openbmc_spl_emmc_defconfig |  24 +-
 drivers/crypto/Kconfig                     |  19 ++
 drivers/crypto/Makefile                    |   1 +
 drivers/crypto/aspeed_hace.c               | 266 +++++++++++++++++++++
 13 files changed, 375 insertions(+), 38 deletions(-)
 create mode 100644 drivers/crypto/aspeed_hace.c

-- 
2.30.2

