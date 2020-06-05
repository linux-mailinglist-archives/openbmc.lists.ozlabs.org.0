Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB81F00D2
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 22:15:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dv5r6GZHzDr1x
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 06:15:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dv506gbczDr10
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jun 2020 06:14:42 +1000 (AEST)
IronPort-SDR: lQ6lCiXVVP3YVg3Fli4iGi9W9ZP+1dQr3Fs5XYxNSQyWKX4eAU6U1QCyXZvFcnRiXmRDDiwcq1
 eSSo2Y1EWuPg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 13:14:39 -0700
IronPort-SDR: Qssf7K96Kpaac9/jZqMVxV7UwcIHqkbP1RYa3FCdcG/YMmSNhthDP22u6nicibH2bCp81VSopp
 xLWUC+fSW1cA==
X-IronPort-AV: E=Sophos;i="5.73,477,1583222400"; d="scan'208";a="273576647"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 13:14:39 -0700
Date: Fri, 5 Jun 2020 13:14:38 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: kcsbridge cannot work with the latest sdbusplus package.
Message-ID: <20200605201438.GD7478@mauery.jf.intel.com>
References: <25e5caa0753f41f1b6524c351ee87011@quantatw.com>
 <20200605153321.GM17541@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200605153321.GM17541@heinlein>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Fran Hsu =?utf-8?B?KOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 05-Jun-2020 10:33 AM, Patrick Williams wrote:
>On Fri, Jun 05, 2020 at 12:57:35PM +0000, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=
=AC=99) wrote:
>> Hi All,
>> 	I built the BMC FW from the latest OpenBMC branch. And I found the ksc =
channel is not working.
>> I got the following error message:
>> 	kcsbridged -c ipmi-kcs1
>> 	terminate called after throwing an instance of 'sdbusplus::exception::S=
dBusError'
>>   	what():  Invalid path or interface: org.freedesktop.DBus.Error.Invali=
dArgs: Invalid argument
>> 	Aborted (core dumped)
>>  So I did a check of the recent package changes.
>> The latest sdbusplus add the "validate interface and path passed to DBus=
", but there is a problem when kcsbridge call the "add_interface" API, the =
part of the regex checking function.
>> https://github.com/openbmc/sdbusplus/blob/7f664254a4365612b82db2fd8fb827=
98686e777b/include/sdbusplus/asio/object_server.hpp#L811
>> kcsbridge takes the one parameter of the /dev/ipmi-kcs*. But regex funct=
ion didn't allow the character '-', so I got the exception message.
>> Does it need to add the regex checking to the "add_interface" API? Or ad=
d the character '-' to the regex checking pattern?
>>
>> Thanks
>> Fran Hsu
>> E-Mail : Fran.Hsu@QuantaTW.com
>>
>
>Hi Fran,
>
>kcsbridged needs an update to not use a -.  This was added because:
>
>    - The dbus spec is very clear about valid names for Interfaces,
>      Object Paths, and Services [1].
>
>    - In some cases, sdbus itself and/or the dbus daemon actively check
>      for valid names and give an error, but in a few cases the error
>      was being ignored by applications.
>
>    - For names that sdbus was not verifying, it is possible they add
>      verification in the future and cause code breakage.
>
>I know I was helping one developer recently who was adding a new dbus
>element and they were stumped as to why their object was not showing up
>as they expected.  It was due to an invalid name that sdbus was
>dropping.  Rather than a silent error from sdbus we made this a hard,
>obvious error, by throwing an exception.
>
>Thanks for reporting the issue.  Are you interested in working up a fix,
>otherwise Vernon is the only listed maintainer presently?

Currently, we are dealing with this issue using a symlink to alias the=20
kcs device.

root@intel-obmc:/tmp# cat /lib/udev/rules.d/99-ipmi-kcs.rules
KERNEL=3D=3D"ipmi-kcs3", SYMLINK+=3D"ipmi_kcs3"
KERNEL=3D=3D"ipmi-kcs4", SYMLINK+=3D"ipmi_kcs4"

Then we add the instance of the kcsbridge with the ipmi_kcs3 name. Keep=20
in mind that whatever name you use, it should match the name in the=20
/usr/share/ipmid-providers/channel_config.json file.

--Vernon

