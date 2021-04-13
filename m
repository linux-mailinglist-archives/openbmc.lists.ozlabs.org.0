Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6335D99F
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJBw5FBnz2yxL
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Xqvvfiyf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xqvvfiyf; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJBh3S2vz2yxL
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:10 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id y2so7786408plg.5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xGSIVYMGcV4WW6jwMqFfL3YSEg5og8s7f8u7y5VEXPg=;
 b=XqvvfiyfKGgz7r1Yh4S0CWpmU3Fgi1PkA5jTIN5cKjntWvFnWZ26KHOmWmL993cw1Z
 rp6lNIgaZCnMVJ+IqUveq3sEjCNJiyOFOmT51VvGNO+q+Hfkgvwnl5hdHlZNossNQORE
 pARlnSLrjcF/tZ71XQwu7cxzZIS7p7uetVIwIqq7/Y/MOkAAkZMOOkXA2Xhvwt3ULpjf
 nfATQbFmFba8Y+CqVklwHeVTLM9rowWIiSmDEy/9vtnGEPE7L5WJpbo+lIv3BPawSBfz
 4z+j5qgY4xlqJElMx9Lq7yugk9u0oN9dSD8ruSzER4wYYk2hhoDCRO+onRV7xbKLPktk
 R5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xGSIVYMGcV4WW6jwMqFfL3YSEg5og8s7f8u7y5VEXPg=;
 b=Svq2hd3+WYcspE4D/6MVEw/cpMNuX60Eo0yU3qlzkUr5FEyIYWTWsgtPJKqhAVwZUc
 sMEN6QdjS0PjeuH8IU/HJwIEQ4C5omQRGMhcDcH1Pvd6xc2ZWoN9AVVjuT4K0ok6XghP
 yy0k7qVmtgR/Auh4FLAAsAGZposT48wxH9HfbL0O8uPqkHYseAp/utAtPDSPa8uKc52z
 YsR3NA/dw9Ki9YbpF5wPk1rUPrDKexA+FBfkImSeNtW/8E7Rx8YpOl0jeeHzrhOQItEG
 QhIBkOMtmWodf01vW/UdOcp2WONrG1tGyUc/G9kt/EkgrrulRJPdFuKh2obrock2vPeT
 /uiQ==
X-Gm-Message-State: AOAM532cYEVr4RxQ5eEltfTKdZ9grGK/08PNoBhu0MrWIl5pWonJ4EzP
 Csfa8VtexGevrkvTznNOXAVQRTFfBwo=
X-Google-Smtp-Source: ABdhPJxrF4/KkT4s5le4tRbzLxgvQMCtj0SLbawxhIpquFVOvW5BPIzOfGwD7PGh48HQWBnNq/LL7A==
X-Received: by 2002:a17:90a:4005:: with SMTP id u5mr3562139pjc.6.1618301286572; 
 Tue, 13 Apr 2021 01:08:06 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:06 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 00/11] Use HACE to
Date: Tue, 13 Apr 2021 17:37:44 +0930
Message-Id: <20210413080755.73572-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
AST2600 to perform SHA hashing during boot.

The first five patches rearrange the way the ast2600 SPL boots, using
the common loading code so we can perform FIT verification on the u-boot
proper.

image-fit has been submitted upstream but not merged yet as it broke
boards that were performing hashing but not checking the result(!).

The final four patches add support for HACE and enable it in the emmc
configuration.

I intend to merge these patches into the openbmc u-boot tree while we
wait for upstream to accept the FIT hashing changes.

A large gotcha of enabling the HACE: it will break checking FIT images
that are in SPI NOR. u-boot will try to load the FIT directly from
memory-mapped flash, and the HACE engine can only read from SDRAM
regions. A fallback mechanism would need to be implemented if someone
was interested in supporting FIT + HACE + SPI NOR.

Joel Stanley (11):
  aspeed: Build secboot only when enabled
  ast2600: Specify boot order
  ast2600: Configure emmc boot options
  ast2600: spl: Support common boot devices
  config: ast2600: Enable common eMMC SPL loader
  image-fit: use hashing infra
  hash: Allow for SHA512 hardware implementations
  ast2600: Add HACE to device tree
  clk: aspeed: Add HACE yclk to ast2600
  crypto: Add driver for Aspeed HACE
  configs/openbmc: Enable hw accelerated sha

 arch/arm/dts/ast2600-rainier.dts           |   5 +
 arch/arm/dts/ast2600-tacoma.dts            |   5 +
 arch/arm/dts/ast2600.dtsi                  |   9 +
 arch/arm/dts/ast2600a1-evb.dts             |   4 +
 arch/arm/mach-aspeed/ast2600/Makefile      |   3 +-
 arch/arm/mach-aspeed/ast2600/spl.c         |  16 ++
 common/hash.c                              |  24 +-
 common/image-fit.c                         |  16 +-
 configs/ast2600_openbmc_spl_emmc_defconfig |  12 +-
 drivers/clk/aspeed/clk_ast2600.c           |  22 ++
 drivers/crypto/Kconfig                     |  16 ++
 drivers/crypto/Makefile                    |   1 +
 drivers/crypto/aspeed_hace.c               | 250 +++++++++++++++++++++
 include/configs/aspeed-common.h            |   2 +-
 include/configs/evb_ast2600a1_spl.h        |   4 +
 include/hw_sha.h                           |  26 +++
 lib/Kconfig                                |  15 +-
 17 files changed, 415 insertions(+), 15 deletions(-)
 create mode 100644 drivers/crypto/aspeed_hace.c

-- 
2.30.2

