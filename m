Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 066981A9612
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 10:18:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492FcP0pRQzDr3F
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 18:18:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492FXg2GFTzDr5L
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 18:15:29 +1000 (AEST)
IronPort-SDR: Pgu1yBUdyECW9SKcwAxidoMQ4dOg5ojxh9cqrljnlVasAbZvJ02VMPz/VRfrovS+pGs9pZHeGR
 MUibK+i3D2nw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 01:15:26 -0700
IronPort-SDR: R3xyBgCiczJvMvUgwsrh0cP23+iDmFn9SytY/7cFC98o/eTNRRRdIvWKuoJEiFmaWAsgXNENy3
 iAqD+UEUFwmQ==
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="427356007"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.249.254.232])
 ([10.249.254.232])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 01:15:24 -0700
Subject: Re: Sensor history
To: Richard Hanley <rhanley@google.com>, Vijay Khemka <vijaykhemka@fb.com>
References: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
 <20200410210033.GA9295@mauery.jf.intel.com>
 <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
 <A785371B-1AD2-45E0-AD62-60C7E8B2C69D@fb.com>
 <CAH1kD+b4GQFs_V13APk8123dc_vL0GVxXwZLx6pPdUHiKodZRA@mail.gmail.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <bbd70c99-dc36-7d2b-ef25-a17108be8de0@linux.intel.com>
Date: Wed, 15 Apr 2020 10:15:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAH1kD+b4GQFs_V13APk8123dc_vL0GVxXwZLx6pPdUHiKodZRA@mail.gmail.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

TelemetryService is currently in development.

Integration with EventService was tested and proved to work fine. Intel 
have prepared demo for 2020 Virtual OCP Summit if you are willing to 
have some insight about use cases.

We should expect solution to start appearing in upstream sooner than 
later as feature is almost complete - it requires legal issues to be 
sorted out.

Regards,
Adrian

W dniu 4/14/2020 o 22:41, Richard Hanley pisze:
>> Hi Team,
>>
>> There is a telemetry proposal in docs and repository.
>> https://github.com/openbmc/docs/blob/master/designs/telemetry.md
>> https://github.com/openbmc/telemetry
>  > The proposal seems promising and complete.
>  > What is the implementation status?
> 
> I'm also curious about a status update here.  Were there any design 
> issues that needed to be worked out, or is it ready to develop?
> 
>>>    To implement the Redfish Telemetry service would we need to store them on 
>>>    the BMC as well?
>  >It will be nice if we can store it in RAM at least with larger data 
> and some diskspace
>  >With small log rotate.
> 
> The Telemetry Service already has a concept of log rotation, but overall 
> I agree that storing in RAM first with optional persistence is better 
> than the other way around.
> - Richard
