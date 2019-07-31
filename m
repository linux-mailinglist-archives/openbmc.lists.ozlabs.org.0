Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A49297C8C9
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 18:34:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zJt81c4CzDqlQ
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 02:34:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zJsL5NyszDqfV
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 02:33:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 09:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="256201469"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2019 09:33:55 -0700
Subject: Re: entity-manager exposing eeproms
To: Patrick Venture <venture@google.com>
References: <CAO=notyvYn5-VTKys86NVzXXturPh=Q-5DFsR_ZvGeoJs=P0PQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <401cb4b9-4f2b-0722-af80-106cf538fe37@linux.intel.com>
Date: Wed, 31 Jul 2019 09:33:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notyvYn5-VTKys86NVzXXturPh=Q-5DFsR_ZvGeoJs=P0PQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/29/19 10:55 AM, Patrick Venture wrote:
> Hi;
> 
> Sorry to flood with questions, but I'm hoping I won't be the only
> person asking and in the future, other machines starting to use
> entity-manager will find these useful.
> 
> I've added the following configuration:
> 
> cat configurations/semitruck.json
> {
>      "Exposes": [
>          {
>              "Address": "0x50",
>              "Bus": 14,
>              "Name": "Aberdeen",
>              "Type": "24C64"
>          },
>          {
>              "Address": "0x50",
>              "Bus": 15,
>              "Name": "Energia",
>              "Type": "24C64"
>          }
>      ],
>      "Name": "Aberdeen Baseboard",
>      "Probe" : "TRUE",
>      "Type": "Board"
> }
> 
> And I see:
> i2c i2c-14: new_device: Instantiated device 24c64 at 0x50
> i2c i2c-15: new_device: Instantiated device 24c64 at 0x50
> 
> And I see:
> Service xyz.openbmc_project.EntityManager:
> `-/xyz
>    `-/xyz/openbmc_project
>      |-/xyz/openbmc_project/EntityManager
>      `-/xyz/openbmc_project/inventory
>        `-/xyz/openbmc_project/inventory/system
>          `-/xyz/openbmc_project/inventory/system/board
>            |-/xyz/openbmc_project/inventory/system/board/Aberdeen_Baseboard
> 
> busctl introspect xyz.openbmc_project.EntityManager
> /xyz/openbmc_project/inventory/system/board/Aberdeen_Baseboard
> --no-pager
> NAME                                     TYPE      SIGNATURE
> RESULT/VALUE         FLAGS
> org.freedesktop.DBus.Introspectable      interface -         -
>             -
> .Introspect                              method    -         s
>             -
> org.freedesktop.DBus.Peer                interface -         -
>             -
> .GetMachineId                            method    -         s
>             -
> .Ping                                    method    -         -
>             -
> org.freedesktop.DBus.Properties          interface -         -
>             -
> .Get                                     method    ss        v
>             -
> .GetAll                                  method    s         a{sv}
>             -
> .Set                                     method    ssv       -
>             -
> .PropertiesChanged                       signal    sa{sv}as  -
>             -
> xyz.openbmc_project.AddObject            interface -         -
>             -
> .AddObject                               method    a{sv}     -
>             -
> xyz.openbmc_project.Inventory.Item.Board interface -         -
>             -
> .Name                                    property  s         "Aberdeen
> Baseboard" emits-change
> .Probe                                   property  s         "TRUE"
>             emits-change
> .Type                                    property  s         "Board"
>             emits-change
> 
> For the two eeproms listed, neither are currently supported by
> FruDevice.  It's my understanding that entity-manager "exposes"
> things, and I see it adding the eeproms successfully -- but then
> doesn't populate them to dbus.  It populates a configuration space for
> the sensors, so I expected the same for eeproms.

FruDevice != Entity manager. They were kept completely separate, so the 
fru device doesn't know anything about the Entity Manager. The Entity 
Manager simply looks for any interface in it's probe statement to add 
devices. In theory you could create a probe that looked like 
xyz.openbmc_project.Sensor.Value('Value':'20'). Entity manager is adding 
sysfs devices, and some happen to be eeproms.

> 
> Am I missing something, or?
> 
> Thanks,
> Patrick
> 
