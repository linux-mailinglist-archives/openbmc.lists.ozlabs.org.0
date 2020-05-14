Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C73201D314C
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:30:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NC8H25Q3zDqpr
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:30:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=oxTAMJID; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GEFBTBgV; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NC5505wCzDqRk
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:27:20 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DC01A5C0180;
 Thu, 14 May 2020 09:27:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 14 May 2020 09:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Itxo1vUdRZvzD
 5dRzggCEgCiOXOW2NWvJuKQ7OJbuqM=; b=oxTAMJIDGpDJbWOUb5ksedh0ZYTCo
 2IFV7QsfjpH/i/02oSisij215dexv5FusuDPvvCEC1FfT9Dx5fX4y0gp8pwhuab3
 j6hS1kwe1Zs3JbpTHcCjx8FKIs3ICyzo9NgUGnGeoWQQ7EpmViPEZrTcrSKLWRcO
 X8H5QF47WQvkivr/rcKbWXOBokJjCQOL9lA4ybNy1bTBAH/K3LSh7tbT6zfCOeXV
 2Svb1lVDwvq50ekH04jz3IqRuZaUGO47CJuetPiw/VOkjzd7joRAd7s5ml3psNY7
 lCxgeFYkEJgAWlCuIIbbuKY+C/ETIZxG1uL3HXPAoxt8I54tiL+EdZIlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Itxo1vUdRZvzD5dRzggCEgCiOXOW2NWvJuKQ7OJbuqM=; b=GEFBTBgV
 1g4gc9zmCWC5WmPngEAQMr3dXSYWV6Iq3CRu5Y85XHtRGed/FgG/2U7RDTcJ1sfT
 nq9eTss2eKmUG1zuLBoAv7xssJ9SZnsYET485EEoPfl+bUHiqOPjuIc17Y/6Ob5F
 BCUktzoM6IkZJ63g0grSBc+An85SAKvmtSTlGjNJifzzsL6Hcimr+oCgv9UBwXHg
 6IYLKxTY2lF5Lgthn8eYBvZLagY67bXAqVoTJb9q68YNbPmAkfBKO9Unc/pP6ERb
 jFS6y9+QSPOnlJp6FsqNEOQrEFvSZ75kkYhAyYkh6RkOYDjQ1zPwoKD/0jBeIsAA
 v3uErXd0kACMIA==
X-ME-Sender: <xms:Mke9XpzjpPPE5v0z453QtPQN6hIFBQ1EbYu6Iypgnb9oqTD4o_5p-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdelhedrfedunecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:Mke9XpQteUWAVXfqZAkhzPyLPmwnv0Ejgtiev1Vw5tpPN4BD6b4ZEg>
 <xmx:Mke9XjW4W8dZAzPZAwSVhE6Xd1y6MiyBbH0Z3FGY_8lSEv5FWR3Sag>
 <xmx:Mke9Xrh4TFVfeL-LgKzRv9umSTgsLOct63ndYUGbAusNukuxvmj_Og>
 <xmx:Mke9XuOleyf8IaOn3m13M0zEc_yvvJoxdyFy1alOBC7xTHlhsWq9UA>
Received: from localhost.localdomain
 (ppp14-2-95-31.adl-apt-pir-bras31.tpg.internode.on.net [14.2.95.31])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9FC3A30611FB;
 Thu, 14 May 2020 09:27:13 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [RFC PATCH linux dev-5.4 1/4] ARM: configs: aspeed-g5: Disable
 netfilter
Date: Thu, 14 May 2020 22:57:00 +0930
Message-Id: <20200514132703.448317-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514132703.448317-1-andrew@aj.id.au>
References: <20200514132703.448317-1-andrew@aj.id.au>
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

Enabling modules with CONFIG_NETFILTER=y and CONFIG_NETFILTER_ADVANCED=n
results in a diverse set of netfilter functions being built as modules.
These functions were not previously enabled in any way because modules
were disabled, therefore we can't have been using them. Given that we
aren't using them, disable netfilter as well to prevent them from being
built.

CONFIG_NETFILTER=y was introduced in 20c90af9ea6a ("ARM: config: aspeed:
Update defconfig") with little fanfare in the commit message, which
makes me wonder whether it was enabled because we needed it or whether
its addition slipped through the cracks.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index cdf30fbe613e..e124b4ddd442 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -69,8 +69,6 @@ CONFIG_IPV6_ROUTER_PREF=y
 CONFIG_IPV6_ROUTE_INFO=y
 CONFIG_IPV6_OPTIMISTIC_DAD=y
 CONFIG_IPV6_MULTIPLE_TABLES=y
-CONFIG_NETFILTER=y
-# CONFIG_NETFILTER_ADVANCED is not set
 CONFIG_VLAN_8021Q=y
 CONFIG_NET_NCSI=y
 # CONFIG_WIRELESS is not set
-- 
2.25.1

