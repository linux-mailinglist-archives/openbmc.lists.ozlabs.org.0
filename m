Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E912767FB
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 06:51:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxjLM2DMvzDqbG
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 14:51:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=apparao.puli@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxjKV21jHzDqVJ
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 14:50:38 +1000 (AEST)
IronPort-SDR: 965RKQxmpPWpWnCWQQa616G1BxDPl3d8ksClqQCV3YsPMcT8zQ2HMan8oJWnDhRyvpMViEG2HQ
 lhszlqH1VhKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="158456397"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; d="scan'208";a="158456397"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 21:49:23 -0700
IronPort-SDR: ZBAEjIIcmB/L1LGBkkXF4GRdn3QgmfhXpr6CDt2b7ejNMkwn5TiotwnI4K7Ixgqm2HS/Y/VNqk
 18A3tFFyfqMg==
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; d="scan'208";a="455191910"
Received: from apuli-mobl.gar.corp.intel.com (HELO [10.215.125.89])
 ([10.215.125.89])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 21:49:21 -0700
From: "Puli, Apparao" <apparao.puli@linux.intel.com>
Subject: Re: bmcweb : https client support
To: Sunitha Harish <sunithaharish04@gmail.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <5c93d1fa-102b-61a1-1dd8-4a371d7c2a2a@gmail.com>
 <84607e86-b9f9-cf02-9971-71df98878b85@gmail.com>
Message-ID: <41d3b0a0-f9c4-84e5-ed0a-be83b78383d5@linux.intel.com>
Date: Thu, 24 Sep 2020 10:18:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <84607e86-b9f9-cf02-9971-71df98878b85@gmail.com>
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

Hi Sunitha,

    Firstly I am sorry for late response.

Its in my back log list. At the moment, I switched to other priority 
activities and i am afraid i can get to this in next couple weeks. I am 
planning to resume this mid of next month and address the concerns which 
ED raised(Majorly Keep alive implementation, Resolving address using 
async call). Happy to see if you would like to contribute (Mainly on 
keep alive connection and async resolve).

Thanks,

-Appu

On 9/15/2020 11:49 AM, Sunitha Harish wrote:
> Hi Apparao,
>
> Any information on this? We are looking for this change with high 
> priority.
>
> Thanks & regards,
> Sunitha
>
>
> On 11-09-2020 17:03, Sunitha Harish wrote:
>> Hi Apparao,
>>
>> This is about the https client support at bmcweb. Commit: 
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/31735/. IBM 
>> is interested in this commit. We have a use-case requiring the 
>> redfish client to be able to subscribe for event notifications over 
>> secure channel.
>>
>> Can you please share your plan to get this commit to the master? Do 
>> you have plans to implement the client certificate support as well ?
>>
>> Thanks & regards,
>> Sunitha
>>
>>
>>
