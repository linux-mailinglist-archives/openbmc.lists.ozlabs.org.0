Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBAE273148
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 19:56:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwBvN4ltXzDqgL
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 03:56:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwBq73QYXzDqhC
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 03:52:32 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 21 Sep 2020 13:52:27 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: interest in a minimal image recipe
Message-ID: <20200921175227.zmdjbmixbwvstd4m@thinkpad.fuzziesquirrel.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 08:53:26AM -0700, Ed Tanous wrote:
>On Mon, Sep 21, 2020 at 5:55 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>>
>> In what way does EM require intel-ipmi-oem?  I am using EM without
>> intel-ipmi-oem without (I thought anyway) issue.
>
>You're running Entity Manager, without intel-ipmi-oem, and you can run
>a successful "ipmitool sensor list" or "ipmitool fru print" command,
>and have it return the entity manager/dbus-sensors/FruDevice results?

Ah, now I understand.  No, I can't do that.  But I don't need to because 
the default IPMI handler implementations in phosphor-host-ipmid work for 
me (the YAML based ones), and those don't need entity-manager.  I'm 
using entity-manager for other reasons.

As an aside - I think a majority are using the intel-ipmi-oem handlers 
now so I'd support moving those into phosphor-host-ipmid and using them 
as the defaults.  But that must not be easy, otherwise Intel would have 
just done that rather than forking the handlers in intel-ipmi-oem in the 
first place.

But in any case, intel-ipmi-oem requires entity-manager, not the other 
way around right?  The "feature" being selected here is the Intel IPMI 
handler forks, and that would simply depend on entity-manager.  A 
strawman:

obmc-phosphor-image.bbclass:
FEATURE_PACKAGES_intel-ipmi-handler-forks = "packagegroup-intel-ipmi-handler-forks"

packagegroup-obmc-apps.bb:
RDEPENDS_packagegroup-obmc-apps-intel-ipmi-handler-forks = "intel-ipmi-oem"

intel-ipmi-oem.bb:
RDEPENDS_${PN} = "entity-manager"

One prerequisite to this is that the intel-ipmi-oem recipe would need to 
move to meta-phosphor.  Perhaps its time for the repo to be renamed into 
something else.

>In my understanding, this shouldn't work, and we've had many reports
>of "I enabled entity manager, and my sensors don't show up in IPMI".
I don't think the answer to "how do I enable IPMI sensors" was ever 
"enable entity manager" was it?  To enable IPMI, you have always needed 
to enable either the original YAML based handlers or the intel-ipmi-oem 
forks.
