Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AA15B646
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 02:00:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hyq50mZkzDqSk
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 12:00:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hyfk3gVDzDqTK
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 11:53:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 16:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,434,1574150400"; d="scan'208";a="281384659"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2020 16:52:57 -0800
Subject: Re: Functionality vs Security
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <6F13EC73-E3F0-43D5-8E3F-1A8585918C2A@fuzziesquirrel.com>
 <99262b0e-fca2-71c9-ff1f-3526ed26efd0@linux.intel.com>
 <895D5B68-8442-4E76-9143-782572C85A25@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <00463030-bc3e-f00c-15f2-b7a5bf519f2f@linux.intel.com>
Date: Wed, 12 Feb 2020 16:52:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <895D5B68-8442-4E76-9143-782572C85A25@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, "Mihm, James" <james.mihm@intel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/12/20 4:50 PM, Brad Bishop wrote:
> 
> 
>> On Feb 12, 2020, at 7:11 PM, James Feist <james.feist@linux.intel.com> wrote:
>>
>> On 2/12/20 4:05 PM, Brad Bishop wrote:
>>>> On Feb 12, 2020, at 4:16 PM, James Feist <james.feist@linux.intel.com> wrote:
>>>>
>>>> In IRC yesterday I proposed the question of whether to change the default of bmcweb to disable REST D-Bus, or to change it in our meta-layers only. I created the patch here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 and I am looking for feedback. While REST D-Bus does expose many useful APIs, and phosphor-webui depends heavily on it, it does leak information to any logged in user. This comes to the question, should we prefer functionality by default or security by default? It is a compile switch either way, so each user can still decide which they prefer. I have the opinion that the default should be the safest configuration, and if someone wants to change that, then they can accept the risk and change the build flag.
>>>>
>>>> Thoughts?
>>>>
>>>> Thanks,
>>>>
>>>> James
>>> One idea I have is adding a new distro configuration.  Today we have openbmc-phosphor - we could add a DISTRO=openbmc-secure-at-all-costs to meta-phosphor, and the legacy API could be disabled by default there, and remain enabled by default in openbmc-phosphor.
>>
>> I would rather see OpenBMC by default secure.
> 
> I would as well.  This is why I would like to see the webui patches upstreamed.
> 
>> I don't want to see CVEs caused by an insecure default configuration in anybody's platform.
> 
> Is anyone planning on opening a CVE?

I'm not aware of any.

> 
> -brad
> 
