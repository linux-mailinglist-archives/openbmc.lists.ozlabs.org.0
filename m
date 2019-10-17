Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12CDA597
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 08:27:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tzj54gXJzDr86
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 17:27:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RuWK473X"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Q17rEwdh"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tzfj5WH6zDr9y
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 17:25:01 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B9CF521E29;
 Thu, 17 Oct 2019 02:24:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 17 Oct 2019 02:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=n6M9q3LwfWvob+YP6h+hDhl2EA
 Q8dYTm2WPQZ7Z68E0=; b=RuWK473XeVv27NT6RrVDwl16BtMdTPg5v7X22TUtZ3
 f8Ki7kn4frfZtirG+tYCPdJTGAbbmL0eF7OGqKPIM8Az0+uEUo4Iz3HrCg2dlTzq
 GiHVKvobYH0Z3FMcjoQ/iLPkfpkJPhy8oJGErdRUztIbXnDbJjAAdF3tug30BE2r
 CtMXkRILZhyiWPHLC5ORbgXrURArywmmYRU4RmKmlqnSWijV+CLBcc/8rHW56jJg
 9HqUVcOLSNeIULizyvRhIYQzEL/gHUPF6XAqj0h38YUNjpWGytk5jgW8k0uVvrCy
 02klil/gjDsMj7gQSHDqpI116tRSRmCVUW5jjMLq7pTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=n6M9q3LwfWvob+YP6
 h+hDhl2EAQ8dYTm2WPQZ7Z68E0=; b=Q17rEwdhS79G2t6jlG/pCGX+pAiVd6fh0
 3uoMZf37Rj+2SBQhErl+jMy6WT26d/l+DfOSq/UOvI2VE0D98OkswKnw9SpZReNa
 N0V/ddxq3YlafL3PsJS4oKPCQGsAVSvoiwDxmZv5b6TOttkAJKgz5gWVNcKyFqTE
 0tr6aibR7FZYQlpBiA7abSasfE1EjJ5Sos0/cu56mG//eP2zenruVGZKoff+PRdD
 hywZ7EYDXumCCBInH//j6eMSczVeIMl5wWvlGYiwgoPkfTJ/o13nog2GhJ5bM9ZW
 ss/mxizX5vamcAvF+D+K61R84m1RqsTRt8oWJMJx1z0aovcVB5QxA==
X-ME-Sender: <xms:OAmoXSPOqPL_lES0oJw2T0yYrC_MS7bj5IOunavT_6CNFUSIsuM1Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilh
 hfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OAmoXawRp6ucdH4IN0VFHP5WyW38ZW_XIXUZGMoagZz5nA9LlyYbzA>
 <xmx:OAmoXUsLVnacgMTgYhaYN7mvttJkwRcb0wDvLn6lnTkbnPdoqbqxoA>
 <xmx:OAmoXfG7oUBb0epelA4YLLg3za-aBq1-4VrEbHR8SiQx7nxkYvzOpQ>
 <xmx:OAmoXczalTjWraVgxtgxsJ0CXfO756XavuaLE_pFDrPoS5Pb63g0Xg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 012B2D6005B;
 Thu, 17 Oct 2019 02:24:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: clg@kaod.org
Subject: [PATCH qemu aspeed-4.2] hw/arm/aspeed: Fix STRAP2 configuration for
 Tacoma
Date: Thu, 17 Oct 2019 16:55:44 +1030
Message-Id: <20191017062544.25110-1-andrew@aj.id.au>
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

We were writing the STRAP2 configuration to the STRAP1 property/register

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ad86ef2eccec..807868224c6c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -711,7 +711,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     mc->desc       = "Aspeed AST2600 EVB (Cortex A7)";
     amc->soc_name  = "ast2600-a0";
     amc->hw_strap1 = TACOMA_BMC_HW_STRAP1;
-    amc->hw_strap1 = TACOMA_BMC_HW_STRAP2;
+    amc->hw_strap2 = TACOMA_BMC_HW_STRAP2;
     amc->fmc_model = "mx66l1g45g";
     amc->spi_model = "mx66l1g45g";
     amc->num_cs    = 2;
-- 
2.20.1

