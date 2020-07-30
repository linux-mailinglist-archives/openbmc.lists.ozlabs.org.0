Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A95233B18
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 00:07:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHkzd05G0zDrCQ
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 08:07:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHkvG6cKmzDrBh
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 08:03:38 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UM24Lb059122; Thu, 30 Jul 2020 18:03:35 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32m2h1pm2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 18:03:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UM0Q8N014649;
 Thu, 30 Jul 2020 22:03:34 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 32gcq215qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 22:03:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06UM3Vg236569494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 22:03:31 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44EE97806B;
 Thu, 30 Jul 2020 22:03:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 036E778068;
 Thu, 30 Jul 2020 22:03:33 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.50.101])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 22:03:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.7 v2 6/7] spi: fsi: Check mux status before
 transfers
Date: Thu, 30 Jul 2020 17:03:29 -0500
Message-Id: <20200730220330.16368-7-eajames@linux.ibm.com>
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
 adultscore=0 bulkscore=0 mlxlogscore=946 malwarescore=0 suspectscore=1
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

The SPI controllers are not accessible if the mux isn't set. Therefore,
check the mux status before starting a transfer and fail out if it isn't
set.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/spi/spi-fsi.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index 53cfa201e187..8949a64ec87d 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -12,6 +12,7 @@
 
 #define FSI_ENGID_SPI			0x23
 #define FSI_MBOX_ROOT_CTRL_8		0x2860
+#define  FSI_MBOX_ROOT_CTRL_8_SPI	 0xf0000000
 
 #define FSI2SPI_DATA0			0x00
 #define FSI2SPI_DATA1			0x04
@@ -84,6 +85,26 @@ struct fsi_spi_sequence {
 	u64 data;
 };
 
+static int fsi_spi_check_mux(struct fsi_device *fsi, struct device *dev)
+{
+	int rc;
+	u32 root_ctrl_8;
+	__be32 root_ctrl_8_be;
+
+	rc = fsi_slave_read(fsi->slave, FSI_MBOX_ROOT_CTRL_8, &root_ctrl_8_be,
+			    sizeof(root_ctrl_8_be));
+	if (rc)
+		return rc;
+
+	root_ctrl_8 = be32_to_cpu(root_ctrl_8_be);
+	dev_dbg(dev, "Root control register 8: %08x\n", root_ctrl_8);
+	if ((root_ctrl_8 & FSI_MBOX_ROOT_CTRL_8_SPI) ==
+	     FSI_MBOX_ROOT_CTRL_8_SPI)
+		return 0;
+
+	return -ENOLINK;
+}
+
 static int fsi_spi_check_status(struct fsi_spi *ctx)
 {
 	int rc;
@@ -449,11 +470,15 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
 static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 					struct spi_message *mesg)
 {
-	int rc = 0;
+	int rc;
 	u8 seq_slave = SPI_FSI_SEQUENCE_SEL_SLAVE(mesg->spi->chip_select + 1);
 	struct spi_transfer *transfer;
 	struct fsi_spi *ctx = spi_controller_get_devdata(ctlr);
 
+	rc = fsi_spi_check_mux(ctx->fsi, ctx->dev);
+	if (rc)
+		return rc;
+
 	list_for_each_entry(transfer, &mesg->transfers, transfer_list) {
 		struct fsi_spi_sequence seq;
 		struct spi_transfer *next = NULL;
@@ -537,24 +562,13 @@ static size_t fsi_spi_max_transfer_size(struct spi_device *spi)
 static int fsi_spi_probe(struct device *dev)
 {
 	int rc;
-	u32 root_ctrl_8;
 	struct device_node *np;
 	int num_controllers_registered = 0;
 	struct fsi_device *fsi = to_fsi_dev(dev);
 
-	/*
-	 * Check the SPI mux before attempting to probe. If the mux isn't set
-	 * then the SPI controllers can't access their slave devices.
-	 */
-	rc = fsi_slave_read(fsi->slave, FSI_MBOX_ROOT_CTRL_8, &root_ctrl_8,
-			    sizeof(root_ctrl_8));
+	rc = fsi_spi_check_mux(fsi, dev);
 	if (rc)
-		return rc;
-
-	if (!root_ctrl_8) {
-		dev_dbg(dev, "SPI mux not set, aborting probe.\n");
 		return -ENODEV;
-	}
 
 	for_each_available_child_of_node(dev->of_node, np) {
 		u32 base;
-- 
2.24.0

