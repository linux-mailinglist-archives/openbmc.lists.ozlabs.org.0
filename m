Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5431D3165
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:35:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NCGD0brvzDqFY
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:35:16 +1000 (AEST)
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
 header.s=fm2 header.b=nVy6PBcy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=sEInYzO4; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NC5509sKzDqS3
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:27:20 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B5D55C01C5;
 Thu, 14 May 2020 09:27:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 14 May 2020 09:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=gBQGQerZp2JLDMsds7mUV4wXxX
 FtKvfl5nmQF37yR1Y=; b=nVy6PBcykz2IjhzOJDV37qM0jBzoafYNKu1m0iEmN7
 d0ZfXag5zA8heY3xIU0i9EXKiIFS7FXilwsmyDTfhPqpVgd3h8N0VmLeYz4kwX2X
 v58rIPqoQge4ZEBnsrRcQ3ksil9QOkQu6CBVi72m67cp5J7ZIY6Xd2qcw6erV7ca
 HS5MFx+zEGiRgZxhk5EGHI8KurKtMNSITjuP3qN6+XR2s0JblCa9pIpcjIm30h4o
 fgJcXIax59BNXB1bFDui1S6q3FUeJG7iM6lm8piE5dgT6gWbw3xphuM9AKGnr7sD
 QsGHd4mxNlefGEZNbwUwpBpnJM0/Fi6pQWkmOpZKQdWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gBQGQerZp2JLDMsds
 7mUV4wXxXFtKvfl5nmQF37yR1Y=; b=sEInYzO4MJXoSeBjRqITX7WrW902q602Z
 swAEswqqzTsUDvmHjYY3/PIL7uVxUe0vJsolayVvZfX/9MKiYTl2ZDX8z6F6aM9A
 B7otQbjKdsTGdDbsOGXVdrH2XKYCNyAgcG6nqwZ+AUlljn4COdTb0diacIeI/g3O
 K7vPbQuVPurL5SkqGkSn5ajU4oQazgTu8KMirUZ/UzwR8/qzLaEn6F0OkbYrJPuB
 ArkPZHo0eoNQcgsHj7kT30UC1Sg/qL3imVXITVvA+h7ahhVyPwbq7itZQmgR2bNC
 bVKX2qJU+m+Y2fn9oWF6kw2/5AXOaQG4NsqyESE+dnTt5UZ/TK7eQ==
X-ME-Sender: <xms:MUe9XqGa2ARuiBtWYXrFHNyYL8oFD3cSZkeLFb6JvWtIBbSmohwleA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucfkphepudegrddvrdelhedrfedunecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjh
 drihgurdgruh
X-ME-Proxy: <xmx:MUe9XrWYiB2SzHuv1gvV5M9w2ICsvB13QvjN_baTsr91RbwC3BL5eQ>
 <xmx:MUe9XkL7lwCGIdMRODIn4qkemJ2NCBOmub9W7EvryQpeisahCy_G4w>
 <xmx:MUe9XkGzLu7NNqSjVAq18M3nDx_bPgsixanp3uLB5Oh1dUDVDvaEPw>
 <xmx:Mke9XohYiwzSQOsV8kqgDN_osgqmwbZ_aTquRKbx2s_jJLOJDsR2IQ>
Received: from localhost.localdomain
 (ppp14-2-95-31.adl-apt-pir-bras31.tpg.internode.on.net [14.2.95.31])
 by mail.messagingengine.com (Postfix) with ESMTPA id 082653060EE4;
 Thu, 14 May 2020 09:27:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [RFC PATCH linux dev-5.4 0/4] Enable kprobes on AST2500 and later
Date: Thu, 14 May 2020 22:56:59 +0930
Message-Id: <20200514132703.448317-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
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

Hello,

kprobes are pretty handy, so turn them on. I'm expecting opinions, especially
with the first and last and middle patches, so the series is RFC.

Please opine!

Andrew

Andrew Jeffery (4):
  ARM: configs: aspeed-g5: Disable netfilter
  ARM: configs: aspeed-g5: Enable modules
  ARM: configs: aspeed-g5: Enable kprobes
  ARM: configs: aspeed-g5: Set CONFIG_FORTIFY_SOURCE=n to appease
    kprobes

 arch/arm/configs/aspeed_g5_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1

