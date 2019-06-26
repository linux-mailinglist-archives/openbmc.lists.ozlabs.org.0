Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0356314
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 09:20:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YZDp3TQ3zDqXR
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:20:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lNDZe0Ow"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="puLWPAjq"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YZ7j0G9qzDqWh;
 Wed, 26 Jun 2019 17:16:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7E04E1C22;
 Wed, 26 Jun 2019 03:15:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 26 Jun 2019 03:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=fWlD1uewNsuOv
 vJeyP+mMa6JLokQU6xzkQsW9nl9tuI=; b=lNDZe0OwrWhjUfAq+Ykf7egxE5PT+
 TlpMZA8Aqdm9GKfmbzNSHzFTLTqiVth6hkZInumC9IlQvLXrRrLRRh/Nhmy2I2Oh
 huZJy0QqifGtdjxtqD3DwAg+g4FX95lbpaSewrK7PzdPUYqL/oPHEE2Eh2ZGfcHh
 DlEcUYWm6Agp/5fhcS+p5mgkBwGnXArZZwMtgD4MZuaS0AF4UDD9bh6szqY3WRBR
 nAw3MHI8xYWqL7z7eVpn5FpiwCIHrKzXT6T+4EMtkyZFy+oWciefDbJmMJsLPoF4
 B7D7d/qlqFLLT/if/Ja5aaNIPj7opctGOicwctW59RkcXYHZDRMBr++YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=fWlD1uewNsuOvvJeyP+mMa6JLokQU6xzkQsW9nl9tuI=; b=puLWPAjq
 whxH/c7QidyFvKjgWRqCymc6vEDpiIa/O0wlvq32w+ldyywucvsmSIJJ1JgNNkxa
 VxsubG6LyhdPmq7RttIWL3pPJT/IBCAF8ZYbaPcw8TVBEG4wKCV/fkzuskhOg4HE
 0cW7eE8wFvA7QXeVkEEsoU1LZ6MtbkWVEPbxYWUBuzt+ah6Dfc4Ey1LU8j9C62vx
 fElrkRFsEZzQJeBDULfIE27y7zLAKabz4F7yIeWBC/H1a7giGl7u5sB9L9vOsRzh
 xGVxNUmF4FkvO4Y2q6hKvkamFUihRcB1o1KlhLRnEkikoBk8pWMPp8OQ6dh5sR8z
 GC+1YP3iDF1hfw==
X-ME-Sender: <xms:rhsTXWlP9ws_PPZRzyZx3jZQVpTxB6KyWfzOBAM3H8MP0NYYodpJdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedu
X-ME-Proxy: <xmx:rhsTXea8AUim3q9k60F2hy0ukk1inKBD5-vkK0e7z1dtpVOUvq3qoQ>
 <xmx:rhsTXV0gWSQ-XQyewoq0qSiXREhxFsnm6gkfUEnHub6LDw4V2gglIg>
 <xmx:rhsTXURq--Q-jb9A_GChcDNgbzCXGK7AgsCwSSqBU7pyudU9rftbvg>
 <xmx:rhsTXe1FVeEOkH_6ZkGh_RmuGM_dxyrquAVFKMSeErk5f_NxzwBhoQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CDFB380076;
 Wed, 26 Jun 2019 03:15:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 4/8] MAINTAINERS: Add entry for ASPEED pinctrl drivers
Date: Wed, 26 Jun 2019 16:44:26 +0930
Message-Id: <20190626071430.28556-5-andrew@aj.id.au>
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

Add myself as maintainer to avoid burdening others with the madness.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6954776a37e..978383f5c1ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2586,6 +2586,15 @@ S:	Maintained
 F:	Documentation/hwmon/asc7621.rst
 F:	drivers/hwmon/asc7621.c
 
+ASPEED PINCTRL DRIVERS
+M:	Andrew Jeffery <andrew@aj.id.au>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/pinctrl/aspeed/
+F:	Documentation/devicetree/bindings/pinctrl/aspeed,*
+
 ASPEED VIDEO ENGINE DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org
-- 
2.20.1

