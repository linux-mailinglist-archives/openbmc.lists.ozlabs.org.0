Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 554FF14AE4D
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 04:08:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486BQq0yJWzDqGv
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 14:08:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ko9jldE1; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486BMy48JyzDqGC
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 14:06:22 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id 6so6211844pgk.0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 19:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A7vAKlqPxW853kN1blT1XOUWNAC0tZpHcMuyW0tP+gE=;
 b=ko9jldE1uNn1wtfLrQrA8zeO4qEJqzscpDgM2Bihn1F3Ei298BFl8SoEOcPiHn9L9u
 haA4DA1okKChK4J0Q8TmsR6U4iYAT45bLHvi+8Q6LMxJuN9U/10+8LOJ4rrCM4QMkVoj
 S97qbg5oD08rlERsSx/vn49KNVOpDA6LWcPsdNvepwLKDwqZYSqViwcIP7YhejfDOwH2
 87nSYp1wTLB8jD2olmeRaU0onku9fAeaCPw8ru2BNYMnKo31FiNaHP6fRwq5Wo/U8p0u
 WxsY+W3Rw2TDaE7L8bX0krXamtJoDt4WaG6UCnzkW+Vug892zD/Zsqlhxe/2x0DxdouG
 xDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A7vAKlqPxW853kN1blT1XOUWNAC0tZpHcMuyW0tP+gE=;
 b=eKyJlQhNWt9O0WjWu+RkNWJ7QjYJMn9uSEM1Dzyif1yz7rnsfSHtv1n5CB40CaIUKl
 qa9JY4oh8+nY3QMvyODfA25GRAR+uIVvOBvms9b7EYnk92GOgq3Rbr6RxOChZE/0+lyC
 9FY9FUeyvilKQA8/3yGGhtF+lMMmA/w6u5LdVkhACBzPyWNRQbJ/kGFm9uRB3lu3Rf3P
 stn6K+XMrFCqKqqDJv0JOEPK4j1P8Da/WFzpAge9h0SB6hvg8M5uUfghbmvzE4XeFFJP
 xG7/0k4ANGdZWVrhstnE9PID1Ie3ocAgg/ItUbFEwjQdvaB10PDk9JqukITbIVYw2fbI
 aG8Q==
X-Gm-Message-State: APjAAAUTFqcgzge68pWad1KaL29U1tbf3kcKDbgxQMs9dPJOeVumQDIH
 5P4ZpwEj44kUbGquD23zjdI=
X-Google-Smtp-Source: APXvYqzgp+UpbGYPlE4N5zQ2J32BEQ8Wo8rDIgC7dhW7X3RTgr9j7Lzj5sw7CpcDMF9AKY6NinwBTA==
X-Received: by 2002:aa7:9510:: with SMTP id b16mr1768595pfp.65.1580180777932; 
 Mon, 27 Jan 2020 19:06:17 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2:ab25])
 by smtp.gmail.com with ESMTPSA id z4sm17357409pfn.42.2020.01.27.19.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 19:06:17 -0800 (PST)
From: rentao.bupt@gmail.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 taoren@fb.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v3 0/3] aspeed-g6: enable usb support
Date: Mon, 27 Jan 2020 19:06:00 -0800
Message-Id: <20200128030603.32612-1-rentao.bupt@gmail.com>
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
platforms. I'm targeting openbmc tree mainly for some early feedback and
more widespread testing. I'm planning to upstream the patches after
5.6-rc1.

Patch #1 moves hardcoded vhub attributes (number of downstream ports and
endpoints) to "struct ast_hub_config" which is then attached to "struct
of_device_id". By doing this, it will be easier to enable ast2600 vhub
which supports more ports and endpoints.

Patch #2 enables AST2600 support in aspeed-vhub gadget driver.

Patch #3 adds USB devices and according pin groups in aspeed-g6 dtsi.

Tao Ren (3):
  usb: gadget: aspeed: read vhub config from of_device_id
  usb: gadget: aspeed: add ast2600 vhub support
  ARM: dts: aspeed-g6: add usb functions

 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   |  25 +++++
 arch/arm/boot/dts/aspeed-g6.dtsi           |  43 ++++++++
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig |   4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 109 ++++++++++++++-------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c   |  30 ++++--
 drivers/usb/gadget/udc/aspeed-vhub/epn.c   |   4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c   |  26 +++--
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h  |  23 ++---
 8 files changed, 191 insertions(+), 73 deletions(-)

-- 
2.17.1

