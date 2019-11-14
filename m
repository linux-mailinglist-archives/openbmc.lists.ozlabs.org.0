Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F13FC4DE
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 11:58:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DJPT09hRzF665
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 21:58:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DJL91tBdzF82b
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 21:55:42 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 02:55:40 -0800
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="198779747"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.102.85.150])
 ([10.102.85.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Nov 2019 02:55:38 -0800
Subject: Re: openbmc project for telemetry
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
 <A727F88F-D32D-4CAD-8E92-2C99B39E4CEE@fuzziesquirrel.com>
 <ce5c1774-ff0f-602c-a165-43cbca90f818@linux.intel.com>
 <ee14af8a-5e0a-04b1-4978-09d34f6f9628@linux.intel.com>
 <FC0713B7-19EB-49E0-958F-3290DA5A10DD@fuzziesquirrel.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <8bda426c-5dfa-b9c6-f4b0-769288ff675c@linux.intel.com>
Date: Thu, 14 Nov 2019 11:55:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <FC0713B7-19EB-49E0-958F-3290DA5A10DD@fuzziesquirrel.com>
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


W dniu 11/13/2019 o 20:36, Brad Bishop pisze:
> 
> 
>> On Nov 13, 2019, at 11:32 AM, Adrian Ambrożewicz <adrian.ambrozewicz@linux.intel.com> wrote:
>>
>> Are there any obstacles? I'm eager to hear the good news :)
> 
> No obstacles; openbmc/telemetry created.
> 
> thx -brad
> 

Thanks a lot!

So now it's time for silly questions...

What should be my first steps as maintainer? I've found guide here 
https://github.com/openbmc/docs/blob/master/maintainer-workflow.md but 
its general.
I'm more interested in technical side of things.
- Is Linux MAINTAINERS format utilized for automation or information 
about code maintainers should be just included in README file in repo? 
MAINTAINERS file is referenced in 
https://github.com/openbmc/docs/blob/master/maintainer-workflow.md but I 
don't see that in every repo..
- Should maintainer have additional access for repo/gerrit config?

Regards,
Adrian
