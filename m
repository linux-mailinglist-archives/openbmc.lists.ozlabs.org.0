Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5C38B50B
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 19:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmGbz01BXz3049
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 03:16:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lIb0AWe4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lIb0AWe4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmGbg0Rl6z2xy4
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 03:15:58 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KHDHbt058028
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 13:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=mJDr6gDmhyJJMggLynKdHIOLCMrCRMvWnB2urchhGlw=;
 b=lIb0AWe4r5SLOYVQzSXwYl0Jm7fUHm90HQ8Wymz4PNfpJeob4sPm8CTNETJOuOcBunmJ
 EmFn0+n7xEFvOrPfzw5h7+3QO70UKrrCOpwWTEpJOtTFC6pbE6DKA7vVVOYww4bpnWO8
 dZF5V5SNOtQsa0vGDOLU3bm56eV3hkpIf53mxsbCdR1I42Lq/V/eXhB1kU9vSw7HZ4LR
 hZP39DsEie82GSS3z/5N8Xs+aSKrn/2SRcubKLNXvpe3D8IeeJexuHfYcv9nDV2Kh8Le
 a9MDvQFo/MXe+PEhC7VMbRdglLcWC1VDvtp3xVtL64rYj67+xSLrFq1kEVNdlS9/xAhu JQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nupngk4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 13:15:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KGrB1b028260
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 17:15:55 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 38j5xa3hy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 17:15:55 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14KHFsaZ32768322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 17:15:54 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1051613604F
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 17:15:54 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45479136055
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 17:15:53 +0000 (GMT)
Received: from [9.206.135.189] (unknown [9.206.135.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 17:15:52 +0000 (GMT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Redfish 2021.1 release webinar on May 24
Message-ID: <4735cd75-f844-4390-ac0d-c93676b571c8@linux.vnet.ibm.com>
Date: Thu, 20 May 2021 11:15:49 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1Qu6VqVbezpYAOkpWSUf7JVUWsl7Qf5l
X-Proofpoint-ORIG-GUID: 1Qu6VqVbezpYAOkpWSUf7JVUWsl7Qf5l
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_04:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2
 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 mlxlogscore=164 lowpriorityscore=0 mlxscore=2 spamscore=2
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200108
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

Redfish is doing another webinar on the newly released 2021.1 on May 24 
if anyone is interested.

https://us02web.zoom.us/webinar/register/WN_YLi_8QwlTbSPsI6BhffwcQ

We just picked up these new schemas in bmcweb, 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43376

Gunnar
