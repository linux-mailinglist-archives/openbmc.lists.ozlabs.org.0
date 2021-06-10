Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E03A2133
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 02:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0kyt6cXtz3079
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 10:15:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sDr7//Xh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sDr7//Xh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0kyY6YxGz2xvV
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jun 2021 10:15:33 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15A047co148338
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jun 2021 20:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=JANz1coOVt5WS2mJuNPCm2UK8aIEYL6zPcnogN/9xhU=;
 b=sDr7//Xhu2MkDZDkjXlgfqDCnbbX+Au3bjTg2t1EudQG4g6zVGswEBQGPBFTWNlwOcNv
 RYuXektMkEUbPmKd8/ntt/TCz7V40hhOxIMgcbXdRhPw9zkJFLATMwdBkqRi1AvA8qj/
 5FMA96JbzjwBSpv8FMFUD/iUpvk1Uk19SRmWzhb1iSKYJavnatsgPvvzZsTP/b/Xp/+v
 uD8eIkNMM+2+vtqmzrKzVakNpSe4G42woxllQqqsl6E58G71hyg2VwMTnoqW05aFHRab
 p2GYeWeblKxLEZtdpZCYPX98r1fGJ0y+xUZ0UnFkSzdFkj7HwVjfJimO7rMPtS8BcJ5e ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 393754s941-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jun 2021 20:15:29 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15A04CAW149814
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jun 2021 20:15:29 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 393754s93t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Jun 2021 20:15:29 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15A07Il5013083;
 Thu, 10 Jun 2021 00:15:28 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3900wa4rpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 00:15:28 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15A0FR1b28639568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 00:15:27 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F77D78064;
 Thu, 10 Jun 2021 00:15:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCE127805E;
 Thu, 10 Jun 2021 00:15:26 +0000 (GMT)
Received: from demeter.local (unknown [9.65.208.95])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Jun 2021 00:15:26 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>, krtaylor <kurt.r.taylor@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: [SecurityworkGroup] Security response team - bug database needed
Message-ID: <5961cc98-ef84-f38b-e606-35f94c94c511@linux.ibm.com>
Date: Wed, 9 Jun 2021 19:15:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xUZHw1XHcC1_kLub9TXkETFpY_HheWmu
X-Proofpoint-ORIG-GUID: wyQm-AbWSqG6VyJR_FJ4gqXl8h_uF0_W
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-09_07:2021-06-04,
 2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=956
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106090130
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

This is a followup to a discussion in the security working group meeting 
held 2021-06-09 agenda item 11.


The security response team has difficulty tracking reported security 
vulnerabilities to closure and writing CVEs in a timely manner.  Having 
a confidential bug tracker would help.
Per Dick, the UEFI team uses bugzilla and has a restructured corner for 
the security response team: anyone can write a bug, but only security 
response team members can see it.
What are the best practices? How do we get a bug tracker which only 
OpenBMC security response team members can read?

Joseph

