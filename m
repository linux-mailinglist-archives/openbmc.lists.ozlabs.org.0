Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD478285137
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 19:53:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5Q6d618hzDqDh
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 04:52:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5Q5t1GpTzDqDb
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 04:52:17 +1100 (AEDT)
IronPort-SDR: NQEQ0pAUsHKnCO0da5A77hP22yBINfMu//2xUh++GxjMlTDySAGJtRdxOC4rPSgNy2Dh0SXUix
 VUtNXTtGzMfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="152371561"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="152371561"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 10:52:08 -0700
IronPort-SDR: XbwmFRn+9781+ya6Ph2r/jNrSusBX7YT1hK6MJlXQnbCgveNecAJIfTFcv4tLeAyzUGYFqUgzm
 iQzVzOUJMkXA==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="315763518"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.255.228.213])
 ([10.255.228.213])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 10:52:06 -0700
Subject: Re: PECI patchset status
To: Joel Stanley <joel@jms.id.au>, "Mihm, James" <james.mihm@intel.com>
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
 <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
 <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
 <20200903171556.GA32795@mauery.jf.intel.com> <20200904163430.GA3532@heinlein>
 <DM5PR11MB188420C2AF67DA8C09C4689F90240@DM5PR11MB1884.namprd11.prod.outlook.com>
 <CACPK8XeXm4_JP-pt9OzcHQwA2sqpHMVnW1kpNUQRh+ULRmG-Cw@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <251ba84a-a2ce-4000-e7bd-90685b9d3854@linux.intel.com>
Date: Tue, 6 Oct 2020 10:51:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XeXm4_JP-pt9OzcHQwA2sqpHMVnW1kpNUQRh+ULRmG-Cw@mail.gmail.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 9/28/2020 10:49 PM, Joel Stanley wrote:
> On Fri, 11 Sep 2020 at 01:20, Mihm, James <james.mihm@intel.com> wrote:
> 
>> Would it be acceptable for all of the 84+ Intel patches to reside in the openbmc repo while we work through the upstreaming process?
>> Some of the patches require design changes and will take much longer to upstream.
> 
> This is the intent of the openbmc tree. THe patches need to be posted,
> in reviewable series, to be included.
> 
> As discussed in this thread regarding the PECI patches, they have been
> around for a long time without submission. They will need to be posted
> upstream again before I put them in the OpenBMC tree.
> 
> Early September, when this thread was started, was a great time to
> make the PECI submission in terms of the upstream kernel development
> cycle. The next best time is now.

Thank you for carrying the out-of-tree PECI patch set so far. I really
appreciate it.

I agree with you that the PECI upstreaming should make a progress now
but I'm still in unbalanced task priorities. I'll try to make it done as
soon as possible but it's not available right now.

As James already said, we'll use a forked tree if PECI patches are
dropped off from OpenBMC linux tree v5.9, and it'll not be a permanent
fork but just for a temporary and alternative way to minimize impact of
dropping off the PECI patch set. Thanks for your understanding in
advance.

Best,

Jae
