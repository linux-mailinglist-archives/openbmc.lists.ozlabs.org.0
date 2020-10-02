Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FE280D88
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 08:36:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2gHL0JKMzDqch
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 16:35:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=kDgT+l7e; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=AqKQIe9A; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2gGJ2Cp8zDqDf
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 16:35:02 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 13A288E1;
 Fri,  2 Oct 2020 02:34:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 02 Oct 2020 02:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=p5JF5pnpGkbGSYyJlhXCg3sjgN
 U9Fd9BRqw5p/OorIw=; b=kDgT+l7etZ3YcskvP2+5APsX7RWouS6d4vaeK8nJIs
 SkWGUFfJvvti6p8l1NlHiYuDc+NZYoh07E1yjxEymikngi6xYbh7Oa9iPPKg2y5I
 j1an657VGFl0IIjDXgT5pP3QgQN9RO0Xun20jmGLj8drKyBiB9Vez3wjgHHTrjV5
 /md8lxiU/bb5+sKFbart7XjtryE9Ly8rq+9zJjorFBkxhigIJhJy3ifTVe/2Qkib
 Xn19/Nxk+rOYkF7UF0pUBf4F4LRXmDZnsP56GyZng01cu4+rWq7CBgjJDqkZxgwR
 d3EvKLazcr/VW5OgEal3iwYItKdqaRpJoMp4IGrrEtiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=p5JF5pnpGkbGSYyJl
 hXCg3sjgNU9Fd9BRqw5p/OorIw=; b=AqKQIe9Ab9pz2hEQmYcpHyW8Imt3XOaKC
 ivVEeTVgb9x3/qO0eEseWQD1RQCuQoK7w7wkF/4VXh1hWopQpxz/JvvSBmWuF0cp
 DqoNhxEgUv9fREAm40Qh/J5C+A4Gzxe9ifJgFm45PBsNNOuiQldLtTcMnFK9iG+f
 C8nf3n9bHA3yKr05jpxlPWc5DL/SnUMe2GR1mLccHTOSz39e9qj4WGS9DlSrjeee
 7203GjH6XSxwK7VGmuznOdPBEa4xxKQ+o/2Ta288SsFAi3Hl/vaOOIyJ0I3qxcEn
 elaBglbWHTHrZ0m7fNGqlnuhbg58RsmJqd2lVt5kqf7GwN8w/zdxA==
X-ME-Sender: <xms:Ecp2Xw14J9qCly6iUBCYC_IVFMpMJHqoOfbysZ2gqiVE44FV6lq-XA>
 <xme:Ecp2X7Hnm5JtyJcYW-WLEFO_sNEq_E56bnnvJ_Y6pdm0x2HV1OIeF8HcGOsOK3OEF
 DYws878vgLSlmQ5Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeehgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecukfhppeduudekrddvuddtrddukeekrddujeeh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Ecp2X44EF4vaEf5BPU04Y2flKd1rbNFvax0ZZoGHNxXm9SkEPFPuAQ>
 <xmx:Ecp2X53wr4KM4dedDGF6KMnHoc_dxzSKp5NdAtL7qx-eYWh9R_tYDA>
 <xmx:Ecp2XzFFFuo2Wmy7bbNbufczjv_LNCVQkHiMZH7tXCQxvvQtfekZbg>
 <xmx:Esp2X6z_WJZ9a1kVPTPkFpnr71xFRDBBL-NaLpDhB9Uk_sZEta94HA>
Received: from localhost.localdomain
 (ppp118-210-188-175.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.188.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 97B24306467E;
 Fri,  2 Oct 2020 02:34:56 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH 0/3] Enable pstore for Rainier
Date: Fri,  2 Oct 2020 16:04:11 +0930
Message-Id: <20201002063414.275161-1-andrew@aj.id.au>
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

This series adds pstore support to the Rainier platform for recovery of oopses
and panics.

Patch 3/3 is a minor cleanup. Only patch 1/3 is a requirement as 2/3 is handled
by the config snippet in the bitbake metadata.

Please review!

Andrew

Andrew Jeffery (3):
  ARM: dts: rainier: Add reserved memory for ramoops
  ARM: config: Enable PSTORE in aspeed_g5_defconfig
  ARM: dts: rainier: Don't shout addresses

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 12 ++++++++++--
 arch/arm/configs/aspeed_g5_defconfig         |  4 ++++
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.25.1

