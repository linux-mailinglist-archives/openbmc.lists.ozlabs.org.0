Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662154FC225
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 18:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcYyg2B5xz3bWD
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 02:21:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n7Ce8J1A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n7Ce8J1A; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcYxR5vnvz2yPv
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 02:20:43 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BF2sqb004067; 
 Mon, 11 Apr 2022 16:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tXJSfYG+ezzJKJJETcRDQ6rZOBy2t4qsDATl1Irm9bc=;
 b=n7Ce8J1AyarOvntZBpkORjDVjks8f5KlQEy5gpbovRDrS8c8irjNUtA++lJ9fOlKgXu5
 lxRf6A14yPGQMZ5AZYpRxLFjWU5PkDOhgjMOT09QLcblC9xDvMDZKqUml1prNxsOE6G1
 UxgDnWBOhWEwSbpkH3T/9Dnz/rD6P1Y4uZSoljGppYXXm4KcIbYzedpH149C8Aa5pAdd
 NI75uUZRnFOgdCvbqjXhY6I4a8Y8iuMEg6gmKi3Do4kSAtuys61lso8aWLZOGvDmpdrc
 czy6rIMabWZ97RO2vMk0PxFZaPS44gTTKYowZVNYiu6hmZ0dU7caBJhQcEtpjXf34BRg Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcpmghn6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:39 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BGDTQL024487;
 Mon, 11 Apr 2022 16:20:39 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcpmghn5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:38 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BGDQfs031571;
 Mon, 11 Apr 2022 16:20:37 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3fb1s98x77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:37 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23BGKb8N59375900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 16:20:37 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45B88124055;
 Mon, 11 Apr 2022 16:20:37 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50471124058;
 Mon, 11 Apr 2022 16:20:36 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.106.206])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Apr 2022 16:20:36 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Subject: [PATCH v3 0/4] leds: pca955x: Add HW blink support
Date: Mon, 11 Apr 2022 11:20:29 -0500
Message-Id: <20220411162033.39613-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Jf0Lhr0ZSQWN8O_D1VdS7xpZ6MMjN8yr
X-Proofpoint-GUID: Av2hZI4HOjfN_Hq7XENZ5kTBcvcx7X3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_06,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=655
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110089
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
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com, joel@jms.id.au,
 pavel@ucw.cz
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds support for blinking using the PCA955x chip, falling
back to software blinking if another LED on the chip is already blinking
at a different rate, or if the requested rate isn't representable with
the PCA955x.
Also included are some minor clean up and optimization changes that make
the HW blinking a bit easier.

Changes since v2:
 - Split the cleanup patch
 - Prettier dev_err calls
 - Include units for blink period and use defined unit translations
   rather than just a number.
 - Use positive conditionals.

Changes since v1:
 - Rework the blink function to fallback to software blinking if the
   period is out of range of the chip's capabilities or if another LED
   on the chip is already blinking at a different rate.
 - Add the cleanup patch

Eddie James (4):
  leds: pca955x: Refactor with helper functions and renaming
  leds: pca955x: Use pointers to driver data rather than I2C client
  leds: pca955x: Optimize probe led selection
  leds: pca955x: Add HW blink support

 drivers/leds/leds-pca955x.c | 341 ++++++++++++++++++++++++------------
 1 file changed, 232 insertions(+), 109 deletions(-)

-- 
2.27.0

