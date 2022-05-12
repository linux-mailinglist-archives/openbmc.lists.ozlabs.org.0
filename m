Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED123525236
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 18:12:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzcHB6NQSz3c9B
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 02:12:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a5y0BsCu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a5y0BsCu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzcGh1x29z3bqT
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 02:11:39 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CFkZG0002565;
 Thu, 12 May 2022 16:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SlbYoRNj9D+lZWo3IzPOD4FUJ4BKT2/M7hLsLSVRkGw=;
 b=a5y0BsCu9b2oyM47b8Q5Ej1gCUvGLHwgCPzbBmpHE6LXPGShcsnaBrgw+UASA7nPUgBF
 ilzIyYsTwn3afgp61BRHwMt5kcQ6oh7XaMDyXQti3Bgn3NWgV7UFV/ZXDtgOvvuxXPZ4
 Dk1u11H23lG+qBpDpEIzD6mCmfsvUbiwb3+6ZjO3z0IwtOUzCVtNnJGBhsFFh8zHPguh
 VfLJZyCMOHYPVFe0gtRRF1UP+Tp0pZFl9aq6//C4riLgL7AkpTl/BJDeGftpv2yqlRjh
 Q+eqwJBcYSNCPap8sR7Y6iXmhvHvYCD6a04pVvTtKYZ8jXshiWL42oa6CDSVE13EGb+P NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1560ght2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 16:11:32 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24CFm7dC007129;
 Thu, 12 May 2022 16:11:32 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1560ghr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 16:11:32 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24CFlJ6U022059;
 Thu, 12 May 2022 16:11:25 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3fwgd9mebg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 16:11:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24CGBPub62849350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 16:11:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42646AC065;
 Thu, 12 May 2022 16:11:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDB1BAC060;
 Thu, 12 May 2022 16:11:24 +0000 (GMT)
