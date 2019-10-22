Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A85AEDFCDB
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 06:50:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y1KX0X5pzDqL2
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 15:50:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ep2lcBj8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="yP0DHf1I"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y1FG3zntzDqKb
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 15:46:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 217132129D;
 Tue, 22 Oct 2019 00:46:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 22 Oct 2019 00:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Q3ZRWiSWiGd5x
 lMU37lgLgWXxCCauNJkSs71OkCYV8s=; b=Ep2lcBj8yAIm3MJzjYLF9iORK4xuI
 B7nOVoezgTimxHFhK8KDhJn05U2KTZyK7bPdQIF9ilfEkSFo6GjZ2SUM/mUyYvdX
 lSgufpkoLFgeSNYpDUc/jPVPkirxsMVoYSM3+m2CXl+XSEPD3jAah1QPbzVYdyBb
 nbQUfVmlsO4immAgaktU0Fsj55N82Ocr/av0DezUQ/AbW85t9enjwKl3S/3PmYP+
 qC+DMBMBRJuyOZPs0u41p3g5SOHUICsPfKuXRl88B4bwo+lfVe18H4Vpl/3Ril1w
 9BrEGqdGgOwDe4CcGD/r4YXaGrm9552U22ssriS2PGTos6bGoHzYpR+mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Q3ZRWiSWiGd5xlMU37lgLgWXxCCauNJkSs71OkCYV8s=; b=yP0DHf1I
 JN2lzsEuvxWKprT8AcvkfaXgLvG8BZOgRPwapbRihIKSDKHT/5zqlJdOPfOhZE9T
 q0+xJngA3/k3cVCiE9/YmvJgiiWHYND2HEh2xfdY943XXqxGobrvXtf7biwvMGkh
 inSl2oaqqV+iTwiBjSXcUApYIFfjsVOhGs5KgvRn5NxEH8HCj8u9bQuC9nrw7bTz
 RvvhhM4pGD3OJFG4i+UxWyEn3t83+2H59fzSMeYw14zpYfemn1V+dKqEewe9SNlW
 ZymCt07TXuz9JnxVCbS+wgRVan1zaHi3THqmY8KxHGFp/DRdLxMBxHYC8FKJUOnz
 /nJQb4thTIbhcA==
X-ME-Sender: <xms:wImuXbJkBQJ_858sFlAUE8sMMn9Fr2Dx_3zuRCfhcZq_t62pNlL8ZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeeigdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrvdeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:wImuXZhQUtlN2Oftp3t3fmDMTDMT97eNiqlEnvZZMIJMctZ0rgp-3Q>
 <xmx:wImuXUccFt5GJioq0M6uqzPjrtwB-TaUDBBZbuXGpyeOODSWfcgXgA>
 <xmx:wImuXR7n3_q7A79e5V4y7hVIA-gMHQAiVlbTLCRIRRerrJUnxU5E7g>
 <xmx:wImuXaV1Zy5bVyd5qjmFJc0Loo4r0HGCpq12nzYfNYLKNCpu5f2CrA>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id DAB1A80060;
 Tue, 22 Oct 2019 00:46:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 2/4] pinctrl: aspeed-g6: Fix LPC/eSPI mux
 configuration
Date: Tue, 22 Oct 2019 15:47:35 +1100
Message-Id: <20191022044737.15103-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022044737.15103-1-andrew@aj.id.au>
References: <20191022044737.15103-1-andrew@aj.id.au>
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

Early revisions of the AST2600 datasheet are conflicted about the state
of the LPC/eSPI strapping bit (SCU510[6]). Conversations with ASPEED
determined that the reference pinmux configuration tables were in error
and the SCU documentation contained the correct configuration. Update
the driver to reflect the state described in the SCU documentation.

Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 56 ++++++++++------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index eb0c11a9fbf2..fb96e8d2e6c8 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1098,61 +1098,53 @@ SSSF_PIN_DECL(AD15, GPIOV6, LPCPME, SIG_DESC_SET(SCU434, 14));
 SSSF_PIN_DECL(AF15, GPIOV7, LPCSMI, SIG_DESC_SET(SCU434, 15));
 
 #define AB7 176
