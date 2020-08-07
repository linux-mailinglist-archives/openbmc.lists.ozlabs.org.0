Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0E23F29E
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 20:18:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNYWB1LShzDqng
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 04:17:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNYVC4VJ5zDqTL
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 04:17:06 +1000 (AEST)
IronPort-SDR: jvMOdvHJSmKWjbpSXhN27sr+dQjoV7U6EorO16NB63vv0A9j3O4rNGIBKCN46f+qAmqUW5DFFx
 mpjIhzzbyywg==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="132718944"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="132718944"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 11:17:04 -0700
IronPort-SDR: me4M0QqugYgoiaWcpUxeVc3upS79TodFJ+TRcN8yDkKEr6WfSM9/in+N/YJCelf3S/+n+FMl3e
 21yXVY2mZ7Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="333618856"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.36.209])
 ([10.209.36.209])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 11:17:04 -0700
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>, Alex Qiu <xqiu@google.com>
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
 <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
 <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <cf598e89-10ba-8cdd-f6c6-26f175e21e83@linux.intel.com>
Date: Fri, 7 Aug 2020 11:17:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 8/7/2020 11:04 AM, Jason Ling wrote:
> 
>     Yeah that's what I meant, a generic PSUSensor Type with a field called
>     'Export' or something that EM can use to get the Export type.
> 
> Sure, I think that handles the EM side of things.
> 
>     I'm conflicted on that.  Part of the reason that list is there, and
>     not in the config files directly, is to convey that those are the
>     types that have been tested to work correctly, and the types that the
>     config files "promise" to work sanely.  The other thing is, if you've
>     done the testing, adding to that list is (should be) relatively
>     trivial and straightforward.  Opening up that list to runtime parsing
>     opens a lot of security questions I'm not prepared to answer.
> 
> Sure, let's scrap runtime parsing and go for something far simpler.
> (1) have a base type, devices list that represents the approved device list.
> (2) have an empty extended type, device list that represents user 
> specified extensions.
> (3) factor these out into separate files and provide a method that 
> returns the union of the base and extended types/devices.
> 
> now we have a base type/device list that contains supported guaranteed 
> devices and another extended type/device list that is easier to maintain 
> patches for.
> I think that's a rather small change and accomplishes what I'd like 
> while preserving the intent of keeping a list of supported types/devices.
> What do you think?

What would happen if something wasn't in the approved devices list? 
Print a warning? Assert? I don't have any problems with this approach. 
It would be nice if this list could be (in the future) extended to all 
sensor types.
