Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED23E0C5F
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 21:13:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yNTQ1MMfzDqK3
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 06:13:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yNSZ4TdwzDqGQ
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 06:13:01 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 12:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; d="scan'208";a="372633668"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 22 Oct 2019 12:12:59 -0700
Subject: Re: x86-power-control
To: Johnathan Mantey <johnathanx.mantey@intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
 <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
 <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
 <F590F665-9327-4C8D-8C23-C317DA71D7F0@fb.com>
 <54c375be-e45e-fc2a-dd31-6c9d61158169@linux.intel.com>
 <6DA89556-AD25-4BEE-AF40-9D7A129B7CB9@fb.com>
 <548712d2-820b-7c20-f05e-fbd80ab38c62@linux.intel.com>
 <4230479D-77FD-4073-B478-2D0B34C2927A@fb.com>
 <286a9c11-565f-35f7-bdd6-2099e926bf5a@linux.intel.com>
 <a62a6c18-c184-61b4-2e47-b5a26088ba04@intel.com>
 <76c2d813-3e28-416c-1826-188f868b9eae@intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <91592d5c-3039-4e62-da46-a191f7b57cf6@linux.intel.com>
Date: Tue, 22 Oct 2019 12:12:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <76c2d813-3e28-416c-1826-188f868b9eae@intel.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/22/19 12:06 PM, Johnathan Mantey wrote:
> One observation about this method.
> It may not work for the way CI unit tests are presently behaving.
> 
> For phosphorr-networkd, I think, the unit tests insist that everything 
> being tested be Git committed. The copy of the source file will not be. 
> This will prevent the unit test from running. I found this requirement 
> by the unit tests to be an irritant. I would clang-format my source, and 
> commit.  The unit tests would do an automated reformat, causing my 
> commit to be useless.  I'd have to recommit the source one more time to 
> proceed.  It would be nice to eliminate/modify this requirement in the 
> unit tests.

It should be fine in this case because CI would only be running against 
the "default" header file, the modified one would not get introduced in 
the CI path.

> 
> On 10/22/19 11:04 AM, Johnathan Mantey wrote:
>> You may want to delay the copy until the compile step.  For example:
>>
>> PROJECT_SRC_DIR := "${THISDIR}/${PN}"
>> do_compile_prepend(){
>>     cp -f ${PROJECT_SRC_DIR}/your-header.hpp ${S}
>> }
>>> Don't patch, simply copy over your new header into the correct 
>>> directory in a do_configure_prepend (I think that's the right yocto 
>>> step to overwrite, but I might be off). --
>> Johnathan Mantey
>> Senior Software Engineer
>> *azad te**chnology partners*
>> Contributing to Technology Innovation since 1992
>> Phone: (503) 712-6764
>> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>
>>
> 
> -- 
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>
> 
