Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC7185F70
	for <lists+openbmc@lfdr.de>; Sun, 15 Mar 2020 20:18:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gTjJ29dyzDqMF
	for <lists+openbmc@lfdr.de>; Mon, 16 Mar 2020 06:17:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S4yLSbp0; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gTgv2h5MzDqBM;
 Mon, 16 Mar 2020 06:16:43 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id ca13so7294409pjb.2;
 Sun, 15 Mar 2020 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CN9k9v/8yanEjvR23mTlz7kA9CFHoWHmloWkKBS3Xfc=;
 b=S4yLSbp0ndcNFd6XrNeRW3x72H5xjX1PGggO6RKE2KMhHWTPIOarIaOzSnkPqdkmmu
 3KcSCod7vNk9ClFu4pv4qhzNy3vKgg+BoMvzpq//eBCfQQW4355FWsYReXn5WsJVK5UZ
 R3JbLN8UQ3esw79Bpw6sVrXK7shFgDQUUVdlss81RJfudRMrz6W6dHMkJfNdYJvemb1q
 URIMNQzOx73yinju9GRZId5tQAtB19vJryHOAxpXzVsJZ7JnU42zFeBNiSIoOOIsstCQ
 0YYBxYBdtaxX66HCSplM2ksq7Ba4JTzDHkDMQN2EAUjbzmYlqyPbA+sDYRo1NmMqaEAl
 W9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CN9k9v/8yanEjvR23mTlz7kA9CFHoWHmloWkKBS3Xfc=;
 b=rjbGpqLkPUMDM4Ab5o+i2bz52sxfkqLIpFj+HwduocR/sxkWcpmRecwLnR91Am94BA
 SFjmsfxiyoYq358t99IHv85ROY69TYmHherlE/eziAT6dDa1YcpQ4c0YcYGrqBJtmoOq
 wJmQoWKb+Rr7HDoQNrczKoR9gIZ4bT6or59ow0NXjqbwLEAhXcPZ8fCFO59h5F1+c6jC
 hhjFtXkW5N/goIFPE3+vgDTYjQwFK4btcrpGkLTPSF9Mi3ZLqsR4Gysg8DpVMWLa4hVY
 3kryXyqz4juOTC+6WScK/FxPkBOekgxI1pRwgB2oGFjM8ixnmxhKUin5564XB2RgSLbt
 lNUg==
X-Gm-Message-State: ANhLgQ2Yy04Bf/XkSw0wfXJLHKTwLUhzIZHNMwZ5kUQlgky9bbSRgOna
 pVyfRrKwrNVnCneAnbS3j+w=
X-Google-Smtp-Source: ADFU+vsjhDVjjDl11WUJvFRigf5KGVcQfKwnZ9/KJdInHA9LulswWg4d2VO7LJ3xsEd9l0h9798aqQ==
X-Received: by 2002:a17:90a:191:: with SMTP id
 17mr20937506pjc.88.1584299799816; 
 Sun, 15 Mar 2020 12:16:39 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 13sm61431882pgo.13.2020.03.15.12.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 12:16:39 -0700 (PDT)
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
Subject: [PATCH v2 0/6] usb: gadget: aspeed: allow to customize vhub device
Date: Sun, 15 Mar 2020 12:16:26 -0700
Message-Id: <20200315191632.12536-1-rentao.bupt@gmail.com>
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

This patch series allows people to customize aspeed-usb-vhub device IDs
and strings via device tree.

Patch #1 converts the single "usb_gadget_strings" instance to a list of
"usb_gadget_strings" so it's more convenient to support miltiple
languages.

Patch #2 moves LANGID validation code from configfs.c to usbstring.c so
it can be used by aspeed-vhub driver.

Patch #3 initializes aspeed-vhub strings with default, or from device
tree if according device tree properties are defined.

Patch #4 overrides aspeed-vhub's device IDs if according properties are
defined in device tree.

Patch #5 moves fixup-usb1-dev-desc logic from get-descriptor handler to
vhub-init time so the descriptor is patched only once.

Patch #6 documents new device tree properties in dt-binding document.

Tao Ren (6):
  usb: gadget: aspeed: support multiple language strings
  usb: gadget: add "usb_validate_langid" function
  usb: gadget: aspeed: allow to set usb strings in device tree
  usb: gadget: aspeed: allow to set device IDs in device tree
  usb: gadget: aspeed: fixup usb1 device descriptor at init time
  dt-bindings: usb: document aspeed vhub device ID/string properties

 .../bindings/usb/aspeed,usb-vhub.yaml         |  68 +++++
 drivers/usb/gadget/configfs.c                 |  14 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c     |   4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c      | 236 ++++++++++++++++--
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h     |   4 +-
 drivers/usb/gadget/usbstring.c                |  24 ++
 include/linux/usb/gadget.h                    |   3 +
 7 files changed, 312 insertions(+), 41 deletions(-)

-- 
2.17.1

