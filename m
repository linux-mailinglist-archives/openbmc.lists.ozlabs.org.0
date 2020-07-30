Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E1233B15
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 00:04:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHkwJ0T0TzDrDg
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 08:04:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHkvG4dtkzDrBd
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 08:03:38 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UM25vC059250; Thu, 30 Jul 2020 18:03:34 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32m2h1pm1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 18:03:33 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UM0Qok014639;
 Thu, 30 Jul 2020 22:03:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 32gcq215qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 22:03:33 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06UM3S2d36176292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 22:03:28 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31A897806B;
 Thu, 30 Jul 2020 22:03:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E56A378068;
 Thu, 30 Jul 2020 22:03:31 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.50.101])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 22:03:31 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.7 v2 3/7] spi: fsi: Fix use of the bneq+ sequencer
 instruction
Date: Thu, 30 Jul 2020 17:03:26 -0500
Message-Id: <20200730220330.16368-4-eajames@linux.ibm.com>
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
 clxscore=1015 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=796 malwarescore=0 suspectscore=1
 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300151
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

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

All of the switches in N2_count_control in the counter configuration are
required to make the branch if not equal and increment command work.
Set them when using bneq+.

A side effect of this mode requires a dummy write to TDR when both
transmitting and receiving otherwise the controller won't start shifting
receive data.

It is likely not possible to avoid TDR underrun errors in this mode and
they are harmless, so do not check for them.

Fixes: bbb6b2f9865b ("spi: Add FSI-attached SPI controller driver")
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/spi/spi-fsi.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index 559d0ff981f3..c31a852b6a3e 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -29,6 +29,10 @@
 #define SPI_FSI_ERROR			0x0
 #define SPI_FSI_COUNTER_CFG		0x1
 #define  SPI_FSI_COUNTER_CFG_LOOPS(x)	 (((u64)(x) & 0xffULL) << 32)
+#define  SPI_FSI_COUNTER_CFG_N2_RX	 BIT_ULL(8)
+#define  SPI_FSI_COUNTER_CFG_N2_TX	 BIT_ULL(9)
+#define  SPI_FSI_COUNTER_CFG_N2_IMPLICIT BIT_ULL(10)
+#define  SPI_FSI_COUNTER_CFG_N2_RELOAD	 BIT_ULL(11)
 #define SPI_FSI_CFG1			0x2
 #define SPI_FSI_CLOCK_CFG		0x3
 #define  SPI_FSI_CLOCK_CFG_MM_ENABLE	 BIT_ULL(32)
@@ -61,7 +65,7 @@
 #define  SPI_FSI_STATUS_RDR_OVERRUN	 BIT_ULL(62)
 #define  SPI_FSI_STATUS_RDR_FULL	 BIT_ULL(63)
 #define  SPI_FSI_STATUS_ANY_ERROR	 \
-	(SPI_FSI_STATUS_ERROR | SPI_FSI_STATUS_TDR_UNDERRUN | \
+	(SPI_FSI_STATUS_ERROR | \
 	 SPI_FSI_STATUS_TDR_OVERRUN | SPI_FSI_STATUS_RDR_UNDERRUN | \
 	 SPI_FSI_STATUS_RDR_OVERRUN)
 #define SPI_FSI_PORT_CTRL		0x9
@@ -238,6 +242,7 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
 	int rc;
 	u8 len = min(transfer->len, 8U);
 	u8 rem = transfer->len % len;
+	u64 cfg = 0ULL;
 
 	loops = transfer->len / len;
 
@@ -258,8 +263,14 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
 	if (loops > 1) {
 		fsi_spi_sequence_add(seq, SPI_FSI_SEQUENCE_BRANCH(idx));
 
-		rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG,
-				       SPI_FSI_COUNTER_CFG_LOOPS(loops - 1));
+		cfg = SPI_FSI_COUNTER_CFG_LOOPS(loops - 1);
+		if (transfer->rx_buf)
+			cfg |= SPI_FSI_COUNTER_CFG_N2_RX |
+				SPI_FSI_COUNTER_CFG_N2_TX |
+				SPI_FSI_COUNTER_CFG_N2_IMPLICIT |
+				SPI_FSI_COUNTER_CFG_N2_RELOAD;
+
+		rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, cfg);
 		if (rc)
 			return rc;
 	}
@@ -275,6 +286,7 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 {
 	int rc = 0;
 	u64 status = 0ULL;
+	u64 cfg = 0ULL;
 
 	if (transfer->tx_buf) {
 		int nb;
@@ -312,6 +324,16 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 		u64 in = 0ULL;
 		u8 *rx = transfer->rx_buf;
 
+		rc = fsi_spi_read_reg(ctx, SPI_FSI_COUNTER_CFG, &cfg);
+		if (rc)
+			return rc;
+
+		if (cfg & SPI_FSI_COUNTER_CFG_N2_IMPLICIT) {
+			rc = fsi_spi_write_reg(ctx, SPI_FSI_DATA_TX, 0);
+			if (rc)
+				return rc;
+		}
+
 		while (transfer->len > recv) {
 			do {
 				rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS,
-- 
2.24.0

