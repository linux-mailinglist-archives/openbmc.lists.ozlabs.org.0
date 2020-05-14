Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 223E21D315C
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:33:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NCCw4XbszDqs2
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:33:16 +1000 (AEST)
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
 header.s=fm2 header.b=qOBGqzCB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NHCa0DvK; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NC5569ybzDqSZ
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:27:21 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C1D25C0243;
 Thu, 14 May 2020 09:27:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 14 May 2020 09:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=SETVyfr5ZtYfV
 TywJMKRXKdYJs3Awt1Ux8E2j1ZYFdY=; b=qOBGqzCBlhzK3SYhqHYBt8kUfOlxp
 pH4vkIok63VcbuaWC35XsNBXvRjSEfII4exJRQfvFNiooOurabF+Os7gGeUrVg1B
 oj1NRQ0oxrFNASFe2g0+z/dTI61uljYShG5/jYaHGszYUPGlhYSGvkRE1GqimZRY
 LXrWqyMKjz/ZwxzZXi9gZqrJAsT7n8nhvnjiXwgfYRrHi6oDBAb/cg8zY8tMG/c0
 5n6mutWgHVasb36sIklHS3I3xsVOztf72HZuq3vxrc8uoH7+Y06Ug7wk6IabWXhA
 3HIYqCccO92vZcMY+T7aDwSP0p3d1Is7NvPa7qqsAijmeQXIJqiADaTrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=SETVyfr5ZtYfVTywJMKRXKdYJs3Awt1Ux8E2j1ZYFdY=; b=NHCa0DvK
 UyEaeoYeP14J0rfgkoTQFocS3AZ9z94F2FC0Sy7d8/PN054aQKbkPX9NDwFJm30+
 JnlrtYMvqLU5vs9k/mnp15QG/8nTn/L7g46Bu4pYjUXGXT+7W4ctsrLzysYV96jS
 iNlbTUfPpiCQfAXNgyy4Qt4nEnCsV2FHa/yVVl4fSaG6PJ1C6CTfm0UtJNKiWLaC
 JDSiHPvtkNSYrBPEK2YRJr/27plMFgBdb+QialAwoqPH8xZIv39RFGyic/DUlO5v
 1C/6wQV8xhQyenrtBC2JBgOP5GeaGqnx2cnZWoDSHc6FemXTAxbGC80trKHunjFY
 gofD1idch6d/TQ==
X-ME-Sender: <xms:N0e9Xg79rM52R9YDR5q-Er-Dva123_kYyI7a8uiRMYMrPS-mQoyi3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdelhedrfedunecuvehl
 uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:N0e9Xh5v4B_1f41KgQyMYUqFiubjRDJ_RmFgAT9fQGfsqt_NGMS3ow>
 <xmx:N0e9XvebbKH0I_rDDoSwdXvqudOCGamVi_4QKn4ypycvnr-qgf0AXA>
 <xmx:N0e9XlK-9Y2aou3LCeZozAwoapVFE0oCH6kOgswXm_ZIICRKkJ3G2Q>
 <xmx:N0e9XpW7zubaP6Jtfd8d1VKzmK5WwExQZxcdr_XeU5Nnk3saVhqXmQ>
Received: from localhost.localdomain
 (ppp14-2-95-31.adl-apt-pir-bras31.tpg.internode.on.net [14.2.95.31])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5EE8C3060FDD;
 Thu, 14 May 2020 09:27:18 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [RFC PATCH linux dev-5.4 4/4] ARM: configs: aspeed-g5: Set
 CONFIG_FORTIFY_SOURCE=n to appease kprobes
Date: Thu, 14 May 2020 22:57:03 +0930
Message-Id: <20200514132703.448317-5-andrew@aj.id.au>
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

Setting CONFIG_FORTIFY_SOURCE=y and CONFIG_KPROBES=y on arm gives a panic when
trying to insert a new probe:

$ echo r:myretprobe do_sys_open '$retval' >> /sys/kernel/debug/tracing/kprobe_events
[   51.688589] detected buffer overflow in memcpy
[   51.689430] ------------[ cut here ]------------
[   51.689627] kernel BUG at lib/string.c:1096!
[   51.689800] Internal error: Oops - BUG: 0 [#1] SMP ARM
[   51.690107] Modules linked in:
[   51.690442] CPU: 0 PID: 107 Comm: sh Not tainted 5.4.39-00272-ga1ee7c973659 #6
[   51.690674] Hardware name: Generic DT based system
[   51.691184] PC is at fortify_panic+0x18/0x20
[   51.691371] LR is at __irq_work_queue_local+0x40/0x7c
[   51.691575] pc : [<8083eaa4>]    lr : [<8020e0ec>]    psr: 60000013
[   51.691812] sp : bd237cb0  ip : bd237bc0  fp : bd237cbc
[   51.692129] r10: 00000007  r9 : 00000000  r8 : 00000060
[   51.692395] r7 : 8011f2f0  r6 : b5092480  r5 : 7f000000  r4 : b4c53b4c
[   51.692723] r3 : 80c04c48  r2 : 00000000  r1 : bd7c5448  r0 : 00000022
[   51.693088] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   51.693449] Control: 10c5387d  Table: b50f406a  DAC: 00000051
[   51.693769] Process sh (pid: 107, stack limit = 0x4e9b7225)
[   51.694126] Stack: (0xbd237cb0 to 0xbd238000)

YOLO it and disable fortified source.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 254fb7562738..b7f8ccc99000 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -269,7 +269,6 @@ CONFIG_SQUASHFS_XZ=y
 CONFIG_SQUASHFS_ZSTD=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 CONFIG_HARDENED_USERCOPY=y
-CONFIG_FORTIFY_SOURCE=y
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_USER_API_HASH=y
-- 
2.25.1

