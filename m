Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C61D61E8691
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 20:25:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YXzq0bYkzDqk5
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 04:25:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YXz86G4GzDqhC
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 04:24:36 +1000 (AEST)
IronPort-SDR: fdRtusvTmd1GuEjcRuykv+f/zd6ppPl4E8SOQGOL/oPp+SGAP44jELEEzOdXUvOkTZ7sN/HnAs
 2eG138bgujWg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 11:24:34 -0700
IronPort-SDR: UKfXJbx7yIbGeoeP+5bMOliZm3h3pOzT4sPYTTuiEvqH9tYf7KYJJjO4CwyI3DN0AJYMhWNUCT
 AvaN3QvB19UA==
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; d="scan'208";a="469588040"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 11:24:33 -0700
Date: Fri, 29 May 2020 11:24:32 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: James Feist <james.feist@linux.intel.com>
Subject: Re: Adding usb-ctrl from intel-bmc into phosphor-misc
Message-ID: <20200529182432.GB7478@mauery.jf.intel.com>
References: <CAGm54UEDRmEQVQ-WaRiUa+fpxL0UUe-OZ4rwRZHVLTUJBZZb=A@mail.gmail.com>
 <555375f27645bf26067fba4cfbfc5f5f8ac8c101.camel@fuzziesquirrel.com>
 <2856971c-8efc-cf48-a8c0-210bba71e92e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2856971c-8efc-cf48-a8c0-210bba71e92e@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29-May-2020 10:09 AM, James Feist wrote:
>On 5/28/2020 5:48 AM, Brad Bishop wrote:
>>On Wed, 2020-05-27 at 11:07 +0800, =E9=83=81=E9=9B=B7 wrote:
>>>There is a script [usb-ctrl][1] hosted in intel-bmc.
>>>It supports the VirtualMedia feature by insert/eject files to the host
>>>as a USB mass-storage device.
>>>Comparing to the existing [state_hook][2] in jsnbd, it supports
>>>multiple UDCs, so it supports mount multiple files.
>>>
>>>In addition, I have some updates on the usb-ctrl script to make it
>>>support the USB ECM device, which creates a USB ethernet device
>>>between BMC and the host.
>>>
>>>So my proposal is to add the `usb-ctrl` script into the phosphor-misc
>>>repo so that it gets reviewed and could be used by upstream.
>>>
>>>Any ideas?
>>>
>>>[1]:
>>>https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-c=
ommon/recipes-core/fw-update/files/usb-ctrl
>>>[2]:
>>>https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-laye=
r/recipes-connectivity/jsnbd/jsnbd/state_hook
>>>
>>
>>I'm the current maintainer of phosphor-misc and I am looking for help
>>with that.  I would be fine with adding this script to that repository.
>>It would be nice, but not required, to hear from the Intel team that
>>they would pull from the new location if we do this...
>
>Yes, we could start using it from there. Just would have to move the=20
>recipes to point to the right place. CCing Vernon who was the original=20
>author.

That old thing? :) Seems like a long time since I wrote that. I am fine=20
with it moving to a new home. That being said, it might be better off as=20
a c++ binary that is controlled from D-Bus than a shell script. It=20
started off as a script because we just needed it NOW.

--Vernon
