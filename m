Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F6943B308
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 15:14:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdsjQ54Svz2yZf
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 00:14:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IP+UFbDg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IP+UFbDg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdshy3JjWz2x9T
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 00:13:53 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QCaElN006514
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=lQJDNxpPgrx0UW4mSMpD8aIcWsdi/WGf8V+veQu5IGE=;
 b=IP+UFbDgvGx/ZYJ+UPm1/nebBB9iD0tRFekpsRSWNm8rhu4ZLnnSnVVXhBUD5cnVhT5k
 7olz1/Xv0plwvLDywCjImHeF39SmklAFb4gMMMycMcMbSBy0pwZqfJZYGQLLYaL7i7Fo
 cY57kvHSmBPNArsL1MVuB3vGrdY59AW79riJohroUeoscPcddEmDjMEsSUEnVSzOyiPg
 JFENQeRCvNfvWDIHpBgulEVWg5Lzwu9enEO8YTMOTb3d7zIFHdKlkdHCoVOwIcSDLwxq
 abhbXCUsrf/1+T0sHOeoN+pQwd0BJ3zdO71z2FlsHaF7bOVW7ctttPZ5pUchJdWF/CG2 kw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4yge8f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:13:45 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QDBUPk015489
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:12:41 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3bx4eyuxvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:12:41 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19QDCeB152887858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:12:40 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01897BE065
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:12:40 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8D51BE05F
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:12:39 +0000 (GMT)
Received: from [9.77.132.135] (unknown [9.77.132.135])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:12:39 +0000 (GMT)
Message-ID: <d0b57999-f452-5239-ccd1-3823fc551a30@linux.ibm.com>
Date: Tue, 26 Oct 2021 08:12:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group - Wednesday October 27
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D_YcGd48YvAqrl_eVFihjE7K6mxwfebu
X-Proofpoint-ORIG-GUID: D_YcGd48YvAqrl_eVFihjE7K6mxwfebu
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_02,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2110260076
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
scheduled for this Wednesday October 27 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
and anything else that comes up:

1.Changing the os-release BUILD_ID back to its default value of DATETIME 
(recipe os-release.bb) - 
https://lore.kernel.org/openbmc/CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO_x5kZ2RAzCg@mail.gmail.com/T/#m0065dab191fe8048ea02ab3c28b31362252f7622 
<https://lore.kernel.org/openbmc/CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO_x5kZ2RAzCg@mail.gmail.com/T/#m0065dab191fe8048ea02ab3c28b31362252f7622>(background 
reference: https://man7.org/linux/man-pages/man5/os-release.5.html 
<https://man7.org/linux/man-pages/man5/os-release.5.html>).

Will the builder need to supply BUILD_ID to maintain a stable (aka 
deterministic, aka reproducible) build?




Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
