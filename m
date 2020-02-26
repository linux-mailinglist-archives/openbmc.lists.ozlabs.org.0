Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E01705A7
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 18:10:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SMkp3hxhzDql2
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 04:10:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SMjd6s2nzDqjW
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 04:09:39 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 09:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="256390960"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 26 Feb 2020 09:09:36 -0800
Subject: Re: dbus-sensors updateValue update hysteresis logic question
To: Josh Lehan <krellan@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CANPkJS8pfmJF9fTk3GQE45g8xQfu_NaLyuhWK=_+=o3B6Hsh_A@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <9328787b-568d-a777-30c7-feb3b0ec631b@linux.intel.com>
Date: Wed, 26 Feb 2020 09:09:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CANPkJS8pfmJF9fTk3GQE45g8xQfu_NaLyuhWK=_+=o3B6Hsh_A@mail.gmail.com>
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

On 2/25/20 5:26 PM, Josh Lehan wrote:
> Hi there! Question about updateValue(), in sensor.hpp file, in 
> dbus-sensors package.
> 
> In updateValue(), it always calls set_property() to update the stored 
> value to the new passed-in value, sending the new value on D-Bus. 
> However, it then tests the hysteresis variable, to avoid a very small 
> change. It only updates the stored value if the change is significant 
> enough. This logic in updateValue() seems strange to me. Wouldn't you 
> want to either do both of these operations at once, or none of them at all?

This is to not trip thresholds if the change is small, so you don't jump 
back and forth over thresholds. We still update the value on d-bus for 
anyone reading the value to have the most recent value.

> 
> If D-Bus is updated but the stored value is not also updated, it would 
> cause them to get out of sync, over time. Think of a slowly changing 
> value, just under the hysteresis threshold, but with each new reading, 
> over time, it adds up to a substantial change. This would cause the 
> D-Bus value to be updated but the stored value to not be updated. Then, 
> if the sensor were to return to the value of the stored value, it would 
> falsely be seen as not an update.

I believe it always compares to the stored value, so this wouldn't be 
possible, as eventually the reading will drift far enough away from the 
stored value that isn't being updated. If it isn't, it should be.


> 
> Also, in the PSUSensor::handleResponse() function, it does a test for 
> equality before calling updateValue(). Shouldn't this test be done by 
> updateValue() itself? Interestingly, PSUSensor doesn't check for 
> hysteresis at all, so these are two different tests. I'm considering 
> refactoring it, to have updateValue() make the decision, so the decision 
> is all made in one place.

Yes, this seems like a discrepancy. Not sure why PSU sensor didn't 
follow the existing logic.


> 
> What's more, PSUSensor uses floating-point equality when testing for 
> equality. This is considered harmful, and in practice means that most 
> readings aren't considered equal, even when they effectively are, so 
> there's a lot of excess update traffic on the D-Bus, defeating most of 
> the hysteresis logic above.
> 
> And, finally, the hysteresis variable is defined as ((max-min)*0.01) 
> which means that a value must be changed by 1/100 of full scale, in 
> order to be considered a change. This seems to be throwing away some 
> useful sensor resolution here. IPMI is "accurate" down to 1/255 of full 
> scale, so it would make sense to at least be as precise as that allows. 
> It might be more useful to lower the hysteresis threshold to 1/1000 of 
> full scale, which would give plenty of headroom.

The value on d-bus is still updating at least for the sensors I'm aware 
of. This should only be used for the threshold comparison.

> 
> Any thoughts on these points? Thanks for reading this.
> Josh
> 
> Josh Lehan | Software Engineer |krellan@google.com 
> <mailto:krellan@google.com> | +1 650-733-8941
> 
