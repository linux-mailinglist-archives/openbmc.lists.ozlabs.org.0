Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C01131A95
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 22:37:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s84V0Jm9zDqDp
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 08:37:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s83p56QzzDq63
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 08:37:09 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 13:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; d="scan'208";a="271303317"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2020 13:37:06 -0800
Subject: Re: Configuring shunt_resistor in hwmon
To: Alex Qiu <xqiu@google.com>
References: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
 <e5878df7-b127-0f86-3366-722e94f86103@linux.intel.com>
 <CAA_a9x+wpvhD7pEe+TEqkjSb6ZoiiYz4ZZBQz0v_7V-cGywHXg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <e585c0d1-81a8-fd09-cb43-84ac878568ad@linux.intel.com>
Date: Mon, 6 Jan 2020 13:37:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAA_a9x+wpvhD7pEe+TEqkjSb6ZoiiYz4ZZBQz0v_7V-cGywHXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Josh Lehan <krellan@google.com>, openbmc@lists.ozlabs.org,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/6/20 1:29 PM, Alex Qiu wrote:
> Hi James,
> 
> Thanks for your quick reply and reviewing my code in the morning!
> 
> That looks interesting, so this ScaleFactor will be used to multiply the 
> voltage value from hwmon without setting the shunt_resistor explicitly? 
> I do have a little concern on the resolution, because it's only 
> reporting 0.165V with default shunt_resistor setting, but we'll try and 
> see if this will work for our case. In the meantime, do you know any 
> other method that will work?

That's all I'm aware of in dbus-sensors. We have a voltage divider 
in-front of our ADC channels, so we use this scale factor to calculate 
the actual voltage. Anything else I think you'd need to add as a new 
change if you're using dbus-sensors. I'm not sure if phosphor-hwmon 
offers anything you could use or not.

> 
> Thank you!
> 
> - Alex Qiu
> 
> 
> On Mon, Jan 6, 2020 at 1:21 PM James Feist <james.feist@linux.intel.com 
> <mailto:james.feist@linux.intel.com>> wrote:
> 
>     On 1/6/20 1:16 PM, Alex Qiu wrote:
>      > Hi OpenBMC folks,
>      >
>      > Is there a way to configure the shunt_resistor value for a hwmon
>     with
>      > entity-manager or other modules?
> 
>     Have you seen this?
>     https://github.com/openbmc/entity-manager/blob/0cbe6bf34101bab7544b40011868efc5145c0804/configurations/WFT%20Baseboard.json#L7
> 
>     For Entity-Manager + dbus-sensors.
> 
>      > We need to configure this value to make
>      > the INA230 report correct voltage, but for now I don't find
>     anything in
>      > the code for it. Shall this be a feature to implement? Thanks!
>      >
>      > - Alex Qiu
> 
