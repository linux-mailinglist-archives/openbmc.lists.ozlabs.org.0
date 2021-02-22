Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7422321E96
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 18:57:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkqdS56mvz3cM0
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 04:57:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m/oaLSD+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m/oaLSD+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkqdD51qDz30QK
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 04:57:04 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MHjI43118951; Mon, 22 Feb 2021 12:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Rkl98VpflsyteCtEai7F24tG3tghN8D3693vZSIFCUM=;
 b=m/oaLSD+MO6Df5Tqjjo/DoSuFG21LGT4ye/PAcZ3Vh9i4peuyA0uAfbC+nxstnVNPKzM
 rJUaX2ic1bIux22U2jICuG4bY3Ad55jrO5aOnvwGhJvWfdFQt7Q/0UkxXEIjuIx/93om
 83ruj2FWqOEeuI2qb1T8djvdCASWQ84LvUQ5VUjbuSUqPJzQnGANn4xPEM+hAEUXvY+E
 GtSY4Fj1KU454Q+gLaW05IQN1xRd1zudiWWbsiw4hX8MOvwkxwB7gJZl0hbs2cqozOyO
 PKRbFHAx5PKbJkGCi8DKb+DhvwU8LN6fGs0Cs7JE902a8AWsq4vTWCDo66meit85R53z Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36vh9n8k9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 12:56:52 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11MHjqon122568;
 Mon, 22 Feb 2021 12:56:23 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36vh9n8jqx-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 12:56:23 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MHUS0t022803;
 Mon, 22 Feb 2021 17:36:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 36tt28r82h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 17:36:39 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MHadYS31588786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 17:36:39 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62EB2B205F;
 Mon, 22 Feb 2021 17:36:39 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9AFBB2066;
 Mon, 22 Feb 2021 17:36:38 +0000 (GMT)
Received: from demeter.local (unknown [9.160.44.72])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 22 Feb 2021 17:36:38 +0000 (GMT)
Subject: Re: overlayFS security concern - threat model
To: Kun Zhao <zkxz@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "chunhui.jia" <chunhui.jia@linux.intel.com>, Andrew Jeffery
 <andrew@aj.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 Michael Richardson <mcr@sandelman.ca>
References: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <fc76b6b2-5231-da28-cfb4-d591e1797732@linux.ibm.com>
Date: Mon, 22 Feb 2021 11:36:37 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_03:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220157
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

On 2/19/21 6:31 PM, Kun Zhao wrote:
> Hi Team, Have the following case ever been discussed before?,...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Hi Team,
>
> Have the following case ever been discussed before?,
>
> Anyone knows the root password will be able to let bmc run their own 
> code by scp the code into bmc with the same file path as any services 
> in rootfs. It will make the secure boot totally useless.
>
> So besides,
>
> 1. disable scp (but scp is one of the firmware upload way)
>
> 2. don’t use overlayFS (but it’s really useful for debugging during 
> develop, and configuration management)
>
> Any other solutions?
>

Kun,

Thanks for starting this thread.  Good discussion everyone!  Note 
OpenBMC's SSH interfaces are described in 
[network-security-considerations][].

I would like to improve the project's threat model to cover these ideas 
and so propose a new document, threat-model-considerations.md, to go 
under [OpenBMC security docs][] with topics:

- OpenBMC has a well-known password.
     - Explanation: OpenBMC has a well-known root password.  There is no 
mechanism which forces anyone to change it.
     - Risk: OpenBMC's default configuration produce firmware which has 
a well-known password which allows an attacker to gain full access to 
BMC internals.
     - Recommendation: Three independent recommendations:
         1. Provide a [configuration guide][] for firmware builders 
which instructs them to change the default password for their distro, 
and similar for BMC administrators which instructs them to change the 
default password when they first access the BMC.
         2. Implement an image option to cause the BMC's initial 
password to be expired so it must be changed before access is granted.
         3. Move away from password-based authentication.
     - Caveat: The expired password solution leaves a time window when 
the BMC is available to attackers and has well known password.

- Root account login to the BMC's command shell.
     - Explanation: Root access to the BMC's command shell is required 
for developers and service personnel to do their job. (They need to 
access the BMC internal tools and interfaces.)  But root access is not 
needed for any administrators or users performing normal BMC functions.
     - Risk: Users will have more authority than they need to do their 
job.  (The BMC should be designed so the owner can give each user the 
authority they nee, but no more.)  Additional authority may allow a user 
or attacker to damage BMC internals or gain information about the host 
they are not intended to have.
     - Recommendation: Disable root access in production images. (Should 
we have an OpenBMC image feature to control this?)  If root access is no 
disabled, it must be strictly limited to authorized users.

- SSH access to the BMC (including scp firmware update).
     - Explanation: The BMC provides an SSH server to allow secure shell 
(ssh) sessions to the BMC's command shell, ssh sessions to the host 
console, and scp-based firmware update.
     - Risk: See the "Root account login to the BMC's command shell" 
topic.  Note that ssh access to the host console is intended.
     - Recommendation: As above, disable SSH access for production 
images.  Disable SCP and instead use Redfish firmware update.

- Running unintended code on the BMC.
     - Explanation: The BMC is intended as a closed appliance but runs 
Linux.
     - Risk: The BMC's Linux capabilities allow an attacker who gains 
access to the BMC to attack the BMC's network and attack the BMC's host.
     - Recommendation: Use technologies like SecureBoot and Integrity 
Measurement Architecture (IMA).
     - Caveats: Powerful scripting tools such as the command shell (sh 
or bash) would be allowed by IMA to run on the BMC but still give an 
attacker the ability to run harmful code.

- Having writable portions of the BMC's file system
     - Explanation: The BMC is intended as a closed appliance with a 
read-only file system but has a writable portions of the file system to 
store BMC admin-configurable items, firmware updates, internal and host 
logs, etc.
     - Risk: The BMC's writable file system allows an attacker who gains 
access to the BMC to make their access permanent by writing to the BMC's 
file system.
     - Recommendation: Strictly limit which portions of the BMC's file 
system are writable.  For example, to /var, /run, and a strict subset of 
/etc.  Use a non-persistent overlay for data that does not need to 
persist beyond a BMC reboot.

I've added this topic to the [OpenBMC security working group agenda][].  
But please keep the discussion going in the email list.

Thanks!
-Joseph

[network-security-considerations]: 
https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md
[OpenBMC security docs]: 
https://github.com/openbmc/docs/blob/master/security
[configuration guide]: 
https://github.com/openbmc/openbmc/wiki/Configuration-guide
[OpenBMC security working group agenda]: 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI 


>
> Thanks.
>
> Kun
>