-SIG_EXPR_LIST_DECL_SESG(AB7, LAD0, LPC, SIG_DESC_SET(SCU434, 16),
-			  SIG_DESC_CLEAR(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AB7, ESPID0, ESPI, SIG_DESC_SET(SCU434, 16),
-			  SIG_DESC_SET(SCU510, 6));
+SIG_EXPR_LIST_DECL_SESG(AB7, LAD0, LPC, SIG_DESC_SET(SCU510, 6),
+			SIG_DESC_SET(SCU434, 16));
+SIG_EXPR_LIST_DECL_SESG(AB7, ESPID0, ESPI, SIG_DESC_SET(SCU434, 16));
 PIN_DECL_2(AB7, GPIOW0, LAD0, ESPID0);
 
 #define AB8 177
-SIG_EXPR_LIST_DECL_SESG(AB8, LAD1, LPC, SIG_DESC_SET(SCU434, 17),
-			  SIG_DESC_CLEAR(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AB8, ESPID1, ESPI, SIG_DESC_SET(SCU434, 17),
-			  SIG_DESC_SET(SCU510, 6));
+SIG_EXPR_LIST_DECL_SESG(AB8, LAD1, LPC, SIG_DESC_SET(SCU510, 6),
+			SIG_DESC_SET(SCU434, 17));
+SIG_EXPR_LIST_DECL_SESG(AB8, ESPID1, ESPI, SIG_DESC_SET(SCU434, 17));
 PIN_DECL_2(AB8, GPIOW1, LAD1, ESPID1);
 
 #define AC8 178
-SIG_EXPR_LIST_DECL_SESG(AC8, LAD2, LPC, SIG_DESC_SET(SCU434, 18),
-			  SIG_DESC_CLEAR(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AC8, ESPID2, ESPI, SIG_DESC_SET(SCU434, 18),
-			  SIG_DESC_SET(SCU510, 6));
+SIG_EXPR_LIST_DECL_SESG(AC8, LAD2, LPC, SIG_DESC_SET(SCU510, 6),
+			SIG_DESC_SET(SCU434, 18));
+SIG_EXPR_LIST_DECL_SESG(AC8, ESPID2, ESPI, SIG_DESC_SET(SCU434, 18));
 PIN_DECL_2(AC8, GPIOW2, LAD2, ESPID2);
 
 #define AC7 179
-SIG_EXPR_LIST_DECL_SESG(AC7, LAD3, LPC, SIG_DESC_SET(SCU434, 19),
-			  SIG_DESC_CLEAR(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AC7, ESPID3, ESPI, SIG_DESC_SET(SCU434, 19),
-			  SIG_DESC_SET(SCU510, 6));
+SIG_EXPR_LIST_DECL_SESG(AC7, LAD3, LPC, SIG_DESC_SET(SCU510, 6),
+			SIG_DESC_SET(SCU434, 19));
+SIG_EXPR_LIST_DECL_SESG(AC7, ESPID3, ESPI, SIG_DESC_SET(SCU434, 19));
 PIN_DECL_2(AC7, GPIOW3, LAD3, ESPID3);
 
 #define AE7 180
-SIG_EXPR_LIST_DECL_SESG(AE7, LCLK, LPC, SIG_DESC_SET(SCU434, 20),
-			  SIG_DESC_CLEAR(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AE7, ESPICK, ESPI, SIG_DESC_SET(SCU434, 20),
-			  SIG_DESC_SET(SCU510, 6));
+SIG_EXPR_LIST_DECL_SESG(AE7, LCLK, LPC, SIG_DESC_SET(SCU510, 6),
+			SIG_DESC_SET(SCU434, 20));
+SIG_EXPR_LIST_DECL_SESG(AE7, ESPICK, ESPI, SIG_DESC_SET(SCU434, 20));
 PIN_DECL_2(AE7, GPIOW4, LCLK, ESPICK);
 
 #define AF7 181
-SIG_EXPR_LIST_DECL_SESG(AF7, LFRAME, LPC, SIG_DESC_SET(SCU434, 21),
-			  SIG_DESC_CLEAR(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AF7, ESPICS, ESPI, SIG_DESC_SET(SCU434, 21),
-			  SIG_DESC_SET(SCU510, 6));
+SIG_EXPR_LIST_DECL_SESG(AF7, LFRAME, LPC, SIG_DESC_SET(SCU510, 6),
+			SIG_DESC_SET(SCU434, 21));
+SIG_EXPR_LIST_DECL_SESG(AF7, ESPICS, ESPI, SIG_DESC_SET(SCU434, 21));
 PIN_DECL_2(AF7, GPIOW5, LFRAME, ESPICS);
 
 #define AD7 182
-SIG_EXPR_LIST_DECL_SESG(AD7, LSIRQ, LSIRQ, SIG_DESC_SET(SCU434, 22),
-			  SIG_DESC_CLEAR(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AD7, ESPIALT, ESPIALT, SIG_DESC_SET(SCU434, 22),
-			  SIG_DESC_SET(SCU510, 6));
+SIG_EXPR_LIST_DECL_SESG(AD7, LSIRQ, LSIRQ, SIG_DESC_SET(SCU510, 6),
+			SIG_DESC_SET(SCU434, 22));
+SIG_EXPR_LIST_DECL_SESG(AD7, ESPIALT, ESPIALT, SIG_DESC_SET(SCU434, 22));
 PIN_DECL_2(AD7, GPIOW6, LSIRQ, ESPIALT);
 FUNC_GROUP_DECL(LSIRQ, AD7);
 FUNC_GROUP_DECL(ESPIALT, AD7);
 
 #define AD8 183
-SIG_EXPR_LIST_DECL_SESG(AD8, LPCRST, LPC, SIG_DESC_SET(SCU434, 23),
-			  SIG_DESC_CLEAR(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AD8, ESPIRST, ESPI, SIG_DESC_SET(SCU434, 23),
-			  SIG_DESC_SET(SCU510, 6));
+SIG_EXPR_LIST_DECL_SESG(AD8, LPCRST, LPC, SIG_DESC_SET(SCU510, 6),
+			SIG_DESC_SET(SCU434, 23));
+SIG_EXPR_LIST_DECL_SESG(AD8, ESPIRST, ESPI, SIG_DESC_SET(SCU434, 23));
 PIN_DECL_2(AD8, GPIOW7, LPCRST, ESPIRST);
 
 FUNC_GROUP_DECL(LPC, AB7, AB8, AC8, AC7, AE7, AF7, AD8);
-- 
2.20.1

