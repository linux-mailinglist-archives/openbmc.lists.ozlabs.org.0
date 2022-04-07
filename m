Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94EC4F8737
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 20:41:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ9FZ61LPz3bXR
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 04:41:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xf0jad1z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xf0jad1z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ9DQ1s3Hz2xBb
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 04:40:21 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 237IdFVG023828; 
 Thu, 7 Apr 2022 18:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Fl2GO6wGc28nQZYONKzjL4fEx5OpdVBXnH9xBytf0oc=;
 b=Xf0jad1zfUolVMIrE1lmF28wJxnLOWII3wckW7BnIRXF56iDtyZV9dEmE5Ik6c/l+FrN
 9yhraT0O6ONmX0/DAZs3ETgwDrDZpunJnrso/5Dt6KXtiyEWw/I9pk1hnBvEcHKJkkLC
 PFxVi+RrArEpWMhPY4hoAYNbns2ApzoMIph2jlcdUzQ5icfwHu1J+UfVU5R2wjUDbczM
 aYKQ/r8Qe0ugbeuSJQw0fYED/8Ghi6kyDbUvUdM6FRKgCSj0LRpCzskHfkAErmneJcRf
 JPKaY1+0Jsb5Cb16D/dtQEkNDky0RXkW9YrUuS9WQosKjRZfriVxiqZyRCBSvbZLBckv sQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f9xkbjdra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:39:46 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 237INFeK002168;
 Thu, 7 Apr 2022 18:39:45 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3f6e4aaepv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:39:45 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 237IdiKY57082314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Apr 2022 18:39:44 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1CA4124052;
 Thu,  7 Apr 2022 18:39:44 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0180912405B;
 Thu,  7 Apr 2022 18:39:44 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.114.26])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 Apr 2022 18:39:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Subject: [PATCH v2 0/2] leds: pca955x: Add HW blink support
Date: Thu,  7 Apr 2022 13:39:39 -0500
Message-Id: <20220407183941.36555-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eANAoUZdpDgqsjUuRtf-3i-NZZM81AUi
X-Proofpoint-ORIG-GUID: eANAoUZdpDgqsjUuRtf-3i-NZZM81AUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_04,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=422 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070092
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
 linux-kernel@vger.kernel.org, joel@jms.id.au, pavel@ucw.cz
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds support for blinking using the PCA955x chip, falling
back to software blinking if another LED on the chip is already blinking
at a different rate, or if the requested rate isn't representable with
the PCA955x.

Changes since v1:
 - Rework the blink function to fallback to software blinking if the
   period is out of range of the chip's capabilities or if another LED
   on the chip is already blinking at a different rate.
 - Add the cleanup patch

Eddie James (2):
  leds: pca955x: Clean up and optimize
  leds: pca955x: Add HW blink support

 drivers/leds/leds-pca955x.c | 340 +++++++++++++++++++++++++-----------
 1 file changed, 236 insertions(+), 104 deletions(-)

-- 
2.27.0

