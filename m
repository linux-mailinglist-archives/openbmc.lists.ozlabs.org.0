Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE69DA25A
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 01:35:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tpZH2tYjzDr76
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:35:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="M4MtRBjk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LdoDHqPM"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tpYS459VzDqcQ
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:34:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 49AA51491;
 Wed, 16 Oct 2019 19:34:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=AW5GguMkU72K8HVoB/KzhRWJT3
 kg2me91MrL2a4ydmc=; b=M4MtRBjkY6J6InPJuc/CFZsv8cYlIPtKL8sdNnem7a
 KX+fPNUddM+OW2jDWN2waI+f1z2VLMiE4fi6rGJSJ/ukdlv3RMv30XuBeTOgJbxw
 juEUFG/hVyzWcYtDxyDtuCvnKWbuV1bhy8JHN9BYTJq6Lg/p+2bO6C//WVvPwlMs
 a6vQ7wYNfV8q295iGw89waS+5P8H+2+VB+V1H9rugNcHpA8IjEosQhNFBN2xf5H4
 EIrwOReI91Ul3R8qbjTbEnqeDs1kF2iUYeJM60B4P3JE2+swvTl+ahtY36c4tqj8
 IQK0gWfF4HScWVYZApphhUVawUCXVZo6xMq8uCOZusJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AW5GguMkU72K8HVoB
 /KzhRWJT3kg2me91MrL2a4ydmc=; b=LdoDHqPME09VPHL4nDLWNP1tAXbt63z6d
 4tBQWIUnQdlOxYJfLvJQOHTjMq2+eJ9cCpGjJ+JHFL+hMeEWwdSzLXfgVgnfAUf7
 12ftfye7pkbLrkmU1g9+Ov+GBJNsOhy79h4vfWOMidjirVw5ebO2yUzUDH/OIjR1
 7u9Z6n7iDZZRf+qh4aXU44mf2dVsJqVOQr4ImVUL07CtNdx5AyDB4DsLjrZ7WiM+
 454EDQExv8wpy2ynMj8wf8P6s00wnlkG13dvGZspgz5p+gvblCOvUwkFE3INC+xb
 VV+Ypp7wemhcJYdqymSG1cO+UuHGywZIBHFJNbgmptABojpHBGedQ==
X-ME-Sender: <xms:GamnXc7t49h2bPe8sH4zs6VmGi6z1XZiAFV8LMQHJhjLJzp05fRXSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:GamnXUAxbpxu9nS2CbLLkJV_0v-rxeqSOE1YzYD8oDiDomWOTgnhgg>
 <xmx:GamnXYMneGfdqOahpQ5stAW-Zo6u4IchhdDV9zRGRiotILOohpZz2A>
 <xmx:GamnXXAq93fURRhZnndqZM9PbCUiJT40ZrSuKuzziNkaPk6gJ329Dw>
 <xmx:GamnXYgv2z3CMNDXoxT0-HeriX1Ba2uxBrjyb2rFk6cHz-LXN7hqBQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 00545D60066;
 Wed, 16 Oct 2019 19:34:47 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2] soc: aspeed: Fail probe of lpc-ctrl if
 reserved memory is not aligned
Date: Thu, 17 Oct 2019 10:05:58 +1030
Message-Id: <20191016233558.9740-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Alignment is a hardware constraint of the LPC2AHB bridge, and misaligned
reserved memory will present as corrupted data.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
v2: Cosmetic fixes pointed out by Milton

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts |  2 +-
 drivers/soc/aspeed/aspeed-lpc-ctrl.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index a2eef507ffbb..635744a76884 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -28,7 +28,7 @@
 
 		flash_memory: region@98000000 {
 			no-map;
-			reg = <0x98000000 0x04000000>; /* 64M */
+			reg = <0x99000000 0x04000000>; /* 64M */
 		};
 
 		coldfire_memory: codefire_memory@9ef00000 {
diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index 12e4421dee37..f4ac14c40518 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/log2.h>
 #include <linux/mfd/syscon.h>
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
@@ -241,6 +242,18 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 
 		lpc_ctrl->mem_size = resource_size(&resm);
 		lpc_ctrl->mem_base = resm.start;
+
+		if (!is_power_of_2(lpc_ctrl->mem_size)) {
+			dev_err(dev, "Reserved memory size must be a power of 2, got %zu\n",
+			       lpc_ctrl->mem_size);
+			return -EINVAL;
+		}
+
+		if (!IS_ALIGNED(lpc_ctrl->mem_base, lpc_ctrl->mem_size)) {
+			dev_err(dev, "Reserved memory must be naturally aligned for size %zu\n",
+			       lpc_ctrl->mem_size);
+			return -EINVAL;
+		}
 	}
 
 	lpc_ctrl->regmap = syscon_node_to_regmap(
-- 
2.20.1

