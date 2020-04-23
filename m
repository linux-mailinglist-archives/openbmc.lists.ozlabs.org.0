Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 564E31B57B2
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 11:05:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497BGP3C19zDqvD
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 19:05:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497BFL3DK5zDr2k
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 19:04:21 +1000 (AEST)
IronPort-SDR: zuQWrtuXBkvdMznLXaGT8T1K2RAoL5Rhzv2U6GalX91ZSjKeZK4ftQ1qYthXK/SWbeBPeomf8a
 jSVz+kz46AJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 02:04:18 -0700
IronPort-SDR: k0iSq5y14yHy5diop2/qKiaML9ThSeD2PyHgecTXWndxvkDRSvdK0I8+cOPRLL5uo6YfGvrhvX
 vg8jmygDSKww==
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; d="scan'208";a="402855515"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.249.143.125])
 ([10.249.143.125])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 02:04:17 -0700
Subject: Re: phosphor-dbus-interfaces modification process for existing YAML
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <29a3376f-d82d-057c-e2d5-0fe250b55951@linux.intel.com>
 <2A59C9DC-F7F5-4A7E-BF83-5BE2AA8A04B9@fuzziesquirrel.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <c83bd827-6155-ae55-6c8e-1d52078ad9ca@linux.intel.com>
Date: Thu, 23 Apr 2020 11:04:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2A59C9DC-F7F5-4A7E-BF83-5BE2AA8A04B9@fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



W dniu 4/22/2020 o 13:45, Brad Bishop pisze:
> at 7:00 AM, Adrian Ambrożewicz <adrian.ambrozewicz@linux.intel.com> wrote:
> 
>> Hello,
>>
>> OpenBMC Sensor interface is specified here:
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml 
>>
>>
>> We would need to extend it with new hierarchy/namespace : utilization, 
>> and corresponding Unit: Percent.
>>
>> Should I push change directly to review or do I need to discuss it 
>> earlier with someone? My first thought was to address 
>> https://github.com/openbmc/docs/blob/master/architecture/sensor-architecture.md 
>> , however this document doesn't seem to address these details.
>>
>> Regards,
>> Adrian
> 
> Thanks for bringing the topic to the mailing list first!  I find 
> discussion here to be much easier than in a docs/designs or 
> phosphor-dbus-interfacs gerrit review.  I also think it ends up getting 
> much more visibility.
Glad to see the enthusiasm :) I will keep that in mind for the future:)

> 
> With that said - this one is pretty straightforward.  Your proposal 
> sounds good to me!
Great.

> 
> thx - brad
