Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A87369A94
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 21:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRkBZ2rKKz300T
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 05:00:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ARuTTv6r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD
 header.b=ARuTTv6r; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRkBG0SSZz2xxg
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 05:00:05 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 95D9E37AB45A8F;
 Fri, 23 Apr 2021 14:00:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id e3BwLMMDP09D; Fri, 23 Apr 2021 14:00:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6B67937AB45A7C;
 Fri, 23 Apr 2021 14:00:02 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6B67937AB45A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1619204402; bh=ywBQAH5+6ykO9MmJxt8he51RGhtgTfciN0YUXqehpQQ=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ARuTTv6r0XPRVeYWkP6XB+NLBheS8rA7KNyAvF85zDBEmhYkPgKxyZ0y+Vuc+289G
 tTDTZyUVCnKWvyeeoQqnHUg6z2bXSCpwub7ybt+E6JVYxxyJw+06+SerWPXA0p+y+y
 0vuBd2afCy9qnMDcY52TVwymXwJT4dBoxAv8PLX4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LjG_CZgy9FeP; Fri, 23 Apr 2021 14:00:02 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 446CF37AB45A78;
 Fri, 23 Apr 2021 14:00:02 -0500 (CDT)
Date: Fri, 23 Apr 2021 14:00:01 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Ed Tanous <ed@tanous.net>
Message-ID: <435557601.17654407.1619204401116.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <CACWQX80mH2kBB3pCWPFxaYtDCMbMnfmXQWKh91Q+MsQSczpWcQ@mail.gmail.com>
References: <1381833945.17566380.1619166988825.JavaMail.zimbra@raptorengineeringinc.com>
 <CACWQX80mH2kBB3pCWPFxaYtDCMbMnfmXQWKh91Q+MsQSczpWcQ@mail.gmail.com>
Subject: Re: OpenBMC on RCS platforms
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC65 (Linux)/8.5.0_GA_3042)
Thread-Topic: OpenBMC on RCS platforms
Thread-Index: Sk69DGqF/HlrN7sULlPDCQxrnW6f/g==
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



----- Original Message -----
> From: "Ed Tanous" <ed@tanous.net>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "openbmc" <openbmc@lists.ozlabs.org>
> Sent: Friday, April 23, 2021 12:23:23 PM
> Subject: Re: OpenBMC on RCS platforms

> On Fri, Apr 23, 2021 at 7:36 AM Timothy Pearson
> <tpearson@raptorengineering.com> wrote:
>>
> 
> First off, this is great feedback, and despite some of my comments
> below, I do really appreciate you putting it out there.
> 
>> All,
>>
>> I'm reaching out after some internal discussion on how we can better integrate
>> our platforms with the OpenBMC project.  As many of you may know, we have been
>> using OpenBMC in our lineup of OpenPOWER-based server and desktop products,
>> with a number of custom patches on top to better serve our target markets.
>>
>> While we have had fairly good success with OpenBMC in the server / datacenter
>> space, reception has been lukewarm at best in the desktop space.  This is not
>> too surprising, given OpenBMC's historical focus on datacenter applications,
>> but it is also becoming an expensive technical and PR pain point for us as the
>> years go by.  To make matters worse, we're still shielding our desktop /
>> workstation customer base to some degree from certain design decisions that
>> persist in upstream OpenBMC, and we'd like to open discussion on all of these
>> topics to see if a resolution can be found with minimal wasted effort from all
>> sides.
>>
>> Roughly speaking, we see issues in OpenBMC in 5 main areas:
>>
>>
>> == Fan control ==
>>
>> Out of all of the various pain points we've dealt with over the years, this has
>> proven the most costly and is responsible on its own for the lack of RCS
>> platforms upstream in OpenBMC.
>>
>> To be perfectly frank, OpenBMC's current fan control subsystem is a technical
>> embarrassment, and not up to the high quality seen elsewhere in the project.
> 
> Which fan control subsystem are you referring to?  Phosphor-fans or
> phosphor-pid-control?
> 
>>  Worse, this multi-daemon DBUS-interconnected Rube Goldberg contraption has
>>  somehow managed to persist over the past 4+ years, likely because it reached a
>>  complexity level where it is both tightly integrated with the rest of the
>>  OpenBMC system and extremely difficult to understand, therefore it is equally
>>  difficult to replace.  Furthering the lack of progress is the fact that it is
>>  mostly "working" for datacenter applications, so there may be a "don't touch
>>  what isn't broken" mentality in play.
> 
> I'm not really sure I agree with that.  If someone came with a design
> for "We should replace dbus with X", had good technical foundations
> for why X was better, and was putting forward the monumental effort to
> do the work, I know that I personally wouldn't be opposed.  For the
> record, I agree with you about the complexity here, but most of the
> ideas I've heard to make it better were "Throw everything out and
> start over", which, if that's what you want to do, by all means do,
> but I don't think the community is willing to redo all of the untold
> hours of engineering effort spent over the years the project has
> existed.
> 
> FWIW, u-bmc was a project that took the existing kernel, threw out all
> the userspace and started over.  From my view outside the project,
> they seem to have failed to gain traction, and only support a couple
> of platforms.
> 
>>  From a technical perspective, it is indirected to a sufficient level as to be
>>  nearly incomprehensible to most people, with the source spread across multiple
>>  different projects and repositories, yet somehow it remains rigid / fragile
>>  enough to not support basic features like runtime (or even post-compile) fan
>>  configuration for a given server.
> 
> With respect, this statement is incorrect.  On an entity-manager
> enabled system + phosphor-pid-control, all of the fan control
> parameters are fully modifiable at runtime either from within the
> system (through dbus) or through Redfish out of band through the
> OEMManager API.  If you haven't ported your systems to entity-manager
> yet, there's quite a bit of people doing it at the moment and are
> discussing this stuff on discord basically every day that I'm sure
> would be able to give you some direction on where to start getting
> your systems moved over.

<snip>

Interesting.  I assume entity-manager is pretty new still?  A year ago there was zero solution to the problem of runtime configuration, and when I checked several weeks ago the bug report on it [1] had no meaningful progress.  Looks like that's finally changing.

Is the entity manager fairly stable API-wise at this point?  That might be enough of a game changer for me to go back and get approval for what will effectively be our fourth port of the Talos II systems to OpenBMC.

[1] https://github.com/openbmc/openbmc/issues/3595
