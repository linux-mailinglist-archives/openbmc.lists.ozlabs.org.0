Return-Path: <openbmc+bounces-13-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20842A9E3C5
	for <lists+openbmc@lfdr.de>; Sun, 27 Apr 2025 17:31:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlrBj1TRDz302b;
	Mon, 28 Apr 2025 01:30:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745767853;
	cv=none; b=JL+/QvV9A/kaPVmfReQ6p8LGLMhctJYRIzLrxXCKVyIyTEsOd8u4UVN5/8p4wG0rdTbox/+5qfrEo04dtKdiWg8gzLpWvRDfqIiFr2ebICq/b8GvKE4cDenJ0UumlOXj6+H6CmU061erQkB3rC+862DQTkFV096xR0WVR2/GT+l98j9Ncpi5tbmFqsZ2oXd082CYin44Rl/khCslVBh4Cw/Wj3Wnf6cqD4TnwBSv6zIow1uI6k/D6Xki/NjZc5SfSigK3piphsnNXCvlMgTiy1hXaxXOskEfFC/7m2iNzTIRhzfnus9jpn8jGe1ympQ+AknNtFxkjCZVgaouo5jqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745767853; c=relaxed/relaxed;
	bh=Z5cY1Y9fLQtVNuC5PWn+Q7v+8CDXriI0E9tI9OfWFGY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AtZvL8Mcmbssxdpekz2btXEYQTrPXAlkOcZ2AbUxNp/rWURzv22Woie+8i8tH6kbDy2aYIaynwkdCXLwwHIITMqCPhbWS7PEk0stmGqEyeEU6bm5l+gDlL41i/MT532sjZ7zk+GUg+DIV/FzjYy007rTQ/ihGr+6G96O9dty7QbdSgOr1yl0HZpB9Ztb5yl1KqG4V4/P+/nzu8aKGKLB8gIg4gsPQuYY+KhOHjKN+OykqjhdD4yHbYd7nsMQeOUDHCrOA5lnPHyT7/5ho4pSMuJoZYXJgRG1w6et0NCrCtXEd0veAWf9fRWoex2RfEfD6UzHr93peYVvonz22uRN0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K66om4AQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K66om4AQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlrBh4S6fz2yHj
	for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 01:30:52 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7394945d37eso3375591b3a.3
        for <openbmc@lists.ozlabs.org>; Sun, 27 Apr 2025 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745767849; x=1746372649; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5cY1Y9fLQtVNuC5PWn+Q7v+8CDXriI0E9tI9OfWFGY=;
        b=K66om4AQN0XVtPFwJCEsAOuv080jKsi5gNNdD734VifONkAR0VMabPDhvqdMOh7juW
         ET9wd5wzxMOMRn/bGfoucMBqlcnDhvDzbHjAILa03aCDDUmpGRZLoahSNIvl4vA0iEqz
         RZzIrrTuTakS9gd7iq6C516RKHlpHAI8YlZMfZkPmPQf1scmbn3R3kCCr8rJxHXbU/Bc
         P7gH7L6T7vusZIt8w9hrApxJ/3hZLM6ZAJzMd9nwhTWay61e1Hciqt1eiHzMRatnj/uP
         4dDzHT07oWqrz/Aueyq+JYdn6bQprD5B5y6fpReBmydiW+B2T+WsifhVBXOc4OnNYhB8
         PfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745767849; x=1746372649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5cY1Y9fLQtVNuC5PWn+Q7v+8CDXriI0E9tI9OfWFGY=;
        b=BP1dYm0AoL5qsvToXTbfaSO+kxPA6t88ovX12tuhUfiVkfUGET/dld5Z/hroUmiast
         qT7X8SroayDflDlMveIuQNbkdumMe79Snf2aoX/NygzuwfTppVWWA3xwS2f/P/ImhxFC
         xWvq1wIXQRoyoTZ2FX1gq0XSpW8BreRpDjUF1SYkTt/1V/Ckjnp0RGzl43zgV3E8VrMv
         YL36pFGB3gsSgZ4umge+xbqWm+VUcjD3+y3rNOvlhKIsXZ2Bqhe9g++XtLeFo28akbJG
         c5Ef3kWv3qa2gNqtp1qnEJ9N16R9n5zgLL+goeGa0YwZmkyOL4Z1XUKbdH29FWjfbrGo
         0W4g==
