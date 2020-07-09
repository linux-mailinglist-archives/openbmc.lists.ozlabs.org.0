Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0821A030
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 14:45:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2bVf25vJzDr7j
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 22:45:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2bT96l5vzDr6t
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 22:43:57 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 9 Jul 2020 08:42:46 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
Message-ID: <20200709124246.g5axir3p7yyfr6u5@thinkpad.dyn.fuzziesquirrel.com>
References: <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
 <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
 <CAA_a9x+h61N1j3_OPvXeb7uCH+gcouy=r7_y8uSt3+XFh38ddA@mail.gmail.com>
 <CACWQX83baDkPtr6CxEUvBCQQF2YdOkfQDxc03c8YVpqX5qcpfQ@mail.gmail.com>
 <CAA_a9x+6OfxGP+Sd6hYeBo3u1yEm1Z=OeXbk5+EOkcik9KyGdg@mail.gmail.com>
 <CACWQX83treqBh2Xh6ycyK=3eO3HbGmZuPyqFPTEXt1dH8QheFA@mail.gmail.com>
 <CAA_a9xLuCPRGawer58S-XUMo_2A27hLYsn=5_0LE4BUvqSLmtg@mail.gmail.com>
 <CACWQX80nVRC_dXRiNYUmdmTubpVz3oVrv_DHiAeUPbpGKBVGYw@mail.gmail.com>
 <CAA_a9xJSx9c=_JwGDh=3ikSvF8QUkxS1No_myqcWJ6bDViYKRQ@mail.gmail.com>
 <CACWQX808TL-xzCOSoh0BfZSZZQS+PJqYimw8TCU44o0Qk9qHaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX808TL-xzCOSoh0BfZSZZQS+PJqYimw8TCU44o0Qk9qHaA@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>, Alex Qiu <xqiu@google.com>,
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Josh Lehan <krellan@google.com>, Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 08, 2020 at 11:15:03PM -0700, Ed Tanous wrote:
>On Wed, Jul 8, 2020 at 2:46 PM Alex Qiu <xqiu@google.com> wrote:

>> We've talked with the maintainer of hwmon, and he doesn't think adding
>> these to hwmon interface is a good idea, as hwmon is supposed to be a
>> monitoring interface. 

Except most "monitoring devices" are configurable and/or have a dual 
nature - e.g. voltage regulators.

>> Although we haven't yet met the need to set the
>> voltage other than debugging.

We have a need to tweak things in the production firmware.

>Excellent.  I hadn't realized you'd done that.  You're right,
>userspace is probably the right spot for this then.

I dunno.  It would be nice to have an in-kernel solution that allows 
VRMs to be both monitored and controlled.  Mixing i2c-dev with the 
actual vrm driver makes us do strange things like unbinding drivers 
while the vrms are configured, or rewriting the vrm driver monitor 
function in usersapce and missing out on the benefit of a well 
maintained kernel driver.

This problem comes up over and over again.  What would be great is if 
someone with good relationships and standing in the kernel community 
could work with the kernel maintainers to build their understanding of 
how we are using the kernel and figure out a good solution we could 
implement other than just: "use i2c-dev".
