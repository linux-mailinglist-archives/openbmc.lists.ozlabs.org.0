Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBFD172E9F
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 03:11:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TCh76bGXzDrDr
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 13:11:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WxZo9JuH; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TCcY0DfFzDqvr;
 Fri, 28 Feb 2020 13:08:10 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id z12so670299pgl.4;
 Thu, 27 Feb 2020 18:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Z5AIbk2nbOcHqpTmcvhMG9mF23rIvUFPSLJXXgXhGns=;
 b=WxZo9JuHxs2vb8rzf2HkXGaALenOiLW17gU9FV7NRZnQX/R4Snkc7mWGvmDU4MAO7t
 8jVaLqfz7cr3WemoDQyHzihCUa74B7tA2upzRpq3DhB56XOkNZEUAP+diQ8F5pr1mYYy
 /eINOAoaeDTbtQSjkQ7q78GZrG18X6ofyEIevln/VnS7x9LMTG0vZCQ7fdSQAuOm/YSX
 LPE2FMrcSLV42KJJN0Al145sJ40ccNpQSxso2CPCXZfPBYXsZdmZXydPm6TGRv8sxS8X
 IO+MQfO38hqOcgEArnArXh/Imkv8+osKKLguQ/jJgaRUiT+PKDryfxsvWMW27f74d2WQ
 +KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Z5AIbk2nbOcHqpTmcvhMG9mF23rIvUFPSLJXXgXhGns=;
 b=fz2+nH+ZaBOdAo8agRBH3y9acPMuQ0hyx5r13k+etZSgQjFaqZyW7dkd2I3ItrsQaL
 fpDes1htB2FbGOwCv4Ko5MONNQ6/Il7741DbW2RFKpAMXD12WDAf/KtD0eIxwA4K3vUM
 VEaSLjeynnrFCwLllfTnj7fZF6uOYcAAVwzxcapy9Fu0XzGZmlvGY1C4JYbH3BMEY/1f
 ehgBCqjA9Qp1FQx6un5DEFPqm8Gglz477mte6ujsmQwRR/FIy96L9+UnkG2si7cCDDJB
 kKdTRWxvs13OLtL04O1GOScE/u1TMknn/kuOLZOYSM07yC1ZQIb7hyV++FAknk0xeUnb
 Cc/A==
X-Gm-Message-State: APjAAAXF6Ba9D2SCBOSczCLQTb3CZVeuoWX0PCed0i5tLeFho7atdmY1
 Ri3bifrbiRWE39eWzIn+laI=
X-Google-Smtp-Source: APXvYqzwfsLxTTqt4X5L8xIjUVbm8bxdacPFLrNAwoD4cD1bY8Ry1LYaaB9nFvV5Fr/sOrt1DhrKRA==
X-Received: by 2002:a63:42c2:: with SMTP id p185mr2358809pga.268.1582855687383; 
 Thu, 27 Feb 2020 18:08:07 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id k24sm4931972pgm.61.2020.02.27.18.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 18:08:06 -0800 (PST)
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
Subject: [PATCH v6 0/7] aspeed-g6: enable usb support
Date: Thu, 27 Feb 2020 18:07:50 -0800
Message-Id: <20200228020757.10513-1-rentao.bupt@gmail.com>
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

Patch #1 includes vhub's usb descriptors in struct "ast_vhub": all usb
descriptor changes will go to the per-vhub instance instead of touching
the global default descriptors.

Patch #2 replaces hardcoded vhub port/endpoint number with device tree
properties, so that it's more convenient to add support for ast2600-vhub
which provides more downstream ports and endpoints.

Patch #3 enables ast2600 support in aspeed-vhub usb gadget driver.

Patch #4 adds USB devices and according pin groups in aspeed-g6 dtsi.

Patch #5 and #6 add vhub port/endpoint properties into aspeed-g4 and
aspeed-g5 dtsi.

Patch #7 adds device tree binding document for aspeed usb-vhub driver.

Tao Ren (7):
  usb: gadget: aspeed: support per-vhub usb descriptors
  usb: gadget: aspeed: read vhub properties from device tree
  usb: gadget: aspeed: add ast2600 vhub support
  ARM: dts: aspeed-g6: add usb functions
  ARM: dts: aspeed-g5: add vhub port and endpoint properties
  ARM: dts: aspeed-g4: add vhub port and endpoint properties
  dt-bindings: usb: add documentation for aspeed usb-vhub

 .../bindings/usb/aspeed,usb-vhub.yaml         | 73 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi              |  2 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |  2 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi      | 25 +++++++
 arch/arm/boot/dts/aspeed-g6.dtsi              | 45 ++++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig    |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c     | 71 +++++++++++-------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c      | 30 ++++++--
 drivers/usb/gadget/udc/aspeed-vhub/epn.c      |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c      | 58 ++++++++++-----
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h     | 43 +++++++----
 11 files changed, 286 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml

-- 
2.17.1

