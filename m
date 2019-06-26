Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DDC5633C
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 09:23:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YZHz75VpzDqZQ
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:23:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jS6RELUF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="t8TMror0"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YZ7s0P61zDqXS;
 Wed, 26 Jun 2019 17:16:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BE8CD1BF1;
 Wed, 26 Jun 2019 03:16:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 26 Jun 2019 03:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=sPAC0J8p45pKU
 IB1y6CiuAxrWpJQyOXW/mBGynYgVGo=; b=jS6RELUF8TCzRMu17+SPj9n1b41sJ
 QokyV+t3NTZ9ClJmuKx0pjL6cqJKTvWbOhO0Be25AzkZD1lEGSuBTTWEHRWl5nDE
 9L40m6+fuh2t845SBkcQKcAmMWvmfnZfoRsclfkSWKxQ+uo6BMJHDXbJpvAb8jRC
 +8RKoyzAb4habhgwt3RpnFFtfzwaRpsoo2GcqajxPTWHwj3CL0LWAvm3HJVqPle4
 qNAXNyiZM824YBWjT8fEa6cOXVdT/kL6r2VMLJlTLfb0VUUtW3DsaSdHekg1uOLN
 jQ09zwZ0sEcQWezJYR060JUOwFWG/DQYbSp4aqXI8+4wJ5emRfuGJXyPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=sPAC0J8p45pKUIB1y6CiuAxrWpJQyOXW/mBGynYgVGo=; b=t8TMror0
 MPgbGjfekJoOyYvbaClZHHC+SIb9IkdsMw18NjLOyETWY3gG2syVjyoOTvh/lB0A
 OEaCm8T8/3MlbMWXcUS6BwY3rld8XbTUWLl0YncyKp6UzwDzN2AhyyL5V7CbeqNK
 BtjQUt+2EBI22iP+WIXqJfoJGMyHB5YECfJsP9/iqnIV55EPaADqDkRABJLq/tMa
 NHTE3zfcpKP7GWJr7vyGwXyblezTigqlcT+g2augAB2zeWqk0mCmSHDhzaWfmdRW
 m99Bs1CpaoL2Py/Bdz4em9WtrOSOtvvjyfVLivY8Rk53nW09D7FQ3/zcs30SSXYL
 2IJv5XG/Cu4ORA==
X-ME-Sender: <xms:thsTXQ2yBSqrxwI-NsK3aKv1468aASSeUtDEw9ixOnP1eDRa8h8ueA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 peef
X-ME-Proxy: <xmx:thsTXRifKna8wrjp_t4AM3Es96LpdH4g3QMUIWKEl09Q4ivtlaEudA>
 <xmx:thsTXWYBRN_MJihtVW-SptsH7ZaMl_L8e_nXmj2LpeyvUxBhQFTQmw>
 <xmx:thsTXSNK-GUf8JpuCej_RHncPuEQ_EqwIKBkGkU5ODAg0pEjy-xwuQ>
 <xmx:thsTXQ-BUGlDhmOd80plI751UFHPNUERccd8wFF590q7ighhN_BkOQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id DED11380083;
 Wed, 26 Jun 2019 03:16:02 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 6/8] pinctrl: aspeed: Clarify comment about strapping W1C
Date: Wed, 26 Jun 2019 16:44:28 +0930
Message-Id: <20190626071430.28556-7-andrew@aj.id.au>
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

Writes of 1 to SCU7C clear set bits in SCU70, the hardware strapping
register. The information was correct if you squinted while reading, but
hopefully switching the order of the registers as listed conveys it
better.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 4c775b8ffdc4..b510bb475851 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -209,7 +209,7 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
 			continue;
 
-		/* On AST2500, Set bits in SCU7C are cleared from SCU70 */
+		/* On AST2500, Set bits in SCU70 are cleared from SCU7C */
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
 			unsigned int rev_id;
 
-- 
2.20.1

