Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A8273259
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 21:03:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwDNL1133zDqwm
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 05:02:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwDML2RRmzDqdD
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 05:02:04 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 21 Sep 2020 15:01:57 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: interest in a minimal image recipe
Message-ID: <20200921190157.u5lx7362wjnvuxwm@thinkpad.fuzziesquirrel.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
 <20200921182000.twlx3epiawrlfs55@thinkpad.fuzziesquirrel.com>
 <CACWQX81A-vh97+oXT4ejqgM6p4NdmxTffH-sUeruAiQNb5quqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX81A-vh97+oXT4ejqgM6p4NdmxTffH-sUeruAiQNb5quqw@mail.gmail.com>
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

On Mon, Sep 21, 2020 at 11:49:36AM -0700, Ed Tanous wrote:
>On Mon, Sep 21, 2020 at 11:20 AM Brad Bishop
><bradleyb@fuzziesquirrel.com> wrote:

>> I can see how my summary would cause confusion.  FWIW I used the summary
>> in core-image-base as a template.  Is there a better summary?

>Something like: "A basic OpenBMC image with no features enabled".

Nice!  thx.  I'll update the patch.

>So your thinking is that this would eventually become the new
>"defaults" image?  Possibly the "well supported" image?  I can get
>behind that.

Yes, exactly.
