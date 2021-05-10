Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD51377C80
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 08:51:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdsD049kkz305k
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 16:51:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=SptGowtO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cfAnPvnf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=SptGowtO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=cfAnPvnf; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdsBd4YZKz2yQw
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 16:50:33 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 994F916D8;
 Mon, 10 May 2021 02:50:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 10 May 2021 02:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=6Uea664nPRPJW
 hpDpJLduUQkBg1kUPfswLwaWuNq4Mc=; b=SptGowtOdZVsQ6i82ieEH1Qe6kVXg
 vPFbatDvJjvAt6cMLMvbCo/8fPtTFJvqj7x9hBlv1DI1VZqTrCYfnRpbbxVcNmr+
 9r7xLjALfCpJ3JQcKeursvv9ZOSHl7+VITT9GjVzCxf81n82T0eCk+83TUv4W3rX
 yiSMErdqk8pGNBViQs7teJDGr4AW8XuGOglH3PcTxKoaWI3AcNfzAYAI6NI09wTm
 io1vd4sj2MXMjPB9adZ81aXZkuzd0a3jzvs+CR7nyBfhubq1t5O0KTk9nxyKG2fu
 WjvOgQj3rtUZtfcIU2eJ5On9NTLYnQZP4cGV5bPLqHB02x5QAqC3Xak8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=6Uea664nPRPJWhpDpJLduUQkBg1kUPfswLwaWuNq4Mc=; b=cfAnPvnf
 Yh9ShUpa9nhLxXTcUF0DqdgJOKjMXk+7XUTCP+OIScps3Qt5AV6B53UF5W2R6PWY
 hTk2N4EUiyUA8LfkaRIiMwFD3Vwa5z055orMJlr0Tuun8cGXU8fiJkVVyI8UzmnO
 hp1pFyZ+V9MqMRYIISRxEk6UU271Yj1o+u5UVVbGrdrJ+tcfgip7drVL2ks2RfHx
 YxMdPjzBML+w4XJU04wcMlYWCffFPnb98CogJTCUG8gP9kbslSZ4IcAjsV3Qz+cr
 fyGEMp42cQD1JBGgCNNRDtoWBVAeYfMO7eRuJX/J6vtMHcznCDyrn6fbKUmZ0YJX
 dEFvklKkTdAwkA==
X-ME-Sender: <xms:t9eYYFHMsol3PG3uua1SVE0gJ1aoJzXyK7cIOfCraoD3OBXa53oDtA>
 <xme:t9eYYKXgUyUCCv23b9qQ3ZmpRPrzM8zkcDDHGAu0Ag6A0b8_fuqskz29zSHN9fzNj
 JBgxpBF3ju7nOav4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepvddtfedrheejrddvudehrdek
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:t9eYYHI8B2a_vpuDPacD08OOmISf64gif0zVM9eVGXqPK8oJXmYTVw>
 <xmx:t9eYYLGUXsuWlJv0xuJ63Wp8GN7FFKFJdWbQ1o55JhsDLFK0U6HPiQ>
 <xmx:t9eYYLUZTF4saq4zSqskFNYFn82zhZ626aFe2CT1Nw87eU42lsPYgg>
 <xmx:t9eYYCCj80qbmiJ3bGu830MWAcSxc9b2XbVQdpsBDEM9EnbeDadc3g>
Received: from localhost.localdomain (203-57-215-8.dyn.iinet.net.au
 [203.57.215.8]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 02:50:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v3 02/18] ipmi: kcs_bmc: Make status update
 atomic
Date: Mon, 10 May 2021 16:19:39 +0930
Message-Id: <20210510064955.1704652-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510064955.1704652-1-andrew@aj.id.au>
References: <20210510064955.1704652-1-andrew@aj.id.au>
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

Enable more efficient implementation of read-modify-write sequences.
Both device drivers for the KCS BMC stack use regmaps. The new callback
allows us to exploit regmap_update_bits().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
---
 drivers/char/ipmi/kcs_bmc.c         |  7 +------
 drivers/char/ipmi/kcs_bmc.h         |  1 +
 drivers/char/ipmi/kcs_bmc_aspeed.c  |  9 +++++++++
 drivers/char/ipmi/kcs_bmc_npcm7xx.c | 10 ++++++++++
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index f292e74bd4a5..58fb1a7bd50d 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -67,12 +67,7 @@ static inline void write_status(struct kcs_bmc *kcs_bmc, u8 data)
 
 static void update_status_bits(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
 {
-	u8 tmp = read_status(kcs_bmc);
-
-	tmp &= ~mask;
-	tmp |= val & mask;
-
-	write_status(kcs_bmc, tmp);
+	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
 }
 
 static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index eb9ea4ce78b8..970f53892f2d 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -76,6 +76,7 @@ struct kcs_bmc {
 	struct kcs_ioreg ioreg;
 	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
 	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
+	void (*io_updateb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val);
 
 	enum kcs_phases phase;
 	enum kcs_errors error;
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index e3613108ffdf..b89a2acd09b9 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -90,6 +90,14 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
 	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
 }
 
+static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val)
+{
+	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	int rc;
+
+	rc = regmap_update_bits(priv->map, reg, mask, val);
+	WARN(rc != 0, "regmap_update_bits() failed: %d\n", rc);
+}
 
 /*
  * AST_usrGuide_KCS.pdf
@@ -343,6 +351,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	kcs_bmc->ioreg = ast_kcs_bmc_ioregs[channel - 1];
 	kcs_bmc->io_inputb = aspeed_kcs_inb;
 	kcs_bmc->io_outputb = aspeed_kcs_outb;
+	kcs_bmc->io_updateb = aspeed_kcs_updateb;
 
 	addr = ops->get_io_address(pdev);
 	if (addr < 0)
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index 722f7391fe1f..1f44aadec9e8 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -97,6 +97,15 @@ static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
 	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
 }
 
+static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 data)
+{
+	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
+	int rc;
+
+	rc = regmap_update_bits(priv->map, reg, mask, data);
+	WARN(rc != 0, "regmap_update_bits() failed: %d\n", rc);
+}
+
 static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
 {
 	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
@@ -163,6 +172,7 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 	kcs_bmc->ioreg.str = priv->reg->sts;
 	kcs_bmc->io_inputb = npcm7xx_kcs_inb;
 	kcs_bmc->io_outputb = npcm7xx_kcs_outb;
+	kcs_bmc->io_updateb = npcm7xx_kcs_updateb;
 
 	dev_set_drvdata(dev, kcs_bmc);
 
-- 
2.27.0

