Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D115B341
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 22:59:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Htp359V3zDqRq
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 08:59:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cu2HVdgF; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Htm9089SzDq9L;
 Thu, 13 Feb 2020 08:57:28 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id e9so1456526pjr.4;
 Wed, 12 Feb 2020 13:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fnUhPBKcSJIh4dSE9ZDVA1HmaYlN0KtrojiReV2ykb0=;
 b=cu2HVdgFsneUjNAodwp0mnQFtoeN6mjv2Ze87w4aV7ChgNbJ8jExut24J2vW66PS6T
 koVG7aLqf7ULojlqtp726KnUimqivbcuoUV9NtssprL5ko3YprdPY5xvqnlkTdPaIU/r
 8sM5Sd0Qpm6pjQxOwAl9BQbYkjdRX7X68XoEgg8aDvvtGHrTBoVcR05S8hcmY3wT23FZ
 T4Q3nCX9mPO7fNbwnOSAJqdM8mt/maw+2dkLhWpkNJSgWQaOGZTea+Jlfky6SrNUIQ4k
 1gqChzMwo5bt8sp/VLS/L4gnilV6Mhufl+oV3miS3u82WSBHBCTpb3KSoBpHxOn28S+A
 2UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fnUhPBKcSJIh4dSE9ZDVA1HmaYlN0KtrojiReV2ykb0=;
 b=NBKOm3n5FmIoZ9rQyE/MjqVXVRhE8lYVVFOW+Wc1aP62DZc1bdYliPmW/w7kMSY+Q5
 5ayjxurB8PMdP6DwL8HSeEvMC0QW+XrdesStcIwvam46C1waDHaBtZ5qxFrW9S4MYave
 chn/w2tHoh38CGOfC+mHOtXe0K6/Ttkfv8CQo5a+KaFPc/w9tl2jYcPBka6f/FCr4uln
 L1Rc8MWHs/PTH1UzkqX4DGzhuNuiDep5zFMmW+wMF0Eud/lnTWeQeGu6edu8xgUTnhAy
 aVXRid0l/spErajNKyoJfdGzESkxPxhjdCmDLX9QlNjjOccE57NaafvF8oo79mHyPtt3
 R23Q==
X-Gm-Message-State: APjAAAV9Y6D2K1Bzf09711sQewrAN5JhVvfaWiSq49ltYOIjS0JjXb+f
 9BX/SAasAg56oSUglUph6g0=
X-Google-Smtp-Source: APXvYqyH1U4B5ayiip+FCyTBRMApO8id3his1NPhWKEoZ9RMaWpVNfNcOs6FCRURmy4EYX2Y/41kVw==
X-Received: by 2002:a17:90a:fe02:: with SMTP id
 ck2mr1313325pjb.10.1581544646327; 
 Wed, 12 Feb 2020 13:57:26 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::3:533f])
 by smtp.gmail.com with ESMTPSA id r6sm214431pfh.91.2020.02.12.13.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 13:57:25 -0800 (PST)
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
Subject: [PATCH v2 0/5] aspeed-g6: enable usb support
Date: Wed, 12 Feb 2020 13:57:12 -0800
Message-Id: <20200212215717.9474-1-rentao.bupt@gmail.com>
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

Patch #2 and #3 add vhub port/endpoint properties into aspeed-g4 and
aspeed-g5 dtsi.

Patch #4 enables ast2600 support in aspeed-vhub usb gadget driver.

Patch #5 adds USB devices and according pin groups in aspeed-g6 dtsi.

The patch series is sanity tested on AST2520 (Yamp) BMC and AST2600-A0
eval board:
  - AST2520: created 5 gadget devices with 15 endpoints, and all of them
    can be enumerated from usb-host side.
  - AST2600: created 7 gadget devices with 20 endpoints, and all of them
    can be enumerated from usb-host side.

Tao Ren (5):
  usb: gadget: aspeed: read vhub properties from device tree
  ARM: dts: aspeed-g4: add vhub port and endpoint properties
  ARM: dts: aspeed-g5: add vhub port and endpoint properties
  usb: gadget: aspeed: add ast2600 vhub support
  ARM: dts: aspeed-g6: add usb functions

 arch/arm/boot/dts/aspeed-g4.dtsi           |  2 +
 arch/arm/boot/dts/aspeed-g5.dtsi           |  2 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   | 25 ++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi           | 45 ++++++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 71 ++++++++++++++--------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c   | 30 ++++++---
 drivers/usb/gadget/udc/aspeed-vhub/epn.c   |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c   | 26 +++++---
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h  | 23 +++----
 10 files changed, 170 insertions(+), 62 deletions(-)

-- 
2.17.1

