Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7816E3D999C
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 01:38:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZqqX2pFSz3bdj
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 09:38:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DHHzoOVX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DHHzoOVX; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZqpn456Qz3068;
 Thu, 29 Jul 2021 09:38:08 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id c16so4679701plh.7;
 Wed, 28 Jul 2021 16:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=SfhM5hIjH4I2dOHB9xgS2+AKrC0SvF1WxH5UJ+fSmRk=;
 b=DHHzoOVXCFpB2m+umRRgHMk+kFAqECOeEl5r1oi4ckNWeivoGTI7aAz4oGGAr7LbAT
 E7qu8ZeZbpQrwKhiWLnhQ1L1yuaQIOi8WRfuTLsaIy6fB9UIvwKSwt23RSmGoTV6Pgx2
 s/RSqrrUd52uFOZqAd6r9JzRVBiZN56m+Rfnu9DeysgNaBeGA/2A1fEFymHivV3rXEY5
 JVRLMeGgcP5ZS/orWw5L5LIJuVshEUGfmJdntab/jA/1lP1hYGdt2cWyjahQ3df0O5OA
 ZcYaWK9r5Y5oozvErh9m0J8eHzKdduGjWSanUXVITeN031HEknOZGVUasXewZ8DwS7dm
 YAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SfhM5hIjH4I2dOHB9xgS2+AKrC0SvF1WxH5UJ+fSmRk=;
 b=tBSmpfVzwqJ6FoTmvhgAYIgEFZ2c0OtNymr6EFcnA217DjtDpBU/VtJZ8BH4qORR9c
 i1+V2ehmkaIOxyXvuIXI4WUaitF019Eqhg6B4Na9B6Rfbi5eI6SCM15PE60nzqdL8h+b
 Y3ua/xbg59QR0/Ci+BXlJvC/7p+m2hk0fs9hhfKTMmBmvgCdzj77AOV7K7BJb7y0KBZJ
 lqON49XijpuzejZFfi+KvqY8SOyJZammOLAMj6l7Dq1wl6HPu/wpH/J0z/Gm3qAzozXE
 P8VG4zuv9P+CoAumOlXL+T4FbCN9IURQehx74Ib0dQHuZTXBMZDrifSQFG2JvqBO+Mvi
 8ceg==
X-Gm-Message-State: AOAM531nli9PXzCq7KggpL5rf0zr/S+y/RWKGhXYTVf93fBI69FtbQfl
 Wj1/KObDAalgmuTIxlJCmTY=
X-Google-Smtp-Source: ABdhPJw9M4Lxsn7ys7mPlyLWaO6vlx6TfaLR1km4tFwmfpcL1zh55ty79nFEMvIxyek5uv8z6iI/9A==
X-Received: by 2002:a17:902:8bc4:b029:12b:8470:e29e with SMTP id
 r4-20020a1709028bc4b029012b8470e29emr2080316plo.2.1627515485326; 
 Wed, 28 Jul 2021 16:38:05 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id k37sm1038671pgm.84.2021.07.28.16.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 16:38:04 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 0/6] ARM: dts: Add Facebook AST2600 BMCs
Date: Wed, 28 Jul 2021 16:37:49 -0700
Message-Id: <20210728233755.17963-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series introuces 3 new Facebook AST2600 Network BMC platforms.

Patch #1 adds dtsi file to describe the fixed flash layout of 128MB mtd
device. The flash layout is used by all the 3 AST2600 BMC as well as
Wedge400 (AST2500).

Patch #2 simplies Wedge400 dts by including the flash layout dtsi.

Patch #3 adds common dtsi which is included by all the new Facebook
AST2600 Network BMC platforms.

Patch #4 adds the device tree for Facebook Cloudripper (AST2600) BMC.

Patch #5 adds the device tree for Facebook Elbert (AST2600) BMC.

Patch #6 adds the device tree for Facebook Fuji (AST2600) BMC.

Tao Ren (6):
  ARM: dts: Add Facebook BMC 128MB flash layout
  ARM: dts: aspeed: wedge400: Use common flash layout
  ARM: dts: aspeed: Common dtsi for Facebook AST2600 Network BMCs
  ARM: dts: aspeed: Add Facebook Cloudripper (AST2600) BMC
  ARM: dts: aspeed: Add Facebook Elbert (AST2600) BMC
  ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC

 arch/arm/boot/dts/Makefile                    |    3 +
 .../dts/aspeed-bmc-facebook-cloudripper.dts   |  564 ++++++++
 .../boot/dts/aspeed-bmc-facebook-elbert.dts   |  185 +++
 .../arm/boot/dts/aspeed-bmc-facebook-fuji.dts | 1276 +++++++++++++++++
 .../boot/dts/aspeed-bmc-facebook-wedge400.dts |   48 +-
 .../dts/ast2600-facebook-netbmc-common.dtsi   |  176 +++
 .../dts/facebook-bmc-flash-layout-128.dtsi    |   60 +
 7 files changed, 2265 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
 create mode 100644 arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi

-- 
2.17.1

