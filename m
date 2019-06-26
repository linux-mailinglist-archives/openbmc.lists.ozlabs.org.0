Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C456335
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 09:22:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YZGn1lhRzDqNm
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:22:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EII53qjc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OqGgN44J"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YZ7n1LCNzDqW5;
 Wed, 26 Jun 2019 17:16:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F1741C43;
 Wed, 26 Jun 2019 03:16:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 26 Jun 2019 03:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=pMNNPoQe+cIMw
 sr4Ftl9UjYzpm9TC5xQDxPLRq/8iWw=; b=EII53qjcSoRmTCoxy6HJ8mpMYyOdU
 Ux/7cDyNYEm7mZnHJ3VEFKB67RbgNZRo/xNnkSQCm7IWRvxbwUZyS026w/ohyfFK
 CWhTZjp23bJrFk/H2dNeb1dSUM+3DRlQjT2kQxkSXk6UUsqtpDxsXCv3MlALK7Oa
 hdN+z/8jjWHjElnqCZwkKUujlYaSJWRvCPTWJWKHmXuc0cjqD0JvsksurGyPzSbA
 q1WS2siaCVCqyRyiBij5qpxR0//LrIr0JhojWYdZ38xYGBhpbtxentTCylya1/ui
 7m3Dxam45kt1Ryx6ATFBvwJI9wI86svlEKn+XmU0A1Jon0IJtiqg3Nwew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=pMNNPoQe+cIMwsr4Ftl9UjYzpm9TC5xQDxPLRq/8iWw=; b=OqGgN44J
 wdcFVvWoTKGnXcMHxXvp4ZmIlKzc7FrtD7LhPxkqdQJr/XZZXQZJ2IcuaLQ3vvA1
 h3+0o0G0FTRKOrNq1dKJJ56dbyeFXJpJoaD0sKtmZ7jhCHreMQLQmMGZH0yGKFFM
 uM0J48B0VnbQREVESjMjPhFFfs38VUQsUdwfewHszd4k9P0SrouBOHyibjXEcfHf
 qOAVmyJ9srnUTrcoA9kseww2nnrkJ/nm7qr+BysMpCTdLMNKgLpkL2Pk2jPAQviH
 LmjwKlcJBkT4BqcffjHV044iyATmar5nuscQ7PgNBLaKeeBTn6DgmG6rHQ+CkAho
 dBtU1wFQW/CKRQ==
X-ME-Sender: <xms:shsTXWjurTNokRIg06YfKTJu7OmYb1r62pzxrj4TmgQ2TQytzMTVfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedu
X-ME-Proxy: <xmx:shsTXbTnRN7c9pqULVlUcbujM_08ygLDhgGNxQ773PkLXquA4EgEYQ>
 <xmx:shsTXZFMHf9STnAX_TBspcp3o86TJ1LHHun_00MhaLlXEuOojaqdmg>
 <xmx:shsTXTnp7lSNMxhXTZMJ_5eMR3DqRWwJLweIRiSmBCYpKQTPRQCuCw>
 <xmx:shsTXWwSG7xu4OG-kOhNcWrvJBIc-agPSgp0X-h1AhtIMpJ5tlzlFw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8DCA380083;
 Wed, 26 Jun 2019 03:15:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 5/8] pinctrl: aspeed: Correct comment that is no longer true
Date: Wed, 26 Jun 2019 16:44:27 +0930
Message-Id: <20190626071430.28556-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
References: <20190626071430.28556-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We have handled the GFX register case for quite some time now.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
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

