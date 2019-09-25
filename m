Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3564EBE173
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:37:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dhyh5865zDqc6
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:37:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mcPKxxTw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="P1oDu7qq"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhtl0yYXzDqZ9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D9BED4E1;
 Wed, 25 Sep 2019 11:34:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=FwWI9/MDx5th9
 3BPylor5pCFZ4biSV3bwPlyQ31srtU=; b=mcPKxxTwOYV5utFFrBNH0s1pN1E7p
 XVf0lj0XHb9AfE95esmUWh99dexv6C01uq6Q1ctmIpreuEe+5gKYpDSDib85Xjy4
 MVAOVlJ1NvPm4v0FPyTM+1nKZSIKJC7iCr5WVb12Ven6Jj+ra4JGsk4NKFeX+jQO
 dHrDl9C/ltFzSoynaZZ1ThSeQC4mDsTfJibdcS3fGkBeMZlbg5wmbpqUyTUN0NTW
 /jTIGXkb1msPYTnaE/sUP/VRbhU6Rv14GOVduzuJTW+wm3X2fRy+9rMbzqIcGWSw
 50FIcd7w86qYkW0oWAky6aHgp3AvZv38D+3nVwSAEL/C9SY9JbuWWhrIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FwWI9/MDx5th93BPylor5pCFZ4biSV3bwPlyQ31srtU=; b=P1oDu7qq
 Sf7rh/dHvkrpDHTi0bVw82EVb2M3rIIiHAMoPzO5wpNT7xOPZCjZbvxcgWNvZF6y
 64BwhQW+bAVdOPXaysSGrF/AVTbBOEE8iXh9/xowdu77as1b8Rfqzjo91MVwHzr9
 xU+i1NbkyiEcgAehytyb3RljZeaQmDNHIAFoYVvonmeFogNbYLvcfF9cNDuD8lnk
 TfMZySMVXYv679JGBrHnHPbsOYMrgrS7R3JkFT+fox2yOZ+JL4wZS/exzLw3tKPe
 GuCFmPWUR+mjLm00gHejKtFu83R4+HhBTYC+9w6ZMVY4PYNzEVazW2Vy4B5S2RIj
 AsnEr5+oT4h5eQ==
X-ME-Sender: <xms:-oiLXfjb1ZS58kXEiMLY-McWfElegUaFiwm2S0HuiC207DM1uumyfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:-oiLXVlwHbjMcGsBE03rKFtCFDkEUe76cH7gBq3d41-VB96qJWNPYQ>
 <xmx:-oiLXaiuEXUYoYDd-RA1KXDb6N9q5ZZLK02d3kqT1X3NYzHDue3oUQ>
 <xmx:-oiLXa-Os209EXfsEoEDqeGPMkRrNlsz4sz5rH_Sg4ITmL9suc9w8A>
 <xmx:-oiLXeGrlvG0BDyXK4f4NLbQxCBn4woBvyk2qrYCVAG3U3PHgl0Bkg>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9EF5D60063;
 Wed, 25 Sep 2019 11:34:16 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 1/8] dt-bindings: clock: Add AST2500 RMII
 RCLK definitions
Date: Thu, 26 Sep 2019 01:04:32 +0930
Message-Id: <20190925153439.27475-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190925153439.27475-1-andrew@aj.id.au>
References: <20190925153439.27475-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2500 has an explicit gate for the RMII RCLK for each of the two
MACs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 include/dt-bindings/clock/aspeed-clock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index f43738607d77..64e245fb113f 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -39,6 +39,8 @@
 #define ASPEED_CLK_BCLK			33
 #define ASPEED_CLK_MPLL			34
 #define ASPEED_CLK_24M			35
+#define ASPEED_CLK_GATE_MAC1RCLK	36
+#define ASPEED_CLK_GATE_MAC2RCLK	37
 
 #define ASPEED_RESET_XDMA		0
 #define ASPEED_RESET_MCTP		1
-- 
2.20.1

