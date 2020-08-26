Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBB2538AF
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 22:00:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcGtT23KvzDqSg
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 06:00:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcGsc1PJJzDqSh
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 05:59:30 +1000 (AEST)
IronPort-SDR: M8vmkdOpJeRojHP7ydyuiTnUp3oeCL1mxQqWO12SLzyOdrwa6DGQuv7Q5g7TrszaMtt5cOwv13
 jTO+L1Y47wWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174426744"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174426744"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 12:59:12 -0700
IronPort-SDR: pUHo5WMGumxSIn0IO9dU4ahAWguezyP4DSdcIH0cLxhuVXrVM8Slu89Cag9k1yvQfnZiNIU0Q3
 t5zLCboOGppw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="280406459"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 26 Aug 2020 12:59:12 -0700
Received: from [10.209.172.130] (jmbills-mobl.amr.corp.intel.com
 [10.209.172.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 891355805ED
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 12:58:52 -0700 (PDT)
Subject: Re: Seek feedback: BMC console and debug info
To: openbmc@lists.ozlabs.org
References: <CAMXw96MQ-=Ftc5HjNThKd8A6X0hdBdjC43d6RJfzyDoN+b=7YQ@mail.gmail.com>
 <CACWQX82jRpfpeqc9a3kFA+08-CgyOjc8+jYU2Xh307hq-0_DHQ@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <419f732a-8d73-0450-fca6-b89d82fcd96c@linux.intel.com>
Date: Wed, 26 Aug 2020 12:58:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACWQX82jRpfpeqc9a3kFA+08-CgyOjc8+jYU2Xh307hq-0_DHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 8/25/2020 8:35 PM, Ed Tanous wrote:
> Yes, this would be useful to others.  A number of commercial stacks
> (including some I helped write) have this feature, and I had hoped
> someone would tackle it at some point in the future.
> 
> My only comment is I'd rather that we don't duplicate the endpoints in
> Redfish, and have both a Console and a ConsoleDownload collection.  If
> we need a mechanism to download the full log files, I'd recommend that
> the Console endpoint obey an Accept header of "text/plain;
> charset=utf-8" and an Accept-Encoding header of "gzip".  That way,
> we're still meeting the intent of the HTTP and Redfish specs, even if
> we're providing more data download options than they require.
I still need to go dig into it, but I think the new Redfish schemas that 
were added to support the Dump service, added an "AdditionalDataURI" 
property that can provide a URI to download a larger set of additional 
dump data.  It may be what you need for the log file download.

> 
> Other than that, yeah, sounds great, lets see the patchset.
> 
> -Ed
> 
> On Tue, Aug 25, 2020 at 8:24 PM Zhenfei Tai <ztai@google.com> wrote:
>>
>> Hi,
>>
>> We have worked with our vendor on a system that provides console and debug information, which can be useful in times of debugging BMC issues.
>>
>> On a high level, we use obmc-console and phosphor-debug-collector to collect data.
>>
>> obmc-console: We collect console inputs from the host and save to local log files (max 8 files of 1 MB size with rotation.)
>> phosphor-debug-collector: We run this process on the BMC with no modification.
>>
>> For the interface, the data is exposed via bmcweb where there are a pair of URIs for console inputs and debug collector respectively.
>> e.g.
>>
>> /redfish/v1/Systems/system/LogServices/Console -- Enable/disable console inputs data collection.
>> /redfish/v1/Systems/system/LogServices/ConsoleDownload -- Download the log files in a zipped file.
>>
>> It will be great if we can get some feedback on whether the community finds such a system useful and advice to improve the design.
>>
>> Thanks,
>> Zhenfei
