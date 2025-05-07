Return-Path: <openbmc+bounces-35-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56638AAE808
	for <lists+openbmc@lfdr.de>; Wed,  7 May 2025 19:40:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt2ZJ1Zlyz30Qb;
	Thu,  8 May 2025 03:39:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746639560;
	cv=none; b=A72KfNET93BhE6zVO3gZirQ/ABoh6osJ6eU1wQemkeGf5vHUwX4ZsChtDEtcLmGFiCr1a4JCiJMwTFcsr4G7iEipDXf57NNSrpjl2GCzDZryyLfyNF5vwo+ItsYpMFd6Pipc7vyATY68qSlxPaRK0x4ZmSmL0Ow9b9Rffcvekz0u03yj/8okcS2UdGn2p8iAvRC1BTnSgIx/yfGezE0FNRskJtJ//X7lOG2MS6ChnQ5Z4sWrWi2MBUw1ZBCzbYDirwf6DeuTAz2ECdNFCs//bj7KEatEpS5hfXoNTT1l4ng9OeiBqRoGHPHXQAzZiOCtTGv39xCT39CtPzv+HK53rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746639560; c=relaxed/relaxed;
	bh=A5+NQIs3PuLj76B7u/FZjvXO4KGfF7zXYoORgUpp6BU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BqtolB+yPioFOcPNwLJBV99bJrm+oEVUmdEZBXLdSsUaEIiGtcmgn/GWa4GifxAshDp2eAfLUbYKbduD2UXf4n+8XiWd6P5R6Z5TUKmJ9DqUZxIX3NEwuCY21zy8rrTW6LOW8kLjJ898NWK8GCgSGonCYUXxFkB92lfsEUM2udJwdm0svyEEqOTwzHB19yMd/FEGPskG8cjzS3SCsZB2aYUOqDjNSN5mt/4jwwtbb6gqJnRVeECyT5tfdxTMD1Prljw5XHx6N0UtiHaE73zBKmOt7BzKrJR+3jarKExH1qrlByxkd1o/4ySlSOxxk5OVdN6YxkewnR5bokDInrtgZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TO/jFLHC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TO/jFLHC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt2ZH3kHVz2xRt
	for <openbmc@lists.ozlabs.org>; Thu,  8 May 2025 03:39:19 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2279915e06eso1937775ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 07 May 2025 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746639557; x=1747244357; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5+NQIs3PuLj76B7u/FZjvXO4KGfF7zXYoORgUpp6BU=;
        b=TO/jFLHCR3QUsPD2Uc6cut02gFdvV1o6mAPbogIGSbyymqc7CceunmuOqMF2OXJ3dZ
         aatlmUCHevxJyGgy8Kqsd9rf2Oy0pEnPDyoTqhfE54DKPbgz2T3oOAUg4zSxj7XVglC8
         ackFmjXwPcow4wghbD2ttxZpmZ4aGEh/mcJ4Sz/0ZUGu9lq4nNe0dN85xO6kSkkyyBH2
         WAWrtOsYpLClpuNTB9AJu7ZB6B4NONdP0/am1kfmBQN3ciES1uRr6UPPotL6UaDZ4tgf
         wkSXJv/rzrS290yfON57+YHjxBbmk6z5hZmTpv70Jnal4weSYI1eBOAsuvQU4KMS9MDN
         0soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639557; x=1747244357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5+NQIs3PuLj76B7u/FZjvXO4KGfF7zXYoORgUpp6BU=;
        b=vvCkTGVMoaUldyD4zhnpCkVgKFlGLMd8CK1/zeJ+6Hb1/XuZl5bB2LtV2ncXFqX+uU
         zrEAFGLGPJlMA+iJ+n9CPRJpLpy5PQoinfssz5LWmpQmdLIBLZ/x7ezA6aOIQNd6GJ8C
         G8M5A212AIJoM0xnC9TIOWhDZ17KgiO5R0F1ZKZNEqhn3DL6vCmQlA9g/uzCDBIMkT3n
         meYHtlF0Jw1i1eKA0TF3pHQ4v/g1frr+gqzQlmCcHaZLyxUnARCXRmpjLZBUqgTbvK8I
         Mhs3tMoT5Jt5fYxWGxYdy5IXH9eT9RqD9kI1UEWLy3xZ5SU7rlf7HiUZ8rxmVBKUEd7r
         zc3A==
