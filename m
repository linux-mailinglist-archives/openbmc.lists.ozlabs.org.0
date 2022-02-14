Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6694B5E07
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 00:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyKXd3GsPz3bTd
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 10:04:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=trssU6mK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=trssU6mK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyKTK2Pk0z2ywb
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 10:01:09 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EKI44c019552; 
 Mon, 14 Feb 2022 23:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Kd1FD4NJgY4bDYP6yHxyjz7rGjiUViUnTQ1l/FQqWVQ=;
 b=trssU6mK8DmDPg0dkWepbs5vhH1c+dZEYTzQvRZrjTxNDOc/bi3L6rnPE0tZUksaKDPC
 icbb8sYhMAbXUVtsrEN7fp0YFYaXbdQt1AAWTePjkdAJH5UVqQCICG8uCyWJKBsPm0Et
 2fgH0KrpdeMDaFmMUmOw4fUFfBVoPUoxdcruKaQcBVV8InDhzYTapjGAMu4hlW8dPwuQ
 fs+GmZXetOVwuEXomAI+gdo8H0zHaToSQN91nxrg1APoYPfbNBNN/A+dP2iC+0mOj3QP
 g4pv+63SFN2pXfVvpxPCOXvUI7DGYQTFRAaQJtGi6GORJw1dEH3dnsCJpnqsxMpQ54WK PA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e79fw64w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 23:01:06 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EMw4dK011068;
 Mon, 14 Feb 2022 23:01:05 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3e64hab693-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 23:01:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EN13kh22806954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 23:01:03 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DAA01120A5;
 Mon, 14 Feb 2022 23:01:03 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79AAB1120B1;
 Mon, 14 Feb 2022 23:01:02 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.10.159])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 23:01:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 4/4] hwmon: (occ) Add soft minimum power cap
 attribute
Date: Mon, 14 Feb 2022 17:00:53 -0600
Message-Id: <20220214230053.38449-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220214230053.38449-1-eajames@linux.ibm.com>
References: <20220214230053.38449-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QsuV-jAOtEPFypcLFI0iBT0S5H42Wg5W
X-Proofpoint-ORIG-GUID: QsuV-jAOtEPFypcLFI0iBT0S5H42Wg5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_07,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Export the power caps data for the soft minimum power cap through hwmon.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 0cb4a0a6cbc1..f00cd59f1d19 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -674,6 +674,9 @@ static ssize_t occ_show_caps_3(struct device *dev,
 	case 7:
 		val = caps->user_source;
 		break;
+	case 8:
+		val = get_unaligned_be16(&caps->soft_min) * 1000000ULL;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -835,12 +838,13 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	case 1:
 		num_attrs += (sensors->caps.num_sensors * 7);
 		break;
-	case 3:
-		show_caps = occ_show_caps_3;
-		fallthrough;
 	case 2:
 		num_attrs += (sensors->caps.num_sensors * 8);
 		break;
+	case 3:
+		show_caps = occ_show_caps_3;
+		num_attrs += (sensors->caps.num_sensors * 9);
+		break;
 	default:
 		sensors->caps.num_sensors = 0;
 	}
@@ -1047,6 +1051,15 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_caps, NULL, 7, 0);
 			attr++;
+
+			if (sensors->caps.version > 2) {
+				snprintf(attr->name, sizeof(attr->name),
+					 "power%d_cap_min_soft", s);
+				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+							     show_caps, NULL,
+							     8, 0);
+				attr++;
+			}
 		}
 	}
 
-- 
2.27.0

