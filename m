Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D46127F66
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 16:34:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fXpt5G99zDqv8
	for <lists+openbmc@lfdr.de>; Sat, 21 Dec 2019 02:34:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cXIGX72C"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UKpr+DQt"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fXnr01QKzDqsy
 for <openbmc@lists.ozlabs.org>; Sat, 21 Dec 2019 02:33:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 93164676;
 Fri, 20 Dec 2019 10:33:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 20 Dec 2019 10:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=6r7TOnnEf7b3CRYAqPjpq/LFNJ
 bURBZsV5zBRxHVG7Q=; b=cXIGX72CPDGcsC/AXF5zHPMJHAN4pOz9ZsKgz8B5U/
 uNvLQvh5evAaEVGSOCJJV+hi7ar6MV+hGMCQPRBpkd01yo9PCkPfQWHkHA99x6d7
 0UZ2WLLanS9hlMN+tYLmEY2LTrlj/krxuTy9U3XqpWLUqdbUYXreyADjA0cAeNYe
 6aQ0sPvfiUK/XtxSt1K5mT2wXgYwL5MV2PEKVfqN4V8yICCRls45VPwAHmedhgfs
 byKBIBIJ3QPZOALJt/dUtyyUNywh47T6WO5bv/HAl6pfX4mwP3vOX5W7Z8QVpqmk
 nxFWVi+0kvLR87xcMA+M6v0JB34wbyERtQPCioVzEpfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6r7TOnnEf7b3CRYAq
 Pjpq/LFNJbURBZsV5zBRxHVG7Q=; b=UKpr+DQta1gNvGGdJFYON8XD97kacshhY
 E9mVWPkVzTWs/AUW5B3Vw57HKU54YTKGV2aZIhlCFgoWarq23gCkABIBf8lDQeeA
 MCAOmCigxAEPnqmTF4PXp3+kruKbJG/rnp8ME3LQMqixffAknfeDUn3IX0Aoq5LQ
 Jgeo93qpxRfh++0xJQgS+f8OW8sUFQ7Dg0F3F2cyUc5PamY88U6eItoRUmiLoAEn
 eTVvg1yKay6UyYgcamWlLwcaGRdkXKrjj095lDAKoxGD3sS7H5muhyKcXwWGDM3y
 pSEvax1iR8ASTZ3sO2WNSI+A5VPUecMGfwZd57NtWC9n9G/VP24iw==
X-ME-Sender: <xms:uen8XYJb6dz7LF2bCPFmrkG9PipcdP3oAVFfZixpvGwCKyWhIfgepA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddufedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgvficu
 lfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepuddukedrvd
 duuddrledvrddufeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:uen8XZcbs2vYrk7dNSjdqUhPeafOwEovW4Oa5Oh1MM7O3KCFuzMZMw>
 <xmx:uen8XbKwavXN9W4PgtMWjoyzgGQadV1kUFE13rizAydZjP9371mz4A>
 <xmx:uen8XbBnAuLI2xTVrcLPSuVNOQKhxkT8LluD_QryvTf7cgjJAu0big>
 <xmx:uun8Xbw9lok2IRvKv8vQtpdthDf6XhLU5pighZsB47McfO4Rh2oLGA>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75DC08005B;
 Fri, 20 Dec 2019 10:33:11 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] hw/ssi: aspeed: Deselect chip to reset state in command mode
Date: Sat, 21 Dec 2019 02:04:40 +1030
Message-Id: <20191220153440.8118-1-andrew@aj.id.au>
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
Cc: clg@kaod.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is probably a bug elsewhere, maybe in the kernel driver. However,
this workaround/fix appears to resolve the squashfs/UBI corruption we've
been seeing for quite some time in QEMU with e.g. witherspoon-bmc and
associated images.

The problem is the chip is left in e.g. read mode and the deselect is
necessary to reset it back to idle for the current command to issue
correctly. Failure to deselect leads to command-mode access of data at
unexpected addresses (the state mismatch means the command/address are
potentially ignored) and the result presents as data corruption.

Something I don't yet understand is the symptom (squashfs corruption)
wasn't overly deterministic. I would have expected more widespread
symptoms given the change. Having said that, UBI hammers the flash with
its wear-leveling (somewhat ironically). Its approach appears to be
somewhat complex, so maybe it's not surprising that the results are so
variable.

Cc: Andrew Geissler <geissonator@gmail.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

---

An early Christmas present for Andrew G.
---
 hw/ssi/aspeed_smc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7755eca34976..c8713f3e3347 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -739,6 +739,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
         break;
     case CTRL_READMODE:
     case CTRL_FREADMODE:
+        aspeed_smc_flash_unselect(fl);
         aspeed_smc_flash_select(fl);
         aspeed_smc_flash_setup(fl, addr);
 
-- 
2.20.1

