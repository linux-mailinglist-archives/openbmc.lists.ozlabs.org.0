Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB0347AA02
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 13:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHfmr6JRZz2yLd
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 23:59:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@linux.intel.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Mon, 20 Dec 2021 23:59:07 AEDT
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHfmW26zHz2xvv
 for <openbmc@lists.ozlabs.org>; Mon, 20 Dec 2021 23:59:07 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="240379766"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="240379766"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 04:55:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="467379077"
Received: from phawryle-mobl1.ger.corp.intel.com (HELO [10.249.149.48])
 ([10.249.149.48])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 04:55:57 -0800
Message-ID: <592e3b4d-2125-22b7-2413-0aa0857c9fe8@linux.intel.com>
Date: Mon, 20 Dec 2021 13:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Virtual Media repository request
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein>
 <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
 <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
 <d9ea11af-4b30-3424-5b1b-e0a51dde28f4@linux.intel.com>
 <8857fb3c25b2e3918dcda00f04710b3e9f84f1d9.camel@codeconstruct.com.au>
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
In-Reply-To: <8857fb3c25b2e3918dcda00f04710b3e9f84f1d9.camel@codeconstruct.com.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17.12.2021 10:45, Jeremy Kerr wrote:
> Hi Przemyslaw,
> 
>> I am ok with that approach, but I just wanted to separate service code
>> and JS nbd server, as they are quite distinct entities from my
>> perspective.
> 
> The actual nbd server code is tiny; only around 260 lines of javascript.
> I don't think it's worth keeping a whole repo for that, given we would
> not be using the jsnbd/nbd-proxy code.
> 
> So, I'd suggest just including this with the new VM implementation, or
> moving it alongside the rest of the web ui.

Ok, got it.

I plan to start pushing changes here this week.

There is just a one thing to be determined.
Currently, the "proxy" mode handler for websocket in bmcweb is defined 
as /vm/0/0 (see include/vm_websocket.hpp:161).
New service handler (to be found in include/nbd_proxy.hpp) requires 
websocket defined as /nbd/<str> as more slots can be available.
This breaks the old API.
I believe there should be a kind of migration period for applications 
that use old location and format before the old one is turned off.
For /nbd location there is already implemented UI module to handle that 
(but needs to be enabled).

Who is aware of such applications?


> 
> Cheers,
> 
> 
> Jeremy
> 


-- 
Best regards,
Przemyslaw Czarnowski
