Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7416543CAE
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 21:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJH8x3nMbz3bpQ
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 05:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XDBrY/eW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XDBrY/eW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJH886nN8z3brt
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 05:18:48 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258GhvfO004816;
	Wed, 8 Jun 2022 19:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : references : to : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xW+cJdLoUR9Iag3mFUFFZ5R7LbFzUw3XnE8DC02ZvwA=;
 b=XDBrY/eWESJl8dM/bAiPYKhvdAtq+Lgx6M8EFH0r8FYHBgAIjmWbtbKtKRt1Z8nmahwX
 OGMfC/B7kU2i8CIw8KZ38/AJPxlDaMcU5mQ7akIbtd07HG9p6DxSF/159HZumhpTR9Vp
 Q47d4F9sSKuc/HxTRwrBTp+SFl2S0dGVhdI3t3WIJTgnTrAHAQyLezw2LlPf/Da8OLAW
 uQs/MeiLshuSYEgPT8XS8yrjyMjIrt08AEcInGSnbo+zs+wRMXf9FRXdNoVnUKdlfzbw
 FX3cmkvDQEPH7opNdf7dUiVrR6z3++JCWVzM5dZFz3BwOiULJL74PkEISdyWkH703WiC aA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjyhtu5fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 19:18:44 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 258JEjxE024680;
	Wed, 8 Jun 2022 19:18:44 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjyhtu5f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 19:18:44 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 258Io9LX003849;
	Wed, 8 Jun 2022 19:18:43 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma05wdc.us.ibm.com with ESMTP id 3gfy19wc5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 19:18:43 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 258JIh6n63635748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jun 2022 19:18:43 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE19A124055;
	Wed,  8 Jun 2022 19:18:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DD26124054;
	Wed,  8 Jun 2022 19:18:42 +0000 (GMT)
Received: from [9.160.53.66] (unknown [9.160.53.66])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed,  8 Jun 2022 19:18:42 +0000 (GMT)
Message-ID: <13bef4e2-e8ad-b158-d2fc-bbf55bec6850@linux.ibm.com>
Date: Wed, 8 Jun 2022 14:18:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Fwd: Security Working Group meeting - Wednesday June 8 - BMCWeb
 authority checks
Content-Language: en-US
References: <49220e5b-bc49-2cef-fff2-234e24015fc0@linux.ibm.com>
To: Ed Tanous <edtanous@google.com>, Gunnar Mills
 <gmills@linux.vnet.ibm.com>,
        Krzysztof Grobelny <krzysztof.grobelny@intel.com>,
        openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <49220e5b-bc49-2cef-fff2-234e24015fc0@linux.ibm.com>
X-Forwarded-Message-Id: <49220e5b-bc49-2cef-fff2-234e24015fc0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7sQeOUetSEPZwIIq919KG4Ki3-sYLadf
X-Proofpoint-ORIG-GUID: ztft9bGqdRT1DJDrMu6DmlYlEUlUOwxt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_05,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080074
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

BMCWeb maintainers,

FYI, the security working group reviewed BMCWeb's basic authority 
checking mechanisms, and I have summarized that discussion in the 
meeting notes.  We are struggling to find ways to improve or tighten the 
D-Bus API layer.

This email is for information only.  No action is needed.

Joseph


-------- Forwarded Message --------
Subject: 	Re: Security Working Group meeting - Wednesday June 8 - results
Date: 	Wed, 8 Jun 2022 14:06:37 -0500
From: 	Joseph Reynolds <jrey@linux.ibm.com>
To: 	openbmc <openbmc@lists.ozlabs.org>



On 6/7/22 11:12 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday June 8 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Attended: Joseph Reynolds, Yutaka, Ruud Haring, Dick from Phoenix, 
Krishnan Sugavanam, Mark McCawley, Russel Wilson


The meeting went about 20 minutes over time (80 minutes total).


1 Progress on SELinux gerrit review 
https://gerrit.openbmc.org/c/openbmc/docs/+/53205 
<https://gerrit.openbmc.org/c/openbmc/docs/+/53205>

Note the design is intended for BMC which have a larger flash image 
size.  For example the OpenBMC witherspoon reference platform has a 64Mb 
flash divided into 2 sides, with space for a 20Mb readonly filesystem, 
so it is too small.  SELinux is intended for BMC with 256Mb SPI flash, 
where SELinux adds  about  20Mb (initial guess).


