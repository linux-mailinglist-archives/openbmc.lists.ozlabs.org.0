Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4A212DCC
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 22:21:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yTy92Lv6zDqQ9
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 06:21:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yTS90lPDzDr6K
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 05:58:47 +1000 (AEST)
IronPort-SDR: i6+6QaHhsW20JkvOkhrv0WHN6vzhWrI4dlnvsk4f/xZ6KgGxyGsRXJEqkVkvmWsK9eiwwM+mAQ
 b9xeqC4INjxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="208539805"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="208539805"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:58:45 -0700
IronPort-SDR: VasrYnZcc0dv1u8i/vb0jypjC6DHpd7ZKO9RZJ6pJOCR19BHqyrDq9XK+NFw9vLZx/gJau+U7l
 KtJlz4LiyerQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="278218908"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 02 Jul 2020 12:58:45 -0700
Received: from [10.209.134.10] (jmbills-mobl.amr.corp.intel.com
 [10.209.134.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3B8D8580708
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 12:58:45 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Weird build dependency issue causing missing symbols
Message-ID: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
Date: Thu, 2 Jul 2020 12:58:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi All,

We are hitting a weird build dependency issue with Yocto and 
phosphor-dbus-interfaces and are looking for any help or insight anyone 
may have on how to fix it.  We have not been able to pinpoint exactly 
when the issue started, but we believe it has come up since the dunfell 
update.

The symptom of this issue is we see an undefined symbol error at runtime:
[  101.733677] Jul 02 10:37:48 intel-obmc phosphor-ledcontroller[461]: 
phosph
or-ledcontroller: symbol lookup error: phosphor-ledcontroller: undefined 
symbol: 
_ZN9sdbusplus3xyz15openbmc_project3Led6server8Physical17setPropertyByNameERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKSt7variantIJtNS4_7PaletteEhNS4_6ActionEEEb

Once we hit this error, it persists across rebuilds until we delete the 
Yocto build directory (likely something in the cache) and start a fresh 
build.

We have narrowed this down to being caused by two separate issues:
1. When phosphor-dbus-interfaces is rebuilt it will sometimes change the 
order of the PropertiesVariant in server.hpp.
2. When the order of PropertiesVariant changes on a rebuild, the recipes 
that already have an old copy of server.hpp are not triggered to rebuild 
and are left with the old copy of server.hpp.

I have a system that is in this state and have found that if I taint 
phosphor-dbus-interfaces by running "bitbake -C fetch 
phosphor-dbus-interfaces", I see many components rebuild and the symbol 
issue goes away.  If I then remove the taint by running "bitbake -c 
clean phosphor-dbus-interfaces" only phosphor-dbus-interfaces and any 
components in my devtool status list rebuild and the symbol issue comes 
back.

We ran an experiment where we compared the contents of 
".../Led/Physical/server.hpp" between components by running this command 
(where the base file came from an existing build):
for fname in $(find . -iname server.hpp|grep -i "led/physical"); do echo 
"$fname"; diff 
"./tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-network/1.0+gitAUTOINC+d0679f9bb4-r1/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp" 
"$fname"; done

With the tainted phosphor-dbus-interfaces, there is no diff in any of 
the server.hpp files.

After cleaning the taint and rebuilding, I get the following results:
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-sel-logger/0.1+gitAUTOINC+761bf202ba-r0/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+e4f710d7d9-r0/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-dbus-interfaces/1.0+gitAUTOINC+26ff1c8446-r1/sysroot-destdir/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
66,67c66
<                 Action,
<                 uint16_t,
---
 >                 uint8_t,
69c68,69
<                 uint8_t>;
---
 >                 Action,
 >                 uint16_t>;
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-ipmi-ipmb/0.1+gitAUTOINC+a86059348f-r0/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-host-postd/0.1+gitAUTOINC+bf002b46d5-r1/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-network/1.0+gitAUTOINC+d0679f9bb4-r1/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/x86-power-control/1.0+gitAUTOINC+b0c613aa88-r0/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
66,67c66
<                 Action,
<                 uint16_t,
---
 >                 uint8_t,
69c68,69
<                 uint8_t>;
---
 >                 Action,
 >                 uint16_t>;
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-post-code-manager/1.0+gitAUTOINC+9d91a39a3a-r0/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/obmc-ikvm/1.0+gitAUTOINC+861337e8ec-r0/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/service-config-manager/0.1+gitAUTOINC+83241c09ec-r0/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-ipmi-kcs/1.0+gitAUTOINC+d8594e9a62-r1/recipe-sysroot/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
./tmp/sysroots-components/arm1176jzs/phosphor-dbus-interfaces/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
66,67c66
<                 Action,
<                 uint16_t,
---
 >                 uint8_t,
69c68,69
<                 uint8_t>;
---
 >                 Action,
 >                 uint16_t>;

The order of the variant changed in server.hpp in 
phosphor-dbus-interfaces.  I had x86-power-control in my devtool status 
list, so it rebuilt and got the new copy of server.hpp, but everything 
else still had the old copy.

Does anyone have any ideas on what could be happening or if we're 
missing something to properly trigger the rebuilds?

Thanks for your help!
-Jason
