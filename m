Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FF940EC6C
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 23:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9VQk5nDVz2yNM
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 07:22:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g4Fqi0U6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g4Fqi0U6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9VQL4Sy0z2xqy
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 07:21:46 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GKmHEC013896; 
 Thu, 16 Sep 2021 17:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Y1Y9CL0PyXuhW/sWKcNv4iPvW45Dht0cFpqJ7zak2mw=;
 b=g4Fqi0U6NrSGyk7eVndbfKS9949wSBFCU9YS1p5aLBpIm4M2XgKzdZfMLMiZCUiqGl6Z
 FQ7EipwqTr/opGxu00pmuM6DLb+/BD/t3uyNJTNpWD5x6uLt4I7e6gilaxj6H2sFm9lS
 6RyBGStP2pH6QmvXqow5LR8Q+LIfSOczdvWTI2WZ1p6AdPLB8pLQNkqRBIvDteroTWbF
 idnljW4hoht33shPcd5ppja3FUj98M5m4yPjIPMreU9Im1Bz5+UK2EcGXD8+rWqxKzdW
 REPULx9zhbZsEBjCby6gIHToplFzPnezY44TJzI+SewolIIFUBNrt/xUE6Lko8mNh7qF jA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4acw47ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 17:21:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GLB7FN021136;
 Thu, 16 Sep 2021 21:21:41 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3b0m3d8vyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 21:21:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18GLLfGc37421528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 21:21:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34776AC05F;
 Thu, 16 Sep 2021 21:21:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C398DAC059;
 Thu, 16 Sep 2021 21:21:40 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.39.159])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Sep 2021 21:21:40 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 0/7] leds: Support retaining state for the
 PCA955x
Date: Thu, 16 Sep 2021 16:21:33 -0500
Message-Id: <20210916212140.33915-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tM5_1hCmI-KgLslEGkhDKbObLx2ON_SP
X-Proofpoint-ORIG-GUID: tM5_1hCmI-KgLslEGkhDKbObLx2ON_SP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_07,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=911
 mlxscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This series implements the ability to retain the state of the LEDs
controlled by the PCA955x across system reboots. This includes a
change to the LED core driver to respect the retain-state-shutdown
device tree property. It also cleans up the PCA955x driver, adds the
ability to query the hardware LED brightness, switches the I2C probe
function to probe_new, and uses more core functionality for parsing
the fwnode.

This series has been applied to linux-next.

Eddie James (7):
  dt-bindings: leds: Add retain-state-shutdown boolean
  leds: leds-core: Implement the retain-state-shutdown property
  leds: pca955x: Clean up code formatting
  leds: pca955x: Add brightness_get function
  leds: pca955x: Implement the default-state property
  leds: pca955x: Let the core process the fwnode
  leds: pca955x: Switch to i2c probe_new

 .../devicetree/bindings/leds/common.yaml      |   6 +
 drivers/leds/led-class.c                      |  10 +-
 drivers/leds/leds-pca955x.c                   | 232 +++++++++++++-----
 3 files changed, 182 insertions(+), 66 deletions(-)

-- 
2.27.0

