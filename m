Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 979B915B364
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:08:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hv156MZbzDqPl
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:08:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Htz52LYCzDqS2
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 09:06:56 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 14:06:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,434,1574150400"; d="scan'208";a="281352408"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2020 14:06:52 -0800
Subject: Re: Functionality vs Security
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <4F01EAF1-E621-4908-8080-C2BE62287E0C@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <3cee9f0f-9b6a-78da-479e-dd038daafb0d@linux.intel.com>
Date: Wed, 12 Feb 2020 14:06:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <4F01EAF1-E621-4908-8080-C2BE62287E0C@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, "Mihm, James" <james.mihm@intel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/12/20 2:01 PM, Brad Bishop wrote:
> Hi James
> 
>> On Feb 12, 2020, at 4:16 PM, James Feist <james.feist@linux.intel.com> wrote:
>>
>> In IRC yesterday I proposed the question of whether to change the default of bmcweb to disable REST D-Bus, or to change it in our meta-layers only. I created the patch here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 and I am looking for feedback. While REST D-Bus does expose many useful APIs, and phosphor-webui depends heavily on it, it does leak information to any logged in user. This comes to the question, should we prefer functionality by default or security by default? It is a compile switch either way, so each user can still decide which they prefer.
> 
> There is no user that prefers something that doesn’t work or is incomplete, no matter how secure it is.  If you can find one, I’m happy to be proven wrong.

To my knowledge the only thing that breaks is the Web-UI, if you don't 
find the Web-UI useful, then I don't think it matters much.

> 
> In my mind, the only user that wants this is Intel, because Intel has a bunch of patches to the webui that would make the broken upstream work.  The path forward here is simple (in concept) - upstream your webui patches, and the need for this to even be a discussion point goes away.  Has Intel had issues getting the webui patches upstreamed?

We had someone working on the Web-UI, but they had problems getting 
things merged due to differences in design opinions. Unfortunately that 
person has moved on, so the up-streaming effort has been halted for now.

> 
>> I have the opinion that the default should be the safest configuration
> 
> I completely agree!  This disconnect is what should we entertain calling a configuration.  I say that configurations that break existing (working) usage patterns of the upstream project code are not on the table.

It doesn't break it, it's just a default that you can switch back with a 
single build flag. This is only changing a default.

> 
> thx - brad
> 
