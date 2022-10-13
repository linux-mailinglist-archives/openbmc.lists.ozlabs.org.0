Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156F5FDBCB
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 15:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpB2q2lsWz3c7B
	for <lists+openbmc@lfdr.de>; Fri, 14 Oct 2022 00:59:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jEWatFNA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jEWatFNA;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpB2B1zbfz30D1
	for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2022 00:58:41 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DCuvhU026433;
	Thu, 13 Oct 2022 13:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9DT7c2LCLPQfQ0TNUI/vSgWVkiv7BH2Pq44fnpIauzE=;
 b=jEWatFNA4axAz+dfGvzAsKutBt/zfSjDl6W2N6jBCOczZ2NsoaaylbBqS70FTwX+siV5
 j0DqLMPndZ63GlbLo0582AFb+xoxjGXThOTfzWibb3iCOb3HR4yvd2b8eP2RYWzCWXN4
 7K7dGeu38JJBYiI5Bn0lo6bAYuPBj3Vh1VHfIde19DsPrx13lOTmFCyYEOrFrQq8DXdG
 2NnJL4ZDoo333abUhpCXNXgptUTsKGPqhZuE/RWYmFYGRt14CJkIwOwcTWMmOlNzHcGg
 qFiNOMkTTzed2M34DjYBuzcYw5jvLOtSLneZpOqGAr2Nh84emQmyQhNitiYUoXYp9X1j MQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6k4nt9yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 13:58:37 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DDoDtT008608;
	Thu, 13 Oct 2022 13:58:36 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma01dal.us.ibm.com with ESMTP id 3k6kcmg3rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 13:58:36 +0000
Received: from smtpav02.dal12v.mail.ibm.com ([9.208.128.128])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29DDwYjj17957398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Oct 2022 13:58:34 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB52D58060;
	Thu, 13 Oct 2022 13:58:34 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 681FD5805E;
	Thu, 13 Oct 2022 13:58:34 +0000 (GMT)
Received: from [9.160.65.62] (unknown [9.160.65.62])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 13 Oct 2022 13:58:34 +0000 (GMT)
Message-ID: <5469fac9-f98c-1028-99f1-cb9ea3b0ae03@linux.ibm.com>
Date: Thu, 13 Oct 2022 08:58:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: Security Working Group meeting - Wednesday October 12 - results
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
 <0674aa19-5a96-5f3c-4861-ecc54ad030fc@linux.ibm.com>
 <Y0cySugUHS4Sn5Nh@heinlein.stwcx.org.github.beta.tailscale.net>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <Y0cySugUHS4Sn5Nh@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CY9v6xRvvvBfLGSvOCJMoVV9iddjdG7A
X-Proofpoint-GUID: CY9v6xRvvvBfLGSvOCJMoVV9iddjdG7A
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130081
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/12/22 4:31 PM, Patrick Williams wrote:
> On Wed, Oct 12, 2022 at 12:35:12PM -0500, Joseph Reynolds wrote:
>> On 10/12/22 9:15 AM, Joseph Reynolds wrote:
>>
>> Meeting held 2022-10-12:
>> Attendees: alda, cengel74, Dick Wilkins, dsp, galmasi, Joseph Reynolds,
>> Rob, russWilson, RuudHaring, skoteshwara, YutakaSugawara. 1 Ruud:
>> Working gerrit reviews for SELinux and for measured boot.
>> Wanted: branch in public repo to show progress for measured boot.
>> Can we start code before the design is approved?  Specifically, create a
>> public fork?
> We generally do not create branches for development work.  Typically if
> there is code that spans repos people might use a gerrit-topic for it.
>
> Is there expected to be changes to existing repositories and/or new
> repositories needed for this work?  I was under the impression that it
> is mostly recipes (and bbappends) in openbmc/openbmc.  I think as long
> as this is disabled by a feature flag, we can even review and merge
> recipes as the work is in progress.

Thanks for your feedback and additional ideas.  I apologize for my 
summary was not clear.  Clarification: The team working on the "measured 
boot" proof-of-concept wants to share their code with other teams, and 
was looking for a way to do so.  It was suggested to create a public 
fork for this purpose, something like 
https://github.com/SOMEUSER/openbmc.  The overall direction remains to 
do the work in the community repositories.  I'll update the meeting minutes.

Joseph
