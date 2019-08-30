Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E1A3347
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 10:58:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYL10w7GzDr2j
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 18:58:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JCTmQVcf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GMzKbBxR"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYHB2JXYzDqxB
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 18:56:04 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 165DD22077;
 Fri, 30 Aug 2019 04:56:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 04:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=YfOg6kVFIxpytB8V2lWuqBjFpG
 J3tyADqfZr0OoUVzw=; b=JCTmQVcf+BVnSidizgsvxAtdnisg4F4XQAEoQWdBUu
 5D5FqBBas/2l9RWqkgPEPuDhQhLvZcTOC+gBznvTct0PXWnNOE/mLabZ7XVnUeqt
 DjxJq6/OSlrGfXfTIcSyGqeqg2yKRCUsTYSitKwztE5shDRb8yic+9Q7maVm6WYh
 YJG2U9Qi0lo1Zs8woejOreMMRNC0PrXUYgBRcyDVMfYKR7fn7JHKrBNgT31Lsu5I
 HeD0X3ubWUvkNI2Rnzyi1l8PEjLIzx7Z0VEL6Ru25+P2tqMAreDznjJFRRcSj/ky
 cZM8DTDEFrkvV9ibR54YtXB1MFhzzTwFT347VDgUq3sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YfOg6kVFIxpytB8V2
 lWuqBjFpGJ3tyADqfZr0OoUVzw=; b=GMzKbBxRsMDMmSTmpNmdEMwl3boJ1yfB/
 /EpNP4/czanIZEfhZnoGq86nS+vZffduapysVln6CTtKTJ+XYNf/JsiBRED+TOvF
 7Q3hr7dXvLnkTGXW7aCfPusaswW2jscgJ/4Suojl2m37xy0ptZ6jINZzMKhfI5Az
 9Htou2lwzpI3qsCH9vpeXbxo405BrXWb4ZjsE6wcnU/uBb/1TMiVwWSb4L2lrqk8
 9PD1dj9CZLvTVDThCVcfVqGWSxCeoZD+S5DaFtybezXD1nLbrDPhS3aTg+TIZlIr
 n1EPl78idf7AjhxtREOc82m93VKz/4GH1PbkxCUhsDpmxtRY3Qgug==
X-ME-Sender: <xms:oORoXf5JXd-tJognjJpEFURTmm3jYd4sTSBTbZkQRapX20pqCnmGQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtfedrhe
 ejrddvudehrddujeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:oORoXToaPrm5Of_sCAL8tVb-BVWw9-bG-xR8LC5ol6TajWqNiAykEw>
 <xmx:oORoXbA9-Xp8Rcrr1fbPlSmcBrKDLGnSwvSu4XBa5F2MF2Hpi4nWVQ>
 <xmx:oORoXcNYrZx7taIUp0omm9NXjL43hfatq6Yn_1n3M-hErx-2vZgDCQ>
 <xmx:oeRoXe-ii3vVNoMhkXIjxEYdSUhyVpf7vb_YQ547jmAWnTSEZXyNjA>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id A4D1680062;
 Fri, 30 Aug 2019 04:55:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/5] mmc: sdhci-of-aspeed: Fixes for AST2600 eMMC
Date: Fri, 30 Aug 2019 18:26:27 +0930
Message-Id: <20190830085632.12928-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series enables the eMMC onboard the AST2600 EVB. There's currently a
limitation of running it at 52MHz, I'm still investigating that. Reads and
writes are both functional.

The two critical patches (3/5 and 4/5) are on the linux-mmc list and can be
found here:

https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=128207&state=%2A&archive=both

Cheers,

Andrew

Andrew Jeffery (4):
  mmc: sdhci-of-aspeed: Drop redundant assignment to host->clock
  mmc: sdhci-of-aspeed: Uphold clocks-on post-condition of set_clock()
  mmc: sdhci-of-aspeed: Allow max-frequency limitation of SDCLK
  ARM: dts: ast2600-evb: eMMC configuration

Wei Yongjun (1):
  mmc: sdhci-of-aspeed: Fix return value check in aspeed_sdc_probe()

 arch/arm/boot/dts/aspeed-ast2600-evb.dts |  8 ++++++-
 arch/arm/boot/dts/aspeed-g6.dtsi         |  4 ++--
 drivers/mmc/host/sdhci-of-aspeed.c       | 28 ++++++++++++++++--------
 3 files changed, 28 insertions(+), 12 deletions(-)

-- 
2.20.1

