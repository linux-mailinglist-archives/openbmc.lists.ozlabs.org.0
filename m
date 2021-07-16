Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9843CB800
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 15:40:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRC6P1Kbnz3bWP
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 23:40:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=htnD7WVd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=htnD7WVd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRC5b1KmTz2ydS
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jul 2021 23:39:30 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GDYW63062652; Fri, 16 Jul 2021 09:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=slvURfK42HlG3ei5da4DqtPvMXgRau9A4KDIJSa10l0=;
 b=htnD7WVdxaCeauJCbQcaNyTdEWJzCLjVbh+BMChhfVJMIJVP7EeDeW9Y2P8cAzHs/j1J
 RtJ3ZVm7Zp6r0JOsqYuAI7F1RjcQQDZL/kENhWLXgh4HLGDjjLGchnmfhoJ2KhXTImhc
 RaKKhpfkV1WPvIuRDvRKkCdcCOs3HBKt/XiOwkBeQgbNGYUdgd4tGAGoQ6buVpgNMlh2
 HlaUyQxevHqGgZLuILcModuQvHXZ2jkPnZ1g8xwSnm/24Nx5FBuRRksB0VibbfQpxCLr
 OFFZ8ll9QLTnbob4y/J3rB4/QSweye5TZGOz4lVh5zLONsle5D81U0ycMBSQnqP881Pu xQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tyncjdrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 09:39:27 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GDWeta032191;
 Fri, 16 Jul 2021 13:39:26 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 39qt3etdrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 13:39:26 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GDdOZb27722026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 13:39:24 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B78C86E058;
 Fri, 16 Jul 2021 13:39:24 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57F466E050;
 Fri, 16 Jul 2021 13:39:24 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 13:39:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
Date: Fri, 16 Jul 2021 08:39:14 -0500
Message-Id: <20210716133915.14697-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716133915.14697-1-eajames@linux.ibm.com>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RmY9LR1ngEOjPHezr4i17mbeuZORckKt
X-Proofpoint-ORIG-GUID: RmY9LR1ngEOjPHezr4i17mbeuZORckKt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160082
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, broonie@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Security changes have forced the SPI controllers to be limited to
8 byte reads. Refactor the sequencing to just handle 8 bytes at a
time.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/spi/spi-fsi.c | 125 ++++++++----------------------------------
 1 file changed, 22 insertions(+), 103 deletions(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index 87f8829c3995..829770b8ec74 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -25,16 +25,11 @@
 
 #define SPI_FSI_BASE			0x70000
 #define SPI_FSI_INIT_TIMEOUT_MS		1000
-#define SPI_FSI_MAX_XFR_SIZE		2048
-#define SPI_FSI_MAX_XFR_SIZE_RESTRICTED	8
+#define SPI_FSI_MAX_RX_SIZE		8
+#define SPI_FSI_MAX_TX_SIZE		40
 
 #define SPI_FSI_ERROR			0x0
 #define SPI_FSI_COUNTER_CFG		0x1
-#define  SPI_FSI_COUNTER_CFG_LOOPS(x)	 (((u64)(x) & 0xffULL) << 32)
-#define  SPI_FSI_COUNTER_CFG_N2_RX	 BIT_ULL(8)
-#define  SPI_FSI_COUNTER_CFG_N2_TX	 BIT_ULL(9)
-#define  SPI_FSI_COUNTER_CFG_N2_IMPLICIT BIT_ULL(10)
-#define  SPI_FSI_COUNTER_CFG_N2_RELOAD	 BIT_ULL(11)
 #define SPI_FSI_CFG1			0x2
 #define SPI_FSI_CLOCK_CFG		0x3
 #define  SPI_FSI_CLOCK_CFG_MM_ENABLE	 BIT_ULL(32)
@@ -76,8 +71,6 @@ struct fsi_spi {
 	struct device *dev;	/* SPI controller device */
 	struct fsi_device *fsi;	/* FSI2SPI CFAM engine device */
 	u32 base;
-	size_t max_xfr_size;
-	bool restricted;
 };
 
 struct fsi_spi_sequence {
@@ -241,7 +234,7 @@ static int fsi_spi_reset(struct fsi_spi *ctx)
 	return fsi_spi_write_reg(ctx, SPI_FSI_STATUS, 0ULL);
 }
 
-static int fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
+static void fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
 {
 	/*
 	 * Add the next byte of instruction to the 8-byte sequence register.
@@ -251,8 +244,6 @@ static int fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
 	 */
 	seq->data |= (u64)val << seq->bit;
 	seq->bit -= 8;
-
-	return ((64 - seq->bit) / 8) - 2;
 }
 
 static void fsi_spi_sequence_init(struct fsi_spi_sequence *seq)
@@ -261,71 +252,11 @@ static void fsi_spi_sequence_init(struct fsi_spi_sequence *seq)
 	seq->data = 0ULL;
 }
 
