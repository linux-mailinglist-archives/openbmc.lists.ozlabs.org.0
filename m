Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B8B3C139
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 04:30:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NDWC5nBXzDqKW
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 12:30:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LDsz4Zx2zDqDX
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jun 2019 06:39:49 +1000 (AEST)
X-AuditID: ac10606f-bd5ff70000003de9-9f-5cfacb91d7a2
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 38.D4.15849.19BCAFC5; Fri,  7 Jun 2019 16:39:45 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 7 Jun 2019 16:39:45 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.1 v1] ARM: ASPEED: I2C: Update I2C driver to use
 APB_clk
Date: Fri, 7 Jun 2019 16:39:41 -0400
Message-ID: <1559939981-15837-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgluLIzCtJLcpLzFFi42JZI5AwQXfi6V8xBj2rjSx2Xeaw+H3+L7PF
 qZYXLA7MHlfbd7F7XPx4jNnj/IyFjAHMUVw2Kak5mWWpRfp2CVwZu1o62Qp6JSv2Tl/A1MC4
 VqSLkZNDQsBE4vvD04xdjFwcQgK7mCT+XX7JCJIQEjjEKHGzxR7EZhNQk9i7eQ4TiC0i4Cwx
 d8VJZhCbWcBB4vOuvWC2sECIxP4LK8F6WQRUJPbsXcACYvMC1SzY0sICsUxO4ua5TmaIuKDE
 yZlPWCDmSEgcfPGCGWKvrMStQ4+ZIOoVJJ73PWaZwMg3C0nLLCQtCxiZVjEKJZbk5CZm5qSX
 G+kl5mbqJefnbmKEhFb+DsaPH80PMTJxMAL9w8GsJMJbduFHjBBvSmJlVWpRfnxRaU5q8SFG
 aQ4WJXHeVWu+xQgJpCeWpGanphakFsFkmTg4pRoYs3bdmtsr5WT75MnFF6efy6ZrdEYs9lCQ
 MG/L7lqcrmb9w+5zXuera96Pcl/nznmhtlVow53nXJ83rbN5tmCpfy6HLtuJJYFvpi3fvOCD
 ytZYwdez620b5K/fnplUY7/757XDgXkO+VHiO1eaah9IeO4ZHuG06GTpU6a151J7Ld8u/XHj
 scqjq0osxRmJhlrMRcWJAL5GQrkbAgAA
X-Mailman-Approved-At: Tue, 11 Jun 2019 12:30:09 +1000
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
Cc: openbmc@lists.ozlabs.org, Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update I2C clock driver to calculate the clock frequency based on
apb_clk, instead of bus's parent clock frequency.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 45 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 6c8b38f..9cce1fe 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -167,6 +167,7 @@ struct aspeed_i2c_bus {
 };
 
 static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
+static u32 calculate_APB_clock_freq(struct platform_device *pdev);
 
 static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 {
@@ -862,11 +863,11 @@ static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
 }
 
 /* precondition: bus.lock has been acquired. */
-static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
+static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus, u32 apb_clk)
 {
 	u32 divisor, clk_reg_val;
 
-	divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
+	divisor = DIV_ROUND_UP(apb_clk, bus->bus_frequency);
 	clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
 	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
 			ASPEED_I2CD_TIME_THDSTA_MASK |
@@ -883,12 +884,16 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 			     struct platform_device *pdev)
 {
 	u32 fun_ctrl_reg = ASPEED_I2CD_MASTER_EN;
+	u32 apb_clk;
 	int ret;
 
 	/* Disable everything. */
 	writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
 
-	ret = aspeed_i2c_init_clk(bus);
+	apb_clk = calculate_APB_clock_freq(pdev);
+
+	ret = aspeed_i2c_init_clk(bus, apb_clk);
+
 	if (ret < 0)
 		return ret;
 
@@ -945,6 +950,40 @@ static const struct of_device_id aspeed_i2c_bus_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
 
+static u32 calculate_APB_clock_freq(struct platform_device *pdev)
+{
+	u8 pclk_div;
+	u32 scu_csr, scu_hpll;
+	u32 apb_clk, output_freq;
+	char *baseptr = ioremap(0x1e6e2000, 0x28);
+	const struct of_device_id *of_id = of_match_device(aspeed_i2c_bus_of_table, &pdev->dev);
+
+	scu_csr = readl(baseptr + 0x08);
+	scu_hpll = readl(baseptr + 0x24);
+	pclk_div = (scu_csr & 0x03800000) >> 23; /* 23:25 */
+
+	if (strcmp(of_id->compatible, "aspeed, ast2400-i2c-bus") == 0) {
+		u8 OD, D, N;
+
+		D = scu_hpll & 0x0000000F;         /* 0:3  */
+		OD = (scu_hpll & 0x00000010) >> 4; /* 4    */
+		N = (scu_hpll & 0x000007E0) >> 5;  /* 5:10 */
+		output_freq = (24 * (2 - OD) * ((N+2) / (D+1)) * 1000000); /* Output Frequency */
+
+		apb_clk = (output_freq / ((pclk_div * 2) + 2));
+	} else {
+		u8 M, N, P;
+
+		N = scu_hpll & 0x0000001F;         /* 0:4   */
+		M = (scu_hpll & 0x00001FE0) >> 5;  /* 5:12  */
+		P = (scu_hpll & 0x0007E000) >> 13; /* 13:18 */
+		output_freq = ((24 * ((M+1) / (N+1) / (P+1))) * 1000000); /* Output Frequency */
+
+		apb_clk = (output_freq / ((pclk_div * 4) + 4));
+	}
+	return apb_clk;
+}
+
 static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
-- 
2.7.4

