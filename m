Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5AED7CEE
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 19:08:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t22N5wFDzDr3V
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:08:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t21h1V4HzDr15
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 04:08:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 10:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="194574628"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2019 10:07:47 -0700
Subject: Re: The type of sensor value in redfish should be double or int64?
To: Patrick Venture <venture@google.com>, Carol Wang <karo33bug@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
 <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <de3911ab-f416-cc87-3d48-b70ce5e57612@intel.com>
Date: Tue, 15 Oct 2019 10:07:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/15/19 8:17 AM, Patrick Venture wrote:
> On Mon, Oct 14, 2019 at 7:57 PM Carol Wang <karo33bug@gmail.com> wrote:
>>
>> Hi,
>>
>> I tried to override sensor values with redfish Patch, referring to the Voltages example of https://github.com/openbmc/bmcweb/search?q=413961de&type=Commits, but met an error "Invalid argument". Comparing the code https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hpp#L2192 and the doc https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L21, the current code uses double type, but the doc says the value type should be int64. It seems a scale difference. Why the code uses double here?
> 

To my understanding, the phosphor-hwmon sensor system doesn't support
overriding sensor values at runtime, regardless of whether or not you
resolved the type issues with the arguments.  If your goal is just "get
it to work", I'd recommend switching to dbus-sensors (which I realize is
non-trivial for some systems).  With that said, it would be great to get
this int64 to double conversion going again.


> The short answer is, code generally authored by Intel uses doubles for
> the sensor values, whereas the original OpenBMC sensor models used
> int64.
> 
> A while back there was a bit of a debate about this, and it looks like
> we never truly resolved it.  Brad, perhaps this is a good time to?
> The idea is, that with the int64 storage, we store the raw value and
> we also store the scaling factor, so that one can scale the number if
> they choose to.  Sort of keeping the values as they are -- instead of
> operating on them before publishing them to dbus.  We do notably
> however, modify values in phosphor-hwmon before publishing them as
> often there are scaling factors and offsets, beyond the conversion
> from mC to C.
> 
> phosphor-host-ipmid's sensor YAML requires the type to be specified
> for the sensor value interface already, and does validly support both
> types: int64_t and double (I tested it when I briefly had a mixed
> environment).
> phosphor-hwmon reports values without applying the scaling factor, but
> it is aware of the scaling factor, so it could.
> phosphor-pid-control works with both types correctly.

bmcweb also works with both types for everything but the PATCH interface.

> 
> I'm not sure about the phosphor-fan stuff, but I imagine we'll find
> some arithmetic we can drop where it ingests values.
> 
> This change from int64 to double is big enough though that many
> configuration files would need to be adjusted, which is non-trivial.
> I argue however that having code that doesn't have a common interface
> or interfaces for sensors is less than ideal.  Having multiple options
> for talking to sensors is fine, but in my opinion this is only true if
> they implement different interfaces, or the same interface.  In this
> case, we have dbus-sensors and phosphor-hwmon which both implement the
> same interface, but differently: int64 vs double.
> 
> I think using doubles makes sense at the dbus level because generally
> one wants that version of the value.  Therefore you end up with code
> in each daemon that reads the sensor value and the scale so that it
> can perform the same operation that another daemon is also going to
> perform, etc.  Instead of just doing it once.
> 
> I'll climb off my debate box now and climb onto my voting box and say,
> I'd like to make phosphor-hwmon report the value as double and I'm
> willing to review incoming patches that address other aspects of the
> codebase to bring it all together -- since they'll need to be in a
> locked step-forward.

Another vote for moving to double.  The systems I work on don't use
phosphor-hwmon, so there's not a lot of ways to test the other
components.  The pieces that I use (dbus-sensors, phosphor-pid-control,
bmcweb) all work correctly with double.

The reviews to move to double are still open, unresolved, and James has
patches to several daemons that need to be converted.
https://gerrit.openbmc-project.xyz/q/topic:%22double-sensor%22+(status:open%20OR%20status:merged)

