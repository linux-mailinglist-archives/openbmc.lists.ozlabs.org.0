Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BFCEA92
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 19:27:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n6qw00WczDqM6
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 04:27:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n6q95T85zDqKT
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 04:26:59 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 10:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,268,1566889200"; d="scan'208";a="368181304"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 07 Oct 2019 10:26:55 -0700
Subject: Re: Gain,Offset with dbus-sensors values
To: Josh Lehan <krellan@google.com>, Patrick Venture <venture@google.com>
References: <CAO=notzNuQDWtXG9CCLd9qEvqhcsDa2V=6a4KogjkwCC2RZtwA@mail.gmail.com>
 <CANPkJS-UOXmBC8d9Le27OPBiBdPL589uHpmVF7KUbLTzduFhfA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <32a8d9e2-2209-16a5-c513-65ac2a163498@linux.intel.com>
Date: Mon, 7 Oct 2019 10:26:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CANPkJS-UOXmBC8d9Le27OPBiBdPL589uHpmVF7KUbLTzduFhfA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/3/19 7:12 PM, Josh Lehan wrote:
> Thanks for asking this. In particular, in PSUsensor it seems there is 
> only an ability to customize the scaling factor for an entire category 
> of sensors at once: InScaleFactor, CurrScaleFactor, PowerScaleFactor, 
> TempScaleFactor, and so on.
> 
> https://github.com/openbmc/dbus-sensors/blob/2adc95cb4d9ac879f66aa9ef12a6ce8b7c1578fe/src/PSUSensorMain.cpp#L408
> 
> Ideally, there would be a way to customize the scaling factor on a 
> per-sensor basis, for example to customize the scaling of Vout without 
> also affecting Vin. >
> Josh
> 
> Josh Lehan | Software Engineer |krellan@google.com 
> <mailto:krellan@google.com> | +1 650-733-8941
> 
> 
> 
> On Thu, Oct 3, 2019 at 5:03 PM Patrick Venture <venture@google.com 
> <mailto:venture@google.com>> wrote:
> 
>     James;
> 
>     We have some sensors that need a gain and offset value set in the json
>     file, for PSU sensors, but only vout/vin or some specific ones, and
>     not applied to all sensors
I'd be fine with this, I've added Cheng to this email who wrote this sensor.

> 
>     Akin to:
>     https://github.com/openbmc/phosphor-hwmon/blob/2227bd52c5bb8d62dcfe33b58d65515d21e9be17/sensor.cpp#L59
> 
>     Also, is there a way to customize the very verbose suffixes
>     PSUsensor applies
>     such as "Temperature" and "Output_Power".  With IPMI we're only

We added this to our oem IPMI so that common words are replaced, so we 
don't hit this issue. 
https://github.com/openbmc/intel-ipmi-oem/blob/4e6ee15b154599046b75e9af76d08828d4fb02b6/src/sensorcommands.cpp#L1375

Maybe this could be added to IPMI in general? It's kind of nice in 
redfish to have the more formal name. Thoughts?


>     granted 16 characters for the name and ipmid uses the last part of the
>     dbus path for the name.
> 
>     Perhaps ipmid should allow overriding the name value.
> 
>     Patrick
> 
