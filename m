Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1838825A
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 20:24:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464ttx6j54zDr2k
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 04:24:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464ts10z5tzDr3b
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 04:22:59 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 11:22:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,366,1559545200"; d="scan'208";a="259111781"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 09 Aug 2019 11:22:56 -0700
Subject: Re: entity-manager unexpected handling of template parameters
To: Patrick Venture <venture@google.com>
References: <CAO=notycFS1Zhjjt_n5J+mQwLTToZYwW-SM-FKQ-aaeSs4hMUw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <56c9b48b-da29-8ec3-dc16-0e37072c2eb7@linux.intel.com>
Date: Fri, 9 Aug 2019 11:22:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notycFS1Zhjjt_n5J+mQwLTToZYwW-SM-FKQ-aaeSs4hMUw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/9/19 9:53 AM, Patrick Venture wrote:
> Given the following:
> 
> busctl introspect --no-pager xyz.openbmc_project.FruDevice
> /xyz/openbmc_project/FruDevice/Altie
> NAME                                TYPE      SIGNATURE RESULT/VALUE
>              FLAGS
> org.freedesktop.DBus.Introspectable interface -         -
>              -
> .Introspect                         method    -         s
>              -
> org.freedesktop.DBus.Peer           interface -         -
>              -
> .GetMachineId                       method    -         s
>              -
> .Ping                               method    -         -
>              -
> org.freedesktop.DBus.Properties     interface -         -
>              -
> .Get                                method    ss        v
>              -
> .GetAll                             method    s         a{sv}
>              -
> .Set                                method    ssv       -
>              -
> .PropertiesChanged                  signal    sa{sv}as  -
>              -
> xyz.openbmc_project.FruDevice       interface -         -
>              -
> .ADDRESS                            property  u         82
>              emits-change
> .BOARD_LANGUAGE_CODE                property  s         "25"
>              emits-change
> .BOARD_MANUFACTURER                 property  s         "Inventec"
>              emits-change
> .BOARD_MANUFACTURE_DATE             property  s         "Thu Jul 11
> 17:09:00 2019" emits-change
> .BOARD_PART_NUMBER                  property  s         "1051867-01"
>              emits-change
> .BOARD_PRODUCT_NAME                 property  s         "Altie"
>              emits-change
> .BOARD_SERIAL_NUMBER                property  s
> "ALTIVT192700026"          emits-change
> .BUS                                property  u         1
>              emits-change
> .Common_Format_Version              property  s         "1"
>              emits-change
> 
> I expected entity-manager with this profile to populate dbus properly:
> configurations/altie.json
> {
>      "Name" : "Altie",
>      "Probe" : "xyz.openbmc_project.FruDevice({'BOARD_PRODUCT_NAME': 'Altie'})",
>      "Type": "Board",
>      "xyz.openbmc_project.Inventory.Decorator.Asset": {
>          "Manufacturer": "$BOARD_MANUFACTURER",
>          "Model": "$BOARD_PRODUCT_NAME",
>          "PartNumber": "$BOARD_PART_NUMBER",
>          "SerialNumber": "$BOARD_SERIAL_NUMBER"
>      }
> }
> 
> Instead:
> root@semitruck:~# busctl introspect --no-pager
> xyz.openbmc_project.EntityManager
> /xyz/openbmc_project/inventory/system/board/Altie
> NAME                                          TYPE      SIGNATURE
> RESULT/VALUE                             FLAGS
> org.freedesktop.DBus.Introspectable           interface -         -
>                                      -
> .Introspect                                   method    -         s
>                                      -
> org.freedesktop.DBus.Peer                     interface -         -
>                                      -
> .GetMachineId                                 method    -         s
>                                      -
> .Ping                                         method    -         -
>                                      -
> org.freedesktop.DBus.Properties               interface -         -
>                                      -
> .Get                                          method    ss        v
>                                      -
> .GetAll                                       method    s
> a{sv}                                    -
> .Set                                          method    ssv       -
>                                      -
> .PropertiesChanged                            signal    sa{sv}as  -
>                                      -
> xyz.openbmc_project.AddObject                 interface -         -
>                                      -
> .AddObject                                    method    a{sv}     -
>                                      -
> xyz.openbmc_project.Inventory.Decorator.Asset interface -         -
>                                      -
> .Manufacturer                                 property  s
> "$BOARD_MANUFACTURER"                    emits-change
> .Model                                        property  s
> "$BOARD_PRODUCT_NAME"                    emits-change
> .PartNumber                                   property  s
> "$BOARD_PART_NUMBER"                     emits-change
> .SerialNumber                                 property  s
> "$BOARD_SERIAL_NUMBER"                   emits-change
> xyz.openbmc_project.Inventory.Item.Board      interface -         -
>                                      -
> .Name                                         property  s
> "Altie"                                  emits-change
> .Probe                                        property  s
> "xyz.openbmc_project.FruDevice({\'BOA... emits-change
> .Type                                         property  s
> "Board"                                  emits-change
> 
> I must be doing something obvious and silly.  Please advise.

Entity-manager caches the result and only updates if etc/os-release 
changes. There is a version file in /var/configuration/version, if you 
delete this it'll rescan fresh. It looks right to me.. so I imagine this 
is what is happening.

-James
> 
> Thanks,
> Patrick
> 
