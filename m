Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3B3604C33
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 17:52:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MswG53pTsz3cdy
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 02:51:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fKkJccu3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fKkJccu3;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MswFT1PHrz3bjg
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 02:51:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666194685; x=1697730685;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=QiU3AMbaB7WfNEGtzCgq7VjCpH+Jb3RvY8834wOcqEE=;
  b=fKkJccu3T3L2gtEIz6G+uXizjr7qLstADGr04XYjb+WTWljKokyTtfNA
   8pUDpJa1bkHt8D5SS5L9jJyfj/FtE2pyYOGVPzwaTKJ9Xrx/Qd7eQDtic
   Kve0YrTiBhRgzBIKrpAEvtfOmr0YezT2qDxWrIzE5KplWNtU8hF5NRz8l
   wFP1q4jlwMh9iF+la9T+RHpNpCHA8mfzMYXpoRD1q61xb6+VLM/RqQ9Vb
   Pg3T4I+rvzTsf16DsiU9sSxZGz76oSFnJxhRnNfS+dVUprkqMIwFyaTmk
   nCLCEyyMRN82im62VMfbR7eDqIAbhXSTDlIqAfbqKFmnYVcV4fk3cu2ih
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="305184845"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="305184845"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 08:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698136222"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="698136222"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2022 08:50:48 -0700
Received: from [10.212.45.137] (jmbills-mobl1.amr.corp.intel.com [10.212.45.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 5699358045A
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 08:50:48 -0700 (PDT)
Message-ID: <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
Date: Wed, 19 Oct 2022 09:50:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Adding support for custom SEL records
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
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



On 10/19/2022 8:43 AM, Brad Bishop wrote:
> Thanks for the reply Lei Yu.
> 
> On Wed, 2022-10-19 at 10:05 +0800, Lei Yu wrote:
>>
>> 2. The rsyslog way puts the SEL in a file and thus there are no DBus
>> objects, which makes it harder to work with other services.
> 
> Are there other services that work with IPMI sels?  I know there is a
> Redfish SEL log.  Anything else?

bmcweb has a build flag to choose between D-Bus- or journal-based logging.
> 
>> Indeed, but the rsyslog way is not really (and fully) upstream.
> 
> I'm trying to determine which implementation is a better fit for me
> based on the technical merits of the solution, not based on what
> repositories the source code is in.  If that ends up being the rsyslog
> approach, I'd consider helping to move the code and make it fully
> upstream.
> 
> In the hopes that it generates additional information about the
> motivations behind the differing implementations, allow me to ask a
> somewhat rhetorical question.  Jason, to avoid confusing OpenBMC users
> by having to select from two different SEL implementations with pros and
> cons of each that are not obvious, would you accept patches that remove
> the rsyslog based implementation from intel-ipmi-oem (provided the Intel
> metadata is also updated to use the alternative)?  If not, why not?

Intel had a requirement to support storing at least 4000 log entries. 
At the time, we were able to get about 400 entries on D-Bus before D-Bus 
performance became unusable.

That was before dbus-broker, so it could perhaps be better today.  But 
I'm guessing there is still a performance impact and arbitrary log limit 
placed on a system by storing the logs on D-Bus.

This log limit is what will make D-Bus log storage a non-starter for Intel.

I'd also be curious about the reverse question.  Is there any benefit to 
storing logs on D-Bus that makes it a better solution?

At the risk of complicating things more (https://xkcd.com/927/), D-Bus 
was the primary solution when Intel joined.  We created the rsyslog 
approach because of the limitation imposed by D-Bus.  But I know there 
are still those who don't like the rsyslog approach.  Is there a way we 
can now get together and define a new logging solution that is fully 
upstream and avoids the drawbacks of both existing solutions?

> 
> Thanks,
> brad
