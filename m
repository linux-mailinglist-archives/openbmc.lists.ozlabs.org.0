Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B346E4B8
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 09:58:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8nxn0wMZz3bht
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 19:58:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8nxX1PFGz2ywg
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 19:58:06 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="218737686"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="218737686"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 00:57:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503413134"
Received: from phawryle-mobl1.ger.corp.intel.com (HELO [10.249.131.143])
 ([10.249.131.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 00:57:03 -0800
Message-ID: <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
Date: Thu, 9 Dec 2021 09:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Virtual Media repository request
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
In-Reply-To: <YbDjsxZYYtnNPsCK@heinlein>
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

On 08.12.2021 17:56, Patrick Williams wrote:
> On Tue, Dec 07, 2021 at 03:50:47PM +0000, Hawrylewicz Czarnowski, Przemyslaw wrote:
> 
> Hello Przemyslaw,
> 
> Thank you for wanting to work at getting this code mainlined.  I know there has
> been quite a bit of interest from various people outside Intel.
> 
>> I would like to request for new Virtual Media service repository (based on the design document located here: https://github.com/openbmc/docs/blob/master/designs/virtual-media.md).
> 
> I know you've got a pending commit to update some pieces of this design.  Since
> none of the code has been submitted since the design was originally written, do
> we need anyone to re-read it and see if anything has changed in the rest of the
> codebase that needs design updates?

The code base for VM is "live" at the moment and besides 
asynchronousness nothing needs to be updated at the moment.

There is a limitation for DVD iso's which lies in USB gadget and how it 
is implemented, so maybe there could be some kind of note about that.

> 
>> The service itself is a reworked Virtual Media which early stage is available here: https://github.com/Intel-BMC/provingground.
>>
> 
> What did you have in mind for maintainer structure on this?  I'd ideally like to
> see someone outside of Intel be a co-maintainer with you since:
> 
>    - This code was initially written as experimental Intel-only repository
>      without any community feedback and
>    - The current code hasn't been touched in 2 years and best practices have
>      likely changed.
 >    - You're not currently a maintainer on any other repositories.

The code base exposed in provingground was under the development at that 
moment and actually shouldn't be submitted. The code is updated now 
(still needs some polishing I suppose) but I am ready to push updated 
sources and ask the community to review it.

Right now I am the main person for VM in Intel, but actually I was 
thinking about some co-maintainership in case there are other parties 
willing to have contribution in the code. This could be worked out 
during review process.

> 
>> And additional question: is there anything to do in order to enable CI for this repo?
> 
> Once the repository is set up, Andrew G can enable CI on it fairly quickly.
> 

Glad to hear that.


-- 
Best regards,
Przemyslaw Czarnowski
