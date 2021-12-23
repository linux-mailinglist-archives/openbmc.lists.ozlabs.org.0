Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3647E61B
	for <lists+openbmc@lfdr.de>; Thu, 23 Dec 2021 16:56:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKZYL0psdz305W
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 02:56:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=V+XJt2EU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=doRv/Cx3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=V+XJt2EU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=doRv/Cx3; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKZXs5Xbxz2xXx
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 02:55:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1AB415C0121;
 Thu, 23 Dec 2021 10:55:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 23 Dec 2021 10:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=w+OCQKaR9fThO/RPri2JnBRIRY
 P7/F4zfxZs/8kP+LM=; b=V+XJt2EUXdXOsPj/+ESuw/NLg22uT99DofL1KuJNMk
 KhhRwCXGXnddGOE4BrX5qDlYnioVBUc/4bN9OT3d7AdKz9vj2EU6PEMXWB3xL06x
 2JNK3RYblfe/1QXBYyTszuGZiCNOJBEon349pfJUq7sn64iXRP6DgEfjWfDDl4Ll
 zKp30PIn1mVSJa5p/G0hUs2S+gN5Soa/273pF++p92J/pTSeYhxh4Vh33EkddvVA
 28RDAhdj+YzhR6v0EvbzXtTqi4NXAoZqjYqlUGt+R34B9MXDxgsnBNsmGHcR5Xzt
 9ILOsdWjcU7SkQRu4PrTYUQZhfDts8xSvuv+NF1TLCTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=w+OCQKaR9fThO/RPr
 i2JnBRIRYP7/F4zfxZs/8kP+LM=; b=doRv/Cx31nQMw1U/8sYEvUK+pR6nZwieG
 +Fko9HDo696qqDqJY5ZYJ0205qod+IsN469lxT+ds0mb3w9Dvi/LixdH7nnwlsmg
 yt1Udg730PytoVM6WMJDm5oDj+2L/xeHDcPkcCoxBU45S6qUX/rOMxsF90XXhyap
 g1hXXj3U7zFquuvi6ukew7aiaN8w1gSYvv8AJ2p039JP27qWXVfh7bwjdbUA2BE9
 ZcD2TiyvHZuQSQNluRXfigsYSbEfCReqbbEIE0XagEEXmuJb0r+wPdLmaf4kNsGO
 OjTHftCCqKIG7ObL1O96jXaa6YkikVkkXNax4JyEh3oBIbUScODFg==
X-ME-Sender: <xms:95vEYRqL1UqbB3cc0WTWIXotbVOd_tLk6cEF26bipB-FwHRFskKIew>
 <xme:95vEYTqy08fgKIYVhKH8GI4XFnybXWbtPHEQn5kYzJqcYUJeMiG3AH86pXgHcaq5c
 hzCwR5lLie276P6GdA>
X-ME-Received: <xmr:95vEYeNWG9hjgM2JjtWtnChZRCuY_Yp4hTs4uym8bg-nsIkvkaBkkgS9rSby__s28drF5o8-yys6gOCIk6ePtNnvN3V25g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
 mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptd
 eludegheejteelheduudegkeehleetfeekiedtfefgleeifeelhefgveejhfffnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
 esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:95vEYc5c28ua9z2zTsgmOJJ63rDaYpQSjl5Rlg6i_Nzy5fGHm6pvFg>
 <xmx:95vEYQ5c80-cYruaMHAiP1BQF8DySon-wXEIKWtD6KTz-bqYLxjc6Q>
 <xmx:95vEYUhiITGjJRltZ109zOz-8XZ9pq-jfPkE6Qg9WUMJe2Q9zRBFeg>
 <xmx:-JvEYVhNmYqWLHIX2A-J5GA3oAu3UnqgwsG9cuJexf9y1SJfha9j-A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Dec 2021 10:55:35 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.15] tpm: fix NPE on probe for missing device
Date: Thu, 23 Dec 2021 09:55:34 -0600
Message-Id: <20211223155534.680907-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.32.0
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

When using the tpm_tis-spi driver on a system missing the physical TPM,
a null pointer exception was observed.

    [    0.938677] Unable to handle kernel NULL pointer dereference at virtual address 00000004
    [    0.939020] pgd = 10c753cb
    [    0.939237] [00000004] *pgd=00000000
    [    0.939808] Internal error: Oops: 5 [#1] SMP ARM
    [    0.940157] CPU: 0 PID: 48 Comm: kworker/u4:1 Not tainted 5.15.10-dd1e40c #1
    [    0.940364] Hardware name: Generic DT based system
    [    0.940601] Workqueue: events_unbound async_run_entry_fn
    [    0.941048] PC is at tpm_tis_remove+0x28/0xb4
    [    0.941196] LR is at tpm_tis_core_init+0x170/0x6ac

This is due to an attempt in 'tpm_tis_remove' to use the drvdata, which
was not initialized in 'tpm_tis_core_init' prior to the first error.

Move the initialization of drvdata earlier so 'tpm_tis_remove' has
access to it.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Fixes: 79ca6f74dae0 ("tpm: fix Atmel TPM crash caused by too frequent queries")
Cc: stable@vger.kernel.org
---
 drivers/char/tpm/tpm_tis_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index b2659a4c4016..9813b934e6e4 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -950,6 +950,8 @@ int tpm_tis_core_init(struct device *dev, struct tpm_tis_data *priv, int irq,
 	priv->timeout_max = TPM_TIMEOUT_USECS_MAX;
 	priv->phy_ops = phy_ops;
 
+	dev_set_drvdata(&chip->dev, priv);
+
 	rc = tpm_tis_read32(priv, TPM_DID_VID(0), &vendor);
 	if (rc < 0)
 		goto out_err;
@@ -962,8 +964,6 @@ int tpm_tis_core_init(struct device *dev, struct tpm_tis_data *priv, int irq,
 		priv->timeout_max = TIS_TIMEOUT_MAX_ATML;
 	}
 
-	dev_set_drvdata(&chip->dev, priv);
-
 	if (is_bsw()) {
 		priv->ilb_base_addr = ioremap(INTEL_LEGACY_BLK_BASE_ADDR,
 					ILB_REMAP_SIZE);
-- 
2.32.0

