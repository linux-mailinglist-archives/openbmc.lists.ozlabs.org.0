Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C51414749
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 13:07:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDwVB1MbVz3c5w
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 21:06:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDvkB45JCz2xWT;
 Wed, 22 Sep 2021 20:32:18 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18MAB8vj012567;
 Wed, 22 Sep 2021 18:11:08 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Sep
 2021 18:31:26 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <adrian.hunter@intel.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <andrew@aj.id.au>
Subject: [PATCH 05/10] mmc: aspeed: Adjust delay taps calculation method
Date: Wed, 22 Sep 2021 18:31:11 +0800
Message-ID: <20210922103116.30652-6-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18MAB8vj012567
X-Mailman-Approved-At: Wed, 22 Sep 2021 21:04:50 +1000
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
Cc: BMC-SW@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

- The maximum tap delay may be slightly different on
  different platforms. It may also be different due to
  different SoC processes or different manufacturers.
  Thus, the maximum tap delay should be gotten from the
  device tree through max-tap-delay property.
- The delay time for each tap is an absolute value which
  is independent of clock frequency. But, in order to combine
  this principle with "phase" concept, clock frequency is took
  into consideration during calculating delay taps.
- The delay cell of eMMC device is non-uniform.
  The time period of the first tap is two times of others.
- The clock phase degree range is from -360 to 360.
  But, if the clock phase signedness is negative, clock signal
  is output from the falling edge first by default and thus, clock
  signal is leading to data signal by 90 degrees at least.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 115 ++++++++++++++++++++++-------
 1 file changed, 89 insertions(+), 26 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index c6eaeb02e3f9..739c9503a5ed 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -44,6 +44,7 @@ struct aspeed_sdc {
 
 	spinlock_t lock;
 	void __iomem *regs;
+	u32 max_tap_delay_ps;
 };
 
 struct aspeed_sdhci_tap_param {
@@ -63,6 +64,7 @@ struct aspeed_sdhci_tap_desc {
 struct aspeed_sdhci_phase_desc {
 	struct aspeed_sdhci_tap_desc in;
 	struct aspeed_sdhci_tap_desc out;
+	u32 nr_taps;
 };
 
 struct aspeed_sdhci_pdata {
@@ -158,43 +160,60 @@ aspeed_sdc_set_phase_taps(struct aspeed_sdc *sdc,
 }
 
 #define PICOSECONDS_PER_SECOND		1000000000000ULL
-#define ASPEED_SDHCI_NR_TAPS		15
-/* Measured value with *handwave* environmentals and static loading */
-#define ASPEED_SDHCI_MAX_TAP_DELAY_PS	1253
+#define ASPEED_SDHCI_MAX_TAPS		15
+
 static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
-				     int phase_deg)
+				     bool invert, int phase_deg, u32 nr_taps)
 {
 	u64 phase_period_ps;
 	u64 prop_delay_ps;
 	u64 clk_period_ps;
-	unsigned int tap;
-	u8 inverted;
+	u32 tap = 0;
+	struct aspeed_sdc *sdc = dev_get_drvdata(dev->parent);
 
-	phase_deg %= 360;
+	if (sdc->max_tap_delay_ps == 0)
+		return 0;
 
-	if (phase_deg >= 180) {
-		inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
-		phase_deg -= 180;
-		dev_dbg(dev,
-			"Inverting clock to reduce phase correction from %d to %d degrees\n",
-			phase_deg + 180, phase_deg);
-	} else {
-		inverted = 0;
+	prop_delay_ps = sdc->max_tap_delay_ps / nr_taps;
+	clk_period_ps = div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
+
+	/*
+	 * For ast2600, if clock phase degree is negative, clock signal is
+	 * output from falling edge first by default. Namely, clock signal
+	 * is leading to data signal by 90 degrees at least.
+	 */
+	if (invert) {
+		if (phase_deg >= 90)
+			phase_deg -= 90;
+		else
+			phase_deg = 0;
 	}
 
-	prop_delay_ps = ASPEED_SDHCI_MAX_TAP_DELAY_PS / ASPEED_SDHCI_NR_TAPS;
-	clk_period_ps = div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
 	phase_period_ps = div_u64((u64)phase_deg * clk_period_ps, 360ULL);
 
-	tap = div_u64(phase_period_ps, prop_delay_ps);
-	if (tap > ASPEED_SDHCI_NR_TAPS) {
+	/*
+	 * The delay cell is non-uniform for eMMC controller.
+	 * The time period of the first tap is two times of others.
+	 */
+	if (nr_taps == 16 && phase_period_ps > prop_delay_ps * 2) {
+		phase_period_ps -= prop_delay_ps * 2;
+		tap++;
+	}
+
+	tap += div_u64(phase_period_ps, prop_delay_ps);
+	if (tap > ASPEED_SDHCI_MAX_TAPS) {
 		dev_dbg(dev,
 			 "Requested out of range phase tap %d for %d degrees of phase compensation at %luHz, clamping to tap %d\n",
-			 tap, phase_deg, rate_hz, ASPEED_SDHCI_NR_TAPS);
-		tap = ASPEED_SDHCI_NR_TAPS;
+			 tap, phase_deg, rate_hz, ASPEED_SDHCI_MAX_TAPS);
+		tap = ASPEED_SDHCI_MAX_TAPS;
 	}
 
-	return inverted | tap;
+	if (invert) {
+		dev_info(dev, "invert the clock\n");
+		tap |= ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
+	}
+
+	return tap;
 }
 
 static void
@@ -202,13 +221,19 @@ aspeed_sdhci_phases_to_taps(struct device *dev, unsigned long rate,
 			    const struct mmc_clk_phase *phases,
 			    struct aspeed_sdhci_tap_param *taps)
 {
+	struct sdhci_host *host = dev->driver_data;
+	struct aspeed_sdhci *sdhci;
+
+	sdhci = sdhci_pltfm_priv(sdhci_priv(host));
 	taps->valid = phases->valid;
 
 	if (!phases->valid)
 		return;
 
-	taps->in = aspeed_sdhci_phase_to_tap(dev, rate, phases->in_deg);
-	taps->out = aspeed_sdhci_phase_to_tap(dev, rate, phases->out_deg);
+	taps->in = aspeed_sdhci_phase_to_tap(dev, rate, phases->inv_in_deg,
+				phases->in_deg, sdhci->phase_desc->nr_taps);
+	taps->out = aspeed_sdhci_phase_to_tap(dev, rate, phases->inv_out_deg,
+				phases->out_deg, sdhci->phase_desc->nr_taps);
 }
 
 static void
@@ -230,8 +255,8 @@ aspeed_sdhci_configure_phase(struct sdhci_host *host, unsigned long rate)
 	aspeed_sdc_set_phase_taps(sdhci->parent, sdhci->phase_desc, taps);
 	dev_dbg(dev,
 		"Using taps [%d, %d] for [%d, %d] degrees of phase correction at %luHz (%d)\n",
-		taps->in & ASPEED_SDHCI_NR_TAPS,
-		taps->out & ASPEED_SDHCI_NR_TAPS,
+		taps->in & ASPEED_SDHCI_MAX_TAPS,
+		taps->out & ASPEED_SDHCI_MAX_TAPS,
 		params->in_deg, params->out_deg, rate, host->timing);
 }
 
@@ -493,6 +518,7 @@ static const struct aspeed_sdhci_phase_desc ast2600_sdhci_phase[] = {
 			.enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN,
 			.enable_value = 3,
 		},
+		.nr_taps = 15,
 	},
 	/* SDHCI/Slot 1 */
 	[1] = {
@@ -506,6 +532,31 @@ static const struct aspeed_sdhci_phase_desc ast2600_sdhci_phase[] = {
 			.enable_mask = ASPEED_SDC_S1_PHASE_OUT_EN,
 			.enable_value = 3,
 		},
+		.nr_taps = 15,
+	},
+};
+
+static const struct aspeed_sdhci_phase_desc ast2600_emmc_phase[] = {
+	/* eMMC slot 0 */
+	[0] = {
+		.in = {
+			.tap_mask = ASPEED_SDC_S0_PHASE_IN,
+			.enable_mask = ASPEED_SDC_S0_PHASE_IN_EN,
+			.enable_value = 1,
+		},
+		.out = {
+			.tap_mask = ASPEED_SDC_S0_PHASE_OUT,
+			.enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN,
+			.enable_value = 3,
+		},
+
+		/*
+		 * There are 15 taps recorded in AST2600 datasheet.
+		 * But, actually, the time period of the first tap
+		 * is two times of others. Thus, 16 tap is used to
+		 * emulate this situation.
+		 */
+		.nr_taps = 16,
 	},
 };
 
