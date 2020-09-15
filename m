Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B00226A95A
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 18:10:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrSrB1PrNzDqNW
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 02:10:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kv2GUCED; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrSg75lH8zDqNF
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 02:02:43 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FG1Udj119157
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 12:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=ojV/t0M52PKDacrc1+6m5ufiLR8LFGZJsj8IJwoZgU4=;
 b=kv2GUCEDEIKhq2rbRT7xReMIhTCGWHc2FQb4PAYeV13ahYcUKMt69sA1sMeoCApJpIzR
 e/VruJBKx2ATmaOHxi+LOjdOfFtn/0Za0+W5fb5S3Rsx+9dgC5BaywGUxSNKuUHHlEn9
 Xf9YogZRYinIfe/JjHON0+bMurANoAd8PfPqY7O0ufJYLqUdp8N2x+3vEYdkVEm7al+K
 ojDNgI+5n3s2IuGUYl7/wi1Ueoiw8EBsp4EFDLkhR2X9v1V0f048i7Jb/FVuVNnwCVeY
 0YxigiQTDuvI1qwhdERYKMx2Rw5u6N1dmxMrY0HCWnIV+6meQYYjSf3/EcLXKR0rtO8a Mw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33k0ah0qj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 12:02:38 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08FFlsCV011881
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 15:57:37 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 33jaxxqxbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 15:57:37 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08FFvane54133200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 15:57:36 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C87C612405A
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 15:57:36 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D82B124053
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 15:57:36 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.204.63])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 15:57:36 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: DROPBEAR_DH_GROUP14_SHA1 discussion
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <1f64fcfe-2629-de28-679d-ce99503b23e6@linux.ibm.com>
Date: Tue, 15 Sep 2020 10:57:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_11:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxlogscore=865 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009150128
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

I got a question about the ciphers supported by the dropbear SSH server 
that was patched here [1].
Specifically, the OpenBMC patch disables DROPBEAR_DH_GROUP14_SHA1. What 
are the consequences of re-enabling it in a downstream project?

My answer:
OpenBMC disabled this because SHA1 algorithms are considered to be 
medium strength and the ability to break these will only increase during 
a typical BMC lifetime of 7 years.  I understand this means an attacker 
with (1) visibility to the encrypted SSH traffic and (2) access to a 
very powerful compute facility may be able to break the encryption in 24 
hours.  If this risk is acceptable, you can re-enable this cipher.

- Joseph

[1]: 
https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch 

