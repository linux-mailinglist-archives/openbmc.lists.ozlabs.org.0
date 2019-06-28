Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D6591BC
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 04:52:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZhC068jzzDqn4
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 12:52:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JSrUAZ8l"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nhPowcNo"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zgvw5MPlzDqRG;
 Fri, 28 Jun 2019 12:39:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 074DF2DE9;
 Thu, 27 Jun 2019 22:39:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Jun 2019 22:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=dkailpDyj7vUI
 txB8Vs9sL40BUOIyxRITgSOEfzO07k=; b=JSrUAZ8lW608Xlb0i4jxGz5M0lCm6
 hL3hy88SEw8o3eHtB42JUfTUOOJfQQurqCeN/B2wV2hOUofHMRrdGXkND6UBUDSs
 NUUGtpMwYtuBiQa9jRT1VvdAabNU2unU2bMxObJUOpYOnHM3KXL3xi4sz5+V4Klb
 XYsKHf9ZAvH42k1S3KcoLSI44HaDFUsxMo3oXsfw/DiV7NtYA0+7REe6LVL7P2Ya
 rYpYYARf6joLvi71TdUyNUN1IRVfTHG7JLKSUFWgt3po65+17zVCCh7haS/4Qc2G
 4C2dYcV1EyY6Z/k0e+7ziX4hhftFPdMQWxSZlt5SXtGaWpWa5iwjT+0Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=dkailpDyj7vUItxB8Vs9sL40BUOIyxRITgSOEfzO07k=; b=nhPowcNo
 yBqX1mv2xtH4kEyeJXoNbiL4OwHRGKlKefjuMTSd+JUy1jGKtah6ramJOjBDKaQB
 s8qxgJOSnyE7DIPO5EMKutnUfa3SaQlCqZkZHdLMh7+fDMzU7Wbt4leT0pApxPJO
 Ucgl0C/lF5+lpuMx9q1d7qJnSMaC0FE3d1yJXljAfnmdLJ5Ib8bVAsUuaEPnkPYm
 cSy+3TkHkwLQ6K11PH5hwhVAENULTPzKgGt/d7PmjhfoNGpyUCj9HSFeHwpWRGeO
 Q9dDRAgvshC/akiT6AxitkgyChhy30dOUW2Gc5OfQ661gkAjVaYv6J233KVd2KnU
 zmCD4II2U9sd2A==
X-ME-Sender: <xms:6H0VXQqJ6glKWOVBBKDwGN1xIFb-aPx1esmLo-Pcwb01sd5pf7fz4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:6H0VXY5ZAfAOBaWzGw6NJ8MEYE9-tZTB3lkJFLX1gS1x0R1HwGWAOw>
 <xmx:6H0VXXeRNAVbiXnpwDwYBmKf7IkoDHFdQuizoywqeETG8gFJMDq_uA>
 <xmx:6H0VXd5Hdkx54YTCoiecEXw3xlxVSael4fdUF20lQg-tW3fqABb9IA>
 <xmx:6H0VXX7j7mtJMBAOZA6IE_9AhNUN5wxC1L4JOiKvHxFJEoBkQxoScw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id C946D380074;
 Thu, 27 Jun 2019 22:39:32 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/8] pinctrl: aspeed: Correct comment that is no longer true
Date: Fri, 28 Jun 2019 12:08:35 +0930
Message-Id: <20190628023838.15426-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
References: <20190628023838.15426-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Johnny Huang <johnny_huang@aspeedtech.com>, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We have handled the GFX register case for quite some time now.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4b06ddbc6aec..c5918c4a087c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -240,8 +240,7 @@
  * opposed to naming them e.g. PINMUX_CTRL_[0-9]). Further, signal expressions
  * reference registers beyond those dedicated to pinmux, such as the system
  * reset control and MAC clock configuration registers. The AST2500 goes a step
- * further and references registers in the graphics IP block, but that isn't
- * handled yet.
+ * further and references registers in the graphics IP block.
  */
 #define SCU2C           0x2C /* Misc. Control Register */
 #define SCU3C           0x3C /* System Reset Control/Status Register */
-- 
2.20.1

