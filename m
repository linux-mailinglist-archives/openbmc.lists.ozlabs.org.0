Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C72160B8
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 22:58:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0ybf141wzDqdW
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 06:58:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0yZp1ZGzzDqYV
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jul 2020 06:58:09 +1000 (AEST)
IronPort-SDR: r7X7M3XSUiSRY/Cp3MkoMmmX+8lvq/peNFFebX44/gh3foE9HNPxzu969RwzcBlHLyZsTPPm1X
 LemISppJFQOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="146577665"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="146577665"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 13:58:04 -0700
IronPort-SDR: 78Eu3yf7jD52KY0n0mg5vQTc/pNNI0Zpzbnape+LcJOB2ErkyrpRmSUk9TW9Lb4Zr7wj6PY2RM
 cMq+/OrKC1Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="315292462"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2020 13:58:04 -0700
Received: from [10.251.158.177] (jmbills-mobl.amr.corp.intel.com
 [10.251.158.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 192655805A3
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jul 2020 13:58:04 -0700 (PDT)
Subject: Re: Weird build dependency issue causing missing symbols
To: openbmc@lists.ozlabs.org
References: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
 <20200702213328.GD3922@heinlein>
 <ac51ef67-40de-933e-a5a9-50d7506e073f@linux.intel.com>
 <DM6PR11MB441039521253333CFA3BEF22946A0@DM6PR11MB4410.namprd11.prod.outlook.com>
 <20200703052014.GF3922@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <029604d7-7b79-4eaa-561c-b5334d05f994@linux.intel.com>
Date: Mon, 6 Jul 2020 13:58:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200703052014.GF3922@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 7/2/2020 10:20 PM, Patrick Williams wrote:
> On Fri, Jul 03, 2020 at 12:18:34AM +0000, Ren, Zhikui wrote:
>> Maybe the problem is that this header server.hpp is generated not  a source.
>> Artifact created from the same source *should* be the same (except timestamp)
>> If the source did not update, just a forced rebuild to create new binaries,  I can see Yocto choose not to rebuild things depend on the package.
>> In the case of boost, since it is devtool modified and the header is a source and not build artifact, it make sense to trigger all the rebuild.
>>
>>
>> -----Original Message-----
>> From: openbmc <openbmc-bounces+zhikui.ren=intel.com@lists.ozlabs.org> On Behalf Of Bills, Jason M
>> Sent: Thursday, July 2, 2020 5:00 PM
>> To: openbmc@lists.ozlabs.org
>> Subject: Re: Weird build dependency issue causing missing symbols
>>
>>
>>
>> On 7/2/2020 2:33 PM, Patrick Williams wrote:
>>> On Thu, Jul 02, 2020 at 12:58:43PM -0700, Bills, Jason M wrote:
>>>> We have narrowed this down to being caused by two separate issues:
>>>> 1. When phosphor-dbus-interfaces is rebuilt it will sometimes change
>>>> the order of the PropertiesVariant in server.hpp.
>>>
>>> This sounds like a bug in sdbus++.  We should be sorting the variant
>>> parameters or issuing them in array order.  I'll look into it.
>>>
>>>> 2. When the order of PropertiesVariant changes on a rebuild, the
>>>> recipes that already have an old copy of server.hpp are not triggered
>>>> to rebuild and are left with the old copy of server.hpp.
>>>
>>> This isn't surprising if what is triggering the rebuild is not a Yocto
>>> variable change (or git revision).  Yocto doesn't cache the contents
>>> of the packages, but caches the variables that went into a build step.
>>> A hash of the variables are used to look up the potential 'sstate-cache'
>>> files so that it can skip build steps.
>>>
>>> If you think a variable or a git-revision should have changed with
>>> what you were doing, then maybe it is something else.
>>>
>> It seems like a header file change should trigger a rebuild, though?  If I manually edited something like a library header file, I'd expect everything that includes that library to be rebuilt with the new header change.
>>
>> I tried to devtool modify boost to check the behavior, but that causes boost to rebuild every time and correctly triggers the dependent builds.
>>    Maybe the case above of modifying a header file is invalid?
> 
> It doesn't matter what the content is: header, library, executable, data
> file.  Yocto does not use contents in the decision of "does this need to
> be rebuilt".  It only uses variables from recipes.  If the variables do
> not change, the package is not rebuilt (unless explicitly tainted).
> 
> See https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#dev-invalidating-shared-state-to-force-a-task-to-run for example.
> 
Thanks, Patrick! I think I get it.  I was stuck on the behavior that I 
see when I'm working with repo using 'devtool modify'.  I guess 'devtool 
modify' must have some additional magic to force rebuilds on file 
changes that doesn't apply to a standard build?
