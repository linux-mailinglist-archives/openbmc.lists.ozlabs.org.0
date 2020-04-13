Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EE11A6D62
	for <lists+openbmc@lfdr.de>; Mon, 13 Apr 2020 22:40:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491L8m0W4qzDqPF
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 06:40:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491L7z0d5PzDqJf
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 06:39:25 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Sensor history
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20200410210033.GA9295@mauery.jf.intel.com>
Date: Mon, 13 Apr 2020 16:39:20 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
References: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
 <20200410210033.GA9295@mauery.jf.intel.com>
To: Vijay Khemka <vijaykhemka@fb.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
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

at 5:00 PM, Vernon Mauery <vernon.mauery@linux.intel.com> wrote:

> On 30-Mar-2020 08:02 PM, Vijay Khemka wrote:
>> Is there any implementation for reading sensor history. Please point me  
>> to the repo or code base.
> I do not believe that the BMC is storing any sensor history.

There were some interfaces added to the openpower namespace for this kind  
of thing.   
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/org/open_power/Sensor/Aggregation/History

The application implementing them is in the phosphor-power repository  
(power-supply).

> To get this, you would need to poll the sensors and store the values on  
> another machine.

To implement the Redfish Telemetry service would we need to store them on  
the BMC as well?

-brad