@@ -515,10 +566,17 @@ static const struct aspeed_sdhci_pdata ast2600_sdhci_pdata = {
 	.nr_phase_descs = ARRAY_SIZE(ast2600_sdhci_phase),
 };
 
+static const struct aspeed_sdhci_pdata ast2600_emmc_pdata = {
+	.clk_div_start = 1,
+	.phase_desc = ast2600_emmc_phase,
+	.nr_phase_descs = ARRAY_SIZE(ast2600_emmc_phase),
+};
+
 static const struct of_device_id aspeed_sdhci_of_match[] = {
 	{ .compatible = "aspeed,ast2400-sdhci", .data = &ast2400_sdhci_pdata, },
 	{ .compatible = "aspeed,ast2500-sdhci", .data = &ast2400_sdhci_pdata, },
 	{ .compatible = "aspeed,ast2600-sdhci", .data = &ast2600_sdhci_pdata, },
+	{ .compatible = "aspeed,ast2600-emmc", .data = &ast2600_emmc_pdata, },
 	{ }
 };
 
@@ -562,6 +620,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	ret = of_property_read_u32(pdev->dev.of_node, "max-tap-delay",
+			&sdc->max_tap_delay_ps);
+	if (ret)
+		sdc->max_tap_delay_ps = 0;
+
 	dev_set_drvdata(&pdev->dev, sdc);
 
 	parent = pdev->dev.of_node;
-- 
2.17.1

