Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180460D59D
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 22:37:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxkK21JHvz3bcY
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 07:37:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B7w8SOWu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B7w8SOWu;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxkJR3HTxz307C
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 07:37:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666730231; x=1698266231;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=yLATUnPczkW+Kn/yd9YQcHyyjX9ZFqLBrVi2Dk1xAuM=;
  b=B7w8SOWuUBev5hJpkPqpiDU6yzatndcB/qPphl5quBr0/Yevz9TMQPNY
   LZhhdpy8+j6r1/F3SDow4wVCRhpPZ8f+LO4VEx2PC80KBUQH8nDc/r/Cz
   qTGqAsQBF9Px37+d4vVB4xD4jIXatTIsQC22GRtQmlzch8ddidj7qnkaD
   trpNQSMq2JQsR8LVYeVIEyN5OQfpghIO49LMLoXnoHTARszbw8kLqejdD
   E+C+E/8L2CLuQrFTxTCRmXnfkC562p5ubg9x6JTjVtsoR1nn0UVYB3rl0
   b24WL8VmlBRz1TQ2T+Bhd8U9pwb6oMEM1IsWFlyNBS6xO66RyPibGZoEu
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="306516098"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="306516098"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 13:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="736972244"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="736972244"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2022 13:37:07 -0700
Received: from [10.213.183.198] (jmbills-mobl1.amr.corp.intel.com [10.213.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 928B858090C
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 13:37:07 -0700 (PDT)
Message-ID: <566dd927-bfde-b78c-8a00-971bd8479a72@linux.intel.com>
Date: Tue, 25 Oct 2022 14:37:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Adding support for custom SEL records
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
 <Y1MCZNwdiZ9NC/tT@heinlein.stwcx.org.github.beta.tailscale.net>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <Y1MCZNwdiZ9NC/tT@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 10/21/2022 2:34 PM, Patrick Williams wrote:
> On Wed, Oct 19, 2022 at 09:50:47AM -0600, Bills, Jason M wrote:
> 
>> I'd also be curious about the reverse question.  Is there any benefit to
>> storing logs on D-Bus that makes it a better solution?
> ...
>> Is there a way we can now get together and define a new logging solution
>> that is fully upstream and avoids the drawbacks of both existing solutions?
> 
> First and foremost I'd like to see consistency come out of this.  If
> there is another proposal for how to do it that we can all consolidate
> on (and people are willing to put in effort to get there) then I'm
> on-board.  It seems to me like the lowest friction way to get there, with
> the best maintainability, is to use the phosphor-logging APIs even if we
> end up not putting them into d-bus entries.
> 
I agree that phosphor-logging seems like the right place, so I think 
looking at that but changing the back-end storage away from D-Bus 
objects may be a good direction to consider.

> It happens that phosphor-logging stores the instances on d-bus, but the
> more important aspect to me is that we have a more consistent API for
> defining and creating errors and events.  The "rsyslog-way" is that you
> make very specific journal entries that the rsyslog magic knows about,
> but there are a few issues with it:
> 
>      1. We don't have any consistency in what, when, and how events are
>         logged.  We even have cases within the same repository (looking at
>         dbus-sensors) where some of the implementations make the magic
>         SEL records and others do not.  Additionally, they're not required
>         to be the same format.  Some maintainers have even outright
>         rejected patches with the "magic log statements".
> 
Yes, this consistency would be good.  I tried to add SEL logging into 
phosphor-logging, but the patch didn't make it through review: 
https://gerrit.openbmc.org/c/openbmc/phosphor-logging/+/13956.

>      2. There is no way to generate something like a Redfish message
>         registry for the events, because they're just arbitrary strings
>         that are sprinkled around.  It isn't even easy to programatically
>         search the code for them because there are 4 different approaches
>         to that: cout/cerr, direct journald, phosphor-logging "v1", and
>         phosphor-logging lg2.
> 
I think Redfish is a more difficult case to handle, but if we can do it 
through the same or similar phosphor-logging API as IPMI, then I'm on board.

As for searching, it's true that different methods are used to get the 
log into the journal, but the Redfish MessageId is consistent in all 
cases and can be programatically searched.

>      3. Any kind of automation around these is more at the whim of
>         whatever the developers / maintainers decide to change.  It is,
>         for example, really difficult for me to write data center tooling
>         that reacts to events like "we just lost pgood to the host"
>         because I have to read through the code to find the specific text
>         and hope it never changes.
> 
Doesn't Redfish solve this issue by guaranteeing the same Message and 
MessageId are used for all the same events?

> Conversely, the phosphor-logging APIs leverage YAML-based error specifiers,
> which can be easily transposed into a Redfish message registry, and happen
> to also be the same structure we use for inter-process errors on d-bus calls.
> While I have to review the implementations to make sure they're
> appropriately created, I have far less concern about them disappearing
> or changing once they are in place (and I can review the changes to the YAML
> specifiers to keep tabs on what changes their might be).
> 
