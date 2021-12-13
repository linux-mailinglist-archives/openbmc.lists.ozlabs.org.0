Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BEF473531
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 20:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCX7H5n4Wz306R
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 06:46:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@linux.intel.com;
 receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCX725yhMz2ymt
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 06:45:49 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325086091"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="325086091"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 11:44:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="517898718"
Received: from phawryle-mobl1.ger.corp.intel.com (HELO [10.249.147.244])
 ([10.249.147.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 11:44:46 -0800
Message-ID: <a8fdf872-0dc7-7ede-8381-5740a87cd2a9@linux.intel.com>
Date: Mon, 13 Dec 2021 20:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Virtual Media repository request
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein>
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
In-Reply-To: <YbdwYODNRJPuRady@heinlein>
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

On 13.12.2021 17:10, Patrick Williams wrote:
> On Thu, Dec 09, 2021 at 09:56:55AM +0100, Czarnowski, Przemyslaw wrote:
>> On 08.12.2021 17:56, Patrick Williams wrote:
>>> On Tue, Dec 07, 2021 at 03:50:47PM +0000, Hawrylewicz Czarnowski, Przemyslaw wrote:
> 
>>> What did you have in mind for maintainer structure on this?  I'd ideally like to
>>> see someone outside of Intel be a co-maintainer with you since:
>>>
>>>     - This code was initially written as experimental Intel-only repository
>>>       without any community feedback and
>>>     - The current code hasn't been touched in 2 years and best practices have
>>>       likely changed.
>>   >    - You're not currently a maintainer on any other repositories.
>>
>> The code base exposed in provingground was under the development at that
>> moment and actually shouldn't be submitted. The code is updated now
>> (still needs some polishing I suppose) but I am ready to push updated
>> sources and ask the community to review it.
>>
>> Right now I am the main person for VM in Intel, but actually I was
>> thinking about some co-maintainership in case there are other parties
>> willing to have contribution in the code. This could be worked out
>> during review process.
> 
> This response feels like a bit of a chicken-and-egg.  Who is going to review and
> approve the commits to the repository that assign a maintainer to the
> repository?

I just posted a response to Ed, then noticed new email in the thread.

The code for service is already created and reviewed and used 
internally. The I wanted to expose the code base to wide audience and 
incorporate any valuable input from the community - from people already 
using the old code base (from both jsnbd and provingground) and others 
willing to have impact on the form of the service.

> 
> Maybe Ed's proposal of using an existing repository solves that.  We would need
> to make sure the current maintainer is accepting of whatever design direction
> you've decided to go though.

As I mentioned in the other email, new service is much more complex. We 
have used it for some time and got an expertise on the whole stack.

Also as authors we want to have a key role in the future of this part of 
the code.

But still, please use all above as my input to make the best decision 
for the project.

-- 
Best regards,
Przemyslaw Czarnowski
