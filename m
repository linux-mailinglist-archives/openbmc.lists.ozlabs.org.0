Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF5E5A8516
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 20:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHsdl1gRTz3bqn
	for <lists+openbmc@lfdr.de>; Thu,  1 Sep 2022 04:09:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=krGqAr++;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=krGqAr++;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHsdB4qrYz2xGf
	for <openbmc@lists.ozlabs.org>; Thu,  1 Sep 2022 04:09:17 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VHwHER017107
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 18:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=fMcB2ahpfJM/GJghv2+d2Te3gnNllR45jgZUXVoKVIU=;
 b=krGqAr++k32yOIBNEBHCttB3wAitPltIOMRNr4QclVqKgilQXPoZ8ZmLQDAcyacrcd/F
 vgEW2Mn+bE60UtXPQLCVpcCtUnpEJ0XsAMV8+WQul+jc9Da5d743/vRAabpVsckb7+3B
 EZO8vCRSK1P+162rXJxHbCXj7JfZlBqbmEaxdCbjfpsb3n66ij8JzSdAO7b/bbBPuiB0
 cnBXvfrsQp40HYmou0xYCTwHtsnatIQOhVDg9Xmga/+rLcHQpNB1CS1IESJs5PPjVZRr
 f3XZJ5+v8+mpKklsRN44nzeemVIuz3FLNBW3k9GaozMgVVVG0x4LAUVlvFZe7LFfQIUv cg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jacgvgkj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 18:09:13 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27VI5FBU010670
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 18:09:13 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma04dal.us.ibm.com with ESMTP id 3j7awa2xvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 18:09:13 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27VI9CsS1638922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 18:09:12 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C87C2136051
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 18:09:11 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D4E413604F
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 18:09:11 +0000 (GMT)
Received: from [9.77.157.23] (unknown [9.77.157.23])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 18:09:11 +0000 (GMT)
Message-ID: <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
Date: Wed, 31 Aug 2022 13:09:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
In-Reply-To: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MzYJdg4MvIqznOb4IrtgArqW1B-yEzqO
X-Proofpoint-ORIG-GUID: MzYJdg4MvIqznOb4IrtgArqW1B-yEzqO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_10,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310086
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



On 8/30/22 8:08 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 31 at 10:00am PDT.
>
>
> ATTNTION - Venue Change.  The meeting moved to Discord voice, 
> beginning with this meeting.  Please update your calendars.
>
> === MEETING ACCESS ON DISCORD VOICE starting on Aug 31, 2022  ===
>
> Discord > OpenBMC > Voice channels >  Security ~ 
> https://discord.com/channels/775381525260664832/1002376534377635860 
> <https://discord.com/channels/775381525260664832/1002376534377635860>
>
>
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:

Attendees (as Discord screen names): josephreynolds, galmasi, alda, 
ddaniil, dsp, fnichols3, jiangz, pgc, Rob, RussWilson, 
skotheshwara,YutakaSugawara.


0 We took about 15 minutes to try out the new Discord voice access and 
to escort folks from the old Webex meeting.

1 Continue Measured Boot discussion

DISCUSSION: Create two separate designs for:

  *

    Enable measured boot.

  *

    Enable Keylime Agent.  Direction is for the keylime agent to open
    the BMC network port (using systemd, sort of like how SSH works). 
    The intention is to engage with Redfish for how to configure the
    Keylime Agent: certificates, start/stop the application, etc.


2  Proposal for dynamic changes to Redfish authorization rules 
https://gerrit.openbmc.org/c/openbmc/docs/+/56401 
<https://gerrit.openbmc.org/c/openbmc/docs/+/56401>

No discussion.


3 Proposal to change the meeting time so folks from other time zones can 
better participate.

We are also looking for alternate (non voice) ways to cover the material.

We looked at recording the call, but Discord does not have a record button.

We proposed alternating meeting times to cover time zones in California, 
US Central, Europe, India, China, and Australia.  (So, pretty much the 
whole world.)

TODO: Joseph to create a poll, suggest alternate meeting times: 9am CDT 
& 5pm CDT or 8am Australia.



>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

