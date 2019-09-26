Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62694BF44C
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:44:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGPY4wvwzDqrj
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:44:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RPGIcDH/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="L8tC6zZg"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGC36wp9zDqjJ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BC35D711;
 Thu, 26 Sep 2019 09:35:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=6hssqGUbuRnXj
 EXMbVei0lRN/XBIUiHchoXZBhfOj50=; b=RPGIcDH/7wlzvlbF4TrPR/wmcWFdc
 O5Nj1JJOiRBpJg/uSoD8dIMcdzAF6RyEAwvd7lAeJ4VwfxKh6hGwFP4ijwSPs476
 MDUsvcbDMTWXhc0QEarniFrGEbMVscFpI8R9nKcR/JCrluEll7nQQumGmVkIqrV8
 J1BXa8bMeLRKufRuywOLkXgva1S32g/V5zjkAjf44Vzwr7SwNXSK8o7xe2zFlVyK
 t7eycbGHILZvkpB/JLRfanm9Uo3PWvFcLT5Mtkyctutp56ocQmp/6EUuREOMoWmb
 544j4sxl3wQoFmZr+fjFDMIZd2ff7lq6PLUcVFPW6BaBaV5GIvlLkEUng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=6hssqGUbuRnXjEXMbVei0lRN/XBIUiHchoXZBhfOj50=; b=L8tC6zZg
 fdjJ58wdbf+ExrVKvEXJVezUm2jErup0GOZcJx903Yms4T/bHCQnQglSKMBfW+bN
 jOItTJMmM47GDerRQBJrAJjh1bp79SzpfQySG4B0bqOGwdhL15QeqrqVcYf0aTR+
 oRCUrZCrHKYaJ7OrOUlEztzF33Bb180wGEfkbYs5Ol6VpahZDbbLFqHAlvXxZ2Wc
 UdPkhMhv7BNeOH2/Wxs7NQ8loyeebKu1B2dAsSeuitx5xYK2vPu4uZvPlBR3FnI2
 EDimoAZ4FDBBCy3OC9Ja17TIAwa+0qEubFpSutnGD5P5Sr0QVb4aARY038Fkq8Sl
 BkMoh2cYjQUhAw==
X-ME-Sender: <xms:nL6MXaBt-pkxV9RKlvsGiCbtuh6DwyAYPWzMMWeAalBsi6UwPvoWDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepvd
X-ME-Proxy: <xmx:nL6MXS9qYTGEVpoy5H_MWqj0l9e71--cvNPuZiSk9ylFX1daz4U1tA>
 <xmx:nL6MXQX76U0WgRInWID7bz6J7cxta9a8LHUeVc2ACeweM0BzTRDdWQ>
 <xmx:nL6MXdkkOXpElih8f7kd7wYi1AZW3MY9qj-Pv3Xq-RGRZJasROl7aQ>
 <xmx:nL6MXcQg3wBjtEQS7c172jklC_-Jev1FrVvPEysvM6r7CVilW3jRUA>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 931DED6005E;
 Thu, 26 Sep 2019 09:35:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 04/15] pinctrl: aspeed-g6: Fix UART13 group
 pinmux
Date: Thu, 26 Sep 2019 23:05:57 +0930
Message-Id: <20190926133608.30566-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926133608.30566-1-andrew@aj.id.au>
References: <20190926133608.30566-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, johnny_huang@aspeedtech.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Johnny Huang <johnny_huang@aspeedtech.com>

When UART13G1 be set, pinmux settings in SCU4B8 should be clear.

Fixes: 58dc52ad00a0 ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
[AJ: Tweak commit message]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 68b066594461..dc17cf3d3549 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1262,13 +1262,13 @@ GROUP_DECL(SPI1, AB11, AC11, AA11);
 #define AD11 206
 SIG_EXPR_LIST_DECL_SEMG(AD11, SPI1DQ2, QSPI1, SPI1, SIG_DESC_SET(SCU438, 14));
 SIG_EXPR_LIST_DECL_SEMG(AD11, TXD13, UART13G1, UART13,
-			SIG_DESC_SET(SCU438, 14));
+			SIG_DESC_CLEAR(SCU4B8, 2), SIG_DESC_SET(SCU4D8, 14));
 PIN_DECL_2(AD11, GPIOZ6, SPI1DQ2, TXD13);
 
 #define AF10 207
 SIG_EXPR_LIST_DECL_SEMG(AF10, SPI1DQ3, QSPI1, SPI1, SIG_DESC_SET(SCU438, 15));
 SIG_EXPR_LIST_DECL_SEMG(AF10, RXD13, UART13G1, UART13,
-			SIG_DESC_SET(SCU438, 15));
+			SIG_DESC_CLEAR(SCU4B8, 3), SIG_DESC_SET(SCU4D8, 15));
 PIN_DECL_2(AF10, GPIOZ7, SPI1DQ3, RXD13);
 
 GROUP_DECL(QSPI1, AB11, AC11, AA11, AD11, AF10);
-- 
2.20.1

