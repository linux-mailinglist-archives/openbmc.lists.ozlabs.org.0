Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F165A23267C
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 22:51:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH5Lx2HQnzDqnM
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 06:51:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH5Cl6jKvzDqh3
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 06:45:39 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TKX1WD126555; Wed, 29 Jul 2020 16:45:35 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jy8w740p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 16:45:35 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TKjPpR021790;
 Wed, 29 Jul 2020 20:45:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 32gcy3nxdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 20:45:34 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TKjXZS48824772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 20:45:33 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CBF8112062;
 Wed, 29 Jul 2020 20:45:33 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2BEC112061;
 Wed, 29 Jul 2020 20:45:32 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.18.72])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 20:45:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.7 3/6] spi: fsi: Fix use of the bneq+ sequencer
 instruction
Date: Wed, 29 Jul 2020 15:45:25 -0500
Message-Id: <20200729204528.15157-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200729204528.15157-1-eajames@linux.ibm.com>
References: <20200729204528.15157-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_14:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=1 mlxlogscore=731
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007290138
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Eddie James <eajames@linux.ibm.com>
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

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

