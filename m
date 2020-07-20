Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC1A225B8E
	for <lists+openbmc@lfdr.de>; Mon, 20 Jul 2020 11:26:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9GYs6wy9zDqWg
	for <lists+openbmc@lfdr.de>; Mon, 20 Jul 2020 19:26:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9GXV4y2rzDqKJ
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2020 19:24:57 +1000 (AEST)
IronPort-SDR: EP5ulUhmroC89xiHlgyuqDuADvvoLYStBaDM+J/E90pV0gJy9k9/wHOenT20A0gdOYRYvRQPma
 pEGk2wNgT7GA==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="151222916"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="151222916"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 02:24:55 -0700
IronPort-SDR: sD0X+tIX5KCHUF3VbhY5gRYgcdGDXq4fa5fBo6xlBjwreVc4l7a+4iluDMFbG6wD9E03D/N5Sv
 BwIWdeRfujrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="487180702"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.215.125.198])
 ([10.215.125.198])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2020 02:24:52 -0700
Subject: Re: MCTP Null EID - Physical addressing support - Binding private in
 API
To: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>,
 "Hawrylewicz Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <b774a6d0-97f3-8cc7-9289-3792b5094cdd@linux.intel.com>
 <7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com>
 <54948e11-946b-49ad-945e-2d73c41c1a8a@linux.intel.com>
 <8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com>
 <be5a68c4-39b4-2d88-425d-0ab2121ed564@linux.intel.com>
 <2b9de3db-222a-4a70-bbe9-36a0aec0e66e@www.fastmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <2fec023b-824a-3b0d-bd4e-6b9f2d0b3e28@linux.intel.com>
Date: Mon, 20 Jul 2020 14:54:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2b9de3db-222a-4a70-bbe9-36a0aec0e66e@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Andrew,

inline comments,

Regards,

Richard

On 7/6/2020 8:43 AM, Andrew Jeffery wrote:
>
> On Fri, 5 Jun 2020, at 12:53, Thomaiyar, Richard Marian wrote:
>> Thanks Andrew,
>>
>> inline comments. Captured this as an agenda for our next work group
>> call discussion https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG
> I noted in another thread that I've pushed patches implementing bridging and
> routing along with the provisional EID concept to gerrit:
>
> https://gerrit.openbmc-project.xyz/q/topic:%2522routing%2522+(status:open+OR+status:merged)+project:openbmc/libmctp
>
> In the end the implementation uses a "provisional" flag in both the mctp_eid_t
> type and the route table as there was one race that couldn't be safely
> eliminated without it.
>
>> [Richard]: We
>> can't know which EID can be used as provisional. It may be real EID in
>> a bridged network. Please educate me, if the same can be achieved
>> without having a conflict.
> Because the conflict shouldn't matter - it can be detected by the binding
> receiving the message by looking up the source EID in the route table and
> checking if the result is a provisional EID.
>
> However, the complication occurs when trying to remove the provisional EID from
> the route table in order to deliver the message received from the endpoint that
> has been formally allocated the same EID. If there's an outstanding command
> whose response hasn't yet been sent which will need the provisional EID entry
> from the table in order for the message to be routed, we can't deliver the
> message received from the endpoint which is non-provisionally assigned the EID.
> It's hard to unwind that properly and still account for issues like deadlocks
> or application crashes which will lead to a denial of service.
>
> So the result is we have a route table with two separate address spaces, one
> for formally assigned EIDs and another for provisional EIDs. This partition is
> managed by a flag on the route table entries in the current implementation.

[Richard]: Reviewed the same and indicating provisional EID using the 
flag will cause confusion, as application must use this flag. 
Applications can't just rely on EID 0 is special, instead it must check 
for the flag.

Won't it be easier to track with EID 0 itself, as all application knows 
that it is special EID (no separate EID necessary), and applications 
using special EID, must be aware about which device it is communicating 
and should be fine.

I also see that with provisional EID, we are building up of another EID 
concept similar to MCTP specification, and don't find a way to clear it. 
We are doing on the assumption that provisional EID will be removed once 
proper EID is assigned, but we will end up issuing Get Endpoint ID to a 
device with Null EID (just to make sure that the card has not changed 
the EID when BMC is in reset - This will happen, when Card also went for 
a reset or swapped and it is using a static EID X, in which case BMC 
request with already assigned EID Y will be dropped).

>
> Andrew
