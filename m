Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2008F591C0
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 04:53:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZhD33sVzzDqZP
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 12:53:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZFUpCXQy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TcvD6wq/"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zgw11LsTzDq7c;
 Fri, 28 Jun 2019 12:39:45 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7E9093483;
 Thu, 27 Jun 2019 22:39:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Jun 2019 22:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ADqhvifrknPuz
 OYzjNxXRssrypRVqiE51aZTMCvODu0=; b=ZFUpCXQy6B8uj0ca88kY34wx9NsTW
 nUjr5VFG7dhZvf8CVFBWzSbgULrOcaxoe9sNPrLvUaj+oL3FhA06vVh5xgVPsG8K
 2j4bbWRrw3sheZhasI/Nw5SaE5C58EESA13xOH5kbckMjZIbSs8d50Tkoe5DMFjT
 GlVs7J1IgpNS6nWgcpVCz6EMZkLGatXOD/mjn4Pqzverr4M+aVDD63hs/SOwxeEV
 gdI7TTIuf4TEDXNdiJ3EdfRe/caTjxuRlT2lXEpnevJJ1IF5XgE/bDtgdJtjC0dM
 kIFhPUQOcC/3oHliOUQ2658UQwORvn33ROO/qzypdW3bMwgCvetbg5r/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ADqhvifrknPuzOYzjNxXRssrypRVqiE51aZTMCvODu0=; b=TcvD6wq/
 aS2ba3+jDjzka/vzn1IAo8Td4r8TE0/t1pxAaI4c5PRB6DYCbyNwz3cXMpGglyWB
 iz3OLf+Pd/LmyRKVkPL5Ib9Vs6expRxAJEArw7gWTuLoMiE+lJPwn6K4OpudHOoH
 FykfS3L496SpeQ4dyeNqOIUob3cTOln2H75YU2p5/BGgcf0FkL0r3qb/RBWojZlV
 Ie6aaPzonmsl3ViqvAvn90SeFDigpr75qT67pBCX9QcGMPX6NIfdQE4IAxwF9Iui
 +gSw43orPBJndzNTohgMwaLIxQ1dd62Q3+sZl2t0XM2P58/olpFkF07NwdtV1R/2
 lzfTh3/QlwJbfQ==
X-ME-Sender: <xms:7X0VXYAGuohFMY5g3ytuF5SFQ4MMGGRbnKTqdYf1i2QIuRM01KcW9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:7X0VXcAt3aDT5XckrP3KkgvKfFd_FWCrgfgZTrQE_bOcgmFaGA1jiw>
 <xmx:7X0VXQJaVibh-beRUVk9rE9lsd826w2OsNjrZTTj8YJRbn5Znjqmrw>
 <xmx:7X0VXeTIa0G12SlZ49phXbBfGYUIwwm2w7JGMwYymGl8eDO8c6An8A>
 <xmx:7X0VXcJxIYy1E3Lqkxq9a_-_8O7rFr5daoopP9pglOX2jGdulDzVxA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F15A380074;
 Thu, 27 Jun 2019 22:39:37 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 6/8] pinctrl: aspeed: Clarify comment about strapping W1C
Date: Fri, 28 Jun 2019 12:08:36 +0930
Message-Id: <20190628023838.15426-7-andrew@aj.id.au>
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

Writes of 1 to SCU7C clear set bits in SCU70, the hardware strapping
register. The information was correct if you squinted while reading, but
hopefully switching the order of the registers as listed conveys it
better.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
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