X-Gm-Message-State: AOJu0Yz6FN3ds+J1jDPazEZ9SWOjTpAnzef/mU8k4ohxESV7vm86s6Oi
	n+tiZoWtDHTPROUrlNjJtbU0kd1mGRJRBQSj7wzQZAipGJS8B/GTcYVJ+A==
X-Gm-Gg: ASbGncu/MCB04rVfLFLbntONh5qGrjL1g6zGdl+O2/m9yur4fFPXWpUR6yLVyRse+4u
	4ZT2rGqBEVHuMRVIgiQjf7sijkXfTUMvrgWnn7cAtUJjV+phHerIXhAvsUsG7g0fDqCjdGeFjSe
	UZLh6SGLgTzs0W4HQk8bKb2ZOf0wpgtbOx9thxlXGnQ+oQvmfhtwx/90d0HDg//2FgNib0+xNdf
	a/e5cj6Rulmiq9ghWwSopj73cBkkcoEw2kTWoQsul0FtGdvWb7Th66bmLjERyHoUJeXphdwGRZw
	XQxp/3ZgRYQPoSoD5nak9AzsQXOkBY56j9lc9JqXJygjdEKPaZ9p8RvGGn4+43G2qA==
X-Google-Smtp-Source: AGHT+IE47hJYUVRIw40aHtno/K/0cTLRn4I0ZohEQssYwO53eUKkNEhRbgQ9c7FhGdzfzb/59D/Umg==
X-Received: by 2002:a17:903:32cd:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22e5ea451d7mr59756785ad.17.1746639556911;
        Wed, 07 May 2025 10:39:16 -0700 (PDT)
Received: from localhost.localdomain ([49.207.193.52])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22e15232797sm97751415ad.240.2025.05.07.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:39:16 -0700 (PDT)
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	jk@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 v2 3/3] net: mctp: usb: Port for kernel 6.6
Date: Wed,  7 May 2025 23:08:06 +0530
Message-Id: <20250507173806.5371-4-santosh.puranik.ibm@gmail.com>
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

From: Santosh Puranik <spuranik@nvidia.com>

Fix the way the mctp usb binding driver records netdev stats.

Signed-off-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>
---
 drivers/net/mctp/mctp-usb.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/mctp/mctp-usb.c b/drivers/net/mctp/mctp-usb.c
index e8d4b01c3f34..c398aa45e40d 100644
--- a/drivers/net/mctp/mctp-usb.c
+++ b/drivers/net/mctp/mctp-usb.c
@@ -48,16 +48,17 @@ static void mctp_usb_out_complete(struct urb *urb)
 	case -ECONNRESET:
 	case -ESHUTDOWN:
 	case -EPROTO:
-		dev_dstats_tx_dropped(netdev);
+		netdev->stats.tx_dropped++;
 		break;
 	case 0:
-		dev_dstats_tx_add(netdev, skb->len);
+		netdev->stats.tx_packets++;
+		netdev->stats.tx_bytes += skb->len;
 		netif_wake_queue(netdev);
 		consume_skb(skb);
 		return;
 	default:
 		netdev_dbg(netdev, "unexpected tx urb status: %d\n", status);
-		dev_dstats_tx_dropped(netdev);
+		netdev->stats.tx_dropped++;
 	}
 
 	kfree_skb(skb);
@@ -105,7 +106,7 @@ static netdev_tx_t mctp_usb_start_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 err_drop:
-	dev_dstats_tx_dropped(dev);
+	dev->stats.tx_dropped++;
 	kfree_skb(skb);
 	return NETDEV_TX_OK;
 }
@@ -223,7 +224,8 @@ static void mctp_usb_in_complete(struct urb *urb)
 			skb_trim(skb, pkt_len);
 		}
 
-		dev_dstats_rx_add(netdev, skb->len);
+		netdev->stats.rx_packets++;
+		netdev->stats.rx_bytes += skb->len;
 
 		skb->protocol = htons(ETH_P_MCTP);
 		skb_reset_network_header(skb);
@@ -295,7 +297,6 @@ static void mctp_usb_netdev_setup(struct net_device *dev)
 	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
 	dev->flags = IFF_NOARP;
 	dev->netdev_ops = &mctp_usb_netdev_ops;
-	dev->pcpu_stat_type = NETDEV_PCPU_STAT_DSTATS;
 }
 
 static int mctp_usb_probe(struct usb_interface *intf,
-- 
2.39.5


