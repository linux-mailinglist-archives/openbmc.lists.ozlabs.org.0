Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F82700D8
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 17:23:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtHfX6PdpzDqrX
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 01:23:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZmoONSJI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtHTq6spZzDqkS
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 01:15:59 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IF3SkZ153653
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 11:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vN2OE+dLMTBi9NDEs/niap0EJhyag4o5SF/Jp+70iBA=;
 b=ZmoONSJIB7HDS4NbgHHlUqd5hbOAde19aGrBxslwYsMfEo2cfSAgPKohSPmREIzCKM2E
 qB+nUAhl8k/6buYvALH510QKhxYMwF2p0cAc+TJc8i7J9ijDwQZwUoMhsp1CU/WUbR+N
 5myaN9DMzZzQtM+FfWbcAplEkL22Ifw9nkyNe2LX9/7UWnJA/jNO3smjsco6TQcy4oYh
 WIgjKvAi4+poPtJgNfGCMiwjPYRz0+IsMmpcV4JaUoIDQRP2CKADE8kucU3Tp8j2psRM
 YUDOnfOS+5b64wAYFxZbWKV4gkPqN5hVZeqMtsLRHhV51bDoo2KDrKCpdFqoN93Le5rO yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33my6j8bu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 11:15:55 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08IF3Zkc153968
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 11:15:55 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33my6j8btp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 11:15:55 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08IFCMe7020618;
 Fri, 18 Sep 2020 15:15:54 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 33k659c15k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 15:15:54 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08IFFrdL54067578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 15:15:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A7E612405A;
 Fri, 18 Sep 2020 15:15:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DA3B124053;
 Fri, 18 Sep 2020 15:15:53 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.204.63])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Sep 2020 15:15:53 +0000 (GMT)
Subject: Re: Security Working Group Meeting - Wed 16 September - meeting
 highlights
To: Parth Shukla <timevortex@google.com>, openbmc@lists.ozlabs.org
References: <CAC1Cx+u9ooasL7Kvi4tEjV+MTMk8bzjMd4mLrh6HXRmt_VEMwQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <5e1d298c-19c2-5a6e-1c2e-0c1089683814@linux.ibm.com>
Date: Fri, 18 Sep 2020 10:15:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAC1Cx+u9ooasL7Kvi4tEjV+MTMk8bzjMd4mLrh6HXRmt_VEMwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180124
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

On 9/15/20 2:08 PM, Parth Shukla wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday September 16 at 10:00am PDT.
>
Thanks for the reminder.  Here are highlights from the meeting.  See the 
minutes (linked below) for details.

> We'll discuss the following items on the agenda, and anything else 
> that comes up:
>
>  1. (Parth) Common Remote API for TLS certificate management?
>      1. Certificate management = installation, rotation, revocation
>

Meeting held 2020-09-16:

1 Common Remote API for TLS certificate management?

     1.

        Certificate management = installation, rotation, revocation

ANSWER: OpenBMC desire manage certs via Redfish APIs.

Please create a design; start with email discussion.

Some difficulties were foreseen with cert rotation; need to work out issues.


>  1. FYI: BMCWeb Code review: Admin-configurable session timeouts
>     https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016
>
No discussion.
>
>  1. FYI: BMCWeb core review: moving to Meson build system (from
>     cmake): A security concern is ensuring project defaults are
>     preserved so that builders get the same options when they use the
>     new build system.
>     https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32816
>

No discussion.

>  1. BMCWeb code review: WIP toward HTTP-HTTPS redirect:
>     https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36245
>

No discussion.


>  1. (Joseph): Interest in implementing Redfish ManagerNetworkProtocol
>     properties: HTTPS, IPMI, SSH, VirtualMedia, KVMIP, HTTP
>     (redirect), Oem.OpenBMC.TFTP, and Oem.OpenBMC.mDNS?  This allows
>     the BMC admin to enable and disable these services. Previous
>     discussion on 2019-11-13.
>
Joseph intends to add pieces we need to the existing implementation.

>  1. (Joseph): Interest in implementing Redfish
>     ManagerAccount.AccountTypes.  This allows the BMC admin to control
>     which users are allowed to access specific BMC interfaces (like
>     SSH or IPMI).  See
>     https://redfishforum.com/thread/219/account-groups-property
>

We are working out the issues; see links above.  Joseph wants to implement.


>  1. (email): Protect BMCWeb against password guessing attacks.  See
>     https://lists.ozlabs.org/pipermail/openbmc/2020-September/023054.html
>
There were several discussions about which defense is appropriate, how 
rate limiting interacts with account lockouts, and how to apply this to 
all interfaces not just Redfish.

Do we have different use cases within OpenBMC?  Different use cases:

  *

    Protected datacenter.

  *

    Connected to less-well protected network or to internet.


>  1. Gerrit code review for “EventService: https client support”
>     https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31735/
>
No discussion.

>  1.  (Anton) PoC work for daemons’ privilege separation
>     <https://github.com/openbmc/openbmc/issues/3383>
>     Use systemd features for privilege drop & sandboxing.
>
Anton debriefed efforts to make this work using systemd users created 
on-demand and process groups.

Next steps: List the daemon processes and characterize capabilities each 
of them need.  Joseph is interested in helping and adding this to the 
nascent OpenBMC threat model.

BONUS TOPIC:

10 Heads up on alternatives to the filesystem overlay 
<https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html>. 
https://lists.ozlabs.org/pipermail/openbmc/2019-August/017611.html

There is renewed desire to move away from the overlayfs and use a better 
feature to handle mutable files.

- Joseph

>
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> Regards,
> Parth

