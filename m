Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3701E52B9
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 03:13:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XV7H6vFCzDqVB
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 11:12:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SF0kMaXB; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XV6R0zT3zDqWK;
 Thu, 28 May 2020 11:12:11 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id q24so2313102pjd.1;
 Wed, 27 May 2020 18:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YeymCYJxoRhG3T4Xxmf2TbPWXKoHneVDsox17Vc/EmI=;
 b=SF0kMaXBitrTfXs4ZYGL0gj3rU3facXD9Z2fTnLLHkcmaelUp4j2JlQxp0kJdzFUjc
 MFxy8X0b+8eBqTreQbnNvD1iIZjyLpLsDWTMXyrR9oFv/PhAbPXcLSGAgh0MnZ7mh5qM
 5kq+IwiSeCKTtTNiKSv6Ed1nL43SC+4g0HY3BT0kgs3Hdrssj46/+4FGcbAre1o5of1T
 bl1yOBNY0mJhv/nL+NVWjIbezYFYztnlEd18gTY/FRsl0gn4cZtTUpVHu6rZ/C3jxrzs
 rqHH1ko28u+HcZ3UNrY2cTskl/pmAlTvOCtLGF/zRlsWA9YWkdUJoHvY1SFbDlSv6Rza
 3VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YeymCYJxoRhG3T4Xxmf2TbPWXKoHneVDsox17Vc/EmI=;
 b=JdxM3VVJ4DfBgLqX7+CF8JNoPmuzedxQEkJhglVHDHKCBzYMmjgr6cwJcZOBuUL3eq
 bF5MAV+Yky57EgbZM0oubz5c1oWYPr4YhP1xJqUwbhpsO6uLWS8ya9thJgllcSAanOAe
 INbPl4mx9C8Hvw/GlCoGgzVpZoclN165FxBACX3bFmpmSU4JvPugx+hxoZFEQN4iDXYl
 KZD78aucDelkOuPTxM17QOoKnqyehW5Hs6DsDENgSajtSPDAVcWK/bUTd0PoxYqwPXij
 mcT2S1by8FkZjFOKrSpIFR1jKIhnVz/VG80TwZxIQHs1uLWFStZtd6NnSmIWFwXl2A/j
 sE6A==
X-Gm-Message-State: AOAM531/vC3Kh0OmofWglHCfPWPZooYhmYM73jgRJx+z+pHgWLDGLxCQ
 IOZH9y93pfE8rkYsFpWbaQk=
X-Google-Smtp-Source: ABdhPJxiQddCciww8Rxr4ZOsS/vmlkqh3e2YpWcsPfwemQowQSJHNJrEY+SgMOJGI4e8h5u4/A597g==
X-Received: by 2002:a17:90a:dd43:: with SMTP id
 u3mr1018695pjv.221.1590628327909; 
 Wed, 27 May 2020 18:12:07 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:400::5:ccc9])
 by smtp.gmail.com with ESMTPSA id gd1sm3570640pjb.14.2020.05.27.18.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 18:12:07 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] usb: gadget: aspeed: fixup vhub port irq handling
Date: Wed, 27 May 2020 18:11:54 -0700
Message-Id: <20200528011154.30355-1-rentao.bupt@gmail.com>
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

This is a follow-on patch for commit a23be4ed8f48 ("usb: gadget: aspeed:
improve vhub port irq handling"): for_each_set_bit() is replaced with
simple for() loop because for() loop runs faster on ASPEED BMC.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 10 +++-------
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  3 +++
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index cdf96911e4b1..be7bb64e3594 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -135,13 +135,9 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
 
 	/* Handle device interrupts */
 	if (istat & vhub->port_irq_mask) {
-		unsigned long bitmap = istat;
-		int offset = VHUB_IRQ_DEV1_BIT;
-		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
-
-		for_each_set_bit_from(offset, &bitmap, size) {
-			i = offset - VHUB_IRQ_DEV1_BIT;
-			ast_vhub_dev_irq(&vhub->ports[i].dev);
+		for (i = 0; i < vhub->max_ports; i++) {
+			if (istat & VHUB_DEV_IRQ(i))
+				ast_vhub_dev_irq(&vhub->ports[i].dev);
 		}
 	}
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 2e5a1ef14a75..87a5dea12d3c 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -67,6 +67,9 @@
 #define VHUB_IRQ_HUB_EP0_SETUP			(1 << 0)
 #define VHUB_IRQ_ACK_ALL			0x1ff
 
+/* Downstream device IRQ mask. */
+#define VHUB_DEV_IRQ(n)				(VHUB_IRQ_DEVICE1 << (n))
+
 /* SW reset reg */
 #define VHUB_SW_RESET_EP_POOL			(1 << 9)
 #define VHUB_SW_RESET_DMA_CONTROLLER		(1 << 8)
-- 
2.17.1

