Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0847870F
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 10:29:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFkGW2ZFhz3cN1
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 20:29:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@linux.intel.com;
 receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFkGF6N3qz2xtM
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 20:29:40 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="263891869"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="263891869"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 01:28:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="466442730"
Received: from phawryle-mobl1.ger.corp.intel.com (HELO [10.249.135.222])
 ([10.249.135.222])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 01:28:30 -0800
Message-ID: <d9ea11af-4b30-3424-5b1b-e0a51dde28f4@linux.intel.com>
Date: Fri, 17 Dec 2021 10:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Virtual Media repository request
Content-Language: en-US
To: Ed Tanous <ed@tanous.net>, Jeremy Kerr <jk@codeconstruct.com.au>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein>
 <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
 <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
In-Reply-To: <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 15.12.2021 20:26, Ed Tanous wrote:
> On Mon, Dec 13, 2021 at 6:11 PM Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>>
>> Hi all,
>>
>>> Maybe Ed's proposal of using an existing repository solves that.  We
>>> would need to make sure the current maintainer is accepting of
>>> whatever design direction you've decided to go though.
>>
>> I'm fine with replacing the jsnbd code with a newer implementation,
>> provided there's general community acceptance for doing so. If that's
>> the case, I'm happy to use the existing repo, or replacing openbmc/jsnbd
>> entirely - whatever suits best.
>>
>> [Perhaps in your design document, you can expand the Alternatives
>> Considered section, to provide some motivation to change over]
>>
>> However, I'm *not* OK with just introducing a completely alternate VM
>> implementation and leaving jsnbd as-is, where some platforms use one,
>> and some the other. We have way too many instances where there are two
>> separate implementations and/or repos that deliver the same
>> functionality. I would like to avoid making that problem worse.
> 
> +1

I am ok with that approach, but I just wanted to separate service code 
and JS nbd server, as they are quite distinct entities from my perspective.
So yes for taking over VM functionality by the new service in separate 
repo, leaving only nbd server implementation on this repo.
What do you think?

> 
>>
>> So, either:
>>
>>   - submit these as updates to jsnbd, which implement the new structure as
>>     you like. I'd be happy to hand over the repo to the new maintainers.
>>
>>   or
>>
>>   - provide the new VM implementation as a new repo, propose to change
>>     platforms to use the new implementation, and we can delete jsnbd.
>>
>> Cheers,
>>
>>
>> Jeremy


-- 
Best regards,
Przemyslaw Czarnowski
