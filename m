Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B425B8F44
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 21:31:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSVnw0d0yz3bcv
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 05:31:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NeVwt3X9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NeVwt3X9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSVnR1mcjz2xh0
	for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2022 05:31:22 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28EIGc6s030471
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 19:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lJwzORBXCq5flRqluY3tftOB0pjaNgkOktZlR+TRxrc=;
 b=NeVwt3X9hW3YoRDCqf/iLgxgZwN4JcL1C4tUPEwVFi8s5SBpAd9ry1/2hNI2bl0YCz58
 /PFwrjXPhoMZj71A1xLSUCAIUTqCCqtmYIVxHOW46SvA0ao3K5j8mBBZGBuudbWrTKLy
 NuneBBuJ4zlNfkKYpZeRw00Ybuisg39e+pdJl1hP5hfcm1ispMndGxP8vEeHtU1F6cpf
 tZ2BOGue6lFyI/SWOtKeQAlMmk6QfZ5VO6g1DrPJ8aYgan+RkP4aAjiPIyxx2QNleORq
 PYw2uKNTRChXvHf6Ipvunn1WfytizpsFKFDq0stJxfes4T7rJSSgvJQSADi96YHTV9YI sw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkm3h20v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 19:31:19 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28EJKcsi010830
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 19:31:17 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma05wdc.us.ibm.com with ESMTP id 3jjytypf7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 19:31:17 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28EJVIXQ12648972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 19:31:18 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23F27C605B
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 19:31:16 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCEFAC6059
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 19:31:15 +0000 (GMT)
Received: from [9.160.44.236] (unknown [9.160.44.236])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 19:31:15 +0000 (GMT)
Message-ID: <83774209-19ca-8464-742d-c45b67d26617@linux.ibm.com>
Date: Wed, 14 Sep 2022 14:31:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: Security Working Group meeting - Wednesday September 14 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <816be499-3dde-8a71-ff3c-d41a25a6d688@linux.ibm.com>
In-Reply-To: <816be499-3dde-8a71-ff3c-d41a25a6d688@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hUhamCLAWZ8QOLMy8oj2dmh93zG7vLNb
X-Proofpoint-ORIG-GUID: hUhamCLAWZ8QOLMy8oj2dmh93zG7vLNb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_09,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=815
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209140095
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



On 9/14/22 9:09 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday September 14 at 10:00am PDT.
>
>
> ATTENTION - Venue Change.  The meeting recently moved to Discord 
> voice.  Please update your calendars.
>
> === MEETING ACCESS ON DISCORD VOICE  ===
> First, join Discord via https://discord.gg/69Km47zH98 
> <https://discord.gg/69Km47zH98> and confirm via email.
> Then, to join: navigate Discord > OpenBMC > Voice channels >  Security 
> ~ https://discord.com/channels/775381525260664832/1002376534377635860 
> <https://discord.com/channels/775381525260664832/1002376534377635860>
>
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
> 1. Discuss alternate meeting times

1 Discuss alternate meeting times (continued from previous meeting).

DISCUSSION in discord indicated to use the Discord #security channel for 
security-focused discussions.  And feel free to set up a meeting on the 
Discord #security voice channel at any time.  We will continue with the 
regular security working group meetings (once every other week).


2 SELinux design and implementation progress.

DISCUSSION:

Ruud. How to approve the design? 
https://gerrit.openbmc.org/c/openbmc/docs/+/53205 
<https://gerrit.openbmc.org/c/openbmc/docs/+/53205>  Ideas to ask the 
docs repo maintainers for feedback 
https://github.com/openbmc/docs/blob/master/OWNERS 
<https://github.com/openbmc/docs/blob/master/OWNERS>

Yutaka Status: Working two areas:

  *

    Creating bitbake recipes to enable SELinux on AST2600 EVB in
    non-enforcing mode.

  *

    Working to get tests to pass
    <https://github.com/openbmc/openbmc-test-automation>before
    requesting to merge.  The tests fail on the AST2600 EVB because the
    CPU is not present.

The interim plan is to get SELinux working on the Witherspoon reference 
platform (which should be possible to get all tests to pass).  Then  
adapt the config to other models such as AST2600.


3 Measured Boot.   Sandhya K.

DISCUSSION:

Please review the design: 
https://gerrit.openbmc.org/c/openbmc/docs/+/57138 
<https://gerrit.openbmc.org/c/openbmc/docs/+/57138>

Still working on the design for the keylime agent which runs on the BMC.


Bonus topic: How does communication work?  Where is code reviewed?  
Which channels? For code changes: Note the Linux and U-boot pieces of 
OpenBMC use the email patch process.  Nearly all other OpenBMC repos use 
the Gerrit review process. https://gerrit.openbmc.org/dashboard/self 
<https://gerrit.openbmc.org/dashboard/self>

https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-changes 
<https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-changes>


4 BMC Secure boot.

Please review the design. 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/26169 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/26169>



Joseph

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