-static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
-				     struct fsi_spi_sequence *seq,
-				     struct spi_transfer *transfer)
-{
-	int loops;
-	int idx;
-	int rc;
-	u8 val = 0;
-	u8 len = min(transfer->len, 8U);
-	u8 rem = transfer->len % len;
-
-	loops = transfer->len / len;
-
-	if (transfer->tx_buf) {
-		val = SPI_FSI_SEQUENCE_SHIFT_OUT(len);
-		idx = fsi_spi_sequence_add(seq, val);
-
-		if (rem)
-			rem = SPI_FSI_SEQUENCE_SHIFT_OUT(rem);
-	} else if (transfer->rx_buf) {
-		val = SPI_FSI_SEQUENCE_SHIFT_IN(len);
-		idx = fsi_spi_sequence_add(seq, val);
-
-		if (rem)
-			rem = SPI_FSI_SEQUENCE_SHIFT_IN(rem);
-	} else {
-		return -EINVAL;
-	}
-
-	if (ctx->restricted && loops > 1) {
-		dev_warn(ctx->dev,
-			 "Transfer too large; no branches permitted.\n");
-		return -EINVAL;
-	}
-
-	if (loops > 1) {
-		u64 cfg = SPI_FSI_COUNTER_CFG_LOOPS(loops - 1);
-
-		fsi_spi_sequence_add(seq, SPI_FSI_SEQUENCE_BRANCH(idx));
-
-		if (transfer->rx_buf)
-			cfg |= SPI_FSI_COUNTER_CFG_N2_RX |
-				SPI_FSI_COUNTER_CFG_N2_TX |
-				SPI_FSI_COUNTER_CFG_N2_IMPLICIT |
-				SPI_FSI_COUNTER_CFG_N2_RELOAD;
-
-		rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, cfg);
-		if (rc)
-			return rc;
-	} else {
-		fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, 0ULL);
-	}
-
-	if (rem)
-		fsi_spi_sequence_add(seq, rem);
-
-	return 0;
-}
-
 static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 				 struct spi_transfer *transfer)
 {
 	int rc = 0;
 	u64 status = 0ULL;
-	u64 cfg = 0ULL;
 
 	if (transfer->tx_buf) {
 		int nb;
@@ -363,16 +294,6 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 		u64 in = 0ULL;
 		u8 *rx = transfer->rx_buf;
 
-		rc = fsi_spi_read_reg(ctx, SPI_FSI_COUNTER_CFG, &cfg);
-		if (rc)
-			return rc;
-
-		if (cfg & SPI_FSI_COUNTER_CFG_N2_IMPLICIT) {
-			rc = fsi_spi_write_reg(ctx, SPI_FSI_DATA_TX, 0);
-			if (rc)
-				return rc;
-		}
-
 		while (transfer->len > recv) {
 			do {
 				rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS,
@@ -439,6 +360,10 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
 		}
 	} while (seq_state && (seq_state != SPI_FSI_STATUS_SEQ_STATE_IDLE));
 
+	rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, 0ULL);
+	if (rc)
+		return rc;
+
 	rc = fsi_spi_read_reg(ctx, SPI_FSI_CLOCK_CFG, &clock_cfg);
 	if (rc)
 		return rc;
@@ -459,6 +384,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 {
 	int rc;
 	u8 seq_slave = SPI_FSI_SEQUENCE_SEL_SLAVE(mesg->spi->chip_select + 1);
+	unsigned int len;
 	struct spi_transfer *transfer;
 	struct fsi_spi *ctx = spi_controller_get_devdata(ctlr);
 
@@ -471,8 +397,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 		struct spi_transfer *next = NULL;
 
 		/* Sequencer must do shift out (tx) first. */
-		if (!transfer->tx_buf ||
-		    transfer->len > (ctx->max_xfr_size + 8)) {
+		if (!transfer->tx_buf || transfer->len > SPI_FSI_MAX_TX_SIZE) {
 			rc = -EINVAL;
 			goto error;
 		}
@@ -486,9 +411,13 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 		fsi_spi_sequence_init(&seq);
 		fsi_spi_sequence_add(&seq, seq_slave);
 
-		rc = fsi_spi_sequence_transfer(ctx, &seq, transfer);
-		if (rc)
-			goto error;
+		len = transfer->len;
+		while (len > 8) {
+			fsi_spi_sequence_add(&seq,
+					     SPI_FSI_SEQUENCE_SHIFT_OUT(8));
+			len -= 8;
+		}
+		fsi_spi_sequence_add(&seq, SPI_FSI_SEQUENCE_SHIFT_OUT(len));
 
 		if (!list_is_last(&transfer->transfer_list,
 				  &mesg->transfers)) {
@@ -496,7 +425,9 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 
 			/* Sequencer can only do shift in (rx) after tx. */
 			if (next->rx_buf) {
-				if (next->len > ctx->max_xfr_size) {
+				u8 shift;
+
+				if (next->len > SPI_FSI_MAX_RX_SIZE) {
 					rc = -EINVAL;
 					goto error;
 				}
@@ -504,10 +435,8 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 				dev_dbg(ctx->dev, "Sequence rx of %d bytes.\n",
 					next->len);
 
-				rc = fsi_spi_sequence_transfer(ctx, &seq,
-							       next);
-				if (rc)
-					goto error;
+				shift = SPI_FSI_SEQUENCE_SHIFT_IN(next->len);
+				fsi_spi_sequence_add(&seq, shift);
 			} else {
 				next = NULL;
 			}
@@ -541,9 +470,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 
 static size_t fsi_spi_max_transfer_size(struct spi_device *spi)
 {
-	struct fsi_spi *ctx = spi_controller_get_devdata(spi->controller);
-
-	return ctx->max_xfr_size;
+	return SPI_FSI_MAX_RX_SIZE;
 }
 
 static int fsi_spi_probe(struct device *dev)
@@ -582,14 +509,6 @@ static int fsi_spi_probe(struct device *dev)
 		ctx->fsi = fsi;
 		ctx->base = base + SPI_FSI_BASE;
 
-		if (of_device_is_compatible(np, "ibm,fsi2spi-restricted")) {
-			ctx->restricted = true;
-			ctx->max_xfr_size = SPI_FSI_MAX_XFR_SIZE_RESTRICTED;
-		} else {
-			ctx->restricted = false;
-			ctx->max_xfr_size = SPI_FSI_MAX_XFR_SIZE;
-		}
-
 		rc = devm_spi_register_controller(dev, ctlr);
 		if (rc)
 			spi_controller_put(ctlr);
-- 
2.27.0

