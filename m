Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AFA3B56D5
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 03:36:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCqvv6tt2z30BN
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 11:36:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=j3a0gTC/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TLPYVywG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=j3a0gTC/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TLPYVywG; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCqvW5S9Xz302c;
 Mon, 28 Jun 2021 11:36:23 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 2A30E32004AE;
 Sun, 27 Jun 2021 21:36:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 27 Jun 2021 21:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=Eh3iECIhPnnNClTAB2ZqsMeLKB
 oI8ZytTsXkobUBnhM=; b=j3a0gTC/zeyDVt8VYPvTKAxiUHeXjYgzNcMa1jdj17
 6gZQ/xpSdQiwsYzsW8FvL8gDBXuvxv2oe6E6FNDZSeZDNkcRsXfZBYfgnSDMdiaS
 2TgBJJwQhh1OF//pENkZ7Ryl/sD/vO5KHQbx8NWe6qVxHq2iLcsTo/ezuxAFJ8cO
 U4W1ZFPXUgpMURIr/xB03n7mQ/qaiZ24pXFWokTtST3Sla8QpP+BPF6fDuPNDrMw
 MQihehuwghIUR9c5jkvMMZpeYHOIrR6onPkyjUrAzdhOdAAYEpByuqIJoRMFMVS6
 p/9WNcEwCWqR+nj7010Hr9tsBon0Ns+91DSqZ9njWrlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Eh3iECIhPnnNClTAB
 2ZqsMeLKBoI8ZytTsXkobUBnhM=; b=TLPYVywG0uG41sE2k+tes34C2y7JsKLuw
 G47b/932BrEIyWwHdwcLVmw+LTRHXrXHIXR9ygtRsUdIf9f9qRPWC3oGT+Qu5xKQ
 cje7CJ0Blc/EII/PQSfVUoAx9m/qY+w4bJMLDgIRlELOcwbCLj67LGkDWUUv4JGu
 mVOZEd1y5vnx8RZPhPq6l/2a5bSCE2sKrV6aO+o+wACtqhi+J+qb4wyqwhzU3Vnd
 xqvzhNSSzwLk8mKb3C/drh8uJoDUQ8gT9WmxiDTrUepiYf/UAGXrvH1ocQFXNvcV
 FQzvqMQNHkSMeaHoYegnxIJToZA4UKcVNi4+cNH39u0eTl/mIbPCA==
X-ME-Sender: <xms:kCfZYD4j0derOus7kzYlWXDrlage9SQGmkN-tjgOZUCihN7JtXKzXQ>
 <xme:kCfZYI7R01LMnWLv42hAiqsiSRDDk5fhoiWeZOC2bymyE6PVFjEaVMsQT0Ad042hq
 q-yBnqDUiGFLElILA>
X-ME-Received: <xmr:kCfZYKclvtxqgmPzTe-r9mOur8K7BQfBxbLjtVfZVBuCXLzt8TpEqUofxiElcpYwfgQOGfkIH_Rdgy_UQQYVxWZ_9oIsjbpLx-CiVRY0moFLCwwdhKQtXOcBjS6e5Vl2BMlxXUaCxHqITA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:kCfZYEJ-oZ83N5LOhi4JJ7uO7rlNSVmK4N6xXmoNcAyxVBolY8ARkQ>
 <xmx:kCfZYHLSTezIywRZYx5_yRhnktPzSMlYZugWbT1Q02HrraM9tOOo_Q>
 <xmx:kCfZYNyiM-aiu6rm3hhmFpLB86bhDybeX8RmliOPmtVoOzZohr0bYA>
 <xmx:kSfZYNg7hsxgrNZ2mzIwUpYsE6uHM79OICC6wIdlcZEgNScKnYX_Ng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 21:36:13 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: everest: Add phase corrections for eMMC
Date: Mon, 28 Jun 2021 11:06:05 +0930
Message-Id: <20210628013605.1257346-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The values were determined experimentally via boot tests, not by
measuring the bus behaviour with a scope. We plan to do scope
measurements to confirm or refine the values and will update the
devicetree if necessary once these have been obtained.

However, with the patch we can write and read data without issue, where
as booting the system without the patch failed at the point of mounting
the rootfs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 3295c8c7c05c..3274a1f9047f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -1070,6 +1070,7 @@ &pinctrl_emmc_default {
 
 &emmc {
 	status = "okay";
+	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
 &fsim0 {
-- 
2.30.2

