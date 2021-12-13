Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBDC4734CD
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 20:19:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCWX449f3z306D
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 06:19:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@linux.intel.com;
 receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCWWl4lmhz2xX8
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 06:18:42 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219492069"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="219492069"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 11:17:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="517889853"
Received: from phawryle-mobl1.ger.corp.intel.com (HELO [10.249.147.244])
 ([10.249.147.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 11:17:34 -0800
Message-ID: <71f145ed-47bb-44b0-eb9f-35a56bc353b9@linux.intel.com>
Date: Mon, 13 Dec 2021 20:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Virtual Media repository request
Content-Language: en-US
To: Ed Tanous <ed@tanous.net>, "Hawrylewicz Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <CACWQX81Q0w=oK_Sv9OHKrMo5pj2-HaPEW8Dh1MEuRDjNSQKKaA@mail.gmail.com>
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
In-Reply-To: <CACWQX81Q0w=oK_Sv9OHKrMo5pj2-HaPEW8Dh1MEuRDjNSQKKaA@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11.12.2021 22:13, Ed Tanous wrote:
> On Tue, Dec 7, 2021 at 7:52 AM Hawrylewicz Czarnowski, Przemyslaw
> <przemyslaw.hawrylewicz.czarnowski@intel.com> wrote:
>>
>> Hi.
>>
>> I would like to request for new Virtual Media service repository (based on the design document located here: https://github.com/openbmc/docs/blob/master/designs/virtual-media.md).
> 
> Considering that the virtual media already uses pieces of
> functionality from the old virtual media, why wouldn't this just go in
> https://github.com/openbmc/jsnbd
> 
> Ideally we shouldn't need two different virtual media implementations,
> and my understanding is that the "new" one is a complete replacement
> for jsnbd, while still using the javascript portions of it;  Moving
> the implementation there will simplify when people look for virtual
> media, and will promote the reuse of code, so I think that's what we
> should do.

I think it depends. From my perspective, mixing javascript and service
code is not a good thing. They come from different origins and does
quite different job (even if they are connected together)

Moreover virtual media service if far more than the current
implementation. Old functionality is just at least 1/4 of the
possibilities of new service.

This is, of course, my personal insight. There are more competent people
with wider background in OpenBMC to make the final decision.

Przemek


> 
>>
>> The service itself is a reworked Virtual Media which early stage is available here: https://github.com/Intel-BMC/provingground.
>>
>> And additional question: is there anything to do in order to enable CI for this repo?
> 
> I believe CI is already enabled for jsnbd, so I think we're already
> good to go there.
> 
>>
>> --
>> Best regards,
>> Przemyslaw Czarnowski
>>


-- 
Best regards,
Przemyslaw Czarnowski
