Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B3617084
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 23:15:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2h5z4Fycz2ywV
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 09:15:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qrKhxrdH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qrKhxrdH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2h5L2JjSz2xJ6
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 09:14:46 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2K85LD016226;
	Wed, 2 Nov 2022 22:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=UKsRO0D8cYFc1boJN+vWueKiwv7Sx/TQwzOmO3JKm+8=;
 b=qrKhxrdHh82h4Az8DmYysI/oMTcZFxrd2nhN/0wWIR6qRbtVG/o+q8ZMniKXaPg2FTW3
 Z8VRTGj52wNaOynGZ4v+9vV89zMX3dLMxxS9Er4JJYXZdaLYWKB7wT31O57vneTxM/Vo
 VXQ8uNCc82NMRBiGCu/s34sIc4H9m4baUdxiElZq+6ggeZ3bejXWbfK+8qPGdtXoFsbR
 iWEzZkg9TVbu6D1A3E9SEQiGTs7kFBQ5xx2P+AHwAyN+IF1R0NjecjUIWPU8TfkR4HY8
 ZtuldjWV38Az340m3sSJ3j6Led+6xE8+x3dUUx1UjhKWd28HZu4ruOSy2kZgQAO1Mx3e jQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkwetesp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:14:40 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2M5gAw012185;
	Wed, 2 Nov 2022 22:14:39 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma01dal.us.ibm.com with ESMTP id 3kgutavqkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:14:39 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A2MEc1i10683086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:14:38 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 082E958060;
	Wed,  2 Nov 2022 22:14:38 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8136C58056;
	Wed,  2 Nov 2022 22:14:37 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.47.121])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Nov 2022 22:14:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] fsi: occ: Support probing the hwmon child device from dts node
Date: Wed,  2 Nov 2022 17:14:32 -0500
Message-Id: <20221102221432.12474-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9Ra8sXosYZsrSO0ftWU3T0W7LAPYK99q
X-Proofpoint-GUID: 9Ra8sXosYZsrSO0ftWU3T0W7LAPYK99q
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211020146
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

There is now a need for reading devicetree properties in the OCC
hwmon driver, which isn't current supported as the FSI driver just
instantiates a basic platform device. Add support for this use case
by checking for an "occ-hwmon" node and if present, creating an
OF device from it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/20220809200701.218059-3-eajames@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-occ.c | 41 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 8f7f602b909d..abdd37d5507f 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -44,6 +44,7 @@ struct occ {
 	struct device *sbefifo;
 	char name[32];
 	int idx;
+	bool platform_hwmon;
 	u8 sequence_number;
 	void *buffer;
 	void *client_buffer;
@@ -598,7 +599,7 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 }
 EXPORT_SYMBOL_GPL(fsi_occ_submit);
 
-static int occ_unregister_child(struct device *dev, void *data)
+static int occ_unregister_platform_child(struct device *dev, void *data)
 {
 	struct platform_device *hwmon_dev = to_platform_device(dev);
 
@@ -607,12 +608,25 @@ static int occ_unregister_child(struct device *dev, void *data)
 	return 0;
 }
 
+static int occ_unregister_of_child(struct device *dev, void *data)
+{
+	struct platform_device *hwmon_dev = to_platform_device(dev);
+
+	of_device_unregister(hwmon_dev);
+	if (dev->of_node)
+		of_node_clear_flag(dev->of_node, OF_POPULATED);
+
+	return 0;
+}
+
 static int occ_probe(struct platform_device *pdev)
 {
 	int rc;
 	u32 reg;
+	char child_name[32];
 	struct occ *occ;
-	struct platform_device *hwmon_dev;
+	struct platform_device *hwmon_dev = NULL;
+	struct device_node *hwmon_node;
 	struct device *dev = &pdev->dev;
 	struct platform_device_info hwmon_dev_info = {
 		.parent = dev,
@@ -671,10 +685,20 @@ static int occ_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	hwmon_dev_info.id = occ->idx;
-	hwmon_dev = platform_device_register_full(&hwmon_dev_info);
-	if (IS_ERR(hwmon_dev))
-		dev_warn(dev, "failed to create hwmon device\n");
+	hwmon_node = of_get_child_by_name(dev->of_node, hwmon_dev_info.name);
+	if (hwmon_node) {
+		snprintf(child_name, sizeof(child_name), "%s.%d", hwmon_dev_info.name, occ->idx);
+		hwmon_dev = of_platform_device_create(hwmon_node, child_name, dev);
+		of_node_put(hwmon_node);
+	}
+
+	if (!hwmon_dev) {
+		occ->platform_hwmon = true;
+		hwmon_dev_info.id = occ->idx;
+		hwmon_dev = platform_device_register_full(&hwmon_dev_info);
+		if (IS_ERR(hwmon_dev))
+			dev_warn(dev, "failed to create hwmon device\n");
+	}
 
 	return 0;
 }
@@ -690,7 +714,10 @@ static int occ_remove(struct platform_device *pdev)
 	occ->buffer = NULL;
 	mutex_unlock(&occ->occ_lock);
 
-	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
+	if (occ->platform_hwmon)
+		device_for_each_child(&pdev->dev, NULL, occ_unregister_platform_child);
+	else
+		device_for_each_child(&pdev->dev, NULL, occ_unregister_of_child);
 
 	ida_simple_remove(&occ_ida, occ->idx);
 
-- 
2.31.1

