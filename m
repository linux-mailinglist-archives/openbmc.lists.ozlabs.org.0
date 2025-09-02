Return-Path: <openbmc+bounces-564-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED9B40D36
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 20:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGZ9373R3z30Tc;
	Wed,  3 Sep 2025 04:32:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756837943;
	cv=none; b=ihRp0pfqehIIeBH+hP4htfMED8O/KsCWYWnjFLXzjz/NiBCilzVfE2M9FeaQdefWI4cVLrlzGPBZGAQTqwmlYHkz15x++4SGK1qFZ/y+Y9Ep4Ro1DjSV4mrmJtL3HXsPrjddL67R52OMGMi4YOivHLBGxciLgvp/1jkdWHDk+Ms44AGzTyVM7arK056IhPANFnPvShFUXi77ajY+QOhIjx3K7v3Ucu2L30z8IO5/CWZj3/OmzsMgcs5E/rIHEvFKaLcTxDrQGMr1yM5cck+DRJG61OU9eMEtJBdmX3N5EX8efAR+garV/vfgv5nLoma1NzsVdIFrlLf2tcTG8a/faQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756837943; c=relaxed/relaxed;
	bh=g6rkU8fdf0NPzAGwC4OqI7odUVIxHwQEFB/WKa9ZcVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfxcgBarLu0am4BBnXaqJC1sEElwtbb2INu/wfeop8KFsb5ydaqeeqsZL5HODdrzyXGMystEBu1ZE4LpEPxeo4ODj0zqeM57sTVuKN95uqj9BQdvbG5e+WOT1pU/S/PuhPNnbybmVxq8cppPkm7JzUzp44jw20w720a3nJyHalDcnn2Q8f4DSov2WqCqP3vnla6S3QUlHTAbGuT41WSiOUu4uavkiszMLsQSWzBiV8as6WeLdZWv8UEncVYxzyCX+kGrXjBE88LQ0yadHpcnY97IlupJq01ukG/L/cfSIRwu3yZ0iX4YNRYOYuQfvPuLzG7Ov3bqVFHxDy/PPsMCxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y+EsBLqO; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y+EsBLqO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGZ916QqJz30PF
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 04:32:21 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqQ1t001463;
	Tue, 2 Sep 2025 18:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=g6rkU8fdf0NPzAGwC
	4OqI7odUVIxHwQEFB/WKa9ZcVw=; b=Y+EsBLqOHuEA/C0AXwmz7slJjTQoaBmL7
	1cGCOf6k061o3aBive+ucM/wSK07ABF5RwmB4sfyMTHlAPhXgAXm5++BH8nG0azw
	gZIXlXUDQUgmIiIowfHDF51qZonBVxE596cSMNM1HgB9lHS4EnUety2ewrB5eQcP
	9O7LEvt45I8ZYDD9bcjgVH6RW9H0IGRZTLdlXJiLTbepHGZmUARNxdc72s2m5i65
	aqev8uUT/y+P6SpP2ZtE8nnytHI/hbzwFk+n01Ru7+JO9K8ESf5X3g8lyYRJUT4h
	nu4/40eU3kycL7ppmwNfabpojGn1eEweXdlQEchir5qpk5JLG9OAA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48wshev18t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 18:32:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 582HL3ju009059;
	Tue, 2 Sep 2025 18:32:07 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48vdumbs45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 18:32:07 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 582IW5sG22676084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Sep 2025 18:32:05 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 433B358045;
	Tue,  2 Sep 2025 18:32:05 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA26958050;
	Tue,  2 Sep 2025 18:32:04 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Sep 2025 18:32:04 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com
Subject: [PATCH linux dev-6.12 v1 6/6] iio: si7020: Lock root adapter to wait for reset
Date: Tue,  2 Sep 2025 13:31:47 -0500
Message-ID: <20250902183155.2988560-7-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250902183155.2988560-1-ninad@linux.ibm.com>
References: <20250902183155.2988560-1-ninad@linux.ibm.com>
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
X-Proofpoint-GUID: AVdrkbKAv-lFKEkDC_MgY5gx8ppJJdm3
X-Authority-Analysis: v=2.4 cv=do3bC0g4 c=1 sm=1 tr=0 ts=68b73827 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Vpm0REw9Fi808SwHw0QA:9
X-Proofpoint-ORIG-GUID: AVdrkbKAv-lFKEkDC_MgY5gx8ppJJdm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfX5lkdwnRDfc95
 QKa97KRwgwkC9DepglmPKPYceeptTq2TXyxVRLezpNPHWQfSPTcYRiQTmSRzuN2ACtYTctpGGZv
 olhDgDftAXbPik6agWMZGx1276FPllhdA8FsbKQN68rbHKgB2busPWI+ltStHnv3BUyKwh8lUd2
 +8jiJfghkXZu+0d8oOpxJqAadtcDGjntEJSO/19HPD2GvfswN3YeQdtuVO+3HbGbY6FKNC2z3Gr
 ZavD6O8q1gaeLqQWXCWd6J9bZ/ul6WAuqvZ/+kbkuShe/+njohFZnMlQblVvokIQkV0fJfQKD3h
 XVKvH6w7VOq9hW86IqcMNff96OHm4UyVGCUM3Zz6qmVGPkhD/Tv31xXuctcoshiW6f49S8Ok5zD
 BRtyB69U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020040
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


