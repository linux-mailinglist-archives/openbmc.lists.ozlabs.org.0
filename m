Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F48D4DD004
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 22:15:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKKfd0RCBz30RG
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 08:15:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BxdNT68w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BxdNT68w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKKf940Xtz2yMD
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 08:14:40 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22HJGP4M026413; 
 Thu, 17 Mar 2022 21:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=apMRq4mae8+2j+tSOSavs0UnUWcHBNVoprohqfjTeuY=;
 b=BxdNT68w8iBsWbACAY3WNWPJmjtDt8uehaqG3NXXOEekqqFrkt21n8p7gGxOam4uo3+i
 SG2auXxErB4eIXj/FOv3j8ezxzeSo02kBqwKyDrcCfWj7MxdH0chII1bh+RnWqlY+SCZ
 02tlF07hX0oWQn8YGlh7EEmrhHjrknQEFFiocC2E+zDLGetChO4dGqnWT4AUHVcsBeZM
 Oc/jof0jNtS6PaZ5RBKJBPeoRGAUvgrBDs6cBEHNktJo5pcW8XHpPm7m2d0kY35T+9ev
 St9xpW5PluUzPuPQKC4gkJEsdd2tlpdtXOTjqJjm0X0TILT2uJngx9mYKRarh2qaXroU yg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev04q880w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 21:14:35 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22HLDVgh018860;
 Thu, 17 Mar 2022 21:14:34 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3erk5a7f51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 21:14:34 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22HLEXse7275166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 21:14:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3AD2B205F;
 Thu, 17 Mar 2022 21:14:32 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD5C1B206E;
 Thu, 17 Mar 2022 21:14:31 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.82.208])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Mar 2022 21:14:31 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH] spi: fsi: Implement a timeout for polling status
Date: Thu, 17 Mar 2022 16:14:26 -0500
Message-Id: <20220317211426.38940-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rdwRJAIw1DTGQsBOuy21UnzjMXm8lzOG
X-Proofpoint-ORIG-GUID: rdwRJAIw1DTGQsBOuy21UnzjMXm8lzOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxlogscore=880
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170116
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
Cc: openbmc@lists.ozlabs.org, broonie@kernel.org,
 Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org,
 joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The data transfer routines must poll the status register to
determine when more data can be shifted in or out. If the hardware
gets into a bad state, these polling loops may never exit. Prevent
this by returning an error if a timeout is exceeded.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/spi/spi-fsi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index b6c7467f0b59..d403a7a3021d 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -25,6 +25,7 @@
 
 #define SPI_FSI_BASE			0x70000
 #define SPI_FSI_INIT_TIMEOUT_MS		1000
+#define SPI_FSI_STATUS_TIMEOUT_MS	100
 #define SPI_FSI_MAX_RX_SIZE		8
 #define SPI_FSI_MAX_TX_SIZE		40
 
@@ -299,6 +300,7 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 				 struct spi_transfer *transfer)
 {
 	int rc = 0;
+	unsigned long end;
 	u64 status = 0ULL;
 
 	if (transfer->tx_buf) {
@@ -315,10 +317,14 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 			if (rc)
 				return rc;
 
+			end = jiffies + msecs_to_jiffies(SPI_FSI_STATUS_TIMEOUT_MS);
 			do {
 				rc = fsi_spi_status(ctx, &status, "TX");
 				if (rc)
 					return rc;
+
+				if (time_after(jiffies, end))
+					return -ETIMEDOUT;
 			} while (status & SPI_FSI_STATUS_TDR_FULL);
 
 			sent += nb;
@@ -329,10 +335,14 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 		u8 *rx = transfer->rx_buf;
 
 		while (transfer->len > recv) {
+			end = jiffies + msecs_to_jiffies(SPI_FSI_STATUS_TIMEOUT_MS);
 			do {
 				rc = fsi_spi_status(ctx, &status, "RX");
 				if (rc)
 					return rc;
+
+				if (time_after(jiffies, end))
+					return -ETIMEDOUT;
 			} while (!(status & SPI_FSI_STATUS_RDR_FULL));
 
 			rc = fsi_spi_read_reg(ctx, SPI_FSI_DATA_RX, &in);
-- 
2.27.0

