Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD456113081
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 18:11:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Slks5T16zDqXQ
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 04:11:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Sljv5l1LzDq9d
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 04:10:58 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 09:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="242915629"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 04 Dec 2019 09:10:53 -0800
Subject: Re: Faking Sensor Readings
To: rgrs <rgrs@protonmail.com>
References: <QVdDJHlLW9JS_3uowBPTzSCb1dwpqJjml0ORFR_aQGpuKCve1l8Qwy4GF4X0_dgJmExy8sjJQD_VjnI-o4xwoYhivHJlSPBt42fc1cuDKjw=@protonmail.com>
 <0a4bb951-4f85-728a-8426-af629c870908@yadro.com>
 <234c1d26-7b59-0926-d6c2-6c49f75aab3f@linux.intel.com>
 <x5Z3U1jaa8Tf-HK1htUFoCqgAFdtIXGaDyEU7SKkgNkehJEtqaps9BvN2j_D5lsgjEgoTL81fZ8nJLitwFaqW2zRkFK8vXhbCrld3Ziy43o=@protonmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <2de3b2e2-9b02-a1c2-d310-f6e546e72c1e@linux.intel.com>
Date: Wed, 4 Dec 2019 09:10:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <x5Z3U1jaa8Tf-HK1htUFoCqgAFdtIXGaDyEU7SKkgNkehJEtqaps9BvN2j_D5lsgjEgoTL81fZ8nJLitwFaqW2zRkFK8vXhbCrld3Ziy43o=@protonmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/4/19 1:39 AM, rgrs wrote:
> Hi James,
> 
> I tried busctl set-property,  but the values didn't change.
> Are the steps below correct?
> (test with both 'field mode' enabled and disabled)
> 
> root@obmc:~# busctl introspect xyz.openbmc_project.Hwmon-2439434288.Hwmon1  /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_project.Sensor.Value --no-pager
> NAME                             TYPE      SIGNATURE RESULT/VALUE                             FLAGS
> .MaxValue                        property  x         0                                        emits-change writable
> .MinValue                        property  x         0                                        emits-change writable
> .Scale                           property  x         -3                                       emits-change writable
> .Unit                            property  s         "xyz.openbmc_project.Sensor.Value.Unit.… emits-change writable

This looks like phosphor-hwmon, not dbus-sensors 
https://github.com/openbmc/dbus-sensors.


> .Value                           property  x         18500                                    emits-change writable
> 
> root@obmc:~# busctl --no-pager set-property xyz.openbmc_project.Hwmon-2439434288.Hwmon1  /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_project.Sensor.Value  Value x 50000
> 
> root@saber:~# busctl --no-pager get-property xyz.openbmc_project.Hwmon-2439434288.Hwmon1  /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_project.Sensor.Value  Value
> x 18500
> 
> root@obmc:~#
> 
> Thanks,
> Raj
> 
> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
> On Wednesday, December 4, 2019 1:34 AM, James Feist <james.feist@linux.intel.com> wrote:
> 
> &gt; On 12/3/19 5:49 AM, Alexander Amelkin wrote:
> &gt;
> &gt; &gt; 03.12.2019 15:06, rgrs wrote:
> &gt; &gt;
> &gt; &gt; &gt; Hi,
> &gt; &gt; &gt; How do I fake sensor readings in OpenBMC?
> &gt; &gt; &gt; We're trying to fake temperature sensors and make sure fans ramp up/down
> &gt; &gt; &gt; accordingly.
> &gt; &gt;
> &gt; &gt; We ended up patching the kernel driver to fake the readings by request.
> &gt; &gt; I'm not aware of any ready interface in OpenBMC for that.
> &gt;
> &gt; If you're using d-bus sensors, the sensor property is writable. It is
> &gt; also supported by patching the sensor value in redfish.
> &gt;
> &gt; &gt; With best regards,
> &gt; &gt; Alexander Amelkin
> 
> </james.feist@linux.intel.com>
> 