Received: from [9.65.238.111] (unknown [9.65.238.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 12 May 2022 16:11:24 +0000 (GMT)
Message-ID: <388be3ef-5363-65b8-4b74-b22e3a032803@linux.ibm.com>
Date: Thu, 12 May 2022 11:11:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
Content-Language: en-US
To: Ed Tanous <edtanous@google.com>, nirav.j2.shah@linux.intel.com
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
 <CAH2-KxDkugwGbZZEenBObwzJENCXTUDGtZn5TXPi7c3Kkog5DQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <CAH2-KxDkugwGbZZEenBObwzJENCXTUDGtZn5TXPi7c3Kkog5DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oCn1K5M2lIu-3lA4TzNxs6_Hy946PPBM
X-Proofpoint-ORIG-GUID: 2p_IVxzPX7DcJ4zNKpvU9s2_NTB_YhgO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_12,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120076
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
Cc: openbmc@lists.ozlabs.org, nirav.j2.shah@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/9/22 3:08 PM, Ed Tanous wrote:
> On Mon, May 2, 2022 at 2:58 PM Nirav Shah <nirav.j2.shah@linux.intel.com> wrote:
>> Hello,
>>
>>
>>
>> I am new to OpenBMC (and BMC ),
> Welcome!  Glad to have you.
>
>> so apologies if I am posting this in the wrong place. I have been looking at this issue.  Here is my summary of the problem statement, please do comment and let me know if I got this right.
>>
>> The biggest challenge is the use of system bus and non root access to the system bus.
> This statement could be phrased a little more precisely.  The biggest
> challenge is that:
> 1. bmcweb (and all user-facing daemons) run as root.
> 2. There is no way to define an ACL such that a user-facing daemon
> would not have access to something.
> 4. User-facing daemons enforce their own authorization systems,
> instead of relying on something out of process, which makes them more
> vulnerable than is ideal.
>
>> As previously suggested an ACL based approach can work. (whether it is using a D-Bus ACL configuration file or SELinux)
>> However, it does require an exact configuration to cover all security scenarios (for MAC) and IMO “may” make debugging efforts harder.
>>
>> Coming from a desktop background (which additionally uses D-BUS session/user bus for user isolation), I was investigating if having a session bus would help. For OpenBMC, the idea would be to allow non root application to communicate with each other and with root** applications on a single session bus to begin with. This can be further augmented using ACL based approaches if needed. I have a small POC, which tests this on OpenBMC with D-Bus broker
> I think the thing you haven't touched on here is that in the way linux
> generally uses these, session busses are spun up per-user session,
> which provides some level of abstraction and segmentation between
> various users.  it'd be interesting to talk through that as an
> architecture, and how it maps, but as Patrick points out elsewhere,
> simply moving nearly everything onto a shared session bus doesn't
> really do much to solve the security concerns.
>
> An architecture that would be interesting would be:
>
> 1. On creation of a session, bmcweb registers the session with linux,
> and gives the session that users permissions levels, similar to how a
> "normal distro" session manager would act.
> 2. ACLs would define specifically (at dbus level) what that user was
> allowed to do.  Ideally we could drive some of these from
> PrivilegeRegistry.
> 3. When user requests come in, bmcweb would route the requests to the
> appropriate session bus for that user.
>
> And in theory, at the end, we could remove the permissions code from
> bmcweb, because we'd be relying on linux permissions, which are
> arguably better.

In the 2022-05-11 Security Working Group meeting, I advocated that we 
document a model for how some of the BMC's network-facing services use 
D-Bus interfaces.
The model would be organized by interface, similar to 
https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md 
so it could be incrorporated into a larger threat model.
The model should be adequate to show, for example, how bmcweb and the 
ipmi (ipmitool) network-facing services invoke D-Bus APIs to perform 
user management functions, and how access should be limited to admin users.

This model could be used, for example, to help describe that only bmcweb 
and ipmi should have access to user-management APIs.  Or it could be 
used to help describe the user authority needed to invoke each of the 
user-management APIs.  Or whatever authorization mechanism the projects 
decides to have.

Joseph

Ref:
Security Working Group meeting: 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>
>> To run the demo
>>
>> As root, copy files dbus_session.service and dbus_session.socket to /etc/systemd/system/
>> useradd nirav //or change the .service and .socket file to your user
>> systemctl daemon-reload
>> systemctl start dbus_session
>> ps | grep dbus //will show an additional dbus-broker running
>> compile dbus_server.c and dbus_client.c using yocto sdk or write a receipe
>> ssh as root, export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/bus1 and ./dbus_server
>> ssh as nirav, export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/bus1 and ./dbus_client
>>
>> With the POC I was able to …..
>>
>> Show dbus_broker_launch “–scope user” works on OpenBMC (A session busses can be created using the right system unit files and launcher provided by D-Bus broker)
>>
>> Since I am new to D-Bus broker and systemd I had to confirm this.
>>
>> Show DBUS_SESSION_BUS_ADDRESS is the only env variable required by root to access the session bus of another user. There is a limitation here, discussed below.
>>
>> As far as the actual solution, idea would be to have a configuration file to specify which D-Bus interfaces can be on the session bus. An opt in model which does not need any modification to existing and future OpenBMC daemons/applications would be the goal but there are limitations …..
>>
>> For root**, to access another user’s session bus, its needs to setuid/setgid to the corresponding user.
>>
>> This is because D-Bus actively blocks any user even uid 0 from accessing another’s session bus. It would be a simple patch to make an exception for root. But still something that needs to be maintained.
> This is something that would need to be looked at in more depth technically.
>
>> My POC was not using sdbus/plus. At the very least, modification will be needed to sdbusplus, sdbus, phosphor-dbus and possibly to object mapper. Not sure if more applications need to change.
>> Supporting multiple session D-Buses will be really complicated for a lot of reasons. So even if session bus is a reasonable idea (which I need feedback on), I would not jump into having a session bus per usecase from the get-go.
>>
>> I am happy to start with a design document on git hub and also make some code changes, but I had a few questions.
>>
>> Your views on, if this a workable idea?
> I have very similar concerns with Patrick;  With that said, if these
> are minor additions to existing daemons that are optional, I'd be in
> support of some amount of experimentation in this regard to find an
> acceptable solution, but I don't think the above gets us to what we
> need.
>
>> I am hoping I can isolate all the changes to sdbusplus, sdbus, phosphor-dbus and object mapper. What else might need to change?
> I'm fairly certain every daemon needs some changes to define the
> appropriate ACLs.  Essentially we need to distribute BMCWEBs privilege
> registry mapping to dbus, so individual daemons can put in ACLs that
> define whether their APIs are Admin, Operator, user, or read-only
> privilege level.
>
>> If I can make all these changes, I was thinking of starting with BMCWeb as non root but since BMCWeb interfaces with a lot of daemons that would be a big step. Any better ideas?
> Keep in mind, bmcweb also accesses things that:
> 1. Aren't openbmc dbus daemons (primarily systemd)
> 2. Supports accessing data through unix sockets (KVM, serial port,
> virtual media, ect).
> 3. Supports accessing system data through the filesystem (EventLog,
> HostLog, ect).
> 4. Has data that it needs to persist (sessions, guids, ect) in
> bmcweb_persistent_data.json.
>
> If you want to run bmcweb as non-root on any non-trivial system, you'd
> have to find solutions for those use cases as well.  WIth that said,
> if you want to focus on the dbus aspects first, happy to work through
> that piecemeal, but it will mean that we will have to support both
> configs (bmcweb as root, and bmcweb as non-root) for some amount of
> time, so keep that in mind when you write your patches.
>
>>
>>
>> Thanks,
>>
>> Nirav.
>>
>>
>>
>>
>>
>>
>>
>> --
>> Nirav Shah

