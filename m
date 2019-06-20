Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 850014D261
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 17:45:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V5kB53cMzDrFj
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 01:45:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V5jM001PzDqPW;
 Fri, 21 Jun 2019 01:44:38 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KFgifr038756; Thu, 20 Jun 2019 11:44:36 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t8ccet8ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 11:44:36 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5KFUfMa019353;
 Thu, 20 Jun 2019 15:44:35 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2t4ra6jg57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 15:44:35 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5KFiXl457737502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 15:44:33 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26A81BE051;
 Thu, 20 Jun 2019 15:44:33 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9870BE054;
 Thu, 20 Jun 2019 15:44:32 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Jun 2019 15:44:32 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 20 Jun 2019 10:46:12 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Stewart Smith <stewart@linux.ibm.com>
Subject: Re: Move away from default password
In-Reply-To: <874l4n6ct4.fsf@linux.vnet.ibm.com>
References: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
 <874l4n6ct4.fsf@linux.vnet.ibm.com>
Message-ID: <43de939d764a17c737b0edb31cdfe830@linux.vnet.ibm.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200114
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
Cc: Openbmc <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-06-17 17:56, Stewart Smith wrote:
> Joseph Reynolds <jrey@linux.ibm.com> writes:
>> There is some interest in moving OpenBMC away from a default password.
>> - email:
>> https://lists.ozlabs.org/pipermail/openbmc/2019-June/016515.html  
>> (which
>> references a RestrictionMode design:
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21195)
>> 
>> Having a default password is a security risk.  Note that changing to a
>> different default password is not a good solution.  For example, if a
>> bad actor learns the default password from one device, that actor will
>> likely know the password for many of them.
> 
> and it makes it pretty easy to use something like Shodan to find all 
> the
> possible OpenBMCs connected to the Internet (hopefully by accident) and
> pop a root shell on them.
> 
> Mind you, in a lab environment, it's *really* useful.

I imagine for the forseeable future, OpenBMC would continue to have a 
default userid and password (and I hope each development lab is using a 
different default password than the well-known password).  But I think 
development labs are subject to attack, so we need to eventually move 
away from default passwords even in the development labs.

At this time, I am looking for options to move away from this model, but 
do not anticipate changing the default.


>> I am exploring two options for OpenBMC, and want your feedback.
>> 
>> 1. Unique password per BMC.
>> In this approach, there is a way to change the factory default 
>> password.
>>   Example flow: assemble the BMC, test it, factory reset, generate 
>> unique
>> password (such as `pwgen`), then use a new function “save factory
>> default settings” which would save the current setting into a new
>> “factory settings” flash partition.  After that, a factory reset
>> would reset to the factory installed password, not to the setting in 
>> the
>> source code.
>> Presumably the new factory default would be printed on a sticker, or
>> something.
>> Are there any other factory settings (settings unique to each device)
>> that would benefit from being set like this?
>> One downside to this approach is someone who orders 100 systems has to
>> enter 100 unique passwords.
> 
> There's also a downside for those of us who often work remotely from
> machines, we may have to wait for someone to be awake and be able to
> physically go and check what the default password is.
> 
>> 2. Create new account on first access.
>> Specifically, default OpenBMC to use a new RestrictionMode=SetupAccess
>> which:
>>   - (A) requires users to set up their credentials (at least: remove 
>> the
>> default password) before they can leave that mode, and
>>   - (B) does not let the user do anything else, including other
>> provisioning or operating the host, while in this mode.
>> So we could manufacture the BMC with a default password, but require 
>> it
>> to be changed as the first step to provision the BMC.
>> We might want to make network services react to this new mode, for
>> example, the phosphor-webui GUI would likely want to handle this
>> specially, and most REST APIs would be restricted.
>> Note this approach gives an attacker a window of time before the
>> credentials are set up.
> 
> In a lab environment though, we'd have to ensure we had a *very*
> reliably way to reset the BMC when we switched who was using the 
> machine.

Agreed.  Gaining initial access and recovering access the BMC is one of 
the issues.


>> I believe both of these approaches represent reasonable security
>> practices which may satisfy laws regarding consumer products.  For
>> example, CA Law SB-327
>> https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=201720180SB327
>> 
>> Are there guidelines we can follow?  Can you find additional
>> vulnerabilities with these approaches?  Can we do better than this
>> without requiring additional infrastructure?
>> 
>> I plan to discuss this at the 2019-06-26 Security working group 
>> meeting:
>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/
>> and would be happy to see ideas here.
> 
> I had an idea that provides less security, but still may be valuable:
> make the default password at manufacturing be linked to the MAC address
> of the BMC. This prevents people not on a local network to the machine
> from gaining access (e.g. I have no idea what the MAC address of 
> 8.8.8.8
> is), but if I'm on the same ethernet network, then I can still work it
> out. It would also allow someone buying 100 machines to programatically
> work out what the password should be.

Thanks, I understand this idea.  It may satisfy the letter of the law, 
and perhaps also its intent (disclaimer: not a legal opinion), so it has 
some merit.  But this scheme not as secure as random passwords 
(specifically, if the attacker learns the MAC addresses).

- Joseph