Ruud is continuing to work on the design.  Discovering what config 
changes are needed by enabling SElinux.  For example, SELinux adds a 
`-Z` flag to many commands to show SELinux attributes. SELinux-enabled 
busybox (-Z flag) exists.  Attempting to build from Yocto recipe.

Attempting to follow meta-selinux docs.  Debugging.  Reach out with 
questions to the yocto community (perhaps via email list in 
https://wiki.yoctoproject.org/wiki/Security).


We did a deep dive on BMCWeb authority checking by following a Redfish 
API call:

*

After a Redfish session is created, that session has a role and a
set of privileges.

*

When that session is used to invoke an HTTP operation, that
operation’s  privileges are checked against the session’s privileges.

*

The Redfish spec described this in DSP0266 > Security details >
Authorization.  We peeked at this spec.

*

We looked at the Redfish “delete user” API as implemented by BMCWeb.
https://github.com/openbmc/bmcweb/blob/002d39b4a7a5ed7166e2acad84e0943c3def9492/redfish-core/lib/account_service.hpp#L1941
<https://github.com/openbmc/bmcweb/blob/002d39b4a7a5ed7166e2acad84e0943c3def9492/redfish-core/lib/account_service.hpp#L1941> 

This defines:

o

the HTTP operation (DELETE
/redfish/v1/AccountService/Accounts/<str> where <str> is a
username).

o

along with the privileges required to perform that operation:
namely redfish::privileges::deleteManagerAccount, which only
Administrator users have.

o

The C++ code to implement the operation (which basically invoke
the phosphor-user-manager API via D-Bus system bus with parameters

+

Bus: xyz.openbmc_project.User.Manager

+

Object path: (as C++ variable userPath)

+

Interface: xyz.openbmc_project.Object.Delete

+

Method: Delete

*

We talked about, but did not look at BMCWeb’s router function, which
routes operations to their implementation (such as “delete user”
above), and we talked about but did not look at the authority check
it performs.  That code is in the “handle” method, here:
https://github.com/openbmc/bmcweb/blob/002d39b4a7a5ed7166e2acad84e0943c3def9492/http/routing.hpp#L1236
<https://github.com/openbmc/bmcweb/blob/002d39b4a7a5ed7166e2acad84e0943c3def9492/http/routing.hpp#L1236>

*

We looked at BMCWeb’s implementation of the Redfish privilege
registry.  Specifically, the generated header file here
https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/registries/privilege_registry.hpp
<https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/registries/privilege_registry.hpp>is
a translation of the redfish spec’s privilege registry.  The BMCWeb
contributors maintain this file (runs as needed and checked in to
the repo), and the definitions are used within the operations
handlers (such as “delete user”).


A basic understanding is that OpenBMC’s authority checking (which asks: 
“am I allowed to perform this operation?”) is handled by BMCWeb, and 
there is no authority checking at the D-Bus layer. (Currently anyone who 
needs to use a D-Bus API must have root authority). This is a security 
problem we are trying to solve. (TODO: articulate why this is a problem.)

Two approaches were briefly discussed (not necessarily as complete 
solutions):

*

BMCWeb drops to the logged-in user (switch user command (su) or the
setuid kernel call).

*

SELinux labeling model.


For example, if desired, we can use SELinux to ensure the “delete user” 
dbus api can only be used by bmcweb and that it cannot be used by any 
other service (like IPMI or by SSH/bash).  Then we can ensure only the 
phosphor-user-manager service is allowed to modify the /etc/passwd & 
shadow files.  Doing so will lock down who is allowed to perform BMC 
user management.


Revisit some initial use cases for selinux (examples):

1.

Limit what files bmcweb process can reach.  In my opinion (Joseph)
this would be an easy initial use case for SELinux because BMCWeb
only touches a small set of files,and has no reason to touch other
files.  Also phosphor-user-manager only touches a small set of files
(including /etc/shadow), and has no reason to touch other files or
to reach out to the network.

2.

Control which D-Bus apis bmcweb is allowed to use. (All of them?)


Here is an attempt to state a security problem more clearly: How do we 
limit specific dbus calls to specific users or to specific processes?  
Alternatively: How do we push down the BMCWeb’s authority model into the 
D-Bus APIs?  And what additional security would this give us?



Joseph

>
>
>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

