Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CFC51217C
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 20:45:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpSPN5bxpz3bbV
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 04:45:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UFzMYWgy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UFzMYWgy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpSNy2pcJz3bpH
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 04:45:21 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RHx1MC017607;
 Wed, 27 Apr 2022 18:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+2FTwFw5GivqoPitlQQuogzXBngr7laJzEtA3VpfnEc=;
 b=UFzMYWgy08ANG8k0S11qYF+6Mykw17cTmDH0iaTIwErxIS0XljRxrnYltibMmpegvIOs
 uGfn8QjWmH+ugpbONWM87OpofHR2eSrwvjWHWoThPF2HT99Gvh/73zYdMTf8xXZcnbIe
 RHGO+X0SJtY7br1UTV3ZDMa6aEx52A+InoRQGDwo3YC+HsYBVKf6/3vjWz75FXdqUAWs
 zOoeeo5HfNRL8ApfYesyE72AHtiXpPuOq6TNzoKOnZ4fTF71rFNO+/vNBqlr2A1kz3f7
 5BP+IrJpQNV0QHgXqHuw0Wu+SpBDgeGm9ZACm9FzHFdokMK3/bFDEPlgQ7KYOq7gAVcx SA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpv88hqy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 18:45:18 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23RIgdLU000624;
 Wed, 27 Apr 2022 18:45:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3fm93a5exm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 18:45:18 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23RIjHir26083626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 18:45:17 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37C05124070;
 Wed, 27 Apr 2022 18:45:17 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3B68124064;
 Wed, 27 Apr 2022 18:45:16 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.88.172])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Apr 2022 18:45:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] leds: pca955x: Set blink duty cycle to fifty
 percent
Date: Wed, 27 Apr 2022 13:45:13 -0500
Message-Id: <20220427184513.21192-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JwwUlAvYp0G7dgjAZYg-jU3ffpkFnozf
X-Proofpoint-ORIG-GUID: JwwUlAvYp0G7dgjAZYg-jU3ffpkFnozf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=840 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204270116
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

In order to blink at the specified rate, the blinking LEDs
need to maintain a 50% duty cycle. Therefore, don't use PWM0
for any attempted brightness change, and set PWM0 when
enabling blinking.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 2570f92b6754..da93f04e4d10 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -289,17 +289,12 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 
 	switch (pca955x_ledstate(ls, pca955x_led->led_num % 4)) {
 	case PCA955X_LS_LED_ON:
+	case PCA955X_LS_BLINK0:
 		ret = LED_FULL;
 		break;
 	case PCA955X_LS_LED_OFF:
 		ret = LED_OFF;
 		break;
-	case PCA955X_LS_BLINK0:
-		ret = pca955x_read_pwm(pca955x, 0, &pwm);
-		if (ret)
-			return ret;
-		ret = 256 - pwm;
-		break;
 	case PCA955X_LS_BLINK1:
 		ret = pca955x_read_pwm(pca955x, 1, &pwm);
 		if (ret)
@@ -332,7 +327,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 			clear_bit(pca955x_led->led_num, &pca955x->active_blink);
 			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
 		} else {
-			ret = pca955x_write_pwm(pca955x, 0, 256 - value);
+			/* No variable brightness for blinking LEDs */
 			goto out;
 		}
 	} else {
@@ -432,6 +427,14 @@ static int pca955x_led_blink(struct led_classdev *led_cdev,
 			ret = pca955x_write_ls(pca955x, reg, ls);
 			if (ret)
 				goto out;
+
+			/*
+			 * Force 50% duty cycle to maintain the specified
+			 * blink rate.
+			 */
+			ret = pca955x_write_pwm(pca955x, 0, 128);
+			if (ret)
+				goto out;
 		}
 
 		if (pca955x->blink_period != p) {
-- 
2.27.0

