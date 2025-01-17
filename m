Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60029A16686
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 07:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc05l3z34z89fK
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2025 16:59:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:d0a:203a::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737125524;
	cv=none; b=FGq3XPs9ekkcbXDkquODQ51AAplyCD5KSqspCgrV5hjSF1Jr5Xz3RtJOkLGmWwQfsGybcpuBhC8km3ESEZ0S5B4PDBSl6nAMxn21bBVh8NgcRFNj90+wBe5o9Y4NYmsO60S34cCKdIRs/+9aJIgbF7IoB+iS8zymP01Qbp/YLcTmbWC4o2S7O01eGdefs6XWgg9WPZKwjAMOPKxRBEnErfCzqC4d2Cc3kS4rLzO0kS8NrJtPtD4W1LSQvPMB5V7czAfpThfbm0XrhAo75iRqZCzx4CcB35LZcJi967vSJ9RvAcsdMPoIHZyaRzwS+yHpqgFZYtHjw44C2/23WklG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737125524; c=relaxed/relaxed;
	bh=ctkbvYOkcB/LZp9RUP1BN2kwHQBeeziAByIspvvw/WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PCIH4vV/zepZvvh/FGCFyNKFyze/IIbCPV82iiZiPRKamxQA+/cdWJ6VCxGAgdg81D8XCcKHT8oJBIXDHWiVDFL60A37V1GlcTNJB3fp8iioLzyhtvPqeqm+OQXmM1RDKDqFQQxwhXrukrNRVjZvXm8s1WC2v/D8qtpHUMJSWr2fCJ5JDc3BKwSUQpNfU3mV2ViDx2wwmJZ1qmujcvAmven5oyifg3KmD+Y6pFarvrcfqY4Qb2TL+gGFAjG6t734Hx80zm18xNg8mYTsb400+KgvkKBqyUf+HSYqmD4T5wJVlAJdLW4kyNC5r8RYC7DMMMpc4fFi2V3zGh3x3G++kQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com; dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=uY/jfRCo; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org) smtp.mailfrom=hetzner.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=hetzner.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hetzner.com header.i=@hetzner.com header.a=rsa-sha256 header.s=lms2212 header.b=uY/jfRCo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hetzner.com (client-ip=2a01:4f8:d0a:203a::1; helo=mail.hetzner.company; envelope-from=tan.siewert@hetzner.com; receiver=lists.ozlabs.org)
Received: from mail.hetzner.company (mail.hetzner.company [IPv6:2a01:4f8:d0a:203a::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZN434ZlMz30YS
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2025 01:52:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=ctkbvYOkcB/LZp9RUP1BN2kwHQBeeziAByIspvvw/WE=; b=uY/jfR
	Co58qUrRYXpJv8kKAvX+d3VRzTUP1htGXwvpJATu9lgJm3oi1eCTS6FS8BNVizE5K7r89kixBFMal
	3fPNz/2lN4R1DDehuqSudxaenlbwGkJ1U+D7NdFTtNbqnmJzK1qbpNdsG4v8JQJ7ORRTPBMeogssq
	JKwuOnUDkCRp/PMOrLp4HhQSzDIBEeb2EcnCPnAo4YiTEaJVekjXEU38jzWIF5oFuZ4cEHqvbY6Sa
	fm6IzuImacCuTWSy7nCoWF5xWPZfPbwe749p7aPFiVn7o/7JyWMznnuK5F5h6tFsR0x/KBDPxcD+k
	dDH+divj1u5WIHD+QIyFg9RFL5bw==;
Received: from [2a01:4f8:0:a0a7::4c:0] (helo=localhost.localdomain)
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1tYiu4-000A1S-AQ; Fri, 17 Jan 2025 10:44:36 +0100
From: Tan Siewert <tan.siewert@hetzner.com>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 12/12] i2c: eeprom: Use reg property instead of offset and size
Date: Fri, 17 Jan 2025 10:44:31 +0100
Message-ID: <20250117094434.16641-13-tan.siewert@hetzner.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250117094434.16641-1-tan.siewert@hetzner.com>
References: <20250117094434.16641-1-tan.siewert@hetzner.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: tom.siewert@hetzner.com
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 20 Jan 2025 16:58:31 +1100
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
Cc: Simon Glass <sjg@chromium.org>, Tan Siewert <tan.siewert@hetzner.com>, Michal Simek <michal.simek@xilinx.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Michal Simek <michal.simek@xilinx.com>

Remove adhoc dt binding for fixed-partition definition for i2c eeprom.
fixed-partition are using reg property instead of offset/size pair.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
(cherry picked from commit f692b479f02d9b2689b0686f1f6ff2f06c6ecc59)
Signed-off-by: Tan Siewert <tan.siewert@hetzner.com>
---
 arch/sandbox/dts/test.dts | 13 +++++++++++++
 configs/sandbox_defconfig |  1 +
 drivers/misc/i2c_eeprom.c | 15 ++++++++-------
 test/dm/bootcount.c       |  8 ++++++++
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index b7051610865..39e3fb712a6 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -282,6 +282,14 @@
 			reg = <0x2c>;
 			compatible = "i2c-eeprom";
 			sandbox,emul = <&emul_eeprom>;
+			partitions {
+				compatible = "fixed-partitions";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				bootcount_i2c: bootcount@10 {
+					reg = <10 2>;
+				};
+			};
 		};
 
 		rtc_0: rtc@43 {
@@ -329,6 +337,11 @@
 		offset = <0x13>;
 	};
 
