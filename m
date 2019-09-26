Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D7BF451
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:47:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGSQ2fpWzDqnc
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:47:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iJuZhk5I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XLmO53IS"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGC521tgzDqnD
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2AB3F63A;
 Thu, 26 Sep 2019 09:35:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RBdI+kzIqst2g
 iudBspBq4W5hi6wQi6JtxNFqHziboU=; b=iJuZhk5IW6GlK+SgTuNRZsiKLwuvR
 e/U7pKH0PuLlACg3KcS5Pmk8V72T0s0X0Vg9fCKDOC3MD9fo+vM3pRrKYLWvnf9t
 C9Ymz4m0Ykkmgp24O1N+aARmO6GvvlQ/PlQssW2DuVJBlKzVaGmMuUbr1c1rB6ps
 PNbmgS3+CEmxtpOcnRXjjeA4zsYJ9gBk2CcoM+1qXOPWfIDUn0M3ZIsBWfEOq5C2
 dgK+XaHzD+7RuzGSO/t/Nhmoavtim9SYKPhy1Yxec3WmCiB1OzGOwAviQUJuVOF8
 VKaw6TPdJiv4SKt+Fx8fPFqMTOO/VjwnU9evQVbUFFUtvKvRhseV9FxGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=RBdI+kzIqst2giudBspBq4W5hi6wQi6JtxNFqHziboU=; b=XLmO53IS
 OnorYWxZDsOczH4XZBaQ6T36sy/tLURvYEqaW7daOPsH6p2JpAJg/BvLnE8QjDyt
 phDLv/OR3tjWBft36UthgdTom0H90vpCBV7VCzqCsi0KFXmwCSs/8dG1AoBNEvqU
 f+vZAVbR7mLuu9ghu+84MTsrbFU5p35337dDZa0kEaMlzdXwG2dAPK3BKqusxSm1
 Vo09QbaUY2Jb8IF8012v3nmQM4sjTdzP8TYE78RWfc9hlOBSgrEx0BK8al7FQMTz
 wKS0zk9jcnNPUQeTGSY9qTEami/Q6x7hVN5OxFjlWZlsMnlbSLUTPFTA31Oau6MT
 8IYawzbFS5FtJg==
X-ME-Sender: <xms:nr6MXVgVVJoI1EwsXQpF-JjwBdcPO7ZBXyH4vqiMeJHQ6L-0Vbzl4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepvd
X-ME-Proxy: <xmx:nr6MXYgTBH4wvcApvl8LaacwoL04P4WvObGBygOCVwPn_HL_sLvfCQ>
 <xmx:nr6MXdd2nqslfKy9E_LFKAgifb3E7gXCJ99y3UwaZl8zJOyuiidORQ>
 <xmx:nr6MXcHXtNCqeNpboia3cjk03609Jv459skdoMeE7wugYduCTYnebg>
 <xmx:nr6MXUs1JBDm6ZiyPPAO18iq3ceXcS_Du7PqefxINe7KBAYuy3chTA>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1358D6005B;
 Thu, 26 Sep 2019 09:35:24 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 05/15] pinctrl: aspeed-g6: Rename SD3 to EMMC
 and rework pin groups
Date: Thu, 26 Sep 2019 23:05:58 +0930
Message-Id: <20190926133608.30566-6-andrew@aj.id.au>
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

AST2600 EMMC support 3 types DAT bus sizes (1, 4 and 8-bit),
corresponding to 3 groups: EMMCG1, EMMCG4 and EMMCG8

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 72 ++++++++++------------
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |  1 +
 2 files changed, 33 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index dc17cf3d3549..c6800d220920 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1440,74 +1440,72 @@ FUNC_GROUP_DECL(RGMII2, D4, C2, C1, D3, E4, F5, D2, E3, D1, F4, E2, E1);
 FUNC_GROUP_DECL(RMII2, D4, C2, C1, D3, D2, D1, F4, E2, E1);
 
 #define AB4 232
