Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7262381B1D2
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 10:14:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDYSwSad;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swl9W0k5Dz3cDy
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 20:14:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDYSwSad;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Thu, 21 Dec 2023 20:13:37 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swl8x35Zkz2yts
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 20:13:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703150017; x=1734686017;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pwV7q8MrzUbIEg500It2HdqmDe7eJbHF5nXX5f3Ipsw=;
  b=aDYSwSadcM0ztgexbAjDsx50ITpw+hcduCsy6s8d1KIZFkCVntaPkvpC
   k5d1IC1oPoJ6tR1zr/Bsd1ZFKB6tHo3DfbOhskjpMFbKgkKLdmxHU2FQd
   8/69Z6+lgvwt17FTCExt0iMzCrknqqnznRnfw2FFSUZFQToLd3fmUgfir
   jk59pj/pXwvywP7CozTR6ExM0bRmSYECyakCmoK63xUZDz2+sdyI+K+dQ
   i1jLTRvWGtiiMlTl5v55SmP5hlZ3WEYpzQhTCpq3Idmezf8tqeNlTzctd
   iXVAT9Fie0INWwfd/bgUo3LoC6xqCWhMMoe3UTE+ZaNw+D1ej3zwidq73
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2778290"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="2778290"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 01:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="726375670"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="726375670"
Received: from aambroze-mobl4.ger.corp.intel.com (HELO [10.213.28.79]) ([10.213.28.79])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 01:12:19 -0800
Message-ID: <10cd8a0c-4171-43ce-95a4-3b67b775e68d@linux.intel.com>
Date: Thu, 21 Dec 2023 10:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
Content-Language: pl, en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Patrick Williams <patrick@stwcx.xyz>
References: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
 <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
 <fcd703f2-b05b-4c21-9d66-6506b7aafa01@linux.intel.com>
 <ZYMc0jRDhpuaP_KR@heinlein.vulture-banana.ts.net>
 <508682f0a990cbc8f34121d8b891c1ee9f934dd7.camel@codeconstruct.com.au>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
In-Reply-To: <508682f0a990cbc8f34121d8b891c1ee9f934dd7.camel@codeconstruct.com.au>
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
Cc: cezary.zwolak@intel.com, openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com, jozef.wludzik@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20.12.2023 23:58, Andrew Jeffery wrote:
> On Wed, 2023-12-20 at 10:56 -0600, Patrick Williams wrote:
>> My gripe is that you should not be holding up the open-source project for
>> your own unpublished, undocumented, non-aligned tests.
> 
> My understanding is now that Adrian is aware of the patches he is doing
> some of his own testing to build confidence in merging them. *That*
> latency should probably be measured from around the time I sent the
> initial email, as I suspect that's when he became aware of the patches.
> So far that's a few days, which isn't unreasonable to me. As a
> contributor I sympathise with measuring from when you pushed the
> patches for review, and that this seems like yet more delay, but
> hopefully we can separate out the events here.
 >
 > I'd be more concerned about a knee-jerk merge due to getting a mildly
 > stern email and having the merge breaking things. The fact that he's
 > testing them to build his confidence seems like reasonable maintainer
 > practice to me.

Thank you for your consideration.

> The fact that it's felt that tests are required in
> addition to the automated testing is a concern, but I wouldn't yet
> class this effort as "holding things up" in a tar-pit sense.

I agree that treating all incoming changes as a package to be tested 
might be an overkill. I'm just cautious about switching to C++23, and 
wanted to confirm on target arch and toolchain. Perhaps for some folks 
here it can be seen as unnecessary, for which I apologize, still beg for 
pardon :)

Regards,
Adrian
