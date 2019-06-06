Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D036B29
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 06:51:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KCtL4163zDqf8
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 14:51:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="ZOo591oj"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Se/oG8Uk"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KCrh0dCLzDqf1
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 14:50:11 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A38F221F9;
 Thu,  6 Jun 2019 00:50:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 06 Jun 2019 00:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=fm3; bh=rggHtVpvlfGA6
 LiTFSty0yqBLsB4HLGqaSfF+ldeDX0=; b=ZOo591ojGjX+BYPIi5LmTJjJK1ZG4
 agYqKu2KZFWsv1aFRQRgignGihKREKBUlPIZmKSKXhYOSVfZlfH/V//lXrYrScNb
 qIZmMBaeGxFnxcFIqFQ+fGW5M38aaCuQWLYRb5Fn9f5BZS9zGjER8003Pu/506RC
 f5wOUPzv20ILQb1xkmfi54VxuHhqG06e9NQBkNdINCIedngMHmkSPT7J6/FyFHoh
 dNEH4k514o8d0BmlcmuI/Z2GutzEHGsSageGZe1KtJk2suXt3H+SC7ZXDWT74vbt
 XN0uDtIZCrqRpGk1WY1Pji6lskhDvgfXgkaStJ5nd0FKH6Y3Sc+LZ1sLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rggHtVpvlfGA6LiTF
 Sty0yqBLsB4HLGqaSfF+ldeDX0=; b=Se/oG8UkRMph0UoSvw+GoBdMrr8W32WTm
 5sa1O1NHO8PuFmlQgQ47XZw+wlF4W6+JxL8QX6Pkzgw70lru32qjra154UHfHaRM
 nhlovJM3S7S4Zuv3OfqGpfouLlQ9SgLZ9m2brqKIRnO+RvOeKen5tYxBHRymslGJ
 O5gr4NroWxTQdNOEEZ0O+NoA/5cwfShymkg85960G5ZCYRuxDO7GfsKsRg/JAqgK
 e4P13CCe+rA/MNInkSuZXvcWPVmGIONRmzyb+KjJ6mH8XR31XC5UjV0ycrCEmI8h
 qft9BI7Xk0RER7BH31UVbmUGnKYpQldE5K4TCAUpDqpvap3WLWmdA==
X-ME-Sender: <xms:f5v4XJZBjEf6b4P8MiMEz-FJ4mPYh1hZ5ZFyF8JVbj8rIuPUv-ejgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegfedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgrmhes
 mhgvnhguohiirghjohhnrghsrdgtohhmqeenucffohhmrghinhepohiilhgrsghsrdhorh
 hgnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghilhhfrhhomhep
 shgrmhesmhgvnhguohiirghjohhnrghsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:f5v4XOX4JVp8goq9ZXUtOdA3xt0w5P9hqBzEiqEtue5HUj3rthBGxw>
 <xmx:f5v4XOT4VYBTV3aMBISldlyx1OQYK5agla2lt1HLvY2H6Rjr-hqwJg>
 <xmx:f5v4XMMrK1XTnZAPqSImOtW4cB7Xc8lWJftpY-0nLD-CjDxsTW4zrA>
 <xmx:gJv4XGmo5iWaeEXIIGjrOblHqxbF2xi1OXuuSSnz3ikJd0ViIUI9nQ>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 06590380084;
 Thu,  6 Jun 2019 00:50:04 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: u-boot@lists.denx.de
Subject: [PATCH 0/4] NC-SI PHY Support
Date: Thu,  6 Jun 2019 14:49:46 +1000
Message-Id: <20190606044950.5930-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.21.0
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
Cc: openbmc@lists.ozlabs.org, joe.hershberger@ni.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, sjg@chromium.org, clg@kaod.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series introduces support for the NC-SI protocol to u-boot,
functionality which so far has only been available in vendor trees.

NC-SI (Network Controller Sideband Interface) is a protocol to manage a
sideband connection to a proper network interface, for example a BMC
(Baseboard Management Controller) sharing the NIC of the host system.
Probing and configuration occurs by communicating with the "remote" NIC
via NC-SI control frames (Ethernet header 0x88f8).

Since the RFC[0] the changes have been split out into a few different
patches to make the overall changes more obvious. Additionally a few
small improvements have been added including adding a check to see if
NC-SI is already configured, and marking the PHY bus "reset" as invalid
since it does not define a bus.

An example of NC-SI setup before a normal network command:

=> dhcp
net_loop: configuring NCSI first
ethernet@1e660000: link up, 100 Mbps full-duplex mac:0c:c4:7a:d5:48:43
NCSI: probing channels
NCSI: configuring channel 0
NCSI: configuration done!
BOOTP broadcast 1
BOOTP broadcast 2
DHCP client bound to address 10.61.161.188 (255 ms)

[0]: https://patchwork.ozlabs.org/patch/1107087/

Samuel Mendoza-Jonas (4):
  phy: Add support for the NC-SI protocol
  phy: Include NC-SI in phy setup
  net/ftgmac100: Add NC-SI mode support
  net: NC-SI setup and handling

 cmd/Kconfig              |   6 +
 cmd/net.c                |  18 +
 drivers/net/ftgmac100.c  |  39 +-
 drivers/net/phy/Kconfig  |   4 +
 drivers/net/phy/Makefile |   1 +
 drivers/net/phy/ncsi.c   | 892 +++++++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy.c    |   8 +
 include/net.h            |   3 +-
 include/net/ncsi-pkt.h   | 415 ++++++++++++++++++
 include/net/ncsi.h       |  14 +
 include/phy.h            |  12 +
 include/phy_interface.h  |   2 +
 net/net.c                |  27 +-
 13 files changed, 1429 insertions(+), 12 deletions(-)
 create mode 100644 drivers/net/phy/ncsi.c
 create mode 100644 include/net/ncsi-pkt.h
 create mode 100644 include/net/ncsi.h

-- 
2.21.0

