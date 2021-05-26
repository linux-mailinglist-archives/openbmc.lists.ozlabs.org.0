Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D59BF391FE0
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 21:00:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr0dP5yfJz2ysq
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 05:00:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n1qZK6xA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n1qZK6xA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr0d223Y7z2xvG
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 05:00:05 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14QIY7kP121961
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 15:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+HSwQM078YtvYrkyZ9vLtFEzwkoqoH7vI/2CNtxuxbY=;
 b=n1qZK6xAd5SrYlaEMYOfSlvRwlbFxms7pE1UbvkbmSxPROJc3cIti1RZEJxRr0iNZ3c5
 B4oubkjVRBAR8kJkDYnGVKz203ls9pRt4SXe3Yjxuzo54lBA7nhNhEckt438sThJ9nwR
 EYabOc+7CQOWUb4HhFq28C62Y54lGLi5fJAoy/YgxJJZyJljM1q4yAMHzYja0gpXNOBl
 Z8JpevL6CdUEMwMPYPEWJP7Hvbt/iB+NuDuz1W98tzZmXxNwMNbKY/8mRxjVmYuiPJ78
 McgzKfrlyyy3wUQsdRkmKZRL/qXmKUUMQFTlDs1NfevYebWx1t+h1VQHYBRbE6HSoSMp Dw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38st443fbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 15:00:01 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14QImdlC003962
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 19:00:00 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 38s1ggdmse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 19:00:00 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14QIxxou26739036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 18:59:59 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E2006A054
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 18:59:59 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 118AB6A047
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 18:59:58 +0000 (GMT)
Received: from demeter.local (unknown [9.160.61.45])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 18:59:58 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday May 26 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <8b3c88c2-cc9f-3ebe-2e4d-61974ae27519@linux.ibm.com>
Message-ID: <30dde28a-38ff-6c59-57f4-23ed3fb46130@linux.ibm.com>
Date: Wed, 26 May 2021 13:59:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <8b3c88c2-cc9f-3ebe-2e4d-61974ae27519@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _3eEO5K35b3xNGp3TV4u32f3mZF9CI9o
X-Proofpoint-ORIG-GUID: _3eEO5K35b3xNGp3TV4u32f3mZF9CI9o
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-26_11:2021-05-26,
 2021-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=802 lowpriorityscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260122
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

On 5/26/21 8:43 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday May 26 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
Bonus topic 0: We overviewed OpenBMC's security assurance documentation 
at the start of the meeting.

> 1. Followup from last meeting re uboot, kexec, sysrq-trigger on ARM 
> architecture.
We re-hashed the discussion, added new information, and added new concerns.


> 2. Interest in reviewing TLS protocols supported?
Yes.  We discussed CBC ciphers and HMACs.  Should we disable client 
renegotiation?
Then we re-hashed the discussion about the HTTPS self-signed certificate 
10 year duration.

Items added after the agenda was emailed:
3. user-manager: authentication & password management helper for 
netipmid and bmcweb for non-root environment to drop direct PAM use. 
Privilege separation and Master processes to handle users’ sessions
DISCUSSION:
Idea: Forward all authentication & password change & account change 
requests to user-manager which would then need to be enhanced to check 
authority when a request is made.  Then phosphor-user-manager would need 
root-like authority or a Linux capability to use PAM to change any 
user’s password.
Does phosphor-user-manager also need to be (or work in tandem with) a 
session manager?  Then we can remove session management from IPMI 
network and from BMCWeb, which would be modified to use user-manager.

Also consider how session-less unauthenticated host-IPMI would work.

- Joseph

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

