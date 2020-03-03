Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B62176F5B
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 07:25:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wn7R72YtzDqbp
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 17:25:23 +1100 (AEDT)
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
 header.s=20161025 header.b=Kc6n75Ej; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wn5f3yHtzDqXl;
 Tue,  3 Mar 2020 17:23:48 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id nm6so473162pjb.0;
 Mon, 02 Mar 2020 22:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6UPltCTph8JATwkMOr1U3Yp5FDDP+y4EAKaRm5ThBwE=;
 b=Kc6n75EjJhEh37Mawk55/f0mK1B/wLSfInD/iqmAB9GjGvp7CcQnF4DXEkCoxp55Ig
 KrLPGwAArvdTmZFYkk5iVpqzRLPpS96ZfzN1rSIqHWXCm2y0oNRUzUQJOr5oGEypb3UG
 40jhd6lOd5DEopyFqpQvqkUDCYkvqAW5NuXkzHMDh7DUsZSNrmxIO0U8AFigqmr95pe6
 je8schRmyv8m0fMmf+MclOWJN/Z8DQWTqK+pmtjfX+bYABPd4pIp4A5pXghYZQko9lBv
 54WZidUTxOvI/mGKRMYrTLUt+/tMFWQDQD1O5KCFRxGy586WB9e1v+RDNyfqDZuT9X9X
 EXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6UPltCTph8JATwkMOr1U3Yp5FDDP+y4EAKaRm5ThBwE=;
 b=lkIV77kxkc88B7Pu/AjlXoNbhKajOYBlESJZwGaCYbJFI3ilZP/vz/BO+4z9a6e5eb
 fVb9TM/6Ra1tJVh6vLZ2XpSLloQ5TmY6hP76Ii8sVCNJl8pRpJujw1wNTcQvICBkE0jE
 ABBfx44Rv+ImbcAP5RDZSx8w6oQZTU2xKrlEQO27nhm0IdLhzdekn+qDRQsyj0Ccn4+o
 HG+dhVAlkXdFSZuiYvzCdXUIOqJ7YMZo3bsWubtKH5ExdnHzQ6vJNHqrsBtVp+1MgdmX
 eV8ntzy49Iuvrds/Ke9rNUb4wzj46Kkp6lIIkbVa0nvlcxW4MdH0JTUDU+nkOGO/xKRk
 24Og==
X-Gm-Message-State: ANhLgQ2driYtK86Orgn59vnxAJo6v+JjUaMUDLhEj780Hs+EIF2zas+f
 1mdIi5R5xiYYJaVKCJbaYR4=
X-Google-Smtp-Source: ADFU+vuvnRBHKecc4wMxbN//ecC5JbcdApulYoDZF/PxrhdgfqOSTO1/rFV2BRvLmaCdLXOUQIXFFQ==
X-Received: by 2002:a17:902:b611:: with SMTP id
 b17mr2783485pls.23.1583216626144; 
 Mon, 02 Mar 2020 22:23:46 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id k5sm7453526pfp.66.2020.03.02.22.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 22:23:45 -0800 (PST)
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
Subject: [PATCH v7 0/7] aspeed-g6: enable usb support
Date: Mon,  2 Mar 2020 22:23:29 -0800
Message-Id: <20200303062336.7361-1-rentao.bupt@gmail.com>
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

 .../bindings/usb/aspeed,usb-vhub.yaml         | 77 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi              |  2 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |  2 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi      | 25 ++++++
 arch/arm/boot/dts/aspeed-g6.dtsi              | 45 +++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig    |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c     | 71 ++++++++++-------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c      | 30 ++++++--
 drivers/usb/gadget/udc/aspeed-vhub/epn.c      |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c      | 58 +++++++++-----
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h     | 43 +++++++----
 11 files changed, 290 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml

-- 
2.17.1

