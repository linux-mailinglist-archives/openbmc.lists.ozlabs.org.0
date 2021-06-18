Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AAA3AC1B3
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 05:59:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lYJ0Bzxz3c6Z
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 13:59:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=FhSogfuM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IotLQJz6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=FhSogfuM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=IotLQJz6; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lXy587Tz2xvH
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 13:59:14 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C3EA5C01A9;
 Thu, 17 Jun 2021 23:59:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Jun 2021 23:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=33OG8YRSBH++5
 +rmz3V+7Uv8nnEDRcFBvejaPQOoXUI=; b=FhSogfuMDYNhDh+eu+XBHZxP2phwt
 UdW4VqkCra20vh6WEhFADo543C1oIQotd6tQNpR9N7lyhpgfNzwcCULTAkwtvXDy
 iHXWWpDBZkF3UDSWkqSEyyKuG3d88mR1+Hxy4ngqaJjNG+74k9BTv5TbtCRd9ZSA
 d4pqml8DfkjdQdw6gDDGgjo4uKflm7ZM2EvpVUL9G4GdTvrgGCFzUFnHuH0Wti9t
 ewJhQBs3UVM0qROytSjo7mcYAMg4BGxlCvgIaFkeDvbKQGirpuB2oOnu2556cZwC
 BxgzGyFElJCdT2WH3/3ZZeMZBjcpxgSasLxJCKBPt0v2BiVOIGSnVENig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=33OG8YRSBH++5+rmz3V+7Uv8nnEDRcFBvejaPQOoXUI=; b=IotLQJz6
 f+8MkUSBY2Zo70Nb/PFof+BvdCKqHXpNxsc3tCakIZrjxFW1J+VAlzUhEE5oWsTj
 s5BI2N9rvVd9gN1ptR9BAxMUzmNIEhRI2h0gnVWZTy6eRQBeb2SR97JpAGiiPMUv
 A9l9DTOY4eowkx7UsOy8JTOTbBAzv4VbnwPB1OZ/iwNKJLjIo1HYYYV6lmO3M+rP
 jqBdVmep83ll+om3AztpFc9ZCjdgV/CRHV6fh4SFdPJYEdpGe30beHQr56qEehf7
 Bj3M695qBgkjHnhpSgy2CMuv9i6lkcV6xulhGRU7O44gJjIQsqknmPjXui4IGTpl
 URRTRtIWLBuWQQ==
X-ME-Sender: <xms:DhrMYL_WMqJzx845nim32DPLGZWqyTnR6st-h9Kbwk4mS-_yC6p87Q>
 <xme:DhrMYHsln56PXoU-0Dd06gvJiixelXycs-scGihi9GZ6FobJmY1hgItPhTQW6Zaei
 tLUBgeomncLAwMOEw>
X-ME-Received: <xmr:DhrMYJDPM7RF_cBfUiT2I2PVKci1FPyXnlcCTiYe22nQNc7aHmErN5GiswppSQjQl2O0HaSGI_8IpJUj1nqwbfwUod1FUGraeLVttBApYpDRmo0hXMApxven>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:DhrMYHcsLsSWMhCioC_ECf406XOqjIPb2e0yNmB_xcLYSaadpiLjzQ>
 <xmx:DhrMYAOdk28XjdNw4sfcdNZPlwXXGOHY1sfJqY-JkqymHSqLiEhIJQ>
 <xmx:DhrMYJkolfrmNEPnCUaw2jhb3Kom84-7QkCcx3-3oQm9-SZR8RQ2UQ>
 <xmx:DxrMYKVOtQBJDS5lGElK2b2yDET7WoBzMDLQaTT4BuUyRIzVFRierg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 23:59:09 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 1/7] ipmi: kcs_bmc_aspeed: Fix less than zero
 comparison of a unsigned int
Date: Fri, 18 Jun 2021 13:28:52 +0930
Message-Id: <20210618035858.4024689-2-andrew@aj.id.au>
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

From: Colin Ian King <colin.king@canonical.com>

The comparisons of the unsigned int hw_type to less than zero always
false because it is unsigned. Fix this by using an int for the
assignment and less than zero check.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 9d2df9a0ad80 ("ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Message-Id: <20210616162913.15259-1-colin.king@canonical.com>
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 9753ed0a5be6..b555286016b1 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -301,13 +301,15 @@ static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
 static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u32 dt_type)
 {
 	unsigned int mask, val, hw_type;
+	int ret;
 
 	if (id > 15)
 		return -EINVAL;
 
-	hw_type = aspeed_kcs_map_serirq_type(dt_type);
-	if (hw_type < 0)
-		return hw_type;
+	ret = aspeed_kcs_map_serirq_type(dt_type);
+	if (ret < 0)
+		return ret;
+	hw_type = ret;
 
 	priv->upstream_irq.mode = aspeed_kcs_irq_serirq;
 	priv->upstream_irq.id = id;
-- 
2.30.2

