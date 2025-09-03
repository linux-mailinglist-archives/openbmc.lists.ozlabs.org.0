Return-Path: <openbmc+bounces-584-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975AB42618
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 17:59:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH6j81FQgz3050;
	Thu,  4 Sep 2025 01:58:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756915116;
	cv=none; b=S0Bn+7W8ZFClxY9MfK3oILDnpdTRXYmmPS6vBo6xFNmKfLDhXCMsO5FiK+zG8mfrvOOpXb77Kw10xq7RuZJUqfrBuh8v5KRqVgwP69eHsuT1KW+0zX5p2+LctZ6uhYfm/0ItoNgfSDcCOmSky9O/peYQqpSkhJyq3nRqDEsLANufkhQ3x5hMe3BzuUZBeA5C93xKBOyRq+66iUKXm9OimFYqZyGYBXBgxXG2VCSI5wXLJv+Y2/cZfx6/CweA1kL0aH4f/4WA2IBBaAb2mfbe+vC1Ar05dGZIWZemxyP0ZyeCqs0+XbFvXVdsMxaZqeUTPUUFsEdI0Has05seo2CagA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756915116; c=relaxed/relaxed;
	bh=g6rkU8fdf0NPzAGwC4OqI7odUVIxHwQEFB/WKa9ZcVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4AFc0qHy2gpJ7dtwrUKcDTohF3whQe5V5Q7WzF5oOSryXTjZjrwsFjksLx+kggO5Rq/dycrqfygnzzzf0eFqRGfByiYVFSppcA3KIZdjQmMP3lRZ8dyD3y2pqVHE2l0KdYzv2yp3bw037GQ/cmSyEgay3+mWNUQGz6Vo2MT+qGOwX5KemeD8DozfNNoHYJi5pNh8MEj73qbF6qRMkmAIsR2kFT6lYV+7BRFEf0hHJ9k2HMmYei4iL98/+O98m4oixYgkpgTfLoPQSLOK4M0JM271DLURN96LhHMIzSO/6w5mRd2RxbPveCycDUXMiktr9/iVoGdpfMYmuAosAa8OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d+K1h9L0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d+K1h9L0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH6j611SGz2ykc
	for <openbmc@lists.ozlabs.org>; Thu,  4 Sep 2025 01:58:33 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583FaRxq004042;
	Wed, 3 Sep 2025 15:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=g6rkU8fdf0NPzAGwC
	4OqI7odUVIxHwQEFB/WKa9ZcVw=; b=d+K1h9L0ZhL2I9rBBudxetcLGb2fAc7nE
	9wVWwiIRyCspyeJcs/CAkwwirG4cECzP8FiXvRG5k3JFCj0WjdFI9OfQGewTf+Hf
	vOkboHPzRUmVfqf7RtM2Scb9X9lwv/3F3CB7Pr/Ql2hpTD7rhwnOMv3Wjih8J7WQ
	RNrjUMULrgTleOWYlAINKXZGqfs/HtaYPHmejhyYsSHdY+I5GOcWmyh6oe1o1ZXF
	W6/XaGNlxPKn/uOQ2Zq6obeRJv8L0wupM6mbSN9qIuv+QXyyVdbBsO61B33q4Ddm
	sOGj5tQLxwLf5L+PrOXw/hZSTWP57EH92yB709CvWafyQlvbzAOzg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usua4vkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 583D1FGP019924;
	Wed, 3 Sep 2025 15:58:17 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vbmu8e3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:17 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 583FwFUI21561912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Sep 2025 15:58:15 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8795F58055;
	Wed,  3 Sep 2025 15:58:15 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B3B95804E;
	Wed,  3 Sep 2025 15:58:15 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Sep 2025 15:58:15 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com
Subject: [PATCH linux dev-6.12 v2 6/6] iio: si7020: Lock root adapter to wait for reset
Date: Wed,  3 Sep 2025 10:58:08 -0500
Message-ID: <20250903155810.2839634-7-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903155810.2839634-1-ninad@linux.ibm.com>
References: <20250903155810.2839634-1-ninad@linux.ibm.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fTFF6V8-zwvk0YfF_BPaAHUiqdntZMgJ
X-Authority-Analysis: v=2.4 cv=U6uSDfru c=1 sm=1 tr=0 ts=68b86599 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Vpm0REw9Fi808SwHw0QA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX2kPugIcLu8V1
 /obah1TTxc0sE+t4q1tnXFaLTqP1SO4oIEkjAoTsMyS2hkkry+K14XN31pnBy+z1F4Ja9AN0ell
 xqb8+uDci2vl6c2T0PcYOjX0SIBEnpfQN+i/F9Els+05oK0WSEj/iWzvL7uIw03veWslr61h7XC
 dMShmLaqczYuYyCFzELcEavTT46TYV5sbbPX6ARXHMrXFTizNdMsGrU9L8GmXTlr0WoDuFm6QGX
 2JRNt0RAPQPiK74cKMQj7KO4NMARCUlgzJvj5ENkVWPrQE/ORh0w4l+MVfQAkCI+lywnOffdlVA
 qFhm1hM8s+fEaxDDX5TXV2DQoUvogN0K3pldcPtPBpv0WG7BWGXHBC1EitR5u0Jpf4ANbb83MTG
 exLpLJWS
X-Proofpoint-ORIG-GUID: fTFF6V8-zwvk0YfF_BPaAHUiqdntZMgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eddie James <eajames@linux.ibm.com>

Use the new mux root operations to lock the root adapter while waiting for
the reset to complete. I2C commands issued after the SI7020 is starting up
or after reset can potentially upset the startup sequence. Therefore, the
host needs to wait for the startup sequence to finish before issuing
further I2C commands.

OpenBMC-Staging-Count: 4
Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/20220906202829.1921114-3-eajames@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/iio/humidity/si7020.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
index ff2dba50c0a5b..7f24d54beb8d0 100644
--- a/drivers/iio/humidity/si7020.c
+++ b/drivers/iio/humidity/si7020.c
@@ -228,6 +228,7 @@ static const struct iio_info si7020_info = {
 
 static int si7020_probe(struct i2c_client *client)
 {
+	struct i2c_adapter *root;
 	struct iio_dev *indio_dev;
 	struct si7020_data *data;
 	int ret;
@@ -237,13 +238,24 @@ static int si7020_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -EOPNOTSUPP;
 
+	root = i2c_lock_select_bus(client->adapter);
+	if (IS_ERR(root))
+		return PTR_ERR(root);
+
 	/* Reset device, loads default settings. */
-	ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
-	if (ret < 0)
+	ret = __i2c_smbus_xfer(root, client->addr, client->flags,
+			       I2C_SMBUS_WRITE, SI7020CMD_RESET,
+			       I2C_SMBUS_BYTE, NULL);
+	if (ret < 0) {
+		i2c_unlock_deselect_bus(client->adapter);
 		return ret;
+	}
+
 	/* Wait the maximum power-up time after software reset. */
 	msleep(15);
 
+	i2c_unlock_deselect_bus(client->adapter);
+
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
-- 
2.48.1


