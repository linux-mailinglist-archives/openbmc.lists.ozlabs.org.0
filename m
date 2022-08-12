Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69B59127D
	for <lists+openbmc@lfdr.de>; Fri, 12 Aug 2022 16:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M464Y0cxMz3bYd
	for <lists+openbmc@lfdr.de>; Sat, 13 Aug 2022 00:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=aBWH05Od;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BihLiXC4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=aBWH05Od;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BihLiXC4;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M46406zMGz2xGg;
	Sat, 13 Aug 2022 00:48:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 047E532007F0;
	Fri, 12 Aug 2022 10:48:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 12 Aug 2022 10:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1660315689; x=1660402089; bh=nFAyZba+rUSSpa4dMw5jpMYFE
	bkfzVnF4ksUNlmVM3A=; b=aBWH05Od0HQ74QiuPgre2ttFPk/yRPqxtG7J3wILw
	pN9tIc6SYBKLJjQ6KHnvN18/vLLxbNhfDuaEUw+4Vj29AxsLDMOf+s5LGZPmOvdY
	K0tEsG2JW/ITmwGyIRngtZiHkYjao0cug5P+tDPlUn4pTD/anny5mIdAh3gaEJOq
	sXcwIyY0/Nay1ajcFPpHMN3qGT48oXkEkoFkiSOCHvejBTBMKhjjSVeTy5wTEUke
	gReJsmeJPDisCQr4N7ObzUl/KEFJqBa3D9qD3AP/I2fd9tm7L0LfMcFuPWzs6rSe
	wDNOCG3f1SnqbmewhS1FzyV/p+BTSnuDN8TdNySipohBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660315689; x=1660402089; bh=nFAyZba+rUSSpa4dMw5jpMYFEbkfzVnF4ks
	UNlmVM3A=; b=BihLiXC4PtN2SfU+VBV4DM4mEGnvTGkeAlF76WFLDpPtsdd6EyW
	e37t73EA8IFPtt3fToOOP+B/ifL4pxW9mDcVzHonzNgLr33xrvY6qMlH7lrYaK9i
	mSCg7OtX4wdzNtWiC2HJeSNv8b+LHwus+ZyQz1CG7ctYzz9Q4cA6Xkwsu9aIWBin
	5iyyveb1gQUWPlncAJZjadHrXvRqSwhDYqd1bG2zlwSL+7MNxD290cqWXcVKy9J8
	teZQDNLC/l+zbEZVPuSvrV0aTLbbnCp7NnTxJBQDuCzqbZ0gBm5a3JOCUDvqfV5f
	8NWdUYnmmIefT41RTs9uDzXZPb8H4V0aUjw==
X-ME-Sender: <xms:KGj2YhGpHq2WIrq7pE725XRiIoCZuPX54xRzi2tLqVvtG7iikGyE-w>
    <xme:KGj2YmVelSMbeOLBszGJHZvx_j8xIk1zEkiDmSirizDm8MEUHlGH6wf_EbxdNG9lx
    VyEg0KOd87nXpowuQ>
X-ME-Received: <xmr:KGj2YjJH5Ou5yStvqlggt-3S3VPopiDVqGkaU3UvtJont5VMnoETjhPeFiXp47p5MIIbl9pQsT94gh5XWiJTCHJjy3CJipVCHoNWDbR8-sdcgSiNd40Z_8tNxbSLtEehX88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegiedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpefhfefghfdtteehvddufefgtdelfeehge
    ekvddthfehgedvkeevvddutdehgeefieenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:KGj2YnGoJMsaWvT6ybbpz7J_NwW1p2UPp55Jkc6ri5GLO5h8Dl1fqw>
    <xmx:KGj2YnUCYfC1CLewAtzjPcceTe6yPk9DYzGxXV4dBvh-zinJel4LlQ>
    <xmx:KGj2YiPGRbwDLiLwb-4PJMzLr7vyvceKoXb7jG0z5vn0yuS2f4SoDA>
    <xmx:KWj2Ytd-LzVJnPfa4mOq4QVSvWXfHt3jFAsYW6FPwB_XzLWRruUe_Q>
Feedback-ID: idfb84289:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 10:48:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net
Subject: [PATCH] ipmi: kcs: Poll OBF briefly to reduce OBE latency
Date: Sat, 13 Aug 2022 00:17:41 +0930
Message-Id: <20220812144741.240315-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: minyard@acm.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The ASPEED KCS devices don't provide a BMC-side interrupt for the host
reading the output data register (ODR). The act of the host reading ODR
clears the output buffer full (OBF) flag in the status register (STR),
informing the BMC it can transmit a subsequent byte.

On the BMC side the KCS client must enable the OBE event *and* perform a
subsequent read of STR anyway to avoid races - the polling provides a
window for the host to read ODR if data was freshly written while
minimising BMC-side latency.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index cdc88cde1e9a..417e5a3ccfae 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -399,13 +399,31 @@ static void aspeed_kcs_check_obe(struct timer_list *timer)
 static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 state)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
+	int rc;
+	u8 str;
 
 	/* We don't have an OBE IRQ, emulate it */
 	if (mask & KCS_BMC_EVENT_TYPE_OBE) {
-		if (KCS_BMC_EVENT_TYPE_OBE & state)
-			mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
-		else
+		if (KCS_BMC_EVENT_TYPE_OBE & state) {
+			/*
+			 * Given we don't have an OBE IRQ, delay by polling briefly to see if we can
+			 * observe such an event before returning to the caller. This is not
+			 * incorrect because OBF may have already become clear before enabling the
+			 * IRQ if we had one, under which circumstance no event will be propagated
+			 * anyway.
+			 *
+			 * The onus is on the client to perform a race-free check that it hasn't
+			 * missed the event.
+			 */
+			rc = read_poll_timeout_atomic(aspeed_kcs_inb, str,
+						      !(str & KCS_BMC_STR_OBF), 1, 100, false,
+						      &priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
+			/* Time for the slow path? */
+			if (rc == -ETIMEDOUT)
+				mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
+		} else {
 			del_timer(&priv->obe.timer);
+		}
 	}
 
 	if (mask & KCS_BMC_EVENT_TYPE_IBF) {
-- 
2.34.1

