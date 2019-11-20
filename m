Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B669510368D
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 10:23:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hy0v0wdyzDqwv
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 20:23:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hy0C2DD9zDqsw
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 20:22:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 01:22:45 -0800
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="200654427"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.102.85.150])
 ([10.102.85.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 20 Nov 2019 01:22:44 -0800
Subject: Re: openbmc project for telemetry
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
 <A727F88F-D32D-4CAD-8E92-2C99B39E4CEE@fuzziesquirrel.com>
 <ce5c1774-ff0f-602c-a165-43cbca90f818@linux.intel.com>
 <ee14af8a-5e0a-04b1-4978-09d34f6f9628@linux.intel.com>
 <FC0713B7-19EB-49E0-958F-3290DA5A10DD@fuzziesquirrel.com>
 <8bda426c-5dfa-b9c6-f4b0-769288ff675c@linux.intel.com>
 <8A128ED3-1DFD-43F2-B249-79BFB97E4672@fuzziesquirrel.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <0cf486fd-39c7-70f5-8c4a-76341c201322@linux.intel.com>
Date: Wed, 20 Nov 2019 10:22:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <8A128ED3-1DFD-43F2-B249-79BFB97E4672@fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak,
 Piotr" <piotr.matuszczak@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



W dniu 11/14/2019 o 14:57, Brad Bishop pisze:
> 
> 
>> On Nov 14, 2019, at 5:55 AM, Adrian Ambrożewicz <adrian.ambrozewicz@linux.intel.com> wrote:
>>
>> So now it's time for silly questions...
>>
>> What should be my first steps as maintainer?
> 
> I would add MAINTAINERS, LICENSE and README files.  Add a clang-format file to avoid quibbling over style.  Select a build system.  Many OpenBMC projects are moving to meson.  Ask Andrew to enable the repository CI job on the telemetry repo.  Start submitting patches for review.
> 
> And if you are willing, document the process as you go though it and add that to the maintainer workflow document for the next person :-)
> 
>> I've found guide here https://github.com/openbmc/docs/blob/master/maintainer-workflow.md but its general.
>> I'm more interested in technical side of things.
>> - Is Linux MAINTAINERS format utilized for automation or information about code maintainers should be just included in README file in repo? MAINTAINERS file is referenced in https://github.com/openbmc/docs/blob/master/maintainer-workflow.md but I don't see that in every repo..
> 
> Most OpenBMC projects are using this format:
> 
> https://github.com/openbmc/hiomapd/blob/master/MAINTAINERS
> 
> I’m not aware of any automation that has been built around that file format though.  FWIW I intend to implement the owners plugin on our gerrit installation in the near future:
> 
> https://gerrit.googlesource.com/plugins/owners/
> 
> so you could make use of that if you wanted.
> 
>> - Should maintainer have additional access for repo/gerrit config?
> 
> You have owner acesss (full access) on the project.  You can delegate or give that to others here: https://gerrit.openbmc-project.xyz/admin/groups/45,members
> 
> -brad
> 

Thanks a lot for clear explanation. Work on that will commence as soon 
as Telemetry Service implementation will start.

Regards,
Adrian
