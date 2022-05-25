Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D178B533FC4
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 16:59:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Z3v4zh2z3bWg
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 00:59:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RuN9J5Uf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RuN9J5Uf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Z3R0dr1z2ywR
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 00:59:30 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PDS1ua015194
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=tnKakaFOiNpOhtVP29B7yBGrmvD63qzw0chP6kEs8NM=;
 b=RuN9J5UfjoOWcXTGgHr+7b3j1GgSpTZ1Op1JN2PZwPqT7zZ0cv27AdeToFEZgt9lr+C5
 9utrcx/PDcd4ENrdbe2osVFz3US+l8AYNiELXpXs2gCipkrvczv1mB63+p2w9DjA3e/i
 G/uRT3B6BgYA2ndKqpm3jvtgNYZX0Ctdi44raENV8JUeTsYzIIbglXft13CDJVWtvfy4
 Bv5uFG8szuZmSXa1+JGtAnrV1H0mLWor4ie11YzePqYnaZVPv/av8r0/ewdbUNbaBDKt
 0DLhbwjvvzMULoRv0CfAvBdMy3swMS3M27URZdUMIMy4eewb0cMfxd01h9LjQ18XX5VR Ng== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9nc7sx2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:59:27 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PEs4KJ002339
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:59:27 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3g93utgaxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:59:27 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PExQZh26870172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:59:26 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F19DB2068
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:59:26 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01193B205F
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:59:26 +0000 (GMT)
Received: from [9.65.94.241] (unknown [9.65.94.241])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 14:59:25 +0000 (GMT)
Message-ID: <b724cac2-da1d-7d5b-f545-dacdf95fc519@linux.ibm.com>
Date: Wed, 25 May 2022 09:59:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday May 25
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cFlZulPZkf9wusFNaA6EFdvhtpmzZHs1
X-Proofpoint-ORIG-GUID: cFlZulPZkf9wusFNaA6EFdvhtpmzZHs1
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_04,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=630 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250076
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday May 25 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
and anything else that comes up:

1. No topics.




Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
