Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C300043A6AE
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 00:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdVHD4R02z2xXG
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 09:38:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BjalCLWB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BjalCLWB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdVGl2BBrz2xXG
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 09:38:22 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PLwSqE006628; 
 Mon, 25 Oct 2021 22:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : to :
 cc : from : subject : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=Cn0fW8pzAkDZPxmKGcd2yBjOWxD1GRZIWdtO6JIwqRc=;
 b=BjalCLWBoBkjw73z5i0L7hGQjtic7nUs7CMReaQbMapS4k8WSn0JYOG6t83vwtv10GyJ
 eiwdXAtjxckNYKZrtopDhoT17nFVnGTdmrpgXiDoJ485gPCIU0gmO1U1GIiQxJ40KS9i
 aesaYqSLmUzC3WFz+w9i8ZF9rOqAAjLAJhSirVe8ZZHn7bLFmf9rZNfUfkLffi61lNNU
 kU68+aAx8qhUer7L+OPE25ttV27MkDwjMi7CBD6IzJ1h5gRBmYYc38jPvps3RIHuYpQD
 qhuCbUb1cH2U7pC9qk/ckZwuEaO4wL51bvBoK541x/QE9fdWX8rDsp5TPrGgJetlXC0/ Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4yfrnss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 22:38:10 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19PMFYb5017521;
 Mon, 25 Oct 2021 22:38:10 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4yfrnse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 22:38:10 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19PMYLIs024796;
 Mon, 25 Oct 2021 22:38:08 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3bx4eygwry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 22:38:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19PMc8ho12583316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 22:38:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB04178060;
 Mon, 25 Oct 2021 22:38:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 839A77806E;
 Mon, 25 Oct 2021 22:38:07 +0000 (GMT)
Received: from [9.163.11.121] (unknown [9.163.11.121])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 25 Oct 2021 22:38:07 +0000 (GMT)
Message-ID: <e3b860da-7fab-2453-c936-ba7fe0bc858f@linux.vnet.ibm.com>
Date: Mon, 25 Oct 2021 15:38:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: apparao.puli@linux.intel.com, richard.marian.thomaiyar@linux.intel.com
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Subject: Please review these 2 XS Gerrit reviews of service-config-manager
 (i.e. srvcfg-manager)
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tCl-c3nDsoQSoyjz1-D6PZ1COmJdZQS_
X-Proofpoint-ORIG-GUID: R-HP1oArv5HZ_0MKUmgL-4AIBhpA9qZ4
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_07,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1011
 mlxlogscore=730 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2110250127
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
Cc: vernon.mauery@linux.intel.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, liuxiwei@inspur.com,
 Johnathan Mantey <johnathanx.mantey@intel.com>, gmills@us.ibm.com,
 rashmica.g@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


47932: srvcfg-manager: Use true instead of 1 for a while loop
https://gerrit.openbmc-project.xyz/c/openbmc/service-config-manager/+/47932

and

47921: Replace IRC with Discord
https://gerrit.openbmc-project.xyz/c/openbmc/service-config-manager/+/47921

Please let me know if you are way backlogged what a estimate of
when maybe you can look at them.

Thank you!
