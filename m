Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B83DFCD4
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 06:47:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y1G74xJSzDqLS
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 15:47:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JE7KiZEQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qJgAoDBy"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y1FG3xhvzDqKZ
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 15:46:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A9EA21731;
 Tue, 22 Oct 2019 00:46:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 22 Oct 2019 00:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=j9GM5bHFozeg3
 ktVk83t4krQsMcyXZZlNx788hBaiCs=; b=JE7KiZEQxQ30gtl+GkMmwiq7tfv+K
 DsM7IbrPHgV2MeoVxNXG5mpWlwUrJDJs/wM7THDDmCSVpCBM4H8nsQZbB3WHK5FY
 khQWepGj48KUAhiwcfQoZrx7odbSmodNzaePX0zrDzvnMy+qn74Zrt7sJ1WJHxzb
 Uvz4JHfSQZRkZGI8BeA7TB+GNXdZwFMUK6438YU2BAduxD3M8xSOYzQglVgYaBhd
 n4XLxj0fHAwVd0K3L7yfosmEohI6IlvAcx7T1ys2GP2SyGqxSqfbFe7tUjRzVz2q
 w8YG4paGE5q9gEUZmu4jTReA3Q1NFgzjg+CBTdoqSF/3JuCpc42ELZPdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=j9GM5bHFozeg3ktVk83t4krQsMcyXZZlNx788hBaiCs=; b=qJgAoDBy
 j2/35Lk9sBobrP0h9fPy6wKzeP3xZVsbTwvqjBSJX5y46jxiQvPMQRvRcHPMtm9r
 2g2cxsjMexjp/qozR6dVMOVSTOS9eVDDPE+XtybjN/yLexm4oZcC8PGJV7kC47i8
 nh6f9AwkRSPofnYRs3yj0CVKvgSr5c7Q9rLQJSu9+U/k/V5fvj9M6yVUFKUYnN5e
 fwcYfaPkqmgSQdyc6vjJlaZsojl9qdEGujXLuXrWfuqQ/VaNgIbxHa21PBHO5l10
 0GSbisvV7bhC4X8/NJ05oH0K4e6bQKcd/Ncd/Pn350SjUR9ewaQgaN0ijwCAVMvp
 QGeOtzZk8VvISQ==
X-ME-Sender: <xms:vomuXYMg1ApULZ_pZCkjr2GDsIEdxJ9fAmzz3xL9du2P0jDzad-aRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeeigdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrvdeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:vomuXV1PkW5ahT-BnKGeJ0e3jM9pXlhCSozBR1rBbMB0EAx2ki5-iA>
 <xmx:vomuXQ79m6Pk9d9fGt4A3PdV4BaPzVLWzLIwGmzCykKdE7xzvX_Gsg>
 <xmx:vomuXX6klbq6dvK4jOf42knQpmcqi7n_U-2ICM8QwX1x6XujSjKwIQ>
 <xmx:vomuXbFqUTiBAsshM0HFjc9oTNSh5TaEZiQpOCtzClRWA3Vzed8n5Q>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F05D80060;
 Tue, 22 Oct 2019 00:46:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 1/4] pinctrl: aspeed-g6: Make SIG_DESC_CLEAR()
 behave intuitively
Date: Tue, 22 Oct 2019 15:47:34 +1100
Message-Id: <20191022044737.15103-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022044737.15103-1-andrew@aj.id.au>
References: <20191022044737.15103-1-andrew@aj.id.au>
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

Signal descriptors can represent multi-bit bitfields and so have
explicit "enable" and "disable" states. However many descriptor
instances only describe a single bit, and so the SIG_DESC_SET() macro is
provides an abstraction for the single-bit cases: Its expansion
configures the "enable" state to set the bit and "disable" to clear.

SIG_DESC_CLEAR() was introduced to provide a similar single-bit
abstraction for for descriptors to clear the bit of interest. However
its behaviour was defined as the literal inverse of SIG_DESC_SET() - the
impact is the bit of interest is set in the disable path. This behaviour
isn't intuitive and doesn't align with how we want to use the macro in
practice, so make it clear the bit for both the enable and disable
paths.

(cherry-picked from commit c136d4c71f755a189fe13a0cd4f3e8f538dda567)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 31d903953c68..f86739e800c3 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -508,7 +508,7 @@ struct aspeed_pin_desc {
  * @idx: The bit index in the register
  */
 #define SIG_DESC_SET(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 1)
-#define SIG_DESC_CLEAR(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 0)
+#define SIG_DESC_CLEAR(reg, idx) { ASPEED_IP_SCU, reg, BIT_MASK(idx), 0, 0 }
 
 #define SIG_DESC_LIST_SYM(sig, group) sig_descs_ ## sig ## _ ## group
 #define SIG_DESC_LIST_DECL(sig, group, ...) \
-- 
2.20.1

