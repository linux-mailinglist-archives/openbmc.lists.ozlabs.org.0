Return-Path: <openbmc+bounces-34-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96079AAE806
	for <lists+openbmc@lfdr.de>; Wed,  7 May 2025 19:39:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt2ZG6thBz30Sy;
	Thu,  8 May 2025 03:39:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746639558;
	cv=none; b=Yce6et26/2OKhck4QdI34oHcpn9d7DcTD5rHYiXqk+Gk5+ogOOgIHaaG7McRav/RsiI7XecY4RNPLtqgAszMMN2HPQEbfX82gTkh3bZvoVGlf9HwdHRLMfq3hEfV10OgkDTMv8gDNMkZkLoGspMsobMl94oss+nVZdbSuqRhoT22bYTvA///Gv3c5bXDyWiVtJOXryA7jYN4rT+4Q5mGFCu3CJ+fJZ4IDfNtJKe/HU7GgNc/1shq40h5XieaaBHQmdt2xKABEv/4tRbsHuxrLtV6qZjfe8nwP4ArU6jnrZcnjZr+HGTXcUWXIERIxFT91AWBdmspP2FCR1YwFOtyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746639558; c=relaxed/relaxed;
	bh=4ohK64avZ2LWRI+bxuJmaP6Xv9OAlSraUSeTyYCpmNg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E5oPPOrqOXRd4v0BwjbouwjsVKTpvwu2YltvoLcuRe+zAI15O3kRerNgGe5H/VtTSdDc7nvYc+MOmiNlg1BfxIruAKSKny02utW2cUpn9cvWI1+Lw2lq8cFxOtdUHKwb/QpIm6978zw0vtUqSDVL9xZ+I05t+fai2071IXAy8y+qTOqR9DD3ykju78lANHtRvnjZHMTAo56/WpGjoz0ddq003U+03bJmo91t/M0YkDBQgF96IM7VhVNLc2+y+HdDAj0wevXFggvNvA0NcFjrJnpxCD9sHDpK4aMUwXfYcUW0lI/4mQSVF1GsKZbtuwFRlq7sX6QiDeDRsaDYilGQnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LtHOmGLZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LtHOmGLZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt2ZF0Svzz30Qb
	for <openbmc@lists.ozlabs.org>; Thu,  8 May 2025 03:39:16 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22e09f57ed4so14378815ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 May 2025 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746639555; x=1747244355; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ohK64avZ2LWRI+bxuJmaP6Xv9OAlSraUSeTyYCpmNg=;
        b=LtHOmGLZ9rqx8hWegNUfk76n61S5aRUJ1FtUj1boO25I/k4LchsTN2XePhuQYCK1oX
         1MAyKeAscChCNWiFWjlbRhowOLeAlmE544gkh74/bQe/yn7TSXQ2gyIZ2o50kr8VOt9Y
         8+zeqpgjP1yjf0ymFcr1cqABxvQsD5G9ipg/rmK9+OIROID5q8858fTwTV22hEpaDrr4
         UmpB7sVwRYKf9d/p/+7UvqtR4QAa3ASDj92aPXGMSyADv/XfFJswDHabmasveZLdl1CC
         79P2hjDPHCx4c5jFRjg+MCd6Z1S5lv7X+ckoyKTsqwbP6seBNMPTQ/NuRorCf6qLrwi8
         ajtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639555; x=1747244355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ohK64avZ2LWRI+bxuJmaP6Xv9OAlSraUSeTyYCpmNg=;
        b=Oji8nIeetQApZSwpXUytLvmI2DRIpcUPsR7DrDtb2nA6YgG8ugjEsME+fgw6D8N9VQ
         yYYawLFJHmC+mkR+jmQW3LmAkGtN4NCttaziu/DTFRTEUQT5iz/oA9ZsRB+bdU+HayO8
         XZvRuBeMdYjjaJTVuF2f0wdZYp/3Nk30SWpqRkVkWavOoKAnuaztN908Gdvc9RYv7ORI
         +qOlaa9qckoertXlu0RBthbDlB3w8F/R+ILQIDXEvj7+DUI5vLx2XpG7scgzqa/+QmPl
         alEJmg440POSwKREYoLOlsjSjyPFmBPTXlLiW0Kv3n0e7bn0VA6CJhhQ611gQ1z1Fr4u
         In5A==
X-Gm-Message-State: AOJu0YwTXC/l5h61aVnwfk4j1JMCxYM40G+Zn1HL0qzOrLBaD+zYL2Md
	lgMPiUVF/WSg3576QKCYgiQQwyjtWoUvaqu7hV18KCvf/6CZO/deCWKxBA==
