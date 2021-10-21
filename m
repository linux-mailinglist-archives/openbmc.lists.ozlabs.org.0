Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1595436754
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 18:11:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZssj1HrRz3c6j
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 03:11:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kM7y860l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kM7y860l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZssG6Zkwz2xtV
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 03:10:42 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LFCafw008151; 
 Thu, 21 Oct 2021 12:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=WzW8tuUWwysKQzurFUixApaOJvUuNjVJnG3fqLEeZ/E=;
 b=kM7y860lHb31L9mTkWTX5Z5b8YhmXt+G6+Hy0XaNlh/vA2W4/MsGwmBi8cVujlzodBjM
 k5EB4eOB+mW3Npj4QWlqdtaIJ8kytV3bYK5FjFlgEfqeSuyLVgucPpzW+v/K8g1MyEs1
 +p94h5l56ojHsJfzCTzx5kbp44XU+265efhP43SUbmxCavhqr+52lgW1wCPLpXRnlYlJ
 DC39HP07I5YsHfPPDSI88Dc1OoOf3d1/nIvGQerM07/g0cFwcztHo0LVgrkRCm6UNcRj
 JyXXVMMF4srbHbN262fffgIQaGIbbiCaPVSVRgnoXMehNwlqxBepM8PnYJdNXcsJoq9d nw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bty9errvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 12:10:38 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19LG42Y5027145;
 Thu, 21 Oct 2021 16:10:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3bqpccgsk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 16:10:36 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19LGAZhT49086856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 16:10:35 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79553AE063;
 Thu, 21 Oct 2021 16:10:35 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BC1CAE064;
 Thu, 21 Oct 2021 16:10:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.11.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 16:10:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.14] spi: fsi: Print status on error
Date: Thu, 21 Oct 2021 11:10:34 -0500
Message-Id: <20211021161034.16428-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LIKyPbZI6OIP7OSsLhcbCxrjFnofuqe9
X-Proofpoint-GUID: LIKyPbZI6OIP7OSsLhcbCxrjFnofuqe9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_04,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110210082
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Print the SPI engine status register when an error is detected. This
will aid tremendously in debugging failed transactions.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/20211004195149.29759-1-eajames@linux.ibm.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-fsi.c | 48 ++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index 829770b8ec74..9be18db03722 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -234,6 +234,26 @@ static int fsi_spi_reset(struct fsi_spi *ctx)
 	return fsi_spi_write_reg(ctx, SPI_FSI_STATUS, 0ULL);
 }
 
+static int fsi_spi_status(struct fsi_spi *ctx, u64 *status, const char *dir)
+{
+	int rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS, status);
+
+	if (rc)
+		return rc;
+
+	if (*status & SPI_FSI_STATUS_ANY_ERROR) {
+		dev_err(ctx->dev, "%s error: %08llx\n", dir, *status);
+
+		rc = fsi_spi_reset(ctx);
+		if (rc)
+			return rc;
+
+		return -EREMOTEIO;
+	}
+
+	return 0;
+}
+
 static void fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
 {
 	/*
@@ -273,18 +293,9 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 				return rc;
 
 			do {
-				rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS,
-						      &status);
+				rc = fsi_spi_status(ctx, &status, "TX");
 				if (rc)
 					return rc;
-
-				if (status & SPI_FSI_STATUS_ANY_ERROR) {
-					rc = fsi_spi_reset(ctx);
-					if (rc)
-						return rc;
-
-					return -EREMOTEIO;
-				}
 			} while (status & SPI_FSI_STATUS_TDR_FULL);
 
 			sent += nb;
@@ -296,18 +307,9 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 
 		while (transfer->len > recv) {
 			do {
-				rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS,
-						      &status);
+				rc = fsi_spi_status(ctx, &status, "RX");
 				if (rc)
 					return rc;
-
-				if (status & SPI_FSI_STATUS_ANY_ERROR) {
-					rc = fsi_spi_reset(ctx);
-					if (rc)
-						return rc;
-
-					return -EREMOTEIO;
-				}
 			} while (!(status & SPI_FSI_STATUS_RDR_FULL));
 
 			rc = fsi_spi_read_reg(ctx, SPI_FSI_DATA_RX, &in);
@@ -348,8 +350,12 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
 		if (status & (SPI_FSI_STATUS_ANY_ERROR |
 			      SPI_FSI_STATUS_TDR_FULL |
 			      SPI_FSI_STATUS_RDR_FULL)) {
-			if (reset)
+			if (reset) {
+				dev_err(ctx->dev,
+					"Initialization error: %08llx\n",
+					status);
 				return -EIO;
+			}
 
 			rc = fsi_spi_reset(ctx);
 			if (rc)
-- 
2.27.0

