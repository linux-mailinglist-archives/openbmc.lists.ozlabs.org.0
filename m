Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE97833289C
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 15:30:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvyKg5SmMz3cJs
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 01:30:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=PkNr/bqj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hS0DdT4I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=PkNr/bqj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=hS0DdT4I; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvyKQ6lhyz2yRd
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 01:30:02 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 42D7E1B53;
 Tue,  9 Mar 2021 09:29:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 09:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=z3H
 VXggE3JkrkQkH9OKGOygYczkJkQeCg1eXh9YbdwA=; b=PkNr/bqjgcxMcLm7wOv
 Ksxt64cZ+qSIO6xFZRpILFDMljaUh1mSil4ns+yF9dbgqyLTdpUXLOEx3vLadwDP
 9DoBraIKClP2l4MuHl8SgF020GHbEY4EznNsRjRXRMcUyFbhM4QcouXWsCksYv6p
 4v2mSF1F+i7fOH3hVQRnWfr/ZGyp+b5tSgkFxg/qrPRHlRYTInTa0mO4kLgvKQ0y
 8HijKpRXT96eHbnU4Qo4fbBfvrJXzPNY1HHHjyYPgmEnxfyFrVZ3g3B1NwrKLEmm
 Gv/y0+J96Ivc4WepAOxGQAT2Tv/xMs/qProErILqz2KpU1pAGJm4p8TMt0r/oZD+
 jlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=z3HVXg
 gE3JkrkQkH9OKGOygYczkJkQeCg1eXh9YbdwA=; b=hS0DdT4IHCJTDOmqdmmwp9
 b2QSgv/qUNHcTcbGzVGkP7oG5tfwei1rrF5RADIZCm5DU/p70wmv2HaJe2ywPXYT
 Eu5Z3WNGKbVKwJ5FuLpnCxvm5xttUYObYE5F5/I0/MeBDcw/SVoD6V4UjYslu894
 ZzC/gW/KEso9OBPKWTZlsbnaiwFoqA0msnCBomKO8U/p6H7/5kvzYFnDqRx4yKdK
 PKLnPTezOplr690DsynyqY/27F0AjyRXRXBI6KYbis1c1QWSKGrUxJwZ3Y7cOyur
 gUc7aQMy75+wr3TumA2yzcYIqNAg7nS46lPsINB+PKyptrgfb9HrLDA8xTWz8oBw
 ==
X-ME-Sender: <xms:ZoZHYNazlErFtNw3lILOJS5yx4l8u7YyJKvXonex97KwByRWANy5Lw>
 <xme:ZoZHYEbyIAADOR8fRV_fEhIgo2qxjR6hjM5-_JeDL9QzDOA8QgM5gF6sNLGWET3k7
 bGi1KlEjdG3_dvKF8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeehteevheeltdetvddu
 ffffkedtgfehgeffgffggfffueduieekiefftedukeeivdenucffohhmrghinhepohhpvg
 hnsghmtgdqphhrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmnecukfhppedujeef
 rdduieejrdefuddrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:ZoZHYP9jmqtzqMb4yVx-zPuu2UdX9zd_kevHOBr0sBDeg1rjYSxR0g>
 <xmx:ZoZHYLoZi1y_BYOPTbzCgpkvNH7Sras8rjjwqngVMu1Pne4BjJwxgw>
 <xmx:ZoZHYIrUEqBdv_vJpKdFGiKkcNjL82iUFijwXSyvBKGDEtBdZb0dYw>
 <xmx:ZoZHYJe6joExRavl2NL1vtdsPkhLFQmEwhcqrOGIexAOGVkR-7agiQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id E71B5108005C;
 Tue,  9 Mar 2021 09:29:57 -0500 (EST)
Date: Tue, 9 Mar 2021 09:29:56 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Nan Zhou <nanzhou@google.com>
Subject: Re: Host Serial Console Logs via Redfish
Message-ID: <20210309142956.ywqxbryyjcyffj75@thinkpad.fuzziesquirrel.com>
References: <CAOLfGj7xOoZw0HFvNNE5-fU0VNxt48CwSi_--y7JR01TWs-xqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAOLfGj7xOoZw0HFvNNE5-fU0VNxt48CwSi_--y7JR01TWs-xqg@mail.gmail.com>
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
Cc: Spencer Ku <spencer.ku@quanta.corp-partner.google.com>,
 Litzung Chen <litzung.chen@quanta.corp-partner.google.com>,
 openbmc@lists.ozlabs.org, Ofer Yehielli <ofery@google.com>,
 Ed Tanous <edtanous@google.com>, Richard Hanley <rhanley@google.com>,
 Justin Chen <juschen@google.com>, Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Nan

Thanks for this announcement.  I don't have a lot of specific feedback 
for you, but this sort of introduction to new content is super helpful 
for the overall health of OpenBMC.

On Mon, Mar 08, 2021 at 01:45:00PM -0800, Nan Zhou wrote:

>Implementation for Phase 1 is in
>https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39093. It is
>based on obmc-console, phosphor-hostlogger, and bmcweb. The basic idea is

I like how you are making use of these existing projects.

>that phosphor-hostlogger collects host serial console logs via obmc-console
>and generates tarballs in a rotation manner. These tarballs are then
>consumed and exposed by a new node in bmcweb log service.

Is it one console line per LogEntry?

>We propose the following methods to improve it.
>
>   - Method 1: *D-Bus Signal*; phosphor-hostlogger implements an interface
>   which contains a signal. The payload of the signal should contain
>   timestamps and log messages.  BmcWeb registers as a listener and once it
>   receives a signal, it populates a new LogEntry. BmcWeb should implement its
>   own configurable ring buffer to store log entries received from D-Bus.
>   - Method 2: *File Watcher*; add file watchers in BmcWeb to monitor the
>   log files produced by phosphor-hostlogger. This method is similar to method
>   1. But persistence is still a necessary condition.
>   - Method 3: *obmc-console + bmcweb*: install the console collection and
>   ring buffer parts of phosphor-hostlogger as a library. Use the library
>   directly in BmcWeb to collect console logs.
>   - Method 4: *phosphor-hostlogger + journal + rsyslog + bmcweb*: this
>   architecture is very similar to what the current OpenBMC uses for
>   redfish-event
>   <https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md>.
>   Add a new schema for log entries. Publish journal logs in
>   phosphor-hostlogger. Add file watchers in BmcWeb to monitor the log files
>   produced by rsyslog. rsyslog should have log rotation enabled. Persistence
>   is still a necessary condition.

Perhaps a missing option here is a single dbus object per LogEntry?  I'm 
not necessarily advocating for that - can I assume that was not 
considered because of performance/scaling concerns?

-brad