X-Gm-Gg: ASbGncsVtykGxSScnAeNMDphPzY+1mq8jGfHD67ndOwgDDdFYfOpwpgIsXNQCLCkH5l
	0rZilWMKi1+ro4T5BG+Q1YyVfRLRVgVg9aSTZwvwlkpOiws9ozHkDWN6zu1r5B38rh+zh7McYK8
	CgVAeD7esh63LnvlLBrTsBcCucm68NDov2TzFDr0xRO8EcBrnC9DP21EYE7KCL43lSt7XvV9DLf
	kPV1634aTTg+tMlr0SxSb16eKgzDsP1D1SC7NhzyNQiThIzpnsrGtmNKpED1mxmcTztjqx7eQFd
	dzMVuN4mYhIz3XHQshMG7MIc85FaHQFAWpZSg5pJK0m04PsJJ+x0/PAlyT3IvpGHfg==
X-Google-Smtp-Source: AGHT+IHEa2HNdk/TurWJ2vJXmuQOiyd4lh6+gWhkDGXLACGIe6Kpxu4FZBqnxuFS0SouVqJ+Db3/4g==
X-Received: by 2002:a17:903:1c5:b0:215:6c5f:d142 with SMTP id d9443c01a7336-22e8475510dmr4423405ad.20.1746639554640;
        Wed, 07 May 2025 10:39:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.193.52])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22e15232797sm97751415ad.240.2025.05.07.10.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:39:14 -0700 (PDT)
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 v2 2/3] net: mctp: Add MCTP USB transport driver
Date: Wed,  7 May 2025 23:08:05 +0530
Message-Id: <20250507173806.5371-3-santosh.puranik.ibm@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507173806.5371-1-santosh.puranik.ibm@gmail.com>
References: <20250507173806.5371-1-santosh.puranik.ibm@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jeremy Kerr <jk@codeconstruct.com.au>

Add an implementation for DMTF DSP0283, which defines a MCTP-over-USB
transport. As per that spec, we're restricted to full speed mode,
requiring 512-byte transfers.

Each MCTP-over-USB interface is a peer-to-peer link to a single MCTP
endpoint, so no physical addressing is required (of course, that MCTP
endpoint may then bridge to further MCTP endpoints). Consequently,
interfaces will report with no lladdr data:

    # mctp link
    dev lo index 1 address 00:00:00:00:00:00 net 1 mtu 65536 up
    dev mctpusb0 index 6 address none net 1 mtu 68 up

This is a simple initial implementation, with single rx & tx urbs, and
no multi-packet tx transfers - although we do accept multi-packet rx
from the device.

Includes suggested fixes from Santosh Puranik <spuranik@nvidia.com>.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Santosh Puranik <spuranik@nvidia.com>
Link: https://patch.msgid.link/20250221-dev-mctp-usb-v3-2-3353030fe9cc@codeconstruct.com.au
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
(cherry picked from commit 0791c0327a6e4e7691d6fc5ad334c215de04dcc9)
Signed-off-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>
---
 drivers/net/mctp/Kconfig    |  10 +
 drivers/net/mctp/Makefile   |   1 +
 drivers/net/mctp/mctp-usb.c | 385 ++++++++++++++++++++++++++++++++++++
 3 files changed, 396 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-usb.c

diff --git a/drivers/net/mctp/Kconfig b/drivers/net/mctp/Kconfig
index ce9d2d2ccf3b..569cb5cfba62 100644
--- a/drivers/net/mctp/Kconfig
+++ b/drivers/net/mctp/Kconfig
@@ -42,6 +42,16 @@ config MCTP_TRANSPORT_I3C
 	  A MCTP protocol network device is created for each I3C bus
 	  having a "mctp-controller" devicetree property.
 
+config MCTP_TRANSPORT_USB
+	tristate "MCTP USB transport"
+	depends on USB
+	help
+	  Provides a driver to access MCTP devices over USB transport,
+	  defined by DMTF specification DSP0283.
+
+	  MCTP-over-USB interfaces are peer-to-peer, so each interface
+	  represents a physical connection to one remote MCTP endpoint.
+
 endmenu
 
 endif
diff --git a/drivers/net/mctp/Makefile b/drivers/net/mctp/Makefile
index e1cb99ced54a..c36006849a1e 100644
--- a/drivers/net/mctp/Makefile
+++ b/drivers/net/mctp/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_MCTP_SERIAL) += mctp-serial.o
 obj-$(CONFIG_MCTP_TRANSPORT_I2C) += mctp-i2c.o
 obj-$(CONFIG_MCTP_TRANSPORT_I3C) += mctp-i3c.o
