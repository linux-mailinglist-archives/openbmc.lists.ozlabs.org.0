Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39F3AC1B9
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 06:00:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lZm23JLz3clc
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 14:00:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=TPQE0XI5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kuvQVW1z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=TPQE0XI5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kuvQVW1z; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lY20z6bz2xvH
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 13:59:17 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3BCF15C01C1;
 Thu, 17 Jun 2021 23:59:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Jun 2021 23:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=3/zXr0MFCoTlv
 4MVeFTVcgwaIENgH4z2YG9XCFzoO4w=; b=TPQE0XI5qp10m8p/bT/mO/HEkPyhG
 gvWwMZzKYlIgwv5Y+AgDwokqr+/5zcBQEVImzMG3hNNTE30l8JRNc2UiP+357lyx
 h2VuouqvS+h9KekZR7Hh7oT5kKB44rLvI/2SgnhC11iPGdM+IDcDgPjDffYerQeF
 lmmi/fXu7ARZLpZ/5ZjQaX7Iuv6NuQUXZBLsrA0siAreaFP3lmcAjI3AohW79P3e
 xZUnnp/OEcoKptf2x1mN1vs8ZPgkCbFl8/B8DlI8U3+0f1LnDTZkbNEAbnCJFFxi
 zgddTLw8R6N6KkxHBIVhyfShsAxjS9uTjlX1Cjxipf1X0MMqRpXO+SmCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3/zXr0MFCoTlv4MVeFTVcgwaIENgH4z2YG9XCFzoO4w=; b=kuvQVW1z
 OfbTKfu7RhNDgWLW+yuDFP71tk6jh8Hazm58+gB4LBZ6XSKcj798UsGfWX70zw12
 ahilr+BvnqcjHwMNC6YqMIAz64Mz5d9fEMERhOYQIIwpqgDcrYKqHC7EnAvXwiCI
 lBeV7vE+x5jfuD3ZKDI198GNkQqjHpZ/xhvh7sqXla4uo+srWzDrz5yeAt00tsWW
 q6LiTIDT4Wl6w4UEvHuvOtqMjr5mcWKoyERiKHbvdvEK+skd83RYp561z3UQhj3Q
 DnPwHYczlsYFxw2ERVYIYDR7wZdo3iYobeu+uecMpWfwfSGBbrMvr0NqnebCElmj
 +Tsb179mMIUj2Q==
X-ME-Sender: <xms:ExrMYCCfv8sQHPzqQbRBbxVZ2Coq8nJaR7kUrzEVxF2QUrYfI-Vt7Q>
 <xme:ExrMYMicA6N2Z0oZ2sba7gQVz3pST_XuL6p0LJodiBfiI-SvVvxEZlG_aCPqIRBzn
 RLu33seTQqdVVtYUw>
X-ME-Received: <xmr:ExrMYFnJJZfJPXWDuzPX48r5vNhdYyljpbE04zJqmRf5tDTxov-w9KVglxQ1Vc90FbOzdWZlWrZSszrmO-dCT7Fb0P--YsBpOgo5XVxhEm_c28RjDI8wt6wu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ExrMYAwd7F5xD1SIMEk1YLqsTuUIwR2nfk-Slr49GWAz4Vd1VYzQhg>
 <xmx:ExrMYHTq9PeA7_evh1D_PQ9DYtRH6yqkONrksrD1DjlD2WVRY9ObCQ>
 <xmx:ExrMYLanwtkxrAFxq9KBXuiZeNS8Enm6BFMAWq7gAqlnNX9rKwRoSw>
 <xmx:ExrMYI5YF33YPEniEKts09ye6SVJyNvzRjAiPzGGu8DuVzRwZNHcQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 23:59:13 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 3/7] ARM: configs: Enable IPMI KCS raw chardev
Date: Fri, 18 Jun 2021 13:28:54 +0930
Message-Id: <20210618035858.4024689-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618035858.4024689-1-andrew@aj.id.au>
References: <20210618035858.4024689-1-andrew@aj.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The raw KCS chardev is used by libmctp's vendor-defined LPC binding.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index cefbec257bd8..045d383ce5ce 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -180,6 +180,7 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
 CONFIG_IPMI_KCS_BMC_SERIO=y
+CONFIG_IPMI_KCS_BMC_CDEV_RAW=y
 CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
-- 
2.30.2

