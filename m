Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B0DB1C8
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 18:02:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vDTQ2QYMzDqf2
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 03:02:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vDSX5rRxzDqcY
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 03:02:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 09:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,308,1566889200"; d="scan'208";a="347802704"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 17 Oct 2019 09:02:00 -0700
Received: from [10.251.15.178] (jmbills-mobl.amr.corp.intel.com
 [10.251.15.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EFA0D58048F
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 09:01:59 -0700 (PDT)
Subject: Re: x86-power-control
To: openbmc@lists.ozlabs.org
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
Date: Thu, 17 Oct 2019 09:01:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
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

Hi Vijay

On 10/16/2019 6:13 PM, Vijay Khemka wrote:
> One more question on code, I see following code requires powerButtonMask 
> to be set before aquiring GPIO line. Please let me know who sets this 
> powerButtonMask to true. I know this is related to GPIO passthrough but 
> still couldn’t understand where in code it gets set until someone call 
> set-property of dbus.

powerButtonMask is a gpiod::line object that returns true if it 
references a GPIO line and false otherwise.

> 
> power_control::powerButtonIface->register_property(
> 
> "ButtonMasked", false, [](constboolrequested, bool& current) {
> 
> if(requested)
> 
> {
> 
> if(power_control::powerButtonMask)
> 
> {
This will return if powerButtonMask already references a GPIO.

> 
> return1;
> 
> }
> 
> if(!power_control::setGPIOOutput(
> 
> "POWER_OUT", 1, power_control::powerButtonMask))
Otherwise, this will request the "POWER_OUT" GPIO and assign it to 
powerButtonMask (which will make it return true).

> 
> {
> 
> throwstd::runtime_error("Failed to request GPIO");
> 
> return0;
> 
> }
> 
> std::cerr << "Power Button Masked.\n";
> 
> }
> 
> else
> 
> {
> 
> if(!power_control::powerButtonMask)
> 
> {
This will return if powerButtonMask does not reference a GPIO line.

> 
> return1;
> 
> }
> 
> std::cerr << "Power Button Un-masked\n";
> 
> power_control::powerButtonMask.reset();
Otherwise this will reset powerButtonMask to release the "POWER_OUT" 
GPIO (which will make it return false).

> 
> }
> 
> Regards
> 
> -Vijay
> 
