Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC3840EC73
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 23:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9VTv40r3z2yQy
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 07:24:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vihb30xA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vihb30xA; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9VQN37n6z2yJL
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 07:21:47 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GKv2EW017615; 
 Thu, 16 Sep 2021 17:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5ic/B7BuuW1YuzrlXL7+lVY6zOkUzUTCZFWBbGskhC8=;
 b=Vihb30xAzaL1vm60IVSLuYjq+2cl+2JUMWyTauXGfzaOpVNJbZZrGD9KUHI0QTrFTtqT
 fo76Ab0/pUjtTHyYZ1fpVvbL4OLPDaBzCnJ+uPNvsarFfmY3r98ASTq0+zRklUQgFv8i
 BWRz4+nsh5RFd/KvGJWhr4cRXWYE4wN3xIDcOB/KlzTDRZomB23fDchBXXq99ASIJ058
 cXdKU/7Kp+LPYydU9OijQPkwVLzLERE5EZ4CmkOQZ2ej03kB4qI5kSv7G/hm9R6olHSV
 SyEk/yx/J9IYPK9pC8KXZClItOwUkF7A7TJbO3JetmbkXu/EijvFE8OJom0bsoBpiDJj Yw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4bph2r32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 17:21:43 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GL9seS004222;
 Thu, 16 Sep 2021 21:21:43 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3b0m3d8v1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 21:21:43 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18GLLgIh39256544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 21:21:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B3AEAC05E;
 Thu, 16 Sep 2021 21:21:42 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2FADAC059;
 Thu, 16 Sep 2021 21:21:41 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.39.159])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Sep 2021 21:21:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 2/7] leds: leds-core: Implement the
 retain-state-shutdown property
Date: Thu, 16 Sep 2021 16:21:35 -0500
Message-Id: <20210916212140.33915-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916212140.33915-1-eajames@linux.ibm.com>
References: <20210916212140.33915-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mt0zdt8o9Sj6_RJ4M5uAsiuRpcOjUNoC
X-Proofpoint-GUID: Mt0zdt8o9Sj6_RJ4M5uAsiuRpcOjUNoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_07,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=955 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160122
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Read the retain-state-shutdown device tree property to set the
existing LED_RETAIN_AT_SHUTDOWN flag. Then check the flag when
unregistering, and if set, don't set the brightness to OFF. This
is useful for systems that want to keep the HW state of the LED
across reboots.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/led-class.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4365c1cc4505..bc66f1035d06 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -351,10 +351,15 @@ int led_classdev_register_ext(struct device *parent,
 		if (ret < 0)
 			return ret;
 
-		if (init_data->fwnode)
+		if (init_data->fwnode) {
 			fwnode_property_read_string(init_data->fwnode,
 				"linux,default-trigger",
 				&led_cdev->default_trigger);
+
+			if (fwnode_property_present(init_data->fwnode,
+						    "retain-state-shutdown"))
+				led_cdev->flags |= LED_RETAIN_AT_SHUTDOWN;
+		}
 	} else {
 		proposed_name = led_cdev->name;
 	}
@@ -445,7 +450,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
 
-	led_set_brightness(led_cdev, LED_OFF);
+	if (!(led_cdev->flags & LED_RETAIN_AT_SHUTDOWN))
+		led_set_brightness(led_cdev, LED_OFF);
 
 	flush_work(&led_cdev->set_brightness_work);
 
-- 
2.27.0

