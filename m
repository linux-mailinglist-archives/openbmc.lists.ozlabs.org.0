Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 821168A6AB
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 20:57:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466lTf0ZH6zDqb0
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 04:57:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466lT31k9qzDqVD
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 04:57:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 11:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,378,1559545200"; d="scan'208";a="180954257"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 12 Aug 2019 11:57:06 -0700
Received: from [10.241.245.64] (unknown [10.241.245.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3F6A6580372
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 11:57:06 -0700 (PDT)
Subject: Re: Question about sensor number access
To: openbmc@lists.ozlabs.org
References: <860e21837286442b9a1cdd7d7dafe474@lenovo.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <73e88c82-447d-38fb-bfa4-ddd48976d1b3@linux.intel.com>
Date: Mon, 12 Aug 2019 11:57:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <860e21837286442b9a1cdd7d7dafe474@lenovo.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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


On 8/12/2019 9:08 AM, Ivan Li11 wrote:
> Hi Team,
> 
> I have a question about sensor number.
> 
> As far as I know, “phosphor-host-ipmid” will parse “ipmi-sensors.yaml” 
> and then store these sensors info(sensor number and sensor type, etc) in 
> ipmid.
> 
> May I know if another daemon(e.g. phosphor-sel-logger) needs sensor 
> number info, is there any suggested method to get sensor number ?

phosphor-sel-logger stores only the sensor path and depends on something 
to map sensor path to sensor number when the log is read.

Today, that mapping is only done for dynamic IPMI sensors in 
intel-ipmi-oem, here: 
https://github.com/openbmc/intel-ipmi-oem/blob/master/include/sdrutils.hpp#L207.

We were not able to get to a final solution for handling the mapping of 
dynamic and hardcoded sensor numbers.  You can see the ideas and 
discussion in this review: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951 
and this thread: 
https://lists.ozlabs.org/pipermail/openbmc/2019-January/014890.html.

This is specifically about getting the sensor number from the path for 
phosphor-sel-logger, so it may not apply to your situation, but 
hopefully helps.

Thanks,
-Jason
> 
> Thanks,
> 
> Ivan
> 
