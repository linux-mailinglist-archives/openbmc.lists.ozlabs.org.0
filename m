Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 680EC34F82F
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 06:59:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Dck2dyPz3byr
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 15:59:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QOx+xP0O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QOx+xP0O; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Dc96BXQz3bwW;
 Wed, 31 Mar 2021 15:58:48 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id bt4so8872667pjb.5;
 Tue, 30 Mar 2021 21:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=M9IEZCF3Kb5rzDpus85iH1dAL2w2ZrIdfYygwHVDvMs=;
 b=QOx+xP0OZ9SwBGZAcMXCuioMLzdjTff51PtRLVQmxuiKezcDEiMqpJNi0HnkZQmHNx
 4CX6FTDHqn0bNK3YpNvch7/LCc5iekuFtAiyJ1ZCDw29+RCFssk777mEBiO7JKMSTqe7
 FWmZfiLQC1Tb/Fk03vbxBZeUOmV6PwErF//XkcSl/RTjdjN7d2JWXP3F/xZBakHuvir+
 2HfVjTCQVYGFTCZIdG+s+0kBGsY6BLTwjmV1RTciFZSNbSq1k6u5I0Eqy3pIU2lj/aK1
 +j1GEYDcGl1oqj26f/FcqQv/1SwPJYKQhLmWdJS33+5pLbf3SRSlXRWCtoBPBNQjWsX/
 VWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=M9IEZCF3Kb5rzDpus85iH1dAL2w2ZrIdfYygwHVDvMs=;
 b=Chby4EkfhNyAqT6lSkG7EMltEVzBhSJK20oM/kFWn0GWHJWXhJbsLyn5vAhmjrH8dL
 WRDmByKCT7Mo+5y6zlFPNSP1zNrjMIvG2UM8ajRKH+fMDyx0QLSdhVDFo9n/4JeUI8O1
 KZ4skMWhJAS1Pjpo6M0Y5UDyk1O3z5wx6sn5/9clQhR84VdskyGFxoWfwO0/sjprbmtK
 ZEdeV8i+5WcJmn8ejJTw2UkctZH7qdVCZ9ZyamLXeyzzw31lt61hyFPeetU/Vd19ydXb
 sAiXzkeZravXrKY7AwU6nF9tleU1bSPctP0b1/yb9+4u29bmYM3tzw7CDmAN8yMtTyrN
 Uo5g==
X-Gm-Message-State: AOAM530gFVRKTA4ZIa2WiF4zvcmY455/QclztrsIAo4x4TCXJl3naAeK
 XkPz6kootkO0TQTydJ7vdh4=
X-Google-Smtp-Source: ABdhPJxCQskMGUM7pUf8tLPCPJKZG1Bkr8uITpKSbc8zP5PBHshTADmqpzQJd1Y+m/V/iFE4MN9CAw==
X-Received: by 2002:a17:90a:db51:: with SMTP id
 u17mr1695746pjx.194.1617166725244; 
 Tue, 30 Mar 2021 21:58:45 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a70sm587054pfa.202.2021.03.30.21.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 21:58:44 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Julia Lawall <julia.lawall@inria.fr>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Thomas Tai <thomas.tai@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tao Ren <taoren@fb.com>
Subject: [PATCH] usb: gadget: aspeed: fix dma map failure
Date: Tue, 30 Mar 2021 21:58:31 -0700
Message-Id: <20210331045831.28700-1-rentao.bupt@gmail.com>
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

Currently the virtual port_dev device is passed to DMA API, and this is
wrong because the device passed to DMA API calls must be the actual
hardware device performing the DMA.

The patch replaces usb_gadget_map_request/usb_gadget_unmap_request APIs
with usb_gadget_map_request_by_dev/usb_gadget_unmap_request_by_dev APIs
so the DMA capable platform device can be passed to the DMA APIs.

The patch fixes below backtrace detected on Facebook AST2500 OpenBMC
platforms:

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
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 3 ++-
 drivers/usb/gadget/udc/aspeed-vhub/epn.c  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index be7bb64e3594..d11d3d14313f 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -36,6 +36,7 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
 		   int status)
 {
 	bool internal = req->internal;
+	struct ast_vhub *vhub = ep->vhub;
 
 	EPVDBG(ep, "completing request @%p, status %d\n", req, status);
 
@@ -46,7 +47,7 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
 
 	if (req->req.dma) {
 		if (!WARN_ON(!ep->dev))
-			usb_gadget_unmap_request(&ep->dev->gadget,
+			usb_gadget_unmap_request_by_dev(&vhub->pdev->dev,
 						 &req->req, ep->epn.is_in);
 		req->req.dma = 0;
 	}
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 02d8bfae58fb..cb164c615e6f 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -376,7 +376,7 @@ static int ast_vhub_epn_queue(struct usb_ep* u_ep, struct usb_request *u_req,
 	if (ep->epn.desc_mode ||
 	    ((((unsigned long)u_req->buf & 7) == 0) &&
 	     (ep->epn.is_in || !(u_req->length & (u_ep->maxpacket - 1))))) {
-		rc = usb_gadget_map_request(&ep->dev->gadget, u_req,
+		rc = usb_gadget_map_request_by_dev(&vhub->pdev->dev, u_req,
 					    ep->epn.is_in);
 		if (rc) {
 			dev_warn(&vhub->pdev->dev,
-- 
2.17.1

