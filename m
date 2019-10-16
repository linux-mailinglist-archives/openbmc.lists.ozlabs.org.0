Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44DDA1E9
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 01:06:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tnwT2VtRzDqXY
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:06:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EEDEGV5t"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PIUdm87e"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tnvX1mP1zDr4t
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:05:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 389B31445;
 Wed, 16 Oct 2019 19:05:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=KFGPxEpzKOmec8bwWbTzrZXtLT
 9B4Tk3vMVzEDNMgac=; b=EEDEGV5tP2Ks7GFkKfVyellhv7wsmcbBjt9xaZiEBc
 sya0Fc60UxKn3ORYyKTvA8qBjM452894PCzQYq5aZ4wxMDf1gS2J3+CKhyUYcAYa
 nByLIlewD6lDC3g9YIKVDNtopmIyURHcXGGMwowKCI6Ik0VFC7iNZiHKcsq3Z3DX
 I40FoJpmb8vlfoHJEA4DetGapueiCy5u0Sb9Krq2s6P9KNpUDo7Ji7upnAM5yk3o
 W7M7+TZuGqcekGnLQ+OduZ4b9ZQIzIXjCTnVK0HVHjtL7CVOXJBURcaWH/q2/aK9
 XBd4DxTpm2TTNOqRo1tK1LNjgXRMuvNRzVNNIOq1Y/Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KFGPxEpzKOmec8bwW
 bTzrZXtLT9B4Tk3vMVzEDNMgac=; b=PIUdm87edd/v2BUWWMhRg3/cTz+GajqiP
 tqffa5tO8NhNvf0hdovNsFRWqKiKQ5xbDjXTzNpjIhWey1bPRbL5RtiA7p1Q9WWM
 xCWOY50Jw7BcYOHDYIuBLxU1ZFSR3J/LJZ5BRRmO3tTEX9+ilxZSsDsu+g0dYRu2
 5v5dgv8n4VMBb3FsNgX8k5mrJghFoDpq8BdHP+1ZhPftldV5M6LDj2rQt2zUizov
 TDiBekpyPWFhSRw2a2a4hXkYP9C7cURt4Tx+GaAsKMS2twmcGsYnjU5h09hcRY0O
 AvbPm+GIPP2/bp2WCHQL7ndTiWqFI5JlVMSFVFW5wrAj2UimjbM6g==
X-ME-Sender: <xms:MqKnXQXjKccLHYy5Cnnvaz3HrzcJXX8zMH2LWRxmHeVzqG2t6sY_dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:MqKnXb1039RVY_F3eaPAbkDvhtg0Wc6s6ylDIQS9avqCuutwsfyTag>
 <xmx:MqKnXfTJwhrxucRQu7GRqZ7j_iDRL8STyPr148y55Smw_YkaitB7jQ>
 <xmx:MqKnXfS8u0p_iHDvJVgyPEU51eP_XOXrbMxqpQiDLo6krLsT2RpaNA>
 <xmx:M6KnXYidF9Qk22D-nkf7vfC4r7nQyygBrtJYfQgQWb83J_C094FdPg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACCD1D6005D;
 Wed, 16 Oct 2019 19:05:21 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3] soc: aspeed: Fail probe of lpc-ctrl if reserved
 memory is not aligned
Date: Thu, 17 Oct 2019 09:36:10 +1030
Message-Id: <20191016230610.29462-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Alignment is a hardware constraint of the LPC2AHB bridge, and misaligned
reserved memory will present as corrupted data.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 12e4421dee37..5bad6a33ca43 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -241,6 +241,18 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 
 		lpc_ctrl->mem_size = resource_size(&resm);
 		lpc_ctrl->mem_base = resm.start;
+
+		if (hweight32(lpc_ctrl->mem_size) != 1) {
+			dev_err(dev, "Reserved memory size must be a power of 2, got %zu\n",
+			       lpc_ctrl->mem_size);
+			return -EINVAL;
+		}
+
+		if (lpc_ctrl->mem_base & (lpc_ctrl->mem_size - 1)) {
+			dev_err(dev, "Reserved memory must be naturally aligned for size %zu\n",
+			       lpc_ctrl->mem_size);
+			return -EINVAL;
+		}
 	}
 
 	lpc_ctrl->regmap = syscon_node_to_regmap(
-- 
2.20.1