+obj-$(CONFIG_MCTP_TRANSPORT_USB) += mctp-usb.o
diff --git a/drivers/net/mctp/mctp-usb.c b/drivers/net/mctp/mctp-usb.c
new file mode 100644
index 000000000000..e8d4b01c3f34
--- /dev/null
+++ b/drivers/net/mctp/mctp-usb.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mctp-usb.c - MCTP-over-USB (DMTF DSP0283) transport binding driver.
+ *
+ * DSP0283 is available at:
+ * https://www.dmtf.org/sites/default/files/standards/documents/DSP0283_1.0.1.pdf
+ *
+ * Copyright (C) 2024-2025 Code Construct Pty Ltd
+ */
+
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/usb.h>
+#include <linux/usb/mctp-usb.h>
+
+#include <net/mctp.h>
+#include <net/mctpdevice.h>
+#include <net/pkt_sched.h>
+
+#include <uapi/linux/if_arp.h>
+
+struct mctp_usb {
+	struct usb_device *usbdev;
+	struct usb_interface *intf;
+	bool stopped;
+
+	struct net_device *netdev;
+
+	u8 ep_in;
+	u8 ep_out;
+
+	struct urb *tx_urb;
+	struct urb *rx_urb;
+
+	struct delayed_work rx_retry_work;
+};
+
+static void mctp_usb_out_complete(struct urb *urb)
+{
+	struct sk_buff *skb = urb->context;
+	struct net_device *netdev = skb->dev;
+	int status;
+
+	status = urb->status;
+
+	switch (status) {
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+	case -EPROTO:
+		dev_dstats_tx_dropped(netdev);
+		break;
+	case 0:
+		dev_dstats_tx_add(netdev, skb->len);
+		netif_wake_queue(netdev);
+		consume_skb(skb);
+		return;
+	default:
+		netdev_dbg(netdev, "unexpected tx urb status: %d\n", status);
+		dev_dstats_tx_dropped(netdev);
+	}
+
+	kfree_skb(skb);
+}
+
+static netdev_tx_t mctp_usb_start_xmit(struct sk_buff *skb,
+				       struct net_device *dev)
+{
+	struct mctp_usb *mctp_usb = netdev_priv(dev);
+	struct mctp_usb_hdr *hdr;
+	unsigned int plen;
+	struct urb *urb;
+	int rc;
+
+	plen = skb->len;
+
+	if (plen + sizeof(*hdr) > MCTP_USB_XFER_SIZE)
+		goto err_drop;
+
+	rc = skb_cow_head(skb, sizeof(*hdr));
+	if (rc)
+		goto err_drop;
+
+	hdr = skb_push(skb, sizeof(*hdr));
+	if (!hdr)
+		goto err_drop;
+
+	hdr->id = cpu_to_be16(MCTP_USB_DMTF_ID);
+	hdr->rsvd = 0;
+	hdr->len = plen + sizeof(*hdr);
+
+	urb = mctp_usb->tx_urb;
+
+	usb_fill_bulk_urb(urb, mctp_usb->usbdev,
+			  usb_sndbulkpipe(mctp_usb->usbdev, mctp_usb->ep_out),
+			  skb->data, skb->len,
+			  mctp_usb_out_complete, skb);
+
+	rc = usb_submit_urb(urb, GFP_ATOMIC);
+	if (rc)
+		goto err_drop;
+	else
+		netif_stop_queue(dev);
+
+	return NETDEV_TX_OK;
+
+err_drop:
+	dev_dstats_tx_dropped(dev);
+	kfree_skb(skb);
+	return NETDEV_TX_OK;
+}
+
+static void mctp_usb_in_complete(struct urb *urb);
+
+/* If we fail to queue an in urb atomically (either due to skb allocation or
+ * urb submission), we will schedule a rx queue in nonatomic context
+ * after a delay, specified in jiffies
+ */
+static const unsigned long RX_RETRY_DELAY = HZ / 4;
+
+static int mctp_usb_rx_queue(struct mctp_usb *mctp_usb, gfp_t gfp)
+{
+	struct sk_buff *skb;
+	int rc;
+
+	skb = __netdev_alloc_skb(mctp_usb->netdev, MCTP_USB_XFER_SIZE, gfp);
+	if (!skb) {
+		rc = -ENOMEM;
+		goto err_retry;
+	}
+
+	usb_fill_bulk_urb(mctp_usb->rx_urb, mctp_usb->usbdev,
+			  usb_rcvbulkpipe(mctp_usb->usbdev, mctp_usb->ep_in),
+			  skb->data, MCTP_USB_XFER_SIZE,
+			  mctp_usb_in_complete, skb);
+
+	rc = usb_submit_urb(mctp_usb->rx_urb, gfp);
+	if (rc) {
+		netdev_dbg(mctp_usb->netdev, "rx urb submit failure: %d\n", rc);
+		kfree_skb(skb);
+		if (rc == -ENOMEM)
+			goto err_retry;
+	}
+
+	return rc;
+
+err_retry:
+	schedule_delayed_work(&mctp_usb->rx_retry_work, RX_RETRY_DELAY);
+	return rc;
+}
+
+static void mctp_usb_in_complete(struct urb *urb)
+{
+	struct sk_buff *skb = urb->context;
+	struct net_device *netdev = skb->dev;
+	struct mctp_usb *mctp_usb = netdev_priv(netdev);
+	struct mctp_skb_cb *cb;
+	unsigned int len;
+	int status;
+
+	status = urb->status;
+
+	switch (status) {
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+	case -EPROTO:
+		kfree_skb(skb);
+		return;
+	case 0:
+		break;
+	default:
+		netdev_dbg(netdev, "unexpected rx urb status: %d\n", status);
+		kfree_skb(skb);
+		return;
+	}
+
+	len = urb->actual_length;
+	__skb_put(skb, len);
+
+	while (skb) {
+		struct sk_buff *skb2 = NULL;
+		struct mctp_usb_hdr *hdr;
+		u8 pkt_len; /* length of MCTP packet, no USB header */
+
+		hdr = skb_pull_data(skb, sizeof(*hdr));
+		if (!hdr)
+			break;
+
+		if (be16_to_cpu(hdr->id) != MCTP_USB_DMTF_ID) {
+			netdev_dbg(netdev, "rx: invalid id %04x\n",
+				   be16_to_cpu(hdr->id));
+			break;
+		}
+
+		if (hdr->len <
+		    sizeof(struct mctp_hdr) + sizeof(struct mctp_usb_hdr)) {
+			netdev_dbg(netdev, "rx: short packet (hdr) %d\n",
+				   hdr->len);
+			break;
+		}
+
+		/* we know we have at least sizeof(struct mctp_usb_hdr) here */
+		pkt_len = hdr->len - sizeof(struct mctp_usb_hdr);
+		if (pkt_len > skb->len) {
+			netdev_dbg(netdev,
+				   "rx: short packet (xfer) %d, actual %d\n",
+				   hdr->len, skb->len);
+			break;
+		}
+
+		if (pkt_len < skb->len) {
+			/* more packets may follow - clone to a new
+			 * skb to use on the next iteration
+			 */
+			skb2 = skb_clone(skb, GFP_ATOMIC);
+			if (skb2) {
+				if (!skb_pull(skb2, pkt_len)) {
+					kfree_skb(skb2);
+					skb2 = NULL;
+				}
+			}
+			skb_trim(skb, pkt_len);
+		}
+
+		dev_dstats_rx_add(netdev, skb->len);
+
+		skb->protocol = htons(ETH_P_MCTP);
+		skb_reset_network_header(skb);
+		cb = __mctp_cb(skb);
+		cb->halen = 0;
+		netif_rx(skb);
+
+		skb = skb2;
+	}
+
+	if (skb)
+		kfree_skb(skb);
+
+	mctp_usb_rx_queue(mctp_usb, GFP_ATOMIC);
+}
+
+static void mctp_usb_rx_retry_work(struct work_struct *work)
+{
+	struct mctp_usb *mctp_usb = container_of(work, struct mctp_usb,
+						 rx_retry_work.work);
+
+	if (READ_ONCE(mctp_usb->stopped))
+		return;
+
+	mctp_usb_rx_queue(mctp_usb, GFP_KERNEL);
+}
+
+static int mctp_usb_open(struct net_device *dev)
+{
+	struct mctp_usb *mctp_usb = netdev_priv(dev);
+
+	WRITE_ONCE(mctp_usb->stopped, false);
+
+	return mctp_usb_rx_queue(mctp_usb, GFP_KERNEL);
+}
+
+static int mctp_usb_stop(struct net_device *dev)
+{
+	struct mctp_usb *mctp_usb = netdev_priv(dev);
+
+	netif_stop_queue(dev);
+
+	/* prevent RX submission retry */
+	WRITE_ONCE(mctp_usb->stopped, true);
+
+	usb_kill_urb(mctp_usb->rx_urb);
+	usb_kill_urb(mctp_usb->tx_urb);
+
+	cancel_delayed_work_sync(&mctp_usb->rx_retry_work);
+
+	return 0;
+}
+
+static const struct net_device_ops mctp_usb_netdev_ops = {
+	.ndo_start_xmit = mctp_usb_start_xmit,
+	.ndo_open = mctp_usb_open,
+	.ndo_stop = mctp_usb_stop,
+};
+
+static void mctp_usb_netdev_setup(struct net_device *dev)
+{
+	dev->type = ARPHRD_MCTP;
+
+	dev->mtu = MCTP_USB_MTU_MIN;
+	dev->min_mtu = MCTP_USB_MTU_MIN;
+	dev->max_mtu = MCTP_USB_MTU_MAX;
+
+	dev->hard_header_len = sizeof(struct mctp_usb_hdr);
+	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
+	dev->flags = IFF_NOARP;
+	dev->netdev_ops = &mctp_usb_netdev_ops;
+	dev->pcpu_stat_type = NETDEV_PCPU_STAT_DSTATS;
+}
+
+static int mctp_usb_probe(struct usb_interface *intf,
+			  const struct usb_device_id *id)
+{
+	struct usb_endpoint_descriptor *ep_in, *ep_out;
+	struct usb_host_interface *iface_desc;
+	struct net_device *netdev;
+	struct mctp_usb *dev;
+	int rc;
+
+	/* only one alternate */
+	iface_desc = intf->cur_altsetting;
+
+	rc = usb_find_common_endpoints(iface_desc, &ep_in, &ep_out, NULL, NULL);
+	if (rc) {
+		dev_err(&intf->dev, "invalid endpoints on device?\n");
+		return rc;
+	}
+
+	netdev = alloc_netdev(sizeof(*dev), "mctpusb%d", NET_NAME_ENUM,
+			      mctp_usb_netdev_setup);
+	if (!netdev)
+		return -ENOMEM;
+
+	SET_NETDEV_DEV(netdev, &intf->dev);
+	dev = netdev_priv(netdev);
+	dev->netdev = netdev;
+	dev->usbdev = usb_get_dev(interface_to_usbdev(intf));
+	dev->intf = intf;
+	usb_set_intfdata(intf, dev);
+
+	dev->ep_in = ep_in->bEndpointAddress;
+	dev->ep_out = ep_out->bEndpointAddress;
+
+	dev->tx_urb = usb_alloc_urb(0, GFP_KERNEL);
+	dev->rx_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!dev->tx_urb || !dev->rx_urb) {
+		rc = -ENOMEM;
+		goto err_free_urbs;
+	}
+
+	INIT_DELAYED_WORK(&dev->rx_retry_work, mctp_usb_rx_retry_work);
+
+	rc = mctp_register_netdev(netdev, NULL, MCTP_PHYS_BINDING_USB);
+	if (rc)
+		goto err_free_urbs;
+
+	return 0;
+
+err_free_urbs:
+	usb_free_urb(dev->tx_urb);
+	usb_free_urb(dev->rx_urb);
+	free_netdev(netdev);
+	return rc;
+}
+
+static void mctp_usb_disconnect(struct usb_interface *intf)
+{
+	struct mctp_usb *dev = usb_get_intfdata(intf);
+
+	mctp_unregister_netdev(dev->netdev);
+	usb_free_urb(dev->tx_urb);
+	usb_free_urb(dev->rx_urb);
+	usb_put_dev(dev->usbdev);
+	free_netdev(dev->netdev);
+}
+
+static const struct usb_device_id mctp_usb_devices[] = {
+	{ USB_INTERFACE_INFO(USB_CLASS_MCTP, 0x0, 0x1) },
+	{ 0 },
+};
+
+MODULE_DEVICE_TABLE(usb, mctp_usb_devices);
+
+static struct usb_driver mctp_usb_driver = {
+	.name		= "mctp-usb",
+	.id_table	= mctp_usb_devices,
+	.probe		= mctp_usb_probe,
+	.disconnect	= mctp_usb_disconnect,
+};
+
+module_usb_driver(mctp_usb_driver)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jeremy Kerr <jk@codeconstruct.com.au>");
+MODULE_DESCRIPTION("MCTP USB transport");
-- 
2.39.5


