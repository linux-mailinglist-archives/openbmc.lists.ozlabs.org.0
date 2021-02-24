Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF6323BC7
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 13:11:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlvsT23Pzz3cYX
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 23:11:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jozef.wludzik@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 24 Feb 2021 23:11:16 AEDT
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlvsJ1gq1z30Hr
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 23:11:15 +1100 (AEDT)
IronPort-SDR: nQaMwx3obsVrkLsAGM5LSDotB+EDGQAzj+/XPfuHeDgjZaqAgJ59trkXar04+8MGyuE8CDbLaI
 JBIPJAyaQwYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="184440608"
X-IronPort-AV: E=Sophos;i="5.81,202,1610438400"; d="scan'208";a="184440608"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 04:10:06 -0800
IronPort-SDR: RwhYfg2aDRy9f5mAO2HiXaiMaFNjH/Z87PFIEmDhLaj+/i80qEYAXO1l0sxB5W3DdxnBgaaR87
 b0ZqsmxYe8MQ==
X-IronPort-AV: E=Sophos;i="5.81,202,1610438400"; d="scan'208";a="403670238"
Received: from jwludzik-mobl.ger.corp.intel.com (HELO [10.213.1.73])
 ([10.213.1.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 04:10:05 -0800
Subject: Re: any in-progress Redfish TelemetryService enhancements?
To: openbmc@lists.ozlabs.org
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
From: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Message-ID: <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
Date: Wed, 24 Feb 2021 13:09:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
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

Hi, "Append" is on the list of to dos and should be ready till summer
(might be ready). Other feature that are described by Redfish Telemetry
Model should be ready till the end of summer too -> triggers and
collection functions.

About the issue, the metric reading is not updated when there is no
update from the sensor dbus. To debug it best way to monitor the
PropertiesChanged signal from the service that implement the sensor. If
there is no signal from service than metric won't be updated. If there
is a signal, then Telemetry service has a regression.

I would be very glad for any feedback on telemetry, even filing a bug on
Telemetry sounds great. Thanks in advance

Thanks,
Jozef

On 2/19/2021 20:33 PM, Brad Bishop wrote:
> On Thu, Feb 18, 2021 at 12:04:57PM -0800, Ed Tanous wrote:
>> On Thu, Feb 18, 2021 at 11:16 AM Brad Bishop
>> <bradleyb@fuzziesquirrel.com> wrote:
>>>
>>> Has anyone thought about how to implement the Append behaviors for the
>>> ReportUpdates property in a MetricReportDefinition?
>>>
>>
>> As an aside, if anyone else is interested in Telemetry Service,
>> there's a lot of code there that's not having a lot of community
>> feedback or testing on the reviews, so if anyone else is interested
>> please pull down the patches and provide constructive feedback.
>>
>> https://gerrit.openbmc-project.xyz/q/topic:%2522telemetry%2522+(status:open+OR+status:merged)+status:open
>>
> 
> I pulled these in and did some quick sanity checking.  I was able to
> create a report definition and then see the report get generated and
> read it.
> 
> I have to say - it was really nice being able to pull a feature in and
> having it work out of the box.  So really great job to the Intel team in
> that respect.
> 
> I did find a bug with the telemetry service itself - when reports with
> multiple metrics are created, the last (or maybe all but the first?)
> metric in the report isn't updated after the initial reading.  I was too
> lazy to file a bug and didn't save any information.  I'll try to do that
> soon.
