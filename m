Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 548031AE694
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 22:14:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493nPT6zkKzDs09
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 06:14:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493nNp1wQPzDqBh
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 06:14:01 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HK6hH8116062; Fri, 17 Apr 2020 16:13:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30fjux8pxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 16:13:57 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03HK8LUW121541;
 Fri, 17 Apr 2020 16:13:56 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30fjux8px8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 16:13:56 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03HKAmHU011777;
 Fri, 17 Apr 2020 20:13:56 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 30b5h7cvcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 20:13:56 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03HKDtZm23986522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 20:13:55 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D85C2AE066;
 Fri, 17 Apr 2020 20:13:55 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67790AE05C;
 Fri, 17 Apr 2020 20:13:55 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 17 Apr 2020 20:13:55 +0000 (GMT)
Subject: Re: Proposal: how to make incompatible changes
To: Richard Hanley <rhanley@google.com>, Andrew Jeffery <andrew@aj.id.au>
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
 <e77335c2-97a8-42aa-ad93-394fe6f9b420@www.fastmail.com>
 <CAH1kD+YQ+Am_uwb0vo0mReq8FvBLuxKnxoZi7x_Xfap3SYQFzg@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <7c9d03de-a9ca-a79b-4753-b7d1fc350f8a@linux.ibm.com>
Date: Fri, 17 Apr 2020 15:13:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAH1kD+YQ+Am_uwb0vo0mReq8FvBLuxKnxoZi7x_Xfap3SYQFzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_09:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170145
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

On 4/16/20 4:53 PM, Richard Hanley wrote:  -- also responding to Andrew 
Jeffery
> Thank you for bringing this up.  I really think that some policy 
> discussion is useful here.  I also 100% agree that 
> forward compatibility should be our goal here.
>
> When I think about incompatible changes I tend to group them into one 
> of two categories:
> 1) A design change goes in the opposite direction than what previous 
> versions offered, and the old feature needs to be shut off.
> 2) New features/designs are made, and supporting several different 
> options at the same time is difficult
>
> Security changes are often in the former category. I remember a few 
> months back there was a thread about removing the DBus rest interface 
> as a default service for security reasons.  Brad's point at the time 
> was (I may be paraphrasing here) that we need to maintain support for 
> any currently supported use case or be able to support their migration.

There is broad support to disable the phosphor REST APIs by default.  I 
understand we are waiting for a little more development work so this 
will go smoothly.  See comments in the review:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344

> Now another point in that thread was that some users are going to care 
> more about security than compatibility, and vice versa. One possible 
> solution is to create a second secure phosphor reference implementation.

I am trying hard to move the OpenBMC distro to be "secure by default".  
If we run into compatibility issues, I would try to put them in as 
DISTRO_FEATUREs, and then work to change the default to the secure setting.

An example for this is network IPMI.  I am (we are?) working toward 
allowing the BMC admin to disable the network IPMI service, but it would 
be enabled by default.  Then in future, we can change the default to 
disabled. ... (goes to look for old email)....

So I don't see a need for a second reference distro.

>
> Here is the thread I'm talking about: 
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020491.html
>
> Having two reference implementations (profiles, tracks, or whatever we 
> want to call it) isn't without risk.  If things ever diverge too far, 
> then the overhead might be larger than supporting forward 
> compatibility.  However, I would like to get to a place where changes 
> of that sort can be made accessible to early adopters, combined with a 
> clearly communicated deprecation/migration plan.
>
>
> On Wed, Apr 15, 2020 at 10:01 PM Andrew Jeffery <andrew@aj.id.au 
> <mailto:andrew@aj.id.au>> wrote:
>
>     > Applicability.
>     >
>     > These guidelines are for the BMC's "intended external user
>     interfaces".
>     > For example, its management interfaces including its web server
>     and all
>     > REST APIs.  I haven't given much thought to the BMC/host
>     interfaces or
>     > interfaces internal to the BMC.  IMHO, it is less important to
>     maintain
>     > compatibility in these areas.
>
>     Lets split this. My feelings are
>
>     1. Inband (BMC/Host) interfaces are in the same class as "intended
>     external user interfaces" and therefore should not have incompatible
>     changes unless _absolutely_ necessary. What we implement here should
>     have passed through a specification process under e.g. DMTF.
>

That sounds right to me.  I have less understanding of the BMC/host 
interface, so I'm ahpy ot let someone else lead there.

>
>     2. Interfaces between applications on the BMC (e.g. D-Bus interfaces)
>     is the class where compatibility is less critical, on systems that
>     do not
>     expose the D-Bus interfaces via REST. However, while any system exists
>     that exposes the D-Bus interfaces via REST we must constrain changes
>     to these interfaces as well.
>

Agreed.

>
>     > For example, if you need an incompatible
>     > change in an internal interface, you have a smaller set of users
>     who
>     > ought to be active in the project, and can give you feedback and
>     adapt
>     > within a release cycle.
>     >
>
>     This is true for interfaces between BMC components, it's not true
>     of the
>     host firmware interfaces, hence my split above.
>
>     When we remove the ability to directly access the D-Bus interfaces via
>     REST we will gain a lot more freedom as the D-Bus interfaces then
>     truly
>     become internal.
>
>     Andrew
>

