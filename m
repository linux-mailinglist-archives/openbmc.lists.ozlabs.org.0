Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9CEE181
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 14:48:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Df41KdXzF39J
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 00:48:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Dd82kmFzF353
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 00:47:38 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 05:47:32 -0800
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="195456529"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.102.85.150])
 ([10.102.85.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 04 Nov 2019 05:47:30 -0800
Subject: Re: openbmc project for telemetry
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
 <A727F88F-D32D-4CAD-8E92-2C99B39E4CEE@fuzziesquirrel.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <ce5c1774-ff0f-602c-a165-43cbca90f818@linux.intel.com>
Date: Mon, 4 Nov 2019 14:47:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <A727F88F-D32D-4CAD-8E92-2C99B39E4CEE@fuzziesquirrel.com>
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



W dniu 10/31/2019 o 12:48, Brad Bishop pisze:
> 
>> On Oct 31, 2019, at 6:14 AM, Adrian Ambrożewicz <adrian.ambrozewicz@linux.intel.com> wrote:
>>
>> Hello Brad,
>>
>> First I would like to say introduce myself as it's my first message to the mailing list. I'm Adrian, engineer from Intel Technology Poland. I'm very excited to have an opportunity to work within this group of professionals :)
> 
> Welcome, and likewise!
> 
>> Currently we're working with Piotr on Redfish Telemetry. Current design in the review (https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357) seems to be on track to be accepted.
>>
>> I would like to ask you what requirements we have to comply to have our own repository in openbmc project. From what I've seen in other topic - Apache 2.0 is preferred license. Are there any other expectations?
> 
> I can’t think of any other than the license as you’ve mentioned.
> 
>> Should we wait until mentioned design is accepted or can we start working on some initial implementation right away? If so - I would love to have repo up and running as soon as possible.
> 
> I don’t see any need to wait.  What would you like this repository called?
> 
> thx - brad
> 

Cool! After speaking with Piotr we agreed on straightforward approach. 
The repo should be named 'telemetry' :)

Regards,
Adrian
