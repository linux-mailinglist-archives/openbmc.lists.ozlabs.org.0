Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F01A4754
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 16:24:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zKyN6SnHzDqcn
	for <lists+openbmc@lfdr.de>; Sat, 11 Apr 2020 00:24:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zKxX08cWzDr7k
 for <openbmc@lists.ozlabs.org>; Sat, 11 Apr 2020 00:23:27 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03AE4WWV014764; Fri, 10 Apr 2020 10:23:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30920v0hv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 10:23:21 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03AENLC3060377;
 Fri, 10 Apr 2020 10:23:21 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30920v0hv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 10:23:21 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03AEM3c7015235;
 Fri, 10 Apr 2020 14:23:20 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3091med26g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 14:23:20 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03AENJYD48169230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Apr 2020 14:23:19 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 968C9BE051;
 Fri, 10 Apr 2020 14:23:19 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 036A0BE04F;
 Fri, 10 Apr 2020 14:23:18 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 10 Apr 2020 14:23:18 +0000 (GMT)
Subject: Re: Call for Gardening Tasks
To: Vijay Khemka <vijaykhemka@fb.com>, Richard Hanley <rhanley@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
 <CAH1kD+b3ij5KiZn+-N0O+BnbB-XONmbWtYSRA2feKNb+zw6kjw@mail.gmail.com>
 <521FD3E2-3AFE-4E56-A6CF-B0ABA7E9C8E3@fb.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e42cef9e-1760-d3ee-4396-61cd1d141983@linux.ibm.com>
Date: Fri, 10 Apr 2020 09:23:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <521FD3E2-3AFE-4E56-A6CF-B0ABA7E9C8E3@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_05:2020-04-09,
 2020-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004100113
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

On 4/9/20 5:19 PM, Vijay Khemka wrote:
>
> I can see following small tasks which need refactoring
>
> IPMID:
>
> Some of standard commands are incomplete here like “restore power 
> policies”, some of sensors  sdrs etc.
>
> Dbus interface:
>
> Define more dbus interfaces being used in common code. I see multiple 
> repos has these interfaces hard coded. And I agree for client side 
> code would really be helpful.
>
> Phosphor package clean up:
>
> There are many phosphor packages in image which are added by default 
> and lots of systemd unit are running irrespective of platform 
> requirements.
>
> Documentation:
>
> Many repos doesn’t have proper documentations and it will be really 
> good to add and a root level documents giving an idea about different 
> features and mapped to multiple available repos.
>

Can we flesh out the list of features?
https://github.com/openbmc/docs/blob/master/features.md


The openbmc/docs repo has good stuff for developers.  Can we take it the 
next level by adding:
- Guide for system integrators - source and build config, signing keys, etc.
- Guide for initial BMC setup - genesis boot, discovery, configure IP, 
certs, users, etc.
- Guide for system admins - ongoing tasks like auditing logs, firmware 
updates, etc.
- Security technical implementation guide (STIG).

We've discussed these in the OpenBMC security working group, and I've 
collected some details here:
https://github.com/ibm-openbmc/dev/issues/1531

I would be happy to contribute to these ... just looking for someone to 
collaborate with.  :-)

> I will add more once I remember back.
>
> Regards
>
> -Vijay
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> 
> on behalf of Richard Hanley <rhanley@google.com>
> *Date: *Thursday, April 9, 2020 at 2:57 PM
> *To: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Re: Call for Gardening Tasks
>
> Here are some ideas I have as a wishlist for gardening/improvements.
>
> *Client Models for DBus*
>
> Right now sdbusplus does a pretty good job of making server 
> development easy.  However, I wish we had some more tooling on the 
> client side. I see a decent amount of repeated code around ObjectMapper.
>
> One way to separate concerns and cut down on boilerplate is to have a 
> model library. A call to a model would spin off an async method call 
> to manage the data marshalling, which would then call a lambda with a 
> fully reified object.  This is similar in concept to the way models 
> work in web development.
>
> *Unit Testing in bmcweb*
>
> This is pretty easy to say, and harder to do. I've been thinking a bit 
> about how to add in unit tests without them being too fragile. (This 
> was also something that geissonator mentioned).
>
> *DBus Virtualization and Playback*
>
> One thing that I think makes unit testing in some modules hard is that 
> there is a high barrier around mocking DBus.  I'm not sure the best 
> way to build this sustainably, but it would help improve our CI testing.
>
> *OpenAPI for Redfish*
>
> So far the general impression I've seen with this is that the Swagger 
> output for OpenAPI isn't really good for C++.  Either the ergonomics 
> aren't really good, or there is a lot of code bloat.  I'd love to have 
> some OpenAPI bindings that work well in OpenBMC.
>
> *RUST!?!?*
>
> I'm betting a lot of people have thought about Rust. I'd love to hear 
> what people have tried and what are the sticking points.  Any thoughts 
> on what module/functionality could be a decent candidate for breaking 
> ground here?
>

We discussed the rust language in the OpenBMC security working group 
meetings 2019-10-02
OpenBMC security working group minutes:
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI

> -Richard
>
> On Thu, Apr 9, 2020 at 2:54 PM Richard Hanley <rhanley@google.com 
> <mailto:rhanley@google.com>> wrote:
>
>     Hi everyone,
>
>     Last week I started a thread on Open BMC Gardening
>     <https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.ozlabs.org_pipermail_openbmc_2020-2DApril_021100.html&d=DwMFaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=fAZZtmWl4g8Vngk56_Rs09hgS96TYQMeyRsyZKGHzAo&s=HXdHl56jq4p5eXbhyUHUkkmoF_hGh5tJWMUaVKQ68VM&e=>,
>     and I wanted to kick off the process.
>
>     The basic idea here is to get a survey of various
>     improvement tasks throughout OpenBMC.  Some things might be small
>     refactoring or changes that can be done incrementally (i.e.
>     weeding the garden). Other tasks might be more research or
>     structural (i.e. excavating the garden).
>
>     Just getting these in writing can be helpful for others to gauge
>     what they should focus on. It also helps leave breadcrumbs for any
>     new developer interested in the subject.
>

Richard,

Thanks for your efforts to move this forward.

Security wish list here: 
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list

- Joseph

>     So here's how I see this working. Anyone who has some ideas can
>     reply to this thread with a short to medium description.  Try to
>     avoid new features, and instead look at ways we could improve the
>     status quo. Think about changes and tools that would make your day
>     to day life better.
>
>     From there we can do a write up about what we know about the
>     issue.  This can function as an early stage design doc that gives
>     a broad overview on where the dev's head is at right now.
>
>     Finally, we can do a quarterly review to keep the garden
>     refreshed. Obviously, things can change between that time, but
>     having a semi-regular cadence will hopefully give us a better
>     chance of keeping this up to date.
>
>     - Richard
>