+	bootcount {
+		compatible = "u-boot,bootcount-i2c-eeprom";
+		i2c-eeprom = <&bootcount_i2c>;
+	};
+
 	adc@0 {
 		compatible = "sandbox,adc";
 		vdd-supply = <&buck2>;
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 193e41896cb..236ba5f69ba 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -90,6 +90,7 @@ CONFIG_AXI_SANDBOX=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_DM_BOOTCOUNT=y
 CONFIG_DM_BOOTCOUNT_RTC=y
+CONFIG_DM_BOOTCOUNT_I2C_EEPROM=y
 CONFIG_CLK=y
 CONFIG_CPU=y
 CONFIG_DM_DEMO=y
diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 32a1b208567..5cfcc4729f1 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -300,19 +300,20 @@ static int i2c_eeprom_partition_probe(struct udevice *dev)
 static int i2c_eeprom_partition_ofdata_to_platdata(struct udevice *dev)
 {
 	struct i2c_eeprom_partition *priv = dev_get_priv(dev);
-	u32 offset, size;
+	u32 reg[2];
 	int ret;
 
-	ret = dev_read_u32(dev, "offset", &offset);
+	ret = dev_read_u32_array(dev, "reg", reg, 2);
 	if (ret)
 		return ret;
 
-	ret = dev_read_u32(dev, "size", &size);
-	if (ret)
-		return ret;
+	if (!reg[1])
+		return -EINVAL;
+
+	priv->offset = reg[0];
+	priv->size = reg[1];
 
-	priv->offset = offset;
-	priv->size = size;
+	debug("%s: base %x, size %x\n", __func__, priv->offset, priv->size);
 
 	return 0;
 }
diff --git a/test/dm/bootcount.c b/test/dm/bootcount.c
index 0817b7d3ec1..21f332d9b9d 100644
--- a/test/dm/bootcount.c
+++ b/test/dm/bootcount.c
@@ -23,6 +23,14 @@ static int dm_test_bootcount(struct unit_test_state *uts)
 	ut_assertok(dm_bootcount_get(dev, &val));
 	ut_assert(val == 0xab);
 
+	ut_assertok(uclass_get_device(UCLASS_BOOTCOUNT, 1, &dev));
+	ut_assertok(dm_bootcount_set(dev, 0));
+	ut_assertok(dm_bootcount_get(dev, &val));
+	ut_assert(val == 0);
+	ut_assertok(dm_bootcount_set(dev, 0xab));
+	ut_assertok(dm_bootcount_get(dev, &val));
+	ut_assert(val == 0xab);
+
 	return 0;
 }
 
-- 
2.47.0

