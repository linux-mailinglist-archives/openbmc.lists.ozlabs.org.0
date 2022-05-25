Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4253349E
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 03:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Chz6WcCz3bkQ
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 11:12:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NEYvvIEm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NEYvvIEm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7ChV0cdkz2xMS
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 11:11:53 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P0o54Y032438;
 Wed, 25 May 2022 01:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=D5tbj+rFXvsnW2V9aJdAQf9c7kXHPeMqDRkmplEuGyE=;
 b=NEYvvIEmXReqT9/ALLzlJCe5r5tGXEOEDnyYD/otRdx4py7hVFei9SrepzUHuzNyyFpt
 6mcL9bJOxkomg2A3YnJaEhKuwPX+CTTxRO/I5NKIfXhX/rdeLXaz4iZYwMXkX9xxpcQ7
 340WaEFMMCg3N4vCgLB4NWc+zYvm6UUmppHReMxe9bO4KUyxj0B0cVf+euD32XIm3zxK
 zDtAKuz/wglw0VceddBFqGN1p8FeRwP2RElQ6HtM0M43E1S3+9x5U5X3yKflB+HF06En
 stNGaguVMbXIfll5yG4QqpdiQTDVOqXEVsE5MrFByjmy2tJpxlI6VURYgO/xPERy6ZrI Ag== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9a8ugbhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 01:11:46 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24P17xrg008906;
 Wed, 25 May 2022 01:11:45 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3g93utb72s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 01:11:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24P1BhRT26607886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 01:11:43 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CE596A058;
 Wed, 25 May 2022 01:11:43 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34C796A051;
 Wed, 25 May 2022 01:11:43 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.119.82])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 01:11:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] iio: si7020: Remove reset in probe
Date: Tue, 24 May 2022 20:11:38 -0500
Message-Id: <20220525011138.5882-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8OrH_41PzrpX9bg_zUEazU2XdirLUbEV
X-Proofpoint-ORIG-GUID: 8OrH_41PzrpX9bg_zUEazU2XdirLUbEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_11,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250006
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I2C commands issued after the SI7020 is starting up or after reset
can potentially upset the startup sequence. Therefore, the host
needs to wait for the startup sequence to finish before issuing
further i2c commands. This is impractical in cases where the SI7020
is on a shared bus or behind a mux, which may switch channels at
any time (generating I2C traffic). Therefore, remove the device
reset in the probe function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/iio/humidity/si7020.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
index ab6537f136ba..3c55b81ce984 100644
--- a/drivers/iio/humidity/si7020.c
+++ b/drivers/iio/humidity/si7020.c
@@ -115,13 +115,6 @@ static int si7020_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -EOPNOTSUPP;
 
-	/* Reset device, loads default settings. */
-	ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
-	if (ret < 0)
-		return ret;
-	/* Wait the maximum power-up time after software reset. */
-	msleep(15);
-
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
-- 
2.27.0

