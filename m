Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C1C31E338
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 00:49:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dgvgc1MJ3z30M9
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 10:49:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CMMl7RP4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CMMl7RP4; dkim-atps=neutral
X-Greylist: delayed 1759 seconds by postgrey-1.36 at boromir;
 Thu, 18 Feb 2021 10:48:47 AEDT
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgvgM5Sfqz30GZ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 10:48:47 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11HN9t2Z062261
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 18:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4hB50uAcXOIbflgv5fJh6ewhHjIHURWEKUWU2Pii5gI=;
 b=CMMl7RP4/AypLxDOdyCYawX4zmFU84lyb0DATTyiMk76XfkgF8BqFZFc05v6BKoLtasH
 G2oip5YEnlwcUQLiMNd7Bpuxyb6DjvzrKnbA4JzrKDFHaxOZb5abynDLlK0FRovMOO2B
 ipJWOCNxMWMSPdTITz6mzZM6NOecHEzzyTqnoIBnb2zAq1QMT/noEj/PY6jKtibEHxgM
 TOJLXuEapoKX+vHxBs8iA7VjXFALgwhXCedf3RJLFPJqgXNJelFqLinBnAQA+vjSdwxp
 pArs0zRyPazjdSSQs0689+c04IqJbd6a5OO9eNoScbwXpEH0FoQg1E27rSMGlZoQlfPk 9A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36sbyd8y47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 18:19:22 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11HNH5Bd019714
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:19:22 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 36p6d9hptq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:19:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11HNJJrM33227088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:19:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51D6C112061
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:19:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 267BC112065
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:19:19 +0000 (GMT)
Received: from demeter.local (unknown [9.85.172.6])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:19:19 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday February 17 - results
To: openbmc@lists.ozlabs.org
References: <f6a11337-711a-81db-23a8-44bc24b0072f@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <ec572762-8edc-83dc-219a-6d9cdb5b13c5@linux.ibm.com>
Date: Wed, 17 Feb 2021 17:19:18 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f6a11337-711a-81db-23a8-44bc24b0072f@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_19:2021-02-16,
 2021-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170166
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

On 2/16/21 5:53 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday February 17 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1. Gerrit review FYI: log failed authentication attempts 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39872
No discussion.

>
> 2. Gerrit review FTI: tie-in between Redfish sessions and IPMI 
> sessions.  Redfish will GET & DELETE IMPI sessions 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37785
Why is this function needed?
>
> 3. (Joseph) Discuss adding Web-based SSH to BMCWeb ~ 
> https://github.com/ibm-openbmc/dev/issues/2243

Sounds good. But don’t call this SSH because it is not.  Do the webui 
part the same as the host console.  Do the BMCWeb portion using a new 
D-Bus service (do not fork in bmcweb).


Bonus topics:
4. Interested in improving the documentation for the OpenBMC interface 
overview > Physical interfaces 
<https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md#physical-interfaces>? 
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md#physical-interfaces 
(See related review 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/40424.)

ANSWER: Yes, this is worthwhile.  Add to the agenda for next time.

Is the ASCII art helpful or distracting?

We discusses some ideas: Diagram for BMC cards and PCIe cards.  
Alternate Placement of TPMs, TOD battery.


5. Openssl released version 1.1.1j.

This led to a discussion of how much the OpenBMC project should be 
tracking and announcing CVEs -- Security Incident Response Team (SIRT) 
work.  Currently various members are tracking this privately.  Is it 
even worthwhile, for example, for the OpenBMC project to announce that 
CVE-whatever affects OpenBMC and the fix is going to the latest kernel 
version going into OpenBMC commmit whatever?  (No clear consensus was 
reached.)

Inhibitors to open source SIRT work includes: (A) some members are 
already doing this privately, and are not able to share due to 
confidentiality and repeating in open source is just extra work, (B) we 
are not all on the same release - that is: OpenBMC has not identified 
any Long Term Support (LTS) releases.

At present, there is no OpenBMC effort to show which CVEs are fixed.  
This is left as an exercise to interested downstream projects.

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>

