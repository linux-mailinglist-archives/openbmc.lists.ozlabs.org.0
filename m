Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F44B5E03
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 00:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyKVP5wmVz3bcl
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 10:02:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gf5qJiNe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gf5qJiNe; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyKTH1X0Dz2ywb
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 10:01:06 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EM8qYv021937; 
 Mon, 14 Feb 2022 23:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=a+iuWb53O1yR35Q/SiXyv/UA3c60dTEY9xh/KCry72g=;
 b=gf5qJiNeEpHCNVu/qQf4KQEMjlWuRNjhpTROr2xUIoEQLOaR8InrNs3qr8pWjjTnTMWP
 o0D+doMLDZnSOe2x8JOh/UufFbpZ2jdsJgPBKTsowIjwEenovjKVivi7M0/bZb7K3Met
 bJYQZwGWf8aQxzNmhqaa9ARuhZwtZ3tu6CZBWQ5ttE6mAtI1yGpz5nTCaGuMPYZfxf//
 5oQrqNZHM80NHxPjrtnUowJ07IbgREvocKn097p72du0D+mDChXO1g5m6FdEmzTpIDey
 78LmnC5irUfEu5aN7iBQ2dTi1Lr2ba/GNEEeEs8/jMOxXZ8u+1PNaCbDmSfOn0le1PIU cw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e779vyqch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 23:01:04 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EMw3ug016409;
 Mon, 14 Feb 2022 23:01:03 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3e64hab6je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 23:01:03 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EN11Xd34013478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 23:01:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2505A11209E;
 Mon, 14 Feb 2022 23:01:01 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C1181120A9;
 Mon, 14 Feb 2022 23:01:00 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.10.159])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 23:01:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 2/4] hwmon: (occ) Add sysfs entry for OCC mode
Date: Mon, 14 Feb 2022 17:00:51 -0600
Message-Id: <20220214230053.38449-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220214230053.38449-1-eajames@linux.ibm.com>
References: <20220214230053.38449-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6jDnCX1C8jajhzweDCb2ehx90-exxZtS
X-Proofpoint-ORIG-GUID: 6jDnCX1C8jajhzweDCb2ehx90-exxZtS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_07,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

BMC control applications need to check the OCC mode returned by the
OCC poll response, so export it in sysfs with the other OCC-specific
data.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.h |  1 +
 drivers/hwmon/occ/sysfs.c  | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index a88c66d36e38..2dd4a4d240c0 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -120,6 +120,7 @@ struct occ {
 	u8 prev_ext_stat;
 	u8 prev_occs_present;
 	u8 prev_ips_status;
+	u8 prev_mode;
 };
 
 int occ_setup(struct occ *occ, const char *name);
diff --git a/drivers/hwmon/occ/sysfs.c b/drivers/hwmon/occ/sysfs.c
index 6dc69c9aa4c2..88f655887c95 100644
--- a/drivers/hwmon/occ/sysfs.c
+++ b/drivers/hwmon/occ/sysfs.c
@@ -66,6 +66,9 @@ static ssize_t occ_sysfs_show(struct device *dev,
 	case 8:
 		val = header->ips_status;
 		break;
+	case 9:
+		val = header->mode;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -92,6 +95,7 @@ static SENSOR_DEVICE_ATTR(occ_quick_pwr_drop, 0444, occ_sysfs_show, NULL, 5);
 static SENSOR_DEVICE_ATTR(occ_state, 0444, occ_sysfs_show, NULL, 6);
 static SENSOR_DEVICE_ATTR(occs_present, 0444, occ_sysfs_show, NULL, 7);
 static SENSOR_DEVICE_ATTR(occ_ips_status, 0444, occ_sysfs_show, NULL, 8);
+static SENSOR_DEVICE_ATTR(occ_mode, 0444, occ_sysfs_show, NULL, 9);
 static DEVICE_ATTR_RO(occ_error);
 
 static struct attribute *occ_attributes[] = {
@@ -104,6 +108,7 @@ static struct attribute *occ_attributes[] = {
 	&sensor_dev_attr_occ_state.dev_attr.attr,
 	&sensor_dev_attr_occs_present.dev_attr.attr,
 	&sensor_dev_attr_occ_ips_status.dev_attr.attr,
+	&sensor_dev_attr_occ_mode.dev_attr.attr,
 	&dev_attr_occ_error.attr,
 	NULL
 };
@@ -172,6 +177,11 @@ void occ_sysfs_poll_done(struct occ *occ)
 		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
 	}
 
+	if (header->mode != occ->prev_mode) {
+		name = sensor_dev_attr_occ_mode.dev_attr.attr.name;
+		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
+	}
+
 	if (occ->error && occ->error != occ->prev_error) {
 		name = dev_attr_occ_error.attr.name;
 		sysfs_notify(&occ->bus_dev->kobj, NULL, name);
@@ -185,6 +195,7 @@ void occ_sysfs_poll_done(struct occ *occ)
 	occ->prev_ext_stat = header->ext_status;
 	occ->prev_occs_present = header->occs_present;
 	occ->prev_ips_status = header->ips_status;
+	occ->prev_mode = header->mode;
 }
 
 int occ_setup_sysfs(struct occ *occ)
-- 
2.27.0