X-Gm-Message-State: AOJu0YzH2BnJnCZYDJ052FQeYMdvdN2gYGubCo/tRjOMoBKVX/UO7vwm
	0DfHpgnJiQegCmnxwa8gCN4Xyj3spUYPwH9PfQYrX4MpSZ5dGFnnMltDwg==
X-Gm-Gg: ASbGncsCMKkPC83n9G5dLDbOVPpPM3p6auze4mhN17e8WRpDwc11HGHncs+ZQseFnge
	VroqIpKqPFRgoNx0PnxtvvcTpJ7ltyNNYgvOMBMZJ2xkQPxifG6+RD/a7av+rwYYups++xmIaRR
	L3Tral+9p9psa1UDGd1ctHaumculNTg8vwwHOGUDu1Pq3HOyFccwZIKVF89jP+LtJrWlBizp0Nq
	3ZICpGpdJKFxQV+fc3epwh9kde+YuIS2jTdCjs3j2xDOFLEshxCgCFoPGBm5+ZGS8r2qLgj6/a+
	O8FpvptLS5Q8NCS1qbxn/VcGjReRJ4nXugZONVMGT6lELbtQjIlfVtQkKdMOa10aGrJrSWRPPWU
	RGw==
X-Google-Smtp-Source: AGHT+IFmAvTIJkRamVpT/QbYbHlD7hSqn7+n3ZUudJ/taibSvI6rgL7DPA0thWYhh0Vut7QjT7N3kg==
X-Received: by 2002:a05:6a00:1411:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-73ff72a0be4mr8227259b3a.10.1745767849052;
        Sun, 27 Apr 2025 08:30:49 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.167])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73e25912ad3sm6514567b3a.13.2025.04.27.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:30:48 -0700 (PDT)
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 3/3] net: mctp: usb: Port for kernel 6.6
Date: Sun, 27 Apr 2025 21:00:08 +0530
Message-Id: <20250427153008.3166922-4-santosh.puranik.ibm@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Santosh Puranik <spuranik@nvidia.com>

Fix the way the mctp usb binding driver records netdev stats.
Fix the netdev register call.

Signed-off-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>
---
 drivers/net/mctp/mctp-usb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/mctp/mctp-usb.c b/drivers/net/mctp/mctp-usb.c
index e8d4b01c3f34..0c293d6d3607 100644
--- a/drivers/net/mctp/mctp-usb.c
+++ b/drivers/net/mctp/mctp-usb.c
@@ -48,16 +48,17 @@ static void mctp_usb_out_complete(struct urb *urb)
 	case -ECONNRESET:
 	case -ESHUTDOWN:
 	case -EPROTO:
-		dev_dstats_tx_dropped(netdev);
+        netdev->stats.tx_dropped++;
 		break;
 	case 0:
-		dev_dstats_tx_add(netdev, skb->len);
+        netdev->stats.tx_packets++;
+        netdev->stats.tx_bytes += skb->len;
 		netif_wake_queue(netdev);
 		consume_skb(skb);
 		return;
 	default:
 		netdev_dbg(netdev, "unexpected tx urb status: %d\n", status);
-		dev_dstats_tx_dropped(netdev);
+        netdev->stats.tx_dropped++;
 	}
 
 	kfree_skb(skb);
@@ -105,7 +106,7 @@ static netdev_tx_t mctp_usb_start_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 err_drop:
-	dev_dstats_tx_dropped(dev);
+    dev->stats.tx_dropped++;
 	kfree_skb(skb);
 	return NETDEV_TX_OK;
 }
@@ -223,7 +224,8 @@ static void mctp_usb_in_complete(struct urb *urb)
 			skb_trim(skb, pkt_len);
 		}
 
-		dev_dstats_rx_add(netdev, skb->len);
+		netdev->stats.rx_packets++;
+        netdev->stats.rx_bytes += skb->len;
 
 		skb->protocol = htons(ETH_P_MCTP);
 		skb_reset_network_header(skb);
@@ -340,7 +342,7 @@ static int mctp_usb_probe(struct usb_interface *intf,
 
 	INIT_DELAYED_WORK(&dev->rx_retry_work, mctp_usb_rx_retry_work);
 
-	rc = mctp_register_netdev(netdev, NULL, MCTP_PHYS_BINDING_USB);
+	rc = mctp_register_netdev(netdev, NULL);
 	if (rc)
 		goto err_free_urbs;
 
-- 
2.39.5


