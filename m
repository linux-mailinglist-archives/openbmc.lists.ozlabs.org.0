Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A0DA262
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 01:39:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tpff3WwPzDr1N
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:39:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="b+z1m0jO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="vhZNqFix"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tpf446dTzDqQZ
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:38:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 524DE56F;
 Wed, 16 Oct 2019 19:38:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=X+T8wVqQwus44fQd32mad2+gob
 ewZko/C7I8WYR4BCc=; b=b+z1m0jOiH4KD4fVwLj7NpXmMBJ6M3BIyNntA6svUD
 ubTAWYpCBRVT3H2Q5KTdfeVpWYI+CQlVwuDQxce50Pz4GZn5o/7mil+W7NA+DhcO
 9jc0APbULgjbCuAPIE7mx+TvEGFOuLjGkaumtXY+X8kgr0Y3OffOxSJQuUa4hE43
 dZu723Sk1UrZgRpBmUczjTyTS5FZsaNjDHNWAGYKiaLeii2z0wPNDkzClNEeMx6r
 FAtzuXz5v8rbWd8BgJRWzGkuHvpSuFi4Ny3/tFfjeYKqKyA7AzbZ/4sZLbW3vRnu
 rC39SWHNdRm7Mh3pnaD1wrHjfRN9iPktWSGuFJmQZyAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=X+T8wVqQwus44fQd3
 2mad2+gobewZko/C7I8WYR4BCc=; b=vhZNqFixsJD//hbG02U9gqT72a2iAXWKL
 kg/G1JgWib3kIjIHykPSTH19jy8ud9Eu1Lwv23Lb948pQ98KBSwCAZbgiV9A8a0D
 9ar2N6TLeLqqK9O0O8c4JwVqHoyWK0cnMHXVQqXL+VTpJ23TyfV8My4rIvGg/Ymf
 6LKI2C3qA7yZ514WSQetgpaxORf/U7LZinMuHe7xqBzuwEr1I5UPs+ET7le3pMw5
 KYEechQWlDCn4BVEFnNUYYlr6GNSGnJIsXN1Se1xnv9TWVgAs1Mg+2DLIM9uj+el
 M8zSiLN1uUVZ7demZbXjr2ODTd+iINpim0XosK4XNOvzdlk2h8lFA==
X-ME-Sender: <xms:CaqnXdMSWLD2eSKZL2xfJOwiCrytHxM0PERtFFXsos4u7WNy0WpuoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:CaqnXUOLEixtuu4NhiApKm9hG3PN5q5ncbu23mer6H9GiOFUpQ3qjw>
 <xmx:CaqnXXRqcqregLemDcVN93p-tGkpkItgFyDuwlVIjmwDL8_Gu4jU7Q>
 <xmx:CaqnXeCUSiiyry-cPY6c4chEh92OmJB5AqDkVWPYz_-efAhEw2NI9A>
 <xmx:CaqnXQaYLxYv3BxaEaq4iuzhJfZXxLryEhRYDPq7vTiqOpilt7slIg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 15E7CD60057;
 Wed, 16 Oct 2019 19:38:47 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v3] soc: aspeed: Fail probe of lpc-ctrl if
 reserved memory is not aligned
Date: Thu, 17 Oct 2019 10:09:50 +1030
Message-Id: <20191016233950.10100-1-andrew@aj.id.au>
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
v3: Remove stray dts change
v2: Cosmetic fixes pointed out by Milton

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

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

