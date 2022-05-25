Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B305334A5
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 03:19:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7CsH3FpTz3bXn
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 11:19:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EbZ4xqYa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EbZ4xqYa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Crt4GbCz2y0B
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 11:19:10 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OMKHck000924;
 Wed, 25 May 2022 01:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hUCXVZ1QQTV3pL7uYRRvpa9uhl17r5LlJ2oruo3l66c=;
 b=EbZ4xqYaKG4Mqb7P5GLsilEx37JuW6HJAuayF+zJcMXacoeFhfmGKTSk1WjNufTpjxQp
 kB8wyENOzZKqJygYHYIi52HUU/B4/ZwfWlGGF8awauypZNlQjZ2LOsbLaE9V5KfeZtJm
 P2jAbg3/iAg7YoPwceiy2quiAQ/3xh19MIs8VsENs5gWjzZGfxKNah6mkInugxuHPsyE
 LFXQBQarJct4vPSVutpuJB69C/ByN+ILyfxSYDqCrFOXkB8dGLP/LQkTba5/r1klwAaN
 my60Oo8Xnku/+vLEYwVsk3xpcc+PMRSZoWQnBDanPa7XFIO5YOrgsmN8J8MgKgS5Nsu4 Uw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g982m2jq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 01:19:06 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24P1Bxpb015279;
 Wed, 25 May 2022 01:19:06 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3g93utb8dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 01:19:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24P1J5Rm24117634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 01:19:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 280DEAC05F;
 Wed, 25 May 2022 01:19:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4018AC059;
 Wed, 25 May 2022 01:19:04 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.119.82])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 01:19:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] leds: Ensure hardware blinking turns off when
 requested
Date: Tue, 24 May 2022 20:19:02 -0500
Message-Id: <20220525011902.6254-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ocmx1Fnb5ZYo3ySBaP3yhOUPHt4sCgG0
X-Proofpoint-GUID: ocmx1Fnb5ZYo3ySBaP3yhOUPHt4sCgG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_11,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=674 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250006
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

If an LED is blinking through the hardware and the trigger is deactivated,
the driver will set the brightness to 0 to disable blinking. However, if
the LED driver doesn't support non-blocking operations, the request for
setting brightness to 0 will get queued. Then if a user requests a new
non-zero brightness before the request for 0 brightness is executed, the
LED blinking will not get disabled since the brightness will simply be
updated.
Fix this by flushing the workqueue before updating the requested
brightness.

Fixes: 4d71a4a12b13 ("leds: Add support for setting brightness in a synchronous way")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/led-class.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index f4bb02f6e042..632645db0966 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -55,6 +55,8 @@ static ssize_t brightness_store(struct device *dev,
 
 	if (state == LED_OFF)
 		led_trigger_remove(led_cdev);
+	/* flush out any request to disable blinking */
+	flush_work(&led_cdev->set_brightness_work);
 	led_set_brightness(led_cdev, state);
 	flush_work(&led_cdev->set_brightness_work);
 
-- 
2.27.0

