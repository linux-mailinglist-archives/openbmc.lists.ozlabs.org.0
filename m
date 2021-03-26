Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0609234A248
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 08:02:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6CbR0NL9z3btS
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 18:02:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=heyhvJU3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=heyhvJU3; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6CbB4FfJz2yhs;
 Fri, 26 Mar 2021 18:02:27 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id f10so3962804pgl.9;
 Fri, 26 Mar 2021 00:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fYmuhM1IRdVizXhzKiPSv+Ub0QxzG3Tko+5Eq9MvW/Y=;
 b=heyhvJU3/gnGrud3yBbvIMaXolUTjLPjrYkFKp6B+qMUBMZTyxLexr3TIysq05T7qY
 z2T9axaa32d04Osw8uFzvGzDUonOoqJ/bR4bav7eZkvokFQkf2tLBat8/6lI1HJOMVxe
 PZoCfl0RboIDWZunfsbHt/9J12HKfjdo8V6xBagYemS32K1S//zKRB/K6J41+DwGXOUq
 s77rumz5RicGCo9nqaW+WK5lnTsDJ5FIQtPXxyyl9m5VcWRdIArfJhTn7kjtkjpXTScQ
 IzUrsv/4AnLYvD/1zvEGmhBd0e/lqhm9SJIq0SoGQudeGNHemfPS77Smni59pQ6VTWzl
 rSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fYmuhM1IRdVizXhzKiPSv+Ub0QxzG3Tko+5Eq9MvW/Y=;
 b=r5fBdoYKzseKWtONvaCzzM1GNEZt0YYpcWaR11yFeQaKwxNS2cCpyY0AvTxeTOb+6f
 HE8ov5iXwCx2ij/o3lOdwEedIzesNhO7m3oafFm1vmtTFkjgPehyaWCjOnB0g1sRtntR
 9idEbaSYukBW8CRJ4BhVeyc2/Cl/+FWmA6bYzSx12HoXIJNNuax6Ek0Ppx1EYMOh5RCz
 Z/1AkD8X1GO4b9k2IvlLLaNcZySJHrQlVekvijoHBZJ9zgK6EQCXb2ViJK1x6rSJUsvK
 X1E7r0pjs7l44bz51f/oiR/QdNDoj/nhEhVCLF0Q4el6Dy9Hx1Ci8RrUyCvmUB9AXw9a
 kfLA==
X-Gm-Message-State: AOAM530XPm8nyRZjiQMAzTgoh54hhdl/BkoH9BQxmoUV/lOoV+go9g22
 gt7zaIcgpKS7rJEUFmA0sdA=
X-Google-Smtp-Source: ABdhPJyn9RFt10iRoIkTqW8m0bKtd4afC3cJ85B/IDkwTe37xBUR7RWH1VR4Hm3SQMbY8NcPWjBVjw==
X-Received: by 2002:a63:545e:: with SMTP id e30mr11128704pgm.13.1616742144402; 
 Fri, 26 Mar 2021 00:02:24 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id y193sm8105133pfc.72.2021.03.26.00.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 00:02:23 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Thomas Tai <thomas.tai@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>
Subject: [PATCH] usb: gadget: aspeed: set port_dev dma mask
Date: Fri, 26 Mar 2021 00:02:14 -0700
Message-Id: <20210326070214.6719-1-rentao.bupt@gmail.com>
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

Set aspeed-usb vhub port_dev's dma mask to pass the dma_mask test in
"dma_map_page_attrs" function, and the dma_mask test was added in
'commit f959dcd6ddfd ("dma-direct: Fix potential NULL pointer
dereference")'.

Below is the backtrace without the patch:
[<80106550>] show_stack+0x20/0x24
[<80106868>] dump_stack+0x28/0x30
[<80823540>] __warn+0xfc/0x110
[<8011ac30>] warn_slowpath_fmt+0xb0/0xc0
[<8011ad44>] dma_map_page_attrs+0x24c/0x314
[<8016a27c>] usb_gadget_map_request_by_dev+0x100/0x1e4
[<805cedd8>] usb_gadget_map_request+0x1c/0x20
[<805cefbc>] ast_vhub_epn_queue+0xa0/0x1d8
[<7f02f710>] usb_ep_queue+0x48/0xc4
[<805cd3e8>] ecm_do_notify+0xf8/0x248
[<7f145920>] ecm_set_alt+0xc8/0x1d0
[<7f145c34>] composite_setup+0x680/0x1d30
[<7f00deb8>] ast_vhub_ep0_handle_setup+0xa4/0x1bc
[<7f02ee94>] ast_vhub_dev_irq+0x58/0x84
[<7f0309e0>] ast_vhub_irq+0xb0/0x1c8
[<7f02e118>] __handle_irq_event_percpu+0x50/0x19c
[<8015e5bc>] handle_irq_event_percpu+0x38/0x8c
[<8015e758>] handle_irq_event+0x38/0x4c

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index d268306a7bfe..9eb3904a6ff9 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -569,6 +569,7 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	device_initialize(d->port_dev);
 	d->port_dev->release = ast_vhub_dev_release;
 	d->port_dev->parent = parent;
+	d->port_dev->dma_mask = parent->dma_mask;
 	dev_set_name(d->port_dev, "%s:p%d", dev_name(parent), idx + 1);
 	rc = device_add(d->port_dev);
 	if (rc)
-- 
2.17.1

