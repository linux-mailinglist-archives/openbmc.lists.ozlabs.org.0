Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F1D3415C7
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 07:31:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1vF30pXqz3c9f
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 17:31:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=oERjuYIS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QX0i85yG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=oERjuYIS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=QX0i85yG; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1v9p4ZWYz3bwx;
 Fri, 19 Mar 2021 17:29:02 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B11C6580A7D;
 Fri, 19 Mar 2021 02:29:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1OJCjYpu0WKYw
 rWXB0M7VMQlalIINkuei1N/8NZJJdU=; b=oERjuYISFCSJxKjbKgR/eZgJKmap/
 8pvwCrO8bb4Zqd87Iezz7KsA+JSkKC7CbA+8hDFvAG+Hrtw8TJD8e2jZe4S8j56/
 Z5Lckdwh+c0vOtx3IJJt7pE0tijH8+48bRZqEppgWPugoEihX946vsRgZ9Ik28kc
 XOezLj8iQPXq4RySaxzb8Kp8WuGdqudGsmsNMuwLHoUNLx3oaVKf0YBmAJVSlKkU
 /RtrKihnIB49q4uoBx9HVehwRp3JlEvEJthORMq0tqTePm+iWKo74KenQgzS49Qm
 fzgACoKUNjyGuEYC3TdButZApFmOl30cH5nfeRoByBpVCm3tytZJt6WXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1OJCjYpu0WKYwrWXB0M7VMQlalIINkuei1N/8NZJJdU=; b=QX0i85yG
 HXJKjwxQ2dzXgPHKFWkkG8kpM9a1Why2lNBSGW81Wp6+x/t1vUVyj3Aeo/o16dyz
 5Yvts0HlQY5y+dPQ0lBjhFzMXUu0RrCVodQV43fbd2ahZ9+2a9zVG6gy9lu93iiY
 wsVXfa677ivy0YrOZ1xuLWEYtCChnrwoQ4yWvkVvOpVojCfS+v2XomDcm4eZFiny
 WMAkbzWtBqbrF/Hbld7j/hKLZuL3vPsxJRnehVEVW4X2UahWZaGnm1xhYaXKJtU5
 IPpkk728/WmdqsT0wTBhY9Izv3/DVq/KhqjINRIkoE0aB0u0Xlq1q7xGBgjmXBqO
 yphnPZ3VWouz3w==
X-ME-Sender: <xms:rERUYPAJ2Ujh7o1YAUbvqkRO_nzNcQ2bjti11Q6rHJq9qtPRvveW0A>
 <xme:rERUYFj3jJQxTHBfZ7VtIV-KKq1su3IODKP69K8NbCfo3_kTjOfO3RE6vQnHvIXIx
 RsKKMFXW_0X331nyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukedurdeh
 heenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:rERUYKm4vjIemYfQAr1Q5hyO3NkMLGWpLawBk5fneN9mPQF0xIH2nQ>
 <xmx:rERUYBziywMUWCCPq-ghBktFxxBP3on4STsQvDFrZr0pLCDT00Lm8g>
 <xmx:rERUYEQyCMGMuwtpadrINn27XMW9ZAblfE6SH8n3CuPjqY23YU_XWQ>
 <xmx:rERUYNBkiYszQnlNSgAPTtEM0MXP6KnqVAqub1JwiTPfrF8E9sng3A>
Received: from localhost.localdomain
 (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27F11240054;
 Fri, 19 Mar 2021 02:28:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v2 07/21] ipmi: kcs_bmc: Make status update atomic
Date: Fri, 19 Mar 2021 16:57:38 +1030
Message-Id: <20210319062752.145730-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, ryan_chen@aspeedtech.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org,
 chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable more efficient implementation of read-modify-write sequences.
Both device drivers for the KCS BMC stack use regmaps. The new callback
allows us to exploit regmap_update_bits().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
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
index 061f53676206..630cf095560e 100644
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
@@ -342,6 +350,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
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

