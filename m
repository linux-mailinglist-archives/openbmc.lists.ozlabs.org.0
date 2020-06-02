Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 155781EB735
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 10:19:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49blLz6HQQzDqTk
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 18:19:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49blLF3xdBzDqT6
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 18:18:44 +1000 (AEST)
IronPort-SDR: 6pHP30Lsn+xzb93mEU3lDS3kehyPPI9P9RmBL+bO0yyF3r7k6+lIT6vwbBedtUfuMhC/G8aDs8
 MfqzwCS/Y0Ag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 01:18:40 -0700
IronPort-SDR: X88hMQ+Uq8f1kOF1hL76kN7vQHoMGcMjvsk63ZWesACZntHhYT2op0X/gBoXF3WUgBL2DILefM
 3gyowBVCiYkg==
X-IronPort-AV: E=Sophos;i="5.73,463,1583222400"; d="scan'208";a="444606508"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.213.15.12])
 ([10.213.15.12])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 01:18:39 -0700
Subject: Re: Upstream Yocto Bringing in GCC 10
To: Patrick Williams <patrick@stwcx.xyz>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
 <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
 <20200526155756.GC3445@heinlein>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <78ffc9e9-816a-c420-2d51-8a635342e3c4@linux.intel.com>
Date: Tue, 2 Jun 2020 10:18:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526155756.GC3445@heinlein>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



W dniu 5/26/2020 o 17:57, Patrick Williams pisze:
> On Mon, May 25, 2020 at 02:35:32PM +0200, Adrian Ambrożewicz wrote:
>>> On May 17, 2020, at 7:08 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>> Alright!  The great thing about GCC 10.x is that it brings in support
>>> for most of C++20, including co-routines.  Looking forward to playing
>>> around with it.
>> Is it allowed in OpenBMC to base the functionality on experimental
>> implementations?
> 
> No disagreement with how Brad responded to this.  In the past we've been
> pretty prompt at moving up to the new C++ standards.
> 
> I am curious what you meant by "experimental implementations" here
> though.  Usually the C++ standards committee has put things in the
> 'std::experimental' namespace when they are so and the normal 'std' is
> non-experimental.  This means code using 'std' APIs should continue to
> work going forward, but code using 'std::experimental' might not.
> 
> The specific example I mentioned here of coroutines is out of
> std::experimental as of C++20.  The compiler writers have been slow to
> get it implemented because it is a complicated feature.  So, I guess
> you could consider the fresh implementation at the compiler level as
> "experimental" but the language / library features themselves are not?
> 
Sure, we can distinguish 'experimental' part in two parts:
- APIs (not yet standarized),
- implementations (marked by compiler development team as experimental).

I've meant the latter. In other words - is it good to be early adopter 
of some cool new features, not yet widely tested in the field. Like 
you've said - coroutines are quite complicated feature and trusting 
early implementations might come with a risk.

I can imagine some companies or communities might choose to be careful 
in that matter. I was just wondering if there is some 'BKM' which states 
'experimental (unstable?) implementations are prohibited from use until 
marked by software vendor as stable'. Maybe that's my problem - I could 
be confusing 'experimental' with 'unstable' after all:)

Regards,
Adrian
