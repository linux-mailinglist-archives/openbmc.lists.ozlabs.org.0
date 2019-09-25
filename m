Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8E4BE170
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:36:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dhxZ0cT6zDqcn
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:36:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VWw7qJdM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="f/6BAoRa"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhtl34DzzDqZT
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:23 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DD53438E;
 Wed, 25 Sep 2019 11:34:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Pm0kXIjD5EnSX
 CMvxmhv05EI+M+VF9thTQPnyey0/W0=; b=VWw7qJdMUXxHWOzh5qR5OFab2p4H3
 Rb+JQ9MA5Drss07gZ+Dl83luohxvx4OMnZtSVya0aqluTZHcHWFyMZMIq/dYYz/Q
 /606BobdHdhFBx/CKHSEeREBdEt3oUA1BAx0eQyDGehI1gfxCNPGhJVOX95j6pIZ
 56bvqQgSS0OA/dZ7l+6uLrDGqCTd+sVGZkD22u6SyYhBgdqrs4t1vZ846NmJhuuc
 QYK3prX+DrudLhRh003VkpgHmENw+c/Pg3Jn85Z7tXt+kXt+z6F3t9h1ch91qHIx
 0nCxuZibB1exali4yz2CTRloQh/flK7Y8zq7986jaHhNbx13PVuLEeUtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Pm0kXIjD5EnSXCMvxmhv05EI+M+VF9thTQPnyey0/W0=; b=f/6BAoRa
 Yc4PzGv9FPcSX2mJ1m10sxJBIt5mR3QvGIfqwsMJ4GW3XT3hA3KzUwn20zbdLi0M
 /UXjr81gD2f//fJLK9lrrwbpUxSt+y3et6nNfJ0VUdDxIGzfvCpooaSHaVxiB7dq
 NuqU1/xEWx/YFK2Jmbdm9pHjoJN9s3D/UR5VMjuYUcyoCLM11xStMkbG84ItJPup
 /9m/AsMd0Hy65zAOESOPxCc7mbrx6hMcboPXf1vZvNuhaRSMXLR4YhQ9bESlFHvI
 lYTBHlLjl2SXOcAVJzpP89YZyg8mFg92W+H3rJaWkgi+WD14/I41jpCZG+cerOtY
 xVsxDQYmVHEYqw==
X-ME-Sender: <xms:_IiLXXUkpg5kTzPPyxUgDj87RfcQ3DO5X436NuDsXjiYofXxmFNxLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:_IiLXbi5hwxgT0Am1MwavIp_R9z8r1lxMyP8_fuXhJV43TcAhKWD8g>
 <xmx:_IiLXWeA1qkEKQstglrrOUYNfqtrnqasiWKnc_zZbUfwEDJ6Ha8WhQ>
 <xmx:_IiLXdvldOjBbg5krNRpCeANPD-lNIXvRMqxhzsz8Ws7Ky32SBpvYg>
 <xmx:_IiLXZ5b1HJK3A7Im0IYKHOCvM4IW2qXXHxdi8Mo2N5xBEVTd_2ddw>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A8E5D60057;
 Wed, 25 Sep 2019 11:34:18 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 2/8] dt-bindings: clock: Add AST2600 RMII
 RCLK gate definitions
Date: Thu, 26 Sep 2019 01:04:33 +0930
Message-Id: <20190925153439.27475-3-andrew@aj.id.au>
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

The AST2600 has an explicit gate for the RMII RCLK for each of the four
MACs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 include/dt-bindings/clock/ast2600-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 38074a5f7296..ac567fc84a87 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -84,6 +84,11 @@
 #define ASPEED_CLK_MAC34		65
 #define ASPEED_CLK_USBPHY_40M		66
 
+#define ASPEED_CLK_GATE_MAC1RCLK	67
+#define ASPEED_CLK_GATE_MAC2RCLK	68
+#define ASPEED_CLK_GATE_MAC3RCLK	69
+#define ASPEED_CLK_GATE_MAC4RCLK	70
+
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
-- 
2.20.1

