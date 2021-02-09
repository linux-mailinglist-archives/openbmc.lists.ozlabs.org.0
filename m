Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B628A3152E9
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 16:37:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZn853yQDzDvVS
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 02:37:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZn731FsxzDr4M
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 02:36:29 +1100 (AEDT)
IronPort-SDR: I+Y2G/SJH6pY0OrjRM3HaKZhc+Mxk7U/LtPdGwT430JBJo11u3mLaSJfiRg+pHBwGCqCCCzbvh
 RmSIjtBYf+iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="181961833"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="181961833"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 07:36:25 -0800
IronPort-SDR: Y5qUdUXuu3qVPyEyeo/PLwSZHeR27CJ49BbbrYTpZ2xOpYZXxIajAjt7Zb2yCB72U2KGjDWWxV
 qcESc62Fc/GA==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="396185041"
Received: from aambroze-mobl.ger.corp.intel.com (HELO [10.213.28.180])
 ([10.213.28.180])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 07:36:24 -0800
Subject: Re: ObjectMapper - quantity limitations?
To: Ed Tanous <edtanous@google.com>
References: <8fc3b7be-42bc-fc28-6bbd-c5d8de95feaf@linux.intel.com>
 <CAH2-KxDCorEjGSneVsSDWx7AXFvQZ8fJ1zaqf1zOJfndbW9eNA@mail.gmail.com>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Message-ID: <d531c46e-033f-6cd3-83e2-d331d87c7310@linux.intel.com>
Date: Tue, 9 Feb 2021 16:36:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAH2-KxDCorEjGSneVsSDWx7AXFvQZ8fJ1zaqf1zOJfndbW9eNA@mail.gmail.com>
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

W dniu 1/27/2021 o 18:14, Ed Tanous pisze:
> On Wed, Jan 27, 2021 at 9:04 AM Ambrozewicz, Adrian
> <adrian.ambrozewicz@linux.intel.com> wrote:
>>
>> Hello,
>>
>> I'm doing some performance measurements of OpenBMC telemetry subsystem.
>> I'm using my custom app, which spawns valid D-Bus Sensors, I configure
>> TelemetryService to monitor them and EventService to push MetricReports
>> to external server.
> 
> Which sensor code are you using?
> 
My homebrew app, which I run like so fake-sensors -c 
"/xyz/openbmc_project/inventory/system/board/AC_Baseboard" --loglevel 1 
--sensors {sensors_cnt} --interval {interval_ms} :)
It's just for tests.

>>
>> I observe certain limitation on my system. Each sensor is mapped as two
>> objects in ObjectMapper hierarchy. It seems that I am able to correctly
>> create up to 1500 sensors. When I go above this limit part of the
>> sensors are not represented in ObjectMapper tree.
> 
> When I wrote it originally, there were no arbitrary limits on how many
> objects the mapper could cache or return, but considering how big your
> responses will be, I'm guessing you're hitting the dbus per-message
> limit.  You don't mention if you're seeing any errors in the
> journalctl log from either the broker or object manager.  That might
> give you more clues.
> 

I've come back to the topic and I observe two kind of behaviors:
- mapperx crash (pretty rare)
- error "Error getting associations from ...".

The former still requires debugging, but for the latter I have simple 
explanation - only one application spawns thousands of sensors and is 
bombarding ObjectMapper with InterfaceAdded signals, while receiving 
'Get' on Associations interface (and possibly other calls). I've 
introduced a workaround - up to 3 retries of do_associations() on 
ETIMEDOUT, which allowed mapperx to correctly consume 2000 sensors.

However, performance could be better. On AST2600 listing of 2000 sensors 
by ObjectMapper takes 130s, 60s for 1000. Furthermore - it's just local 
workaround for bigger problem - D-Bus scalability in embedded system.

It looks like sooner or later we need to figure out more lightweight IPC 
for telemetry.

Regards,
Adrian
