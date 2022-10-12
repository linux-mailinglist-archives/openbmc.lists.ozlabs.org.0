Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE635FC9F6
	for <lists+openbmc@lfdr.de>; Wed, 12 Oct 2022 19:35:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnfvF3mdmz3c75
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 04:35:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o5NCA1Y9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o5NCA1Y9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mnftc4VhZz3bjB
	for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 04:35:19 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CFcFcx023418
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 17:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FqMgMFr6Hh9QuHAHDlWc1Nib7uLOEy1nLrmb6wmLf/4=;
 b=o5NCA1Y9PvLCK7DlROxozUWQCOs52ZijSNx/YzoMObtmo//DLTtUM4UOXREVpghzEx1u
 fE/FB2MANh6v91fsCpV+For0mY0TUxeCtUowpOMUOckvzquaKAZK7gYsENLzY+eki0bQ
 RMMuTFnZLJTe80p1RYAvjq+8lgrnfAAq6YIW0ocohIgwL75WuJhhmDV0Xb54qbzPJ6T0
 gVnPBqmyW50RvW5Dqa6Hp8VQd2aBFjdNYtmbGeeuXPgn84491e8W47O93t+D1PJp+o2y
 yhq8Y36+dZaOjzUXGtTJaZVcvT/4HXm5O51zjTtG1orsjw8Es4562uBf7ao+xPbuJVKb vw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5xfmg3ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 17:35:15 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CHLR4n027881
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 17:35:14 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02wdc.us.ibm.com with ESMTP id 3k30uaaqhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 17:35:14 +0000
Received: from smtpav02.dal12v.mail.ibm.com ([9.208.128.128])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29CHZGk652756950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 17:35:16 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86D8D5805A
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 17:35:13 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C90358051
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 17:35:13 +0000 (GMT)
Received: from [9.160.65.62] (unknown [9.160.65.62])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 17:35:13 +0000 (GMT)
Message-ID: <0674aa19-5a96-5f3c-4861-ecc54ad030fc@linux.ibm.com>
Date: Wed, 12 Oct 2022 12:35:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: Security Working Group meeting - Wednesday October 12 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
In-Reply-To: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -4E_XuliOW1WfnmTvkfOrFSaMMNDcblR
X-Proofpoint-ORIG-GUID: -4E_XuliOW1WfnmTvkfOrFSaMMNDcblR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_08,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120112
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

On 10/12/22 9:15 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday October 12 at 10:00am PDT.
>
> The meeting is on Discord voice.
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

Meeting held 2022-10-12:
Attendees: alda, cengel74, Dick Wilkins, dsp, galmasi, Joseph Reynolds, 
Rob, russWilson, RuudHaring, skoteshwara, YutakaSugawara. 1 Ruud: 
Working gerrit reviews for SELinux and for measured boot.
Wanted: branch in public repo to show progress for measured boot.
Can we start code before the design is approved?  Specifically, create a 
public fork?

2 Joseph mentioned interest in some code reviews with security focus:
https://gerrit.openbmc.org/c/openbmc/phosphor-certificate-manager/+/54947 
<https://gerrit.openbmc.org/c/openbmc/phosphor-certificate-manager/+/54947>Allow 
for expired certificate
https://gerrit.openbmc.org/c/openbmc/webui-vue/+/56719 
<https://gerrit.openbmc.org/c/openbmc/webui-vue/+/56719>Old password 
input in change password screen

3 New meeting time?
Anyone can hold a security workgroup meeting.  It is fun and easy!  The 
steps are:

 1. Set a meeting time.  Choose a date and time when others can meet.
 2. Publish (email) the meeting time and its agenda.
 3. Hold the meeting and keep notes about topics discussed.
 4. Publish (email) the notes.



Joseph

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

