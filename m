Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649F233B27
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 00:13:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHl6Z4yyBzDrCQ
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 08:13:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHkvN0CdxzDrBd
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 08:03:43 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UM2qDV182994; Thu, 30 Jul 2020 18:03:34 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32krgegqek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 18:03:34 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UM0lWB031482;
 Thu, 30 Jul 2020 22:03:34 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 32gcy514tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 22:03:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06UM3U3t27263522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 22:03:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4B9878070;
 Thu, 30 Jul 2020 22:03:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4AF37806D;
 Thu, 30 Jul 2020 22:03:32 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.50.101])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 22:03:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.7 v2 5/7] spi: fsi: Implement restricted size for
 certain controllers
Date: Thu, 30 Jul 2020 17:03:28 -0500
Message-Id: <20200730220330.16368-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200730220330.16368-1-eajames@linux.ibm.com>
References: <20200730220330.16368-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_18:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=1 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300153
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
Cc: bradleyb@fuzziesquirrel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some of the FSI-attached SPI controllers cannot use the loop command in
programming the sequencer due to security requirements. Add a boolean
devicetree property that describes this condition and restrict the
size for these controllers. Also, add more transfers directly in the
sequence up to the length of the sequence register.

Fixes: bbb6b2f9865b ("spi: Add FSI-attached SPI controller driver")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/spi/spi-fsi.c | 65 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index c31a852b6a3e..53cfa201e187 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -24,7 +24,8 @@
 
 #define SPI_FSI_BASE			0x70000
 #define SPI_FSI_INIT_TIMEOUT_MS		1000
-#define SPI_FSI_MAX_TRANSFER_SIZE	2048
+#define SPI_FSI_MAX_XFR_SIZE		2048
+#define SPI_FSI_MAX_XFR_SIZE_RESTRICTED	32
 
 #define SPI_FSI_ERROR			0x0
 #define SPI_FSI_COUNTER_CFG		0x1
@@ -74,6 +75,8 @@ struct fsi_spi {
 	struct device *dev;	/* SPI controller device */
 	struct fsi_device *fsi;	/* FSI2SPI CFAM engine device */
 	u32 base;
+	size_t max_xfr_size;
+	bool restricted;
 };
 
 struct fsi_spi_sequence {
@@ -209,8 +212,12 @@ static int fsi_spi_reset(struct fsi_spi *ctx)
 	if (rc)
 		return rc;
 
-	return fsi_spi_write_reg(ctx, SPI_FSI_CLOCK_CFG,
-				 SPI_FSI_CLOCK_CFG_RESET2);
+	rc = fsi_spi_write_reg(ctx, SPI_FSI_CLOCK_CFG,
+			       SPI_FSI_CLOCK_CFG_RESET2);
+	if (rc)
+		return rc;
+
+	return fsi_spi_write_reg(ctx, SPI_FSI_STATUS, 0ULL);
 }
 
 static int fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
@@ -218,8 +225,8 @@ static int fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
 	/*
 	 * Add the next byte of instruction to the 8-byte sequence register.
 	 * Then decrement the counter so that the next instruction will go in
-	 * the right place. Return the number of "slots" left in the sequence
-	 * register.
+	 * the right place. Return the index of the slot we just filled in the
+	 * sequence register.
 	 */
 	seq->data |= (u64)val << seq->bit;
 	seq->bit -= 8;
@@ -237,9 +244,11 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
 				     struct fsi_spi_sequence *seq,
 				     struct spi_transfer *transfer)
 {
+	bool docfg = false;
 	int loops;
 	int idx;
 	int rc;
+	u8 val = 0;
 	u8 len = min(transfer->len, 8U);
 	u8 rem = transfer->len % len;
 	u64 cfg = 0ULL;
@@ -247,22 +256,42 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
 	loops = transfer->len / len;
 
 	if (transfer->tx_buf) {
-		idx = fsi_spi_sequence_add(seq,
-					   SPI_FSI_SEQUENCE_SHIFT_OUT(len));
+		val = SPI_FSI_SEQUENCE_SHIFT_OUT(len);
+		idx = fsi_spi_sequence_add(seq, val);
+
 		if (rem)
 			rem = SPI_FSI_SEQUENCE_SHIFT_OUT(rem);
 	} else if (transfer->rx_buf) {
-		idx = fsi_spi_sequence_add(seq,
-					   SPI_FSI_SEQUENCE_SHIFT_IN(len));
+		val = SPI_FSI_SEQUENCE_SHIFT_IN(len);
+		idx = fsi_spi_sequence_add(seq, val);
+
 		if (rem)
 			rem = SPI_FSI_SEQUENCE_SHIFT_IN(rem);
 	} else {
 		return -EINVAL;
 	}
 
+	if (ctx->restricted) {
+		const int eidx = rem ? 5 : 6;
+
+		while (loops > 1 && idx <= eidx) {
+			idx = fsi_spi_sequence_add(seq, val);
+			loops--;
+			docfg = true;
+		}
+
+		if (loops > 1) {
+			dev_warn(ctx->dev, "No sequencer slots; aborting.\n");
+			return -EINVAL;
+		}
+	}
+
 	if (loops > 1) {
 		fsi_spi_sequence_add(seq, SPI_FSI_SEQUENCE_BRANCH(idx));
+		docfg = true;
+	}
 
+	if (docfg) {
 		cfg = SPI_FSI_COUNTER_CFG_LOOPS(loops - 1);
 		if (transfer->rx_buf)
 			cfg |= SPI_FSI_COUNTER_CFG_N2_RX |
@@ -273,6 +302,8 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
 		rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, cfg);
 		if (rc)
 			return rc;
+	} else {
+		fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, 0ULL);
 	}
 
 	if (rem)
@@ -429,7 +460,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 
 		/* Sequencer must do shift out (tx) first. */
 		if (!transfer->tx_buf ||
-		    transfer->len > SPI_FSI_MAX_TRANSFER_SIZE) {
+		    transfer->len > (ctx->max_xfr_size + 8)) {
 			rc = -EINVAL;
 			goto error;
 		}
@@ -453,7 +484,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 
 			/* Sequencer can only do shift in (rx) after tx. */
 			if (next->rx_buf) {
-				if (next->len > SPI_FSI_MAX_TRANSFER_SIZE) {
+				if (next->len > ctx->max_xfr_size) {
 					rc = -EINVAL;
 					goto error;
 				}
@@ -498,7 +529,9 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 
 static size_t fsi_spi_max_transfer_size(struct spi_device *spi)
 {
-	return SPI_FSI_MAX_TRANSFER_SIZE;
+	struct fsi_spi *ctx = spi_controller_get_devdata(spi->controller);
+
+	return ctx->max_xfr_size;
 }
 
 static int fsi_spi_probe(struct device *dev)
@@ -546,6 +579,14 @@ static int fsi_spi_probe(struct device *dev)
 		ctx->fsi = fsi;
 		ctx->base = base + SPI_FSI_BASE;
 
+		if (of_property_read_bool(np, "fsi2spi,restricted")) {
+			ctx->restricted = true;
+			ctx->max_xfr_size = SPI_FSI_MAX_XFR_SIZE_RESTRICTED;
+		} else {
+			ctx->restricted = false;
+			ctx->max_xfr_size = SPI_FSI_MAX_XFR_SIZE;
+		}
+
 		rc = devm_spi_register_controller(dev, ctlr);
 		if (rc)
 			spi_controller_put(ctlr);
-- 
2.24.0

