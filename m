Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F341268E
	for <lists+openbmc@lfdr.de>; Mon, 20 Sep 2021 21:01:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCv693B2xz2yPF
	for <lists+openbmc@lfdr.de>; Tue, 21 Sep 2021 05:01:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OmUPGFjE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OmUPGFjE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCv5k4Qd3z2yKB;
 Tue, 21 Sep 2021 05:00:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KHTArs011104; 
 Mon, 20 Sep 2021 15:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wFXFaJ3XFIv2SYPbW5RRPnQOc+l3TOww7Aom5wmKs/g=;
 b=OmUPGFjEdoAwi0WE/lrNESBLt+tEROh5aV5KwUSmtuDueKG1rVtNV49nOZYFvCH/g//x
 1WszfSV4rKs35adNTuwO8q7bsqqYD5X6JwINoqBm8PtWbY6kt7+ca7hOZuE+Lqu9fiQX
 TuL+ZQj/TZZAQ7JMj4P6CTENL4ekGJm3j/WBoQCySYjktbTWkFGQYBcbPTBYeYJjyMD3
 PBS+IsPL7i9/oKrnfy6MM7FtZAMAZFCDZevdOPL9GK8Q32EMvAVQTJsZrPOyFGUOos+a
 j8yZqr3ralBJu6xANy67tQiyiJRcII8rJ85yovvzr2SCkp74lGRz9z2cCWncZgoU2liy gw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b6unsywp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 15:00:37 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KIb6aL023847;
 Mon, 20 Sep 2021 19:00:36 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3b57r9xs67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 19:00:36 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KJ0ZGu36045304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 19:00:35 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1144112075;
 Mon, 20 Sep 2021 19:00:35 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3281112064;
 Mon, 20 Sep 2021 19:00:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.87.144])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 19:00:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH] fsi: sbefifo: Add sysfs file indicating a timeout error
Date: Mon, 20 Sep 2021 14:00:31 -0500
Message-Id: <20210920190031.22168-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xd9VfU-_gb4OspdpkqSttHH2ONROusVb
X-Proofpoint-ORIG-GUID: xd9VfU-_gb4OspdpkqSttHH2ONROusVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109200109
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The SBEFIFO timeout error requires special handling in userspace
to do recovery operations. Add a sysfs file to indicate a timeout
error, and notify pollers when a timeout occurs.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 84cb965bfed5..b414ab4431ef 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -124,6 +124,7 @@ struct sbefifo {
 	bool			broken;
 	bool			dead;
 	bool			async_ffdc;
+	bool			timed_out;
 };
 
 struct sbefifo_user {
@@ -136,6 +137,14 @@ struct sbefifo_user {
 
 static DEFINE_MUTEX(sbefifo_ffdc_mutex);
 
+static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct sbefifo *sbefifo = container_of(dev, struct sbefifo, dev);
+
+	return sysfs_emit(buf, "%d\n", sbefifo->timed_out ? 1 : 0);
+}
+static DEVICE_ATTR_RO(timeout);
 
 static void __sbefifo_dump_ffdc(struct device *dev, const __be32 *ffdc,
 				size_t ffdc_sz, bool internal)
@@ -462,11 +471,14 @@ static int sbefifo_wait(struct sbefifo *sbefifo, bool up,
 			break;
 	}
 	if (!ready) {
+		sysfs_notify(&sbefifo->dev.kobj, NULL, dev_attr_timeout.attr.name);
+		sbefifo->timed_out = true;
 		dev_err(dev, "%s FIFO Timeout ! status=%08x\n", up ? "UP" : "DOWN", sts);
 		return -ETIMEDOUT;
 	}
 	dev_vdbg(dev, "End of wait status: %08x\n", sts);
 
+	sbefifo->timed_out = false;
 	*status = sts;
 
 	return 0;
@@ -993,6 +1005,8 @@ static int sbefifo_probe(struct device *dev)
 				 child_name);
 	}
 
+	device_create_file(&sbefifo->dev, &dev_attr_timeout);
+
 	return 0;
  err_free_minor:
 	fsi_free_minor(sbefifo->dev.devt);
@@ -1018,6 +1032,8 @@ static int sbefifo_remove(struct device *dev)
 
 	dev_dbg(dev, "Removing sbefifo device...\n");
 
+	device_remove_file(&sbefifo->dev, &dev_attr_timeout);
+
 	mutex_lock(&sbefifo->lock);
 	sbefifo->dead = true;
 	mutex_unlock(&sbefifo->lock);
-- 
2.27.0

