Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE266F0C22
	for <lists+openbmc@lfdr.de>; Thu, 27 Apr 2023 20:48:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6lB01KLWz3f5Q
	for <lists+openbmc@lfdr.de>; Fri, 28 Apr 2023 04:48:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RnZvuIF+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RnZvuIF+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6l9M30mNz3cGk
	for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2023 04:47:50 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33RIbr3j014087
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 18:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=wbQaqD7OZlh2dyDXuL4mJfldeL1FQZdeHGoL61rCDY0=;
 b=RnZvuIF+MsMPoBRtySQcPbiYLBjP5PsImg10oL4spVHjnvqNS5gFmBmiv7T1dhmFhCGd
 hvz4SRabgZ+UE2fyV4CLkQNPvAlrwhtD0PB48qTZVH4rZTcx8rnp9lMZFn1fdd0mL7Mm
 /9DlzjuHSSw/YIkVEZAadnfCMxsx5FS7nO1OioK4bmZUqGFjLnhCxEwi6ZK2T9WNsUnX
 1L9UhT8TGZVMvbYQvS43XT/y12D//kDODYUZRDmld818wnTLWKegPB8iqgx8jYjgblBZ
 h12eiGYMdV6mFwA3Wa3ZTmT/AqfPA012YLhbmrAIM60dbxbJT+I7VomDw4CoiNvZzkof uQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q7x8mrq0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 18:47:46 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33RHGQsS019529
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 18:47:43 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3q4778utnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 18:47:43 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33RIlgXJ28967434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 18:47:42 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74C9858056
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 18:47:42 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33CF258068
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 18:47:42 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP
	for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2023 18:47:42 +0000 (GMT)
Message-ID: <21c71d3e-f886-1421-5dd7-9857cf608921@linux.ibm.com>
Date: Thu, 27 Apr 2023 14:47:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: openbmc@lists.ozlabs.org
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
Subject: IMA & EVM support for OpenBMC
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 649KuDAGPYPbGlsOhpM6hCI9YE1XSbVL
X-Proofpoint-ORIG-GUID: 649KuDAGPYPbGlsOhpM6hCI9YE1XSbVL
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 mlxlogscore=400 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270162
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

Hello!

  I just wanted to let you know that I have sent a series of patches to gerrit
that first fix the current IMA & EVM support and then provide optional enforcement
support for it for the ast2600 board.

https://gerrit.openbmc.org/c/openbmc/openbmc/+/62929

  I will send most of these patches to the meta-security layer's mailing list.
However, OpenBMC helps to test these in a real-world environment first.

Regards,
    Stefan


