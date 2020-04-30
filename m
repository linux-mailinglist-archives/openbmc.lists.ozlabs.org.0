Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A91C0A25
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 00:12:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CqPT32lWzDqw1
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 08:12:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CqGd22WMzDrHp
 for <openbmc@lists.ozlabs.org>; Fri,  1 May 2020 08:06:33 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ULYPvj092897; Thu, 30 Apr 2020 18:06:30 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhqbaqc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 18:06:30 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03UM68MQ011172;
 Thu, 30 Apr 2020 22:06:29 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 30mcu7n1g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 22:06:29 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03UM6Rqt25756092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 22:06:27 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85C9B13606F;
 Thu, 30 Apr 2020 22:06:27 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51B5C13606A;
 Thu, 30 Apr 2020 22:06:27 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.86.64])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 Apr 2020 22:06:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 3/3] hwmon: (occ) Add new temperature sensor
 type
Date: Thu, 30 Apr 2020 17:06:19 -0500
Message-Id: <20200430220619.31943-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200430220619.31943-1-eajames@linux.ibm.com>
References: <20200430220619.31943-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_13:2020-04-30,
 2020-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0 suspectscore=1
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004300159
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The latest version of the On-Chip Controller (OCC) has a different
format for the temperature sensor data. Add a new temperature sensor
version to handle this data.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 75 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 30e18eb60da7..52af0e728232 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -41,6 +41,14 @@ struct temp_sensor_2 {
 	u8 value;
 } __packed;
 
+struct temp_sensor_10 {
+	u32 sensor_id;
+	u8 fru_type;
+	u8 value;
+	u8 throttle;
+	u8 reserved;
+} __packed;
+
 struct freq_sensor_1 {
 	u16 sensor_id;
 	u16 value;
@@ -307,6 +315,60 @@ static ssize_t occ_show_temp_2(struct device *dev,
 	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
 }
 
+static ssize_t occ_show_temp_10(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct temp_sensor_10 *temp;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	temp = ((struct temp_sensor_10 *)sensors->temp.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = get_unaligned_be32(&temp->sensor_id);
+		break;
+	case 1:
+		val = temp->value;
+		if (val == OCC_TEMP_SENSOR_FAULT)
+			return -EREMOTEIO;
+
+		/*
+		 * VRM doesn't return temperature, only alarm bit. This
+		 * attribute maps to tempX_alarm instead of tempX_input for
+		 * VRM
+		 */
+		if (temp->fru_type != OCC_FRU_TYPE_VRM) {
+			/* sensor not ready */
+			if (val == 0)
+				return -EAGAIN;
+
+			val *= 1000;
+		}
+		break;
+	case 2:
+		val = temp->fru_type;
+		break;
+	case 3:
+		val = temp->value == OCC_TEMP_SENSOR_FAULT;
+		break;
+	case 4:
+		val = temp->throttle * 1000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
 static ssize_t occ_show_freq_1(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
@@ -745,6 +807,10 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 		num_attrs += (sensors->temp.num_sensors * 4);
 		show_temp = occ_show_temp_2;
 		break;
+	case 0x10:
+		num_attrs += (sensors->temp.num_sensors * 5);
+		show_temp = occ_show_temp_10;
+		break;
 	default:
 		sensors->temp.num_sensors = 0;
 	}
@@ -844,6 +910,15 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
 						     show_temp, NULL, 3, i);
 			attr++;
+
+			if (sensors->temp.version == 0x10) {
+				snprintf(attr->name, sizeof(attr->name),
+					 "temp%d_max", s);
+				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+							     show_temp, NULL,
+							     4, i);
+				attr++;
+			}
 		}
 	}
 
-- 
2.24.0

