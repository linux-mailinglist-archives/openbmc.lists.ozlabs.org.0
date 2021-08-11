Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB03E94E4
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDg90bh4z30Fg
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:45:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ggvSSz4i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ggvSSz4i; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbl1VRQz2ysv
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFXxic132655; Wed, 11 Aug 2021 11:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=COo4rF58Vlt0Og4F6DjuRfxg9E3RRUi0ADfkcAFJFXY=;
 b=ggvSSz4iS5HPnXgGXw696/SxbEiYEx9KlxiX5sG5FRarrJ0j/6Y5Rfjf3gvLfqx03Jj+
 fsmQA4LMlWZsjzMK3aQ/RUlVnPsfzeLRMZBKb98sfHNkGjAvqsUuvgbHZ/cdjKPzFWpC
 0+BSZNQMGM7gbi0hiuTJfp7FDJwXSShv4k1fkWKPS/3PbS+w84itHVUSJF4xSH1rq94J
 PI9rfO+qSb2vIsYK22zL57nhHW3B+atGg4/fY5/ux2WHrfzET/f6Q+bJddjblsJ3dJC+
 8FBUUi2InK0yl/n11/obhu2OIwc2vSLDfAYxGFOXrB/qewxlyWl4QkSkiBgw/cW7Ezpm PQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abt97tsht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:37 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFXd3t024679;
 Wed, 11 Aug 2021 15:42:36 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3a9htdenu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:36 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgZpP13894208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:35 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A88F06A06B;
 Wed, 11 Aug 2021 15:42:35 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BBC36A05D;
 Wed, 11 Aug 2021 15:42:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 05/14] pmbus: (core) Add a one-shot retry in
 pmbus_set_page()
Date: Wed, 11 Aug 2021 10:42:23 -0500
Message-Id: <20210811154232.12649-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MWBXM_NoHFw784mLkNIFYzFLz97Qx56e
X-Proofpoint-GUID: MWBXM_NoHFw784mLkNIFYzFLz97Qx56e
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110104
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Jeffery <andrew@aj.id.au>

From extensive testing and tracing it was discovered that the MAX31785
occasionally fails to switch pages despite ACK'ing the PAGE PMBus data
write. I suspect this behaviour had been seen on other devices as well,
as pmbus_set_page() already read-back the freshly set value and errored
out if it wasn't what we requested.

In the case of the MAX31785 it was shown that a one-shot retry was
enough to get the PAGE write to stick if the inital command failed. To
improve robustness, only error out if the one-shot retry also fails to
stick.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/pmbus/pmbus_core.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index def8be831456..1a13d6d3f8b5 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -151,25 +151,34 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
 	    data->info->pages > 1 && page != data->currpage) {
+		int i;
+
 		dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
 			data->currpage);
 
-		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		if (rv < 0) {
+		for (i = 0; i < 2; i++) {
 			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
 						       page);
-			dev_dbg(&client->dev,
-				"Failed to set page %u, performed one-shot retry %s: %d\n",
-				page, rv ? "and failed" : "with success", rv);
+			if (rv)
+				continue;
+
+			rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 			if (rv < 0)
-				return rv;
-		}
+				continue;
 
-		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		if (rv < 0)
-			return rv;
+			/* Success, exit loop */
+			if (rv == page)
+				break;
+
+			rv = i2c_smbus_read_byte_data(client, PMBUS_STATUS_CML);
+			if (rv < 0)
+				continue;
+
+			if (rv & PB_CML_FAULT_INVALID_DATA)
+				return -EIO;
+		}
 
-		if (rv != page)
+		if (i == 2)
 			return -EIO;
 	}
 	data->currpage = page;
-- 
2.27.0