-SIG_EXPR_LIST_DECL_SESG(AB4, SD3CLK, SD3, SIG_DESC_SET(SCU400, 24));
-PIN_DECL_1(AB4, GPIO18D0, SD3CLK);
+SIG_EXPR_LIST_DECL_SEMG(AB4, EMMCCLK, EMMCG1, EMMC, SIG_DESC_SET(SCU400, 24));
+PIN_DECL_1(AB4, GPIO18D0, EMMCCLK);
 
 #define AA4 233
-SIG_EXPR_LIST_DECL_SESG(AA4, SD3CMD, SD3, SIG_DESC_SET(SCU400, 25));
-PIN_DECL_1(AA4, GPIO18D1, SD3CMD);
+SIG_EXPR_LIST_DECL_SEMG(AA4, EMMCCMD, EMMCG1, EMMC, SIG_DESC_SET(SCU400, 25));
+PIN_DECL_1(AA4, GPIO18D1, EMMCCMD);
 
 #define AC4 234
-SIG_EXPR_LIST_DECL_SESG(AC4, SD3DAT0, SD3, SIG_DESC_SET(SCU400, 26));
-PIN_DECL_1(AC4, GPIO18D2, SD3DAT0);
+SIG_EXPR_LIST_DECL_SEMG(AC4, EMMCDAT0, EMMCG1, EMMC, SIG_DESC_SET(SCU400, 26));
+PIN_DECL_1(AC4, GPIO18D2, EMMCDAT0);
 
 #define AA5 235
-SIG_EXPR_LIST_DECL_SESG(AA5, SD3DAT1, SD3, SIG_DESC_SET(SCU400, 27));
-PIN_DECL_1(AA5, GPIO18D3, SD3DAT1);
+SIG_EXPR_LIST_DECL_SEMG(AA5, EMMCDAT1, EMMCG4, EMMC, SIG_DESC_SET(SCU400, 27));
+PIN_DECL_1(AA5, GPIO18D3, EMMCDAT1);
 
 #define Y5 236
-SIG_EXPR_LIST_DECL_SESG(Y5, SD3DAT2, SD3, SIG_DESC_SET(SCU400, 28));
-PIN_DECL_1(Y5, GPIO18D4, SD3DAT2);
+SIG_EXPR_LIST_DECL_SEMG(Y5, EMMCDAT2, EMMCG4, EMMC, SIG_DESC_SET(SCU400, 28));
+PIN_DECL_1(Y5, GPIO18D4, EMMCDAT2);
 
 #define AB5 237
-SIG_EXPR_LIST_DECL_SESG(AB5, SD3DAT3, SD3, SIG_DESC_SET(SCU400, 29));
-PIN_DECL_1(AB5, GPIO18D5, SD3DAT3);
+SIG_EXPR_LIST_DECL_SEMG(AB5, EMMCDAT3, EMMCG4, EMMC, SIG_DESC_SET(SCU400, 29));
+PIN_DECL_1(AB5, GPIO18D5, EMMCDAT3);
 
 #define AB6 238
-SIG_EXPR_LIST_DECL_SESG(AB6, SD3CD, SD3, SIG_DESC_SET(SCU400, 30));
-PIN_DECL_1(AB6, GPIO18D6, SD3CD);
+SIG_EXPR_LIST_DECL_SEMG(AB6, EMMCCD, EMMCG1, EMMC, SIG_DESC_SET(SCU400, 30));
+PIN_DECL_1(AB6, GPIO18D6, EMMCCD);
 
 #define AC5 239
-SIG_EXPR_LIST_DECL_SESG(AC5, SD3WP, SD3, SIG_DESC_SET(SCU400, 31));
-PIN_DECL_1(AC5, GPIO18D7, SD3WP);
+SIG_EXPR_LIST_DECL_SEMG(AC5, EMMCWP, EMMCG1, EMMC, SIG_DESC_SET(SCU400, 31));
+PIN_DECL_1(AC5, GPIO18D7, EMMCWP);
 
