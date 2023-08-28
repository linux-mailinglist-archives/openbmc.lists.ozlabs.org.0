Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766778B8BB
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 21:57:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NgKttGzI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZLtS31kvz30Pn
	for <lists+openbmc@lfdr.de>; Tue, 29 Aug 2023 05:57:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NgKttGzI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZLsq6vW9z2yhR
	for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2023 05:56:31 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37SJdgaQ006747
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CpWd0bsfbUZYO3fWXcUKsCt0kiP8gH6YO6wjv12GfEk=;
 b=NgKttGzIv0KoQOVFlZo5jqH3kad6ucad3GMfJGCWaEx35W+enb02Vf8Kmy5b40paeurG
 Zxt1ogDbK17XNjJrC5Y6aKctYBEdWjilj4dLc9kxpLeozMo3lWm9/H4LaRe0bXGOai5v
 VZSJ5f11B9K+mBzeLNgzoHt+GJyXwrzSsngtZ3Pqbr3phXi4rRWcgbmJ81JwmZXYTqvs
 TnpNn3V/tjiMN0MeFzLCXe9JzWdVZLD8OVIIPObSJUHVgnblwn2/0kYEhc9w9ae3aFpm
 gdtVPSsJimKfpcB9bFk7YjzogcvKz2hgLu4EMwdgay/RPEKPqKy1bNvfAMyFi/IykTF1 wg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sr8q7f73t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:56:27 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37SHrPOB014392
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:56:26 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqvqmwvnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:56:26 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37SJuQ2t62587166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:56:26 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32BD35805C
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:56:26 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3D6258058
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:56:25 +0000 (GMT)
Received: from [9.67.179.227] (unknown [9.67.179.227])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:56:25 +0000 (GMT)
Message-ID: <8c81e300-93f1-018c-4236-caf20e9c8552@linux.ibm.com>
Date: Mon, 28 Aug 2023 14:56:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: Security Working Group meeting - regular meetings discontinued
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <c002db20-f047-b4aa-1137-a9cc96048706@linux.ibm.com>
 <32926d01-780e-f958-1980-175c2a4d3bd3@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <32926d01-780e-f958-1980-175c2a4d3bd3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kTbUzmzL9Fhkx4-nChtOxoOSBYwRHmu9
X-Proofpoint-ORIG-GUID: kTbUzmzL9Fhkx4-nChtOxoOSBYwRHmu9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_17,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280170
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

OpenBMC community,

I am discontinuing the OpenBMC Security Working Group meetings. About a 
year ago, these meetings moved to Discord voice and project's open 
security work moved to the Discord security channel. As intended, the 
content of the voice meeting has significantly reduced as the discussion 
increased in the Discord security channel.  Attendance and topics have 
fallen to zero.  So it is time to discontinue having regular meetings.  
Thanks to everyone who helped move the project forward during this time!

As a direct consequence, the meeting agenda and minutes will no longer 
be appended:
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
Instead of this wiki, please use the Discord OpenBMC security channel 
for this discussion.

To discuss OpenBMC security topics on Discord.
- first join Discord via https://discord.gg/69Km47zH98
- then go to the Discord OpenBMC server: 
https://discord.com/channels/775381525260664832
- and browse to the #security channel - or any other appropriate channel.

Also feel free to email questions to the community.

If you need to talk to someone so you can move forward, please use the 
regular security channel to schedule a call on the Discord OpenBMC 
Security voice channel.  (NOTE: This is a voice channel, different from 
the regular security channel.) See Discord > OpenBMC > Voice channels > 
Security ~ 
https://discord.com/channels/775381525260664832/1002376534377635860
^^ Typically used only for discussion about the voice channel itself.

Note the OpenBMC project's security wiki is here:
https://github.com/openbmc/openbmc/wiki/Security-working-group
I don't have any plans to change this wiki, and I wish for the security 
assurance work it outlines to continue.


To *privately* report a security vulnerability to the project (or think 
you want to ask about reporting such as vulnerability), please do not 
use public channels.  Instead follow the process here:
https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md

Yours truly,
Joseph Reynolds


On 8/17/22 3:26 PM, Joseph Reynolds wrote:
> OpenBMC community members,
>
> Please update your calendar.
>
> The OpenBMC Security Working Group meeting call is moving to the 
> Discord OpenBMC Security voice channel.
> - Effective for the next scheduled meeting on August 31, 2022 and all 
> future meetings (every other week).
> - New access is via Discord > OpenBMC > Voice channels > Security -- 
> https://discord.com/channels/775381525260664832/1002376534377635860
> - Permanent project link: 
> https://github.com/openbmc/openbmc/wiki/Security-working-group
> - Attendees agreed to this change today: see the 2022-08-17 notes in 
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>
> Threre are no other changes.  We'll continue to use Google Docs for 
> the meeting modules.
>
> I plan to start the old Webex meeting to help any stragglers get to 
> the new venue.
>
> -Joseph
>
>
> -------- Forwarded Message --------
> Subject:     Re: Security Working Group meeting - Wednesday August 17
> Date:     Wed, 17 Aug 2022 15:11:46 -0500
> From:     Joseph Reynolds <jrey@linux.ibm.com>
> To:     openbmc <openbmc@lists.ozlabs.org>
>
>
>
> On 8/16/22 10:07 PM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday August 17 at 10:00am PDT.
>>
>> We'll discuss the following items on the agenda 
>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
>> and anything else that comes up:
>
> ...snip...
>
> 0 Move the next meeting access to Discord?  Discord > OpenBMC > Voice 
> channels >  Security ~ 
> https://discord.com/channels/775381525260664832/1002376534377635860 
> <https://discord.com/channels/775381525260664832/1002376534377635860>
>
> Yes, agreed.
>
> The next meeting planned for 2022-08-31 will be on discord.
>
> ...snip...

