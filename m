Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AC161F63
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 04:16:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M5cK5s6pzDqX1
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 14:16:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.66; helo=mail-pj1-f66.google.com;
 envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K52oErQH; dkim-atps=neutral
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M5Yf5vpBzDqSy;
 Tue, 18 Feb 2020 14:14:30 +1100 (AEDT)
Received: by mail-pj1-f66.google.com with SMTP id e9so358444pjr.4;
 Mon, 17 Feb 2020 19:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QXKDYwEJ0FxdOMnutv0vajM2YUai+A8MQR7DaSJ50D8=;
 b=K52oErQHhH1VOS2rZN6/4aypLstAfecJCe/0dHwYOQxReOfbBeAgIk5iOrwuR74dut
 +X4DBNOJOcu+bps5CMA+Pe8icIX0UTJdE6qrDS+z0pGqyDPmelDdMDYCF+W+shvYFEz2
 +t+GGcxWW22TPi20RBvTajOpA6i2HyzmN2CoFtrOaTC+AEVrV96UuSnFBNNR2vZ4oPA9
 tvTUVR2QXobydoifr/ioajA2AEwqlDacsKGHnJ99+Xc2pt1rUF20T9ovZYryNlTnvIle
 bFhww5NrHBPB9J6qMFEIL2hFukX5LzQ0Eb3dIr82CPhEKNvWyrGS2ImGVXcVC+zxdu5Q
 pnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QXKDYwEJ0FxdOMnutv0vajM2YUai+A8MQR7DaSJ50D8=;
 b=nP1Z+ap1sbaKPO2uUmO+FlN1HnAdrbh/QMMdrI5t6GrY4CJ3zAhsXxzm9ECi/7/jga
 rwS6yoylJr1ltE1JV6+5FlY09yrpbadrOQlCSg6ivjo0heGAWf7RnA4Zul6h0eOn/5YD
 KnfXe/Dej8bvWlJLvlwDgXWXPCgkMf42joLPvdiorIaRy6Cp0Ib5+VTEQszn2xXOALe1
 cg9g0qM1F6L0p5yFlpT7tXt3p2ccSbZ6j+jry+7Sbg8kJuNAYHb4skvmBubyArSlWZBe
 g5ZQ/1ALeTkpcgTv5yBcOBTpo0O9TbghzloXAUpgM2q8Y9fFayGCYsk932fq+x+LZXh2
 ac9w==
X-Gm-Message-State: APjAAAWoNhfnN1459EIm3DOOoWDYUl4iVa/hd09osABGHR1pRb3XrW6x
 Yx8zMEwagkosYlNy8okCDmE=
X-Google-Smtp-Source: APXvYqzx47gOz8vXOv1dcSyG2JwaSWwuAN6y+jr/G/nNBvxWFvH/XiVUGGsbruxEO9r6tVblvxUqLg==
X-Received: by 2002:a17:902:547:: with SMTP id
 65mr17940779plf.50.1581995605202; 
 Mon, 17 Feb 2020 19:13:25 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:180::6f94])
 by smtp.gmail.com with ESMTPSA id b18sm1812595pfd.63.2020.02.17.19.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 19:13:24 -0800 (PST)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v3 0/5] aspeed-g6: enable usb support
Date: Mon, 17 Feb 2020 19:13:10 -0800
Message-Id: <20200218031315.562-1-rentao.bupt@gmail.com>
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

The patch series aims at enabling USB Host and Gadget support on AST2600
platforms.

Patch #1 replaces hardcoded vhub port/endpoint number with device tree
properties, so that it's more convenient to add support for ast2600-vhub
which provides more downstream ports and endpoints.

Patch #2 enables ast2600 support in aspeed-vhub usb gadget driver.

Patch #3 adds USB devices and according pin groups in aspeed-g6 dtsi.

Patch #4 and #5 add vhub port/endpoint properties into aspeed-g4 and
aspeed-g5 dtsi.

Tao Ren (5):
  usb: gadget: aspeed: read vhub properties from device tree
  usb: gadget: aspeed: add ast2600 vhub support
  ARM: dts: aspeed-g6: add usb functions
  ARM: dts: aspeed-g5: add vhub port and endpoint properties
  ARM: dts: aspeed-g4: add vhub port and endpoint properties

 arch/arm/boot/dts/aspeed-g4.dtsi           |  2 +
 arch/arm/boot/dts/aspeed-g5.dtsi           |  2 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   | 25 +++++++
 arch/arm/boot/dts/aspeed-g6.dtsi           | 45 ++++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 79 +++++++++++++++-------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c   | 30 +++++---
 drivers/usb/gadget/udc/aspeed-vhub/epn.c   |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c   | 26 ++++---
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h  | 23 +++----
 10 files changed, 178 insertions(+), 62 deletions(-)

-- 
2.17.1