-FUNC_GROUP_DECL(SD3, AB4, AA4, AC4, AA5, Y5, AB5, AB6, AC5);
+GROUP_DECL(EMMCG1, AB4, AA4, AC4, AB6, AC5);
+GROUP_DECL(EMMCG4, AB4, AA4, AC4, AA5, Y5, AB5, AB6, AC5);
 
 #define Y1 240
 SIG_EXPR_LIST_DECL_SEMG(Y1, FWSPIDCS, FWSPID, FWSPID, SIG_DESC_SET(SCU500, 3));
 SIG_EXPR_LIST_DECL_SESG(Y1, VBCS, VB, SIG_DESC_SET(SCU500, 5));
-SIG_EXPR_LIST_DECL_SESG(Y1, SD3DAT4, SD3DAT4, SIG_DESC_SET(SCU404, 0));
-PIN_DECL_3(Y1, GPIO18E0, FWSPIDCS, VBCS, SD3DAT4);
-FUNC_GROUP_DECL(SD3DAT4, Y1);
+SIG_EXPR_LIST_DECL_SEMG(Y1, EMMCDAT4, EMMCG8, EMMC, SIG_DESC_SET(SCU404, 0));
+PIN_DECL_3(Y1, GPIO18E0, FWSPIDCS, VBCS, EMMCDAT4);
 
 #define Y2 241
 SIG_EXPR_LIST_DECL_SEMG(Y2, FWSPIDCK, FWSPID, FWSPID, SIG_DESC_SET(SCU500, 3));
 SIG_EXPR_LIST_DECL_SESG(Y2, VBCK, VB, SIG_DESC_SET(SCU500, 5));
-SIG_EXPR_LIST_DECL_SESG(Y2, SD3DAT5, SD3DAT5, SIG_DESC_SET(SCU404, 1));
-PIN_DECL_3(Y2, GPIO18E1, FWSPIDCK, VBCK, SD3DAT5);
-FUNC_GROUP_DECL(SD3DAT5, Y2);
+SIG_EXPR_LIST_DECL_SEMG(Y2, EMMCDAT5, EMMCG8, EMMC, SIG_DESC_SET(SCU404, 1));
+PIN_DECL_3(Y2, GPIO18E1, FWSPIDCK, VBCK, EMMCDAT5);
 
 #define Y3 242
 SIG_EXPR_LIST_DECL_SEMG(Y3, FWSPIDMOSI, FWSPID, FWSPID,
 			SIG_DESC_SET(SCU500, 3));
 SIG_EXPR_LIST_DECL_SESG(Y3, VBMOSI, VB, SIG_DESC_SET(SCU500, 5));
-SIG_EXPR_LIST_DECL_SESG(Y3, SD3DAT6, SD3DAT6, SIG_DESC_SET(SCU404, 2));
-PIN_DECL_3(Y3, GPIO18E2, FWSPIDMOSI, VBMOSI, SD3DAT6);
-FUNC_GROUP_DECL(SD3DAT6, Y3);
+SIG_EXPR_LIST_DECL_SEMG(Y3, EMMCDAT6, EMMCG8, EMMC, SIG_DESC_SET(SCU404, 2));
+PIN_DECL_3(Y3, GPIO18E2, FWSPIDMOSI, VBMOSI, EMMCDAT6);
 
 #define Y4 243
 SIG_EXPR_LIST_DECL_SEMG(Y4, FWSPIDMISO, FWSPID, FWSPID,
 			SIG_DESC_SET(SCU500, 3));
 SIG_EXPR_LIST_DECL_SESG(Y4, VBMISO, VB, SIG_DESC_SET(SCU500, 5));
