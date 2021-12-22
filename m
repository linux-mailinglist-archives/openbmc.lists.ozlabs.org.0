Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 412FE47D733
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 19:53:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK2XV0qWMz3052
	for <lists+openbmc@lfdr.de>; Thu, 23 Dec 2021 05:53:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b1IEc9jh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b1IEc9jh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK2X04T0Sz2xsk
 for <openbmc@lists.ozlabs.org>; Thu, 23 Dec 2021 05:53:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMITxnv029849
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 18:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=zR2JpRaYTMJ7mKdKA6Ov0uik1f5gD79wtlka2z08xRw=;
 b=b1IEc9jhp6Bx7/DOwNAcGqJJhHTmZQiNPmsaBsIWWNWwe7xLuIqly2AVgX698Nb7DoiM
 xLMi9DjyN7XG0sf4vhnzUUzHXtbMu4NGfvYFvqM/64DkNrro+fbZ04W2wFP7GnYqyGLm
 n1M4//EhrfVX2McF1noeiyciUp+PcS15C7JPxa21IIXvey4c05AUareHVPC/zGejHzuS
 nrsUgCRPpci3cvejXtw1PZechEjWvGLB+0lHDBJTFNDPgQN5mgZJvzyDyPJuOPPoWEqT
 y/TVecN/MtqR30NZZMDzlOGbJPCL5jUwqdvF6xvyBFw7rtyKTJs3sZrw4Jp3YZiaGa4e 5g== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d3f0benk7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 18:52:59 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BMIkrdt015331
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 18:52:59 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3d179aut2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 18:52:59 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BMIqwim27722012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 18:52:58 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 918D5112065
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 18:52:58 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63274112062
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 18:52:58 +0000 (GMT)
Received: from [9.65.195.235] (unknown [9.65.195.235])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 18:52:58 +0000 (GMT)
Message-ID: <3f70d38c-36e0-0cfd-2aa5-ca81989bba6f@linux.ibm.com>
Date: Wed, 22 Dec 2021 12:52:57 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting 2021-12-22 - results
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6D2BKaQTCjoXdEUehS7ccBvBVRh-jZ8o
X-Proofpoint-GUID: 6D2BKaQTCjoXdEUehS7ccBvBVRh-jZ8o
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_08,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=878 phishscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220102
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

Community,

The OpenBMC security working group held a meeting today.  (Sorry I 
missed sending a meeting announcement.)  We discussed the projects 
progress toward becoming CVE Numbering Authority (CNA) with Mitre.

Meeting held 2021-12-22:

Attendance: Joseph R, James M, Dhananjay P


This meeting had low attendance because of the holiday season.


1 CVE Numbering Authority (CNA)  onboarding

Discussion

The CNA training session was held.  We are working on the homework now 
(creating dummy CVEs).  We found this tool easy to use: vulnogram.github.io

TODO: Document new procedures and guidance for the OpenBMC Security 
Response Team to follow when working as a CNA.

TODO: Create a test issue under 
https://github.com/openbmc/security-response/issues 
<https://github.com/openbmc/security-response/issues>

And see if it leaks out into public communication channels, then start 
writing up old vulnerabilities.

