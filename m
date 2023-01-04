Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8C65DC75
	for <lists+openbmc@lfdr.de>; Wed,  4 Jan 2023 20:00:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnJnv6f7tz3c6V
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 06:00:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cOVp25P1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cOVp25P1;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnJnH1j2cz2y7W
	for <openbmc@lists.ozlabs.org>; Thu,  5 Jan 2023 05:59:46 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304HpsSd028293
	for <openbmc@lists.ozlabs.org>; Wed, 4 Jan 2023 18:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=9qS1S6zPXA3ce+HKaQtpwVQqlcnch27nAoZsmVTe3Mk=;
 b=cOVp25P1XxATWAA+GYlSQiUNQVU6b1CbDOW36lDQqqda6n6CUQycjGatGLuzFyn58zNx
 SfhNKpEvnyWocVJESdfc1w0tyJ6ppmesO3OyEzeG5dSQyfVmvS656M//TmCq8urTDc3m
 nBlCPSNvvPJ1+bKPmreKMEI5jfWZAvx3I4P82jxefdVZ8uDNIrVuv5zvi0SkT8GqRevQ
 k5mamShJ2XNzsrIsrfSA/QNbyJZBMdNeB8LcpNzKSAlUpym0c4knExPtwqQNqva0Jn8F
 YTz58qONlco9SCNqettDziXGtL9U/JCl+UtBGRmc2XqwU2AWz/ThytqzlpUJDAnno9qz 4Q== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwe7gsg4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 04 Jan 2023 18:59:43 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 304G0mjD025777
	for <openbmc@lists.ozlabs.org>; Wed, 4 Jan 2023 18:59:42 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mtcq79fs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 04 Jan 2023 18:59:42 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 304IxfsK42205564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 4 Jan 2023 18:59:41 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D6A758059
	for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2023 18:59:41 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4440458053
	for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2023 18:59:41 +0000 (GMT)
Received: from [9.77.128.14] (unknown [9.77.128.14])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2023 18:59:41 +0000 (GMT)
Message-ID: <db7090e9-2739-93d9-2782-a35c58b9983d@linux.ibm.com>
Date: Wed, 4 Jan 2023 12:59:39 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday Jan 4 - results
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S5kUa6s9qPa-FM9PnyveplJ7GYEQFlmN
X-Proofpoint-ORIG-GUID: S5kUa6s9qPa-FM9PnyveplJ7GYEQFlmN
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 mlxlogscore=777
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040153
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

An OpenBMC Security Working Group meeting is scheduled for this 
Wednesday Jan 4 at 10:00am PDT.

The meeting is on Discord voice.

=== MEETING ACCESS ON DISCORD VOICE  ===
First, join Discord via https://discord.gg/69Km47zH98 
<https://discord.gg/69Km47zH98> and confirm via email.
Then, to join: navigate Discord > OpenBMC > Voice channels >  Security ~ 
https://discord.com/channels/775381525260664832/1002376534377635860 
<https://discord.com/channels/775381525260664832/1002376534377635860>


We'll discuss items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
items proposed on the Discord OpenBMC #security channel, and anything 
else that comes up:


Sorry, I neglected to send the meeting reminder.  There was one topic...

Attended (Discord screen names): Attendance was low, possibly due to the 
recent holiday - Joseph Reynolds, Dick Wilkins, ddaniil, ssekar.


1 CVE-2022-40259

DISCUSSION:


Per Joseph, the OpenBMC BMCWeb team investigated CVE-2022-40259 and 
believes it does not apply to OpenBMC.  Will remove this agenda item.


In general, is it fair to ask if a non-OpenBMC CVE applies to OpenBMC?   
Yes, this analysis is typically requested for high severity CVEs.  For 
example, a security response team needs definitive information to be 
able to make a statement like “We investigated CVE xyz and it does not 
apply”.


In general, do security response teams (such as OpenBMC SRT) reach out 
to competing projects for help to perform confidential analysis?  Yes, 
for example, UEFI reaches out to other SRTs as needed.  It is helpful 
when analyzing a problem to first expand the scope of the problem, for 
example to ask if it affects other implementations.


We discussed alternate options for working with the OpenBMC SRT:

  *

    Join the OpenBMC SRT.  Note that membership is generally limited to
    active members who make fixes in the OpenBMC project.

  *

    Attend security working group meetings (this meeting).  But note
    that private discussions cannot be discussed in this public meeting,
    so information about vulnerabilities will be delayed compared to
    other communication methods.

  *

    The OpenBMC SRT can reach out to other SRTs as needed.


How can OpenBMC SRT reach out to other SRTs?  Use their confidential 
vulnerability reporting process (variously named Product Security 
Incident Response Team (PSIRT), SIRT, Security Team, etc).




Access, agenda and notes are in the OpenBMC Security wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
