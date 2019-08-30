Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9270A3353
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 11:03:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYRV5V5yzDqtn
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 19:03:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JkbP/Lse"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Z/sxAgZi"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYQn4HF5zDqB5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 19:02:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 218A121C7D;
 Fri, 30 Aug 2019 05:02:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 05:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=YfOg6kVFIxpytB8V2lWuqBjFpG
 J3tyADqfZr0OoUVzw=; b=JkbP/LseMrHG5PW3n0Agrw8nb0d9uueY13qlov1T8C
 ZPV9Uu+7dU/8f7dOoW/vuV+Spco5mJun9GypANZTa5IM3H1isw0PZc10d4WANsGT
 hjoURgshUxPFQBJgAjQCV+3/qXD4OCTIhy8Q9UWuW0ZwosBUVD7w7Z8k+x0Q4hxJ
 Bs54+9QRTLdXSgWZh4GgHzpCHRHOZuSdmjaQKiuwXSWFlznzkWvE+9Z8rsFbOyBC
 K/Vht316rPd4xiIgUx0LJuwZuulvCY6aYreEapy5q06EmigPhJltMJsCoARzdFqr
 ebhV1qkTtyKBS1E3hhXrSPqtFZcuaa9XbuDJ+eK5cSSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YfOg6kVFIxpytB8V2
 lWuqBjFpGJ3tyADqfZr0OoUVzw=; b=Z/sxAgZiXbo9U0yFM5cb2pVKjPaq4RyYH
 fSLquQjh0baELrBs/PqOsWDOOAbzpV3z2aNGOYKkbkET/jmZUPn2wusYwRkoJHb8
 yl+6xB76HzyOwEBU1i6k2YSIET3o03tEo4JxGSPnQY4UvSFY5R9kxgh9UxD0sz/Q
 CezRaQ/a1XvTap6BThCKXE5RD1cCmqYf69N9Wk9x9OqzA/01f/9iAzpBdqPJG7pp
 xffn4k9OsMi5JQMIHxG1NyUTm/tPfniYS/3EtjGQLzoTp4T69vgSQSDzYXYVJmkh
 60wCHtOdvvyB2ODt6nUXPLcWfrkGHHbBaEFrkMMHpmZos2AkgvTFw==
X-ME-Sender: <xms:LuZoXZBSImUPsI4CY1EoDiJg6qSc9ItFdti0meUQXW1x4pknT-KhjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtfedrhe
 ejrddvudehrddujeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:LuZoXX9O9_35ahkvBjpXZqT7QQWncVj23y4ZNP_qRlc9pJU9w8akqg>
 <xmx:LuZoXaDJpKa59j1-iNb2FKsIPkzmIRJaikRDwsv4BNb5sk4heqt79Q>
 <xmx:LuZoXRvwB7cjA2WS-nEKbJXyojP2LHOZTqlBi7DogX6ZaCkvh54-_A>
 <xmx:L-ZoXdrd6EHKGr0-zgvXnWpQN2STbNz3HxvCepyu3nVnc6YBBltXNQ>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7ADA4D60063;
 Fri, 30 Aug 2019 05:02:36 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/5] mmc: sdhci-of-aspeed: Fixes for AST2600 eMMC
Date: Fri, 30 Aug 2019 18:32:39 +0930
Message-Id: <20190830090244.13566-1-andrew@aj.id.au>
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

