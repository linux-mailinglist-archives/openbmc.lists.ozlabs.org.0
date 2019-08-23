Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B41589B4E4
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 18:49:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FS6q0Sv0zDsS0
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 02:49:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FS651fcQzDsMm
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 02:48:59 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 09:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354669284"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 09:48:56 -0700
Subject: Re: Build break in the latest openbmc tree.
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, akuster808@gmail.com
References: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
 <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
 <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c9c8e027-f907-63c6-bdfe-8c7cecfcd1bb@linux.intel.com>
Date: Fri, 23 Aug 2019 09:48:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
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
Cc: yocto@yoctoproject.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/22/2019 6:09 PM, Brad Bishop wrote:
> at 6:38 PM, James Feist <james.feist@linux.intel.com> wrote:
> 
>> On 8/22/19 3:35 PM, Jae Hyun Yoo wrote:
>>> Hi brad,
>>
>> + The mailing list
>>
>>> We met a build break while making Intel platform builds.
>>> ERROR: No recipes available for:
>>> /home/yoojae/workspace/openbmc/meta-security/recipes-kernel/linux/linux-stable_5.2.bbappend 
>>> It was added by the subtree update patch but there is no main recipe 
>>> for it. Did we miss something?
>>> Thanks,
>>> Jae
> 
> Hi Jae
> 
> linux-stable is in meta-odroid:
> https://lists.yoctoproject.org/pipermail/yocto/2019-August/046424.html
> 
> It isn’t clear to me if meta-security is supposed to have a hard 
> dependency on meta-odroid or not.

Hi Brad,

I checked that 'meta-odroid' isn't in OpenBMC tree. Should we add it
into our openembedded layer?

Thanks,
Jae

> Hi Armin
> 
> Could you suggest what the right thing to do here might be?
> 
> thx!
> brad
> 
