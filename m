Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 243B558354D
	for <lists+openbmc@lfdr.de>; Thu, 28 Jul 2022 00:22:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtStr4YGWz3bc3
	for <lists+openbmc@lfdr.de>; Thu, 28 Jul 2022 08:21:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pAj5tXVm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pAj5tXVm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtStM27Lqz2xjf
	for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2022 08:21:30 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RMBmiM013786;
	Wed, 27 Jul 2022 22:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : from
 : subject : to : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=qOY/CPnppjrXH3EuvApdmsk/6dubyE9OJ4VTBW7/7MI=;
 b=pAj5tXVm4q56XeLC4jYTsBj8qy28x7PGV/eZTIo0MSvaWJPVs+ySamYQPCAeKWtOlOcL
 8ghelIw5xXGH0pX7dPfqfVmOhIZlRma3vRwHTGrQYfwAEBvbn+2WvWN+6tts2HBgocx9
 cg/Igv+aFlfuvRZyZECkGMg4F8znEOlYMcTlz8x+G6U7N0plFuOeGE3m2eHE6B55Jx1T
 plU7xl2cX46ljV7SGL6K0XcV3eqIEv9Yix9pfwjZxELMnbKHYssa527YmTdomqO7enqu
 mKZMLPukMl6Clfk7U0TEf/ApJYjWsRwhFo7gcoc5gJPF0HgDr8lMnJCRFTDuBSsH/CjJ SA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hkdxq86gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Jul 2022 22:21:13 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RML8uq032044;
	Wed, 27 Jul 2022 22:21:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma05wdc.us.ibm.com with ESMTP id 3hg943kurc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Jul 2022 22:21:12 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26RMLBI59110230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Jul 2022 22:21:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAC22AC05E;
	Wed, 27 Jul 2022 22:21:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D137AC059;
	Wed, 27 Jul 2022 22:21:11 +0000 (GMT)
Received: from [9.65.221.58] (unknown [9.65.221.58])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 27 Jul 2022 22:21:11 +0000 (GMT)
Message-ID: <f52f9a67-b515-8e4d-f904-6ef73346e599@linux.ibm.com>
Date: Wed, 27 Jul 2022 17:21:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Change to write GitHub security advisories - attention repo
 maintainers
To: openbmc <openbmc@lists.ozlabs.org>, "Mihm, James" <james.mihm@intel.com>,
        dphadke@linux.microsoft.com
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -QzNFecICUPT-K3kdJaOPd_QtJlhim68
X-Proofpoint-ORIG-GUID: -QzNFecICUPT-K3kdJaOPd_QtJlhim68
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_08,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=710 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270097
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

OpenBMC community and technical oversight committee,

The security response team has been working to improve the process we 
use to respond to security vulnerabilities.  In short, we propose using 
GitHub security advisories, one per repository.  This better aligns with 
industry standards, and it means owners and maintainers will have a 
greater role.

I pushed a gerrit review to preview the details.  Please take a look.  
We are still working out the details and will continue to discuss before 
implementing this change.
https://gerrit.openbmc.org/c/openbmc/docs/+/55974

- Joseph

