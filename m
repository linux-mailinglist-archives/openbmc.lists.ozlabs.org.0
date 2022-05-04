Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBD51996B
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 10:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtV4z37t5z3bc9
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 18:15:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xa6qyXmf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@linux.intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Xa6qyXmf; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtV4Z0VB1z2xBF
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 18:15:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651652110; x=1683188110;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ja4VbyFFzeHofOIg2yfYSSl4j5w0oz0Nneh4SIZecEY=;
 b=Xa6qyXmfNVBj9fyPH5ERFc5Sn+Yda8vHsXxOISsm8BaK6dEeScovJ520
 QH9rxOsefwXIj4Pw5z184tWKgVO1r5I5YB8a41ZNpwp/DDjnZKYtiJ9Sb
 IolDHqHXukrfUsgW7avl+Qiq+bH/QRo0QXZe4gUssrtIUMHyvCLHQPG7k
 XpGx55f9fZQpWmaGm+KqtKxyiMlhHYFo4sFGzjOEvYXwO7ROiWbADEM56
 RLH1sxHtvHgNRNWj09ii1tFMC2QQurcYmXzhkKwyMZ0AhADb0keNmUBVj
 yjf7bQtwjdGnZpI0ac02JN15rD7W/q5k28q/OdcP8+x9WaCjOwsoTzwy9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354134777"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="354134777"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:14:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="516925689"
Received: from dkowalsk-mobl1.ger.corp.intel.com (HELO [10.249.134.116])
 ([10.249.134.116])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:14:06 -0700
Message-ID: <bb54ab97-428c-f689-d6b1-abee147fa263@linux.intel.com>
Date: Wed, 4 May 2022 10:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Virtual Media upstream status.
Content-Language: en-US
To: Ed Tanous <edtanous@google.com>, "Hawrylewicz Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>
References: <DM4PR11MB5247C11F5DAB40B354BE4088B9FC9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <CAH2-KxAusoe1=puTtT-cz4gtFpPeRd7u6VG+4e5eqd-rnabq4Q@mail.gmail.com>
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
In-Reply-To: <CAH2-KxAusoe1=puTtT-cz4gtFpPeRd7u6VG+4e5eqd-rnabq4Q@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 30.04.2022 00:52, Ed Tanous wrote:
> On Fri, Apr 29, 2022 at 1:42 PM Hawrylewicz Czarnowski, Przemyslaw
> <przemyslaw.hawrylewicz.czarnowski@intel.com> wrote:
>>
>> Hi.
>>
>> In response to Ed's request, I started this topic to discuss upstreaming activities (to both existing and new code). And to make update seamless and effective.
>>
>> As service upstream is little stalled waiting for UT to be completed (almost completed), I wanted to attack the problem from another surface. I've pushed bmcweb patches as it got old since first submission.
>>
>> There are two blocking problems I am aware of in current nbd_proxy code. First is that compilation fails. The second is a race appearing sometimes during disconnection. But those are the simple ones.
>>
>> There is more to rework for redfish part. There are two patches
>> * Make status of InsertMedia action consistent (I29d53483) https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/53343/1
>> * Apply async dbus API (I1d016126) https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/53345/1
>>
>> First one addresses simple problem with inconsistent responses from rest api calls connected with actions. Proxy mode does not support InsertMedia action, but is implemented for legacy so response has to be applied accordingly. It has been fixed with some code generalization.
>>
>> The second one applies latest design changes (https://github.com/openbmc/docs/blob/master/designs/virtual-media.md, dbus communication part).
>>
>> Those are must-have changes to work with the service state we upstream at the moment.
>>
>> After service upstream is completed changes removing nbd_proxy option in meson has to be reverted as the last part.
>>
>> No more activities are planned now from out side, but later on we may focus on adding privileges support for websockets (AFAIK it is not supported on level of web server yet).
> 
> Great to hear from you!  You mention a lot about the bmcweb-side
> changes, which are a pretty minor part (I just merged 2 of the 4
> patches), and I'm happy to review them.  The part that interests me is
> the backend daemon upstreaming to make this feature useful and
> testable outside of the Intel tree;  When would you expect that to
> occur?  Will it be an incremental update to jsnb?
Still working internally on UT's requested, unfortunately VM is not top 
priority feature here. But trying best to put the work forward.

> 
> In terms of bmcweb, there's currently two implementations, the jsnb
> targeted one, and the one you're working on above.  Is there any
> reason to keep the jsnb one once this new daemon has been updated?
New deamon will replace old one, this has been settled in other email 
thread.

> 
> The design doc referenced above is about 3 years old at this point,
> are there any design updates that need to happen, or is it still
> relatively accurate?
Service being upstreamed, besides some bug fixes, is quite stable at the 
moment. Quite recently async dbus interface has been added. No more 
suggestions from our side.

> 
> I'm glad to have someone working on it.  If you need quicker response
> times to short-run things, most of the maintainers and myself are on
> Discord, and would be happy to help you work through the specifics of
> the patches needed to get this in.
I am aware of discord byt lurking mostly so far, trying to catch and 
answer VM questions. Thanks for letting me know.

> 
> 
>>
>> --
>> Best regards,
>> Przemyslaw Czarnowski


-- 
Best regards,
Przemyslaw Czarnowski