-SIG_EXPR_LIST_DECL_SESG(Y4, SD3DAT7, SD3DAT7, SIG_DESC_SET(SCU404, 3));
-PIN_DECL_3(Y4, GPIO18E3, FWSPIDMISO, VBMISO, SD3DAT7);
-FUNC_GROUP_DECL(SD3DAT7, Y4);
+SIG_EXPR_LIST_DECL_SEMG(Y4, EMMCDAT7, EMMCG8, EMMC, SIG_DESC_SET(SCU404, 3));
+PIN_DECL_3(Y4, GPIO18E3, FWSPIDMISO, VBMISO, EMMCDAT7);
 
 GROUP_DECL(FWSPID, Y1, Y2, Y3, Y4);
 GROUP_DECL(FWQSPID, Y1, Y2, Y3, Y4, AE12, AF12);
+GROUP_DECL(EMMCG8, AB4, AA4, AC4, AA5, Y5, AB5, AB6, AC5, Y1, Y2, Y3, Y4);
 FUNC_DECL_2(FWSPID, FWSPID, FWQSPID);
 FUNC_GROUP_DECL(VB, Y1, Y2, Y3, Y4);
-
+FUNC_DECL_3(EMMC, EMMCG1, EMMCG4, EMMCG8);
 /*
  * FIXME: Confirm bits and priorities are the right way around for the
  * following 4 pins
@@ -1968,11 +1966,9 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(SALT9G1),
 	ASPEED_PINCTRL_GROUP(SD1),
 	ASPEED_PINCTRL_GROUP(SD2),
-	ASPEED_PINCTRL_GROUP(SD3),
-	ASPEED_PINCTRL_GROUP(SD3DAT4),
-	ASPEED_PINCTRL_GROUP(SD3DAT5),
-	ASPEED_PINCTRL_GROUP(SD3DAT6),
-	ASPEED_PINCTRL_GROUP(SD3DAT7),
+	ASPEED_PINCTRL_GROUP(EMMCG1),
+	ASPEED_PINCTRL_GROUP(EMMCG4),
+	ASPEED_PINCTRL_GROUP(EMMCG8),
 	ASPEED_PINCTRL_GROUP(SGPM1),
 	ASPEED_PINCTRL_GROUP(SGPS1),
 	ASPEED_PINCTRL_GROUP(SIOONCTRL),
@@ -2051,6 +2047,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(ADC8),
 	ASPEED_PINCTRL_FUNC(ADC9),
 	ASPEED_PINCTRL_FUNC(BMCINT),
+	ASPEED_PINCTRL_FUNC(EMMC),
 	ASPEED_PINCTRL_FUNC(ESPI),
 	ASPEED_PINCTRL_FUNC(ESPIALT),
 	ASPEED_PINCTRL_FUNC(FSI1),
@@ -2183,11 +2180,6 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(SALT9),
 	ASPEED_PINCTRL_FUNC(SD1),
 	ASPEED_PINCTRL_FUNC(SD2),
-	ASPEED_PINCTRL_FUNC(SD3),
-	ASPEED_PINCTRL_FUNC(SD3DAT4),
-	ASPEED_PINCTRL_FUNC(SD3DAT5),
-	ASPEED_PINCTRL_FUNC(SD3DAT6),
-	ASPEED_PINCTRL_FUNC(SD3DAT7),
 	ASPEED_PINCTRL_FUNC(SGPM1),
 	ASPEED_PINCTRL_FUNC(SGPS1),
 	ASPEED_PINCTRL_FUNC(SIOONCTRL),
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index a2c0d52e4f7b..08c70ea5b582 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -738,6 +738,7 @@ struct aspeed_pin_desc {
 	static const char *FUNC_SYM(func)[] = { __VA_ARGS__ }
 
 #define FUNC_DECL_2(func, one, two) FUNC_DECL_(func, #one, #two)
+#define FUNC_DECL_3(func, one, two, three) FUNC_DECL_(func, #one, #two, #three)
 
 #define FUNC_GROUP_DECL(func, ...) \
 	GROUP_DECL(func, __VA_ARGS__); \
-- 
2.20.1

