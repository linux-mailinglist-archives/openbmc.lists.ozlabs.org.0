Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 758AD170673
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 18:47:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SNY062NbzDqdR
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 04:47:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SNXL53tlzDqBH
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 04:46:41 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 09:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="256403091"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 26 Feb 2020 09:46:38 -0800
Subject: Re: dbus-sensors updateValue update hysteresis logic question
To: Andrew Macrae <drewmacrae@google.com>
References: <CANPkJS8pfmJF9fTk3GQE45g8xQfu_NaLyuhWK=_+=o3B6Hsh_A@mail.gmail.com>
 <9328787b-568d-a777-30c7-feb3b0ec631b@linux.intel.com>
 <CAAD+EBrbhpihUKzXZUqDgADV9voOXnB5rJku1Q25ReYJPiV75w@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <dd3b78a9-0a9d-cb66-447e-1369d363bd42@linux.intel.com>
Date: Wed, 26 Feb 2020 09:46:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAAD+EBrbhpihUKzXZUqDgADV9voOXnB5rJku1Q25ReYJPiV75w@mail.gmail.com>
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
Cc: Josh Lehan <krellan@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/26/20 9:34 AM, Andrew Macrae wrote:
>     On 2/25/20 5:26 PM, Josh Lehan wrote:
>     > Hi there! Question about updateValue(), in sensor.hpp file, in
>     > dbus-sensors package.
>     >
>     > In updateValue(), it always calls set_property() to update the stored
>     > value to the new passed-in value, sending the new value on D-Bus.
>     > However, it then tests the hysteresis variable, to avoid a very small
>     > change. It only updates the stored value if the change is significant
>     > enough. This logic in updateValue() seems strange to me. Wouldn't you
>     > want to either do both of these operations at once, or none of them at all?
> 
>     This is to not trip thresholds if the change is small, so you don't jump
>     back and forth over thresholds. We still update the value on d-bus for
>     anyone reading the value to have the most recent value.
> 
> 
> If this is just for threshold comparison, would it make more sense to 
> use a more typical method of applying hysteresis?
> To simplify the code could we implement something with no hidden state, 
> and only one bit of state like a schmitt trigger?
> 
> For clarification, could we say the threshold is violated when the value 
> rises above it, but the violation is only 
> resolved/cleared/no-longer-violated when the readings have fallen by an 
> additional hysteresis value below the threshold?
> 
> static bool overThreshold;
> overThreshold = (reading>__threshold-overThreshold*__thresholdHysteresis)
> 
> by making the state observable we make it much easier to understand, 
> test and cover all the behavior.

Sure, I see no problems with that.
