Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED551462E0
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 08:51:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483Dws2kVJzDqW4
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 18:51:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ubw3hLfr; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483Dvm4x4zzDqTT
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 18:50:12 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id b22so986403pls.12
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 23:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ic3W9oQOqSwJ4GY3dxfn0q8nG/4Npz7aKlpmG2iepf0=;
 b=ubw3hLfrsP8TiMhCzGV7wz+nEndEJxbCbQPdqmX/MXxL9j8E9tyvdJFYuXhMx9dEyV
 zHBVBukkAAvxwOg0UT7nVlZdbUtixC595Ie2fcv6tsTxDSm8p1CfZCt95NyRndeN+PEI
 v+qpT83VcHc9wNxBn3iFTjQisOyNbnMsjHSwfCRAI9GuWwLhTFH3uLTN5QPuF07lQyoZ
 ogLwOTH/IJPXH70/T/+Sh8dYl3Vq9JRARMNEksjIktnZzjXFQqq46+ANqhRx6WnpEbrw
 HiSUy6FmNA2gGTcRLOsYqSoJCMm6XgScY5NmnsJyZe0o6mUe/DuHZGgfAsTUvlUSioyM
 T0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ic3W9oQOqSwJ4GY3dxfn0q8nG/4Npz7aKlpmG2iepf0=;
 b=ZNNJqjTdhn+K8PIxuB7emmLT7L1DP01rSly41k5rO95yY+2AOfhlUZ95f0sd/omXlR
 5lKmeBHM7SgF/o+aE7qRiCoLVvvMp6loGWc5sh+5KaTDjqJUzoKzX9bvZkWeb096ghCO
 WrSrDkGTX7to30v8vJX4eMkw99AMhyhggP/7L6IKMn++B7q5xzm+WBHIh9K8RIFl7SWs
 8fgnW1qaiHWp3TWuX4Y6rjquVDK1Gi34xmrBfc2ZG0akCAEItrE8mCxR4te2/yKNa+j3
 mXXp4qpmIEnubtIdheuU1v931m0I2/za74gi+QIn+kQbfzVCwMkCTcyKEe+W2+ffThU3
 fwLg==
X-Gm-Message-State: APjAAAWer1rxfxpnW9SA3ppqQbLRcQwDT2YxpTmyKtq8/zq5Jke98JC8
 nbApu34+LJumyEN+v6xYyJ8=
X-Google-Smtp-Source: APXvYqwvFoNyJvhBtodbvpd3NDvHBgm57qX2y1ItZtwiqhc9PvfcSjg2Mbcya46LOi9UlZmD0S0zFw==
X-Received: by 2002:a17:90a:22e7:: with SMTP id
 s94mr3243147pjc.12.1579765808380; 
 Wed, 22 Jan 2020 23:50:08 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 3sm1526755pjg.27.2020.01.22.23.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 23:50:07 -0800 (PST)
From: rentao.bupt@gmail.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 taoren@fb.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 0/3] aspeed-g6: enable usb support
Date: Wed, 22 Jan 2020 23:49:53 -0800
Message-Id: <20200123074956.21482-1-rentao.bupt@gmail.com>
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
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 108 ++++++++++++++-------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c   |  30 ++++--
 drivers/usb/gadget/udc/aspeed-vhub/epn.c   |   4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c   |  22 +++--
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h  |  21 ++--
 8 files changed, 185 insertions(+), 72 deletions(-)

-- 
2.17.1

