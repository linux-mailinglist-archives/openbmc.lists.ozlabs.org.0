Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D40170C46
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 00:07:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SWdv5c87zDqBP
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 10:06:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iiIqG1tK; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SWZX4VwgzDqV3;
 Thu, 27 Feb 2020 10:04:03 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id o24so249803pfp.13;
 Wed, 26 Feb 2020 15:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Bk/8S/Z3TX6gpAJL/01qav03pWjPrUS9+WLbM4tWfRA=;
 b=iiIqG1tKiFmSLw8ypVAFtG0a/VX8gxPi1TjGNgkgCIZ5Z7qjWdPW9+8K3J2U1skLnT
 XriD3Zl2Sxh5mVPXYsOttA2tMrRBEKKQxeTDuVOrlhQiU6sySvO9bd8fq52EStONOHlq
 C52UbmdpekyXeSt/SIj6TUrMBDVWXxhXdzSm+uaDVzREEtUjyyLy2AyWdJpSvRgR6Lnb
 6Ilh/TDwkwoYBgXez0mR4sZfU+EELlY/vwrUDkjPmHy0LTkn0AHP+zGzsBQ3JchD8hmQ
 oH6cSIRBmiA6O31pnf9/q4rzMBFON1tzp8jO/Rx/QxqMaWVEZdp5K7TaNqlwL6fuWZ1g
 vrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Bk/8S/Z3TX6gpAJL/01qav03pWjPrUS9+WLbM4tWfRA=;
 b=rfIj0XqEYlzXfzQCeg7WnBZepsBi4wExR5PZd7jPE8MOiBvgCAnOfW0K2fEbTy2nfG
 OLN/ajnzuqcd537qJDfml0EwwjKhPd3tVoQr99ZzVcSrn9f5PUf9a+MTXYUWIePf9idy
 u8QYT4BJLA0IY2esT9eB5vxJ3VK0sA3ejxHKyxDTbu9qe761iH7vFIS4vKmAKkA/7uH+
 a5Y3BvI9QR4wQexINAqF6HPpkm0o2KQQnrn17n2525N6JTRNogaN1MqJ92U9VXivEOXv
 B1LCz3Q4h1yrtr2AXkYoDvlzI1dz/VlDax40JjyTddKrUJBFemLlwuie7eFfogZ/7HLq
 PCfA==
X-Gm-Message-State: APjAAAWsZfhhKbg8T8tdgrRiQ4vx2vHWINrm53TKUxko/+/FgsSHd1w8
 d326JPREIZhl28ImyUaZBXQ=
X-Google-Smtp-Source: APXvYqxd8CY0HsAxhIMeDYkypalVr2YKiVsFuVI43/dN5ulZeTbimHEV3k5WocbbHPlR9VinUUrMDQ==
X-Received: by 2002:a63:b347:: with SMTP id x7mr1087976pgt.275.1582758240225; 
 Wed, 26 Feb 2020 15:04:00 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::7:5ebf])
 by smtp.gmail.com with ESMTPSA id 3sm3912621pjg.27.2020.02.26.15.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 15:03:59 -0800 (PST)
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
Subject: [PATCH v4 0/7] aspeed-g6: enable usb support
Date: Wed, 26 Feb 2020 15:03:39 -0800
Message-Id: <20200226230346.672-1-rentao.bupt@gmail.com>
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

 .../bindings/usb/aspeed,usb-vhub.yaml         | 71 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi              |  2 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |  2 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi      | 25 +++++++
 arch/arm/boot/dts/aspeed-g6.dtsi              | 45 ++++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig    |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c     | 71 ++++++++++++-------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c      | 30 +++++---
 drivers/usb/gadget/udc/aspeed-vhub/epn.c      |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c      | 58 ++++++++++-----
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h     | 43 +++++++----
 11 files changed, 284 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml

-- 
2.17.1

