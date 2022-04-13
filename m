Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E097500132
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 23:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kdwk149Nlz3bbl
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 07:30:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sn496Xhp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Sn496Xhp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdwjY0pNCz2xCC
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 07:30:08 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DKWhpP030687
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 21:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=y+o7Jsv5sj1wAnxKiON/Z2ny8gc51s3OJxfx39GzCyI=;
 b=Sn496XhplmdjQSKHOIoYJVEl7oLyy56bMh9O0jPhqC7qgcP66gyfRpEs5+UIpounliHK
 DxdPq+UKh0bWkbuOOBVuy8I4celtGI8abL9aXza6MOZxXFCWwPX5JsFAhhwXiVZaO+MI
 rfa6qA1HYiVahAgAK9BqklIP7VJUEWqiAQYkv08JkgyoycrDJcUNDQRMSbhmYCXuj3Qm
 LwifgAWilvzxZDBttHW3RxvfHqyOqqP0K9jgwTZGuNHAnwsKljz9eEGJBZgOxNg6leLw
 GfzNijj33fBrz985EA30ZI7yhZv2eVUrZn78iGC6pSNBtE88aXKehywjJvPek668lxPK Ew== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fe5n8h010-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 21:30:02 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23DLDQmf004833
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 21:30:01 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3fb1s9uj0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 21:30:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23DLU0KW11731430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 21:30:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 760B3AC062
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 21:30:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DDA5AC05F
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 21:30:00 +0000 (GMT)
Received: from [9.160.0.223] (unknown [9.160.0.223])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 21:30:00 +0000 (GMT)
Message-ID: <41e89e78-67f2-77d2-60f4-63b2bb86d60f@linux.ibm.com>
Date: Wed, 13 Apr 2022 16:29:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: Security Working Group meeting - Wednesday April 13 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <04f7f71d-16db-ce88-f359-f7d60c0a798e@linux.ibm.com>
In-Reply-To: <04f7f71d-16db-ce88-f359-f7d60c0a798e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z-cxqImHThkzazXNN2vf-xx17Leyj8za
X-Proofpoint-ORIG-GUID: Z-cxqImHThkzazXNN2vf-xx17Leyj8za
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_04,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204130102
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

On 4/12/22 11:28 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday April 13 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Attended: Joseph Reynolds, Ruud Haring, Chris Engel, Dick (Phoenix), 
Dong Chen, Jesse Arroyo, Yakatawa Sugawara, Russel Wilson, Krishnan 
Sugvanam, Manojkiran Eda, McCawley, Robert Senger, Sandhya Keteshwara, 
Surya (Intel), James Mihm, Terry Duncan, (and unknown caller who joined 
as the meeting was ending).


> 1. Renewed interest in securing D-Bus interfaces and using SELinux.

Ruud Haring and Yataka Sugawara and Russel Wilson from IBM Research 
presented a proposal.


A recording was made of the presentation and discussion.  TODO: Post the 
recording.


DISCUSSION:

The proposal PDF will be shared with the OpenBMC community.  Here is my 
summary of the main points: SELinux is preferred by IBM and some large 
customers to solve several related access control problems: limiting 
access of root processes, application trust, systemd, and D-Bus.  See 
previous discussion 2020-05-13 below: SELinux email use cases and email 
https://lists.ozlabs.org/pipermail/openbmc/2020-April/021477.html 
<https://lists.ozlabs.org/pipermail/openbmc/2020-April/021477.html>


Next steps: Follow 
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#planning-changes 
<https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#planning-changes>with 
email discussion, Discord (per 
https://github.com/openbmc/openbmc#contact 
<https://github.com/openbmc/openbmc#contact>) and creating a design for 
phase 1 (below).


TODO: Joseph to send email to begin the discussion about SELinux use 
cases which might be shared by multiple OpenBMC users.


IBM plans to work in the OpenBMC community project: stage 1 is an opt-in 
SELinux in permissive mode to collect data about which policies are 
needed.  Later stages are to create SELinux policies for access control, 
and then to change configure SELinux to enforce them.


Does OpenBMC have existing SELinux policies?  None are known, but see 
the Yocto/OE meta-selinux layer and associated docs.


We discussed some difficulties in using SELinux: Configuring the 
meta-selinux layer, configuring the Linux Kernel, and additional space 
requirements (about 20MB)


We discussed SELinux vs AppArmor.  IBM has chosen SELinux because it is 
well known to IBM and customers, and has an active community.  Note the 
planned SELinux support is opt-in, so another contributor can add 
AppArmor as needed.


The intended reference platform is an x86 system running with the 
AST2600 and  256Mb (or more) flash storage..


We discussed SELinux & D-Bus tie-ins.  (OpenBMC D-Bus runs in system 
mode.)  Note that D-Bus has built-in support for SELinux.



> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph
>

