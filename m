Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222CB4B5E04
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 00:02:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyKW72QQ5z30Qt
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 10:02:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nOIUpS91;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nOIUpS91; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyKTH5Z5kz2ywb
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 10:01:07 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ELYgF8027627; 
 Mon, 14 Feb 2022 23:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CwnMi/2c4QJHMS+MQeJ3zcFvrjSZ/vSRpTXDKgZxgFs=;
 b=nOIUpS91x2PQ99G7+jYdfDHvisd8x/paq4yqsnkr4qrCNCxs9SnvqX/nrlMZd454n3rB
 CliJ4Xuwa51QtO7iS+2Hf0Xrn0zOR1Q/4w9H3Ext55YButVggiVoJjKd9YkBIxAhl6cc
 JRwGT5ANVen6DhHKW9YxSHId53tXMVcGX99Mz81F/WSRinvQoJ/scM3eM+mrr4iBiSVe
 T8hRkD9FyYHG0F4ZNwDZvL4h7Uu2/9qB6bXHWiqdUipO07KrQiw2175ScrIT4scs9keK
 +aL8o6qC701fmkZdZn2jDdGx22/ROBWfPO1sWPsPKgHExb0Xz+cyNISWoJ4x3rmzE5jO 9g== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7avfcc4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 23:01:04 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EMw3LU016413;
 Mon, 14 Feb 2022 23:01:04 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 3e64hab6k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 23:01:04 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EN12HN6685254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 23:01:02 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3689A1120A3;
 Mon, 14 Feb 2022 23:01:02 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60B561120A5;
 Mon, 14 Feb 2022 23:01:01 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.10.159])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 23:01:01 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 3/4] hwmon: (occ) Add sysfs entries for
 additional extended status bits
Date: Mon, 14 Feb 2022 17:00:52 -0600
Message-Id: <20220214230053.38449-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220214230053.38449-1-eajames@linux.ibm.com>
References: <20220214230053.38449-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GDnHESNL3D1IMUQaiFTbzs3LChTXIvHr
X-Proofpoint-ORIG-GUID: GDnHESNL3D1IMUQaiFTbzs3LChTXIvHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_07,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=832 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140131
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
Cc: baileysh@us.ibm.com, Eddie James <eajames@linux.ibm.com>, cjcain@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add sysfs entries for DVFS due to a VRM Vdd over-temperature condition,
and add the GPU throttling condition bits (such that if bit 1 is set,
GPU1 is throttling).

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/sysfs.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
index 88f655887c95..b2f788a77746 100644
--- a/drivers/hwmon/occ/sysfs.c
+++ b/drivers/hwmon/occ/sysfs.c
@@ -19,6 +19,8 @@
 #define OCC_EXT_STAT_DVFS_POWER		BIT(6)
 #define OCC_EXT_STAT_MEM_THROTTLE	BIT(5)
 #define OCC_EXT_STAT_QUICK_DROP		BIT(4)
+#define OCC_EXT_STAT_DVFS_VDD		BIT(3)
+#define OCC_EXT_STAT_GPU_THROTTLE	GENMASK(2, 0)
 
 static ssize_t occ_sysfs_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
@@ -69,6 +71,12 @@ static ssize_t occ_sysfs_show(struct device *dev,
 	case 9:
 		val = header->mode;
 		break;
+	case 10:
+		val = !!(header->ext_status & OCC_EXT_STAT_DVFS_VDD);
+		break;
+	case 11:
+		val = header->ext_status & OCC_EXT_STAT_GPU_THROTTLE;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -96,6 +104,8 @@ static SENSOR_DEVICE_ATTR(occ_state, 0444, occ_sysfs_show, NULL, 6);
 static SENSOR_DEVICE_ATTR(occs_present, 0444, occ_sysfs_show, NULL, 7);
 static SENSOR_DEVICE_ATTR(occ_ips_status, 0444, occ_sysfs_show, NULL, 8);
 static SENSOR_DEVICE_ATTR(occ_mode, 0444, occ_sysfs_show, NULL, 9);
+static SENSOR_DEVICE_ATTR(occ_dvfs_vdd, 0444, occ_sysfs_show, NULL, 10);
+static SENSOR_DEVICE_ATTR(occ_gpu_throttle, 0444, occ_sysfs_show, NULL, 11);
 static DEVICE_ATTR_RO(occ_error);
 
 static struct attribute *occ_attributes[] = {
@@ -109,6 +119,8 @@ static struct attribute *occ_attributes[] = {
 	&sensor_dev_attr_occs_present.dev_attr.attr,
 	&sensor_dev_attr_occ_ips_status.dev_attr.attr,
 	&sensor_dev_attr_occ_mode.dev_attr.attr,
+	&sensor_dev_attr_occ_dvfs_vdd.dev_attr.attr,
+	&sensor_dev_attr_occ_gpu_throttle.dev_attr.attr,
 	&dev_attr_occ_error.attr,
 	NULL
 };
@@ -166,6 +178,18 @@ void occ_sysfs_poll_done(struct occ *occ)
 		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
 	}
 
+	if ((header->ext_status & OCC_EXT_STAT_DVFS_VDD) !=
+	    (occ->prev_ext_stat & OCC_EXT_STAT_DVFS_VDD)) {
+		name = sensor_dev_attr_occ_dvfs_vdd.dev_attr.attr.name;
+		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
+	}
+
+	if ((header->ext_status & OCC_EXT_STAT_GPU_THROTTLE) !=
+	    (occ->prev_ext_stat & OCC_EXT_STAT_GPU_THROTTLE)) {
+		name = sensor_dev_attr_occ_gpu_throttle.dev_attr.attr.name;
+		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
+	}
+
 	if ((header->status & OCC_STAT_MASTER) &&
 	    header->occs_present != occ->prev_occs_present) {
 		name = sensor_dev_attr_occs_present.dev_attr.attr.name;
-- 
2.27.0

