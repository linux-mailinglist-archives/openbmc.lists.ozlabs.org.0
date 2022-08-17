Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0455977D5
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 22:26:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7KLS6vtTz3c1v
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 06:26:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bW7etSZQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bW7etSZQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7KL036Q8z3bZc
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 06:26:31 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HKGWA1002523
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : references : from : to : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=m867+jzOQ8PzxrH6ioIOBGyvWBuFSnr77pUkVzPPm0U=;
 b=bW7etSZQ00AejKPSB/s35NUgSnudPwT1aaA+80O2IXCDIgua2QdlB99na16Ub6eThSz4
 E/u4kjAqDROepoezFgzKJYaKtkQbCJM8+hVPHStL79KajeO9eJTBlmoWPhtpFd4/75qF
 j27qeIfc7A1nePhS1pcN8JGF/CmtNH/IllkItpdI70aXOG2/TFIHivQnJ1yMnWagYFqS
 pQBVCOTLwQJvWq48eXyKbF9UiCq9MCsYq9EUZ2IKnsbnwVLq+s5eX8E7zzF88L9iYRZg
 lVJ6LlS/F/jYy9CJPZL8GP4ZVJDbTOSfz3AKriP1K3Ph1X9UUNPwmy7R0CQPPwqa80eX 5Q== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j177p067r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:26:28 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HKMSTu029105
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:26:27 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma01wdc.us.ibm.com with ESMTP id 3hx3k9js2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:26:27 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27HKQRwn66781676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:26:27 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C6D0124058
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:26:27 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E394A124055
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:26:26 +0000 (GMT)
Received: from [9.160.40.68] (unknown [9.160.40.68])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:26:26 +0000 (GMT)
Message-ID: <32926d01-780e-f958-1980-175c2a4d3bd3@linux.ibm.com>
Date: Wed, 17 Aug 2022 15:26:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Security Working Group meeting - moved to Discord Voice channel
Content-Language: en-US
References: <c002db20-f047-b4aa-1137-a9cc96048706@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
In-Reply-To: <c002db20-f047-b4aa-1137-a9cc96048706@linux.ibm.com>
X-Forwarded-Message-Id: <c002db20-f047-b4aa-1137-a9cc96048706@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1fmOZ407HRtXPHfvB13RZUsTpCG7KxAk
X-Proofpoint-ORIG-GUID: 1fmOZ407HRtXPHfvB13RZUsTpCG7KxAk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_13,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 adultscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170075
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

OpenBMC community members,

Please update your calendar.

The OpenBMC Security Working Group meeting call is moving to the Discord 
OpenBMC Security voice channel.
- Effective for the next scheduled meeting on August 31, 2022 and all 
future meetings (every other week).
- New access is via Discord > OpenBMC > Voice channels > Security -- 
https://discord.com/channels/775381525260664832/1002376534377635860
- Permanent project link: 
https://github.com/openbmc/openbmc/wiki/Security-working-group
- Attendees agreed to this change today: see the 2022-08-17 notes in 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI

Threre are no other changes.  We'll continue to use Google Docs for the 
meeting modules.

I plan to start the old Webex meeting to help any stragglers get to the 
new venue.

-Joseph


-------- Forwarded Message --------
Subject: 	Re: Security Working Group meeting - Wednesday August 17
Date: 	Wed, 17 Aug 2022 15:11:46 -0500
From: 	Joseph Reynolds <jrey@linux.ibm.com>
To: 	openbmc <openbmc@lists.ozlabs.org>



On 8/16/22 10:07 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 17 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:

...snip...

0 Move the next meeting access to Discord?  Discord > OpenBMC > Voice 
channels >  Security ~ 
https://discord.com/channels/775381525260664832/1002376534377635860 
<https://discord.com/channels/775381525260664832/1002376534377635860>

Yes, agreed.

The next meeting planned for 2022-08-31 will be on discord.

...snip...
