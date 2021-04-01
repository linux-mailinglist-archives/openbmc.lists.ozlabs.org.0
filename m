Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4073514EF
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 14:56:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB38x5KHGz30Lg
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 23:56:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=CoK+XDW/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.132;
 helo=mail-40132.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=CoK+XDW/; 
 dkim-atps=neutral
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB38g5Wyzz2y8F
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 23:56:16 +1100 (AEDT)
Date: Thu, 01 Apr 2021 12:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1617281770;
 bh=pdk+WzTz3NvYjvs8KAfU/GVe+eqlGc2VC/ER38hjb/U=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=CoK+XDW/QquQ/oRgBZCbFB8sx1doMy/LiTjn5dyyJlIrXXNFzvnq8JM9e/eNTeyXz
 mHjdguoEtb9ELLJHBzoN4lVJ7oO8Vd+jq5gJ4hVbfcje1BJJalz6rwvZr2/QK4HqjW
 rWfTTlCy2DbSB03VjZfTm+/Jyi32gkSYpzp3l/0A=
To: Lei Yu <yulei.sh@bytedance.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: IPMI SEL Parsing
Message-ID: <2FVxBtO4gLzVYqZqGL8XwOcI2a_r6x0CaPGmGozxe_VeNp3Y3y05vSntyZPvfn4EDRsHsLjWJnrVSzbeeVDKhPvLILmFKB3hw-MFaEvepAw=@protonmail.com>
In-Reply-To: <CAGm54UHGr+F-vnO69PLr0MN699BDEDsZiHYoX1WPmF1DZnQLVw@mail.gmail.com>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
 <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
 <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
 <CAGm54UHGr+F-vnO69PLr0MN699BDEDsZiHYoX1WPmF1DZnQLVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: rgrs <rgrs@protonmail.com>
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei,



Is FRU EEPROM required for inventory to work? My board has unprogrammed EEP=
ROM.

I constructed the busctl command according as below, I still get =E2=80=
=9CUndetermined Hardware Failure=E2=80=9D. Please can you let me know if my=
 config YAML has any issues?


# busctl call "xyz.openbmc_project.Logging.IPMI" "/xyz/openbmc_project/Logg=
ing/IPMI" xyz.openbmc_project.Logging.IPMI IpmiSelAdd ssaybq "Sensor messag=
e" /xyz/openbmc_project/sensors/temperature/BMC_Temp 3 0x01 0xFF 0xFF true =
0x20



My Config YAML files has only one sensor for now:


sp3-ipmi-inventory-sensors.yaml

-------------------------------

/xyz/openbmc_project/inventory/system:

    eventReadingType: 111

    offset: 2

    sensorID: 144

    sensorType: 18

/xyz/openbmc_project/inventory/system/chassis/motherboard:

    eventReadingType: 3

    offset: 0

    sensorID: 140

    sensorType: 199

/xyz/openbmc_project/inventory/system/chassis/motherboard/bmc:

    eventReadingType: 0x01

    offset: 0xFF

    sensorID: 1

    sensorType: 0x01



sp3-ipmi-sensors.yaml

---------------------

1:

  sensorType: 0x01

  entityID: 0x06

  path: /xyz/openbmc_project/sensors/temperature/BMC_Temp

  sensorReadingType: 0x01

  unit: xyz.openbmc_project.Sensor.Value.Unit.DegreesC

  scale: 0

  offsetB: 0

  bExp: 0

  rExp: 0

  mutability: Mutability::Write | Mutability::Read

  serviceInterface: org.freedesktop.DBus.Properties

  readingType: readingData

  interfaces:

    xyz.openbmc_project.Sensor.Value:

      Value:

        Offsets:

          0xFF:

            type: double



sp3-ipmi-fru.yaml

-----------------

0:

  /system/chassis/motherboard/bmc:

    entityID: 6

    entityInstance: 1

    interfaces:

      xyz.openbmc_project.Inventory.Decorator.Asset:

        BuildDate:

          IPMIFruProperty: Mfg Date

          IPMIFruSection: Board

        SerialNumber:

          IPMIFruProperty: Serial Number

          IPMIFruSection: Board

        PartNumber:

          IPMIFruProperty: Part Number

          IPMIFruSection: Board

        Manufacturer:

          IPMIFruProperty: Manufacturer

          IPMIFruSection: Board

      xyz.openbmc_project.Inventory.Item:

        PrettyName:

          IPMIFruProperty: Name

          IPMIFruSection: Board

      xyz.openbmc_project.Inventory.Decorator.Revision:

        Version:

          IPMIFruProperty: FRU File ID

          IPMIFruSection: Board



associations.json =E2=80=93 PIM recipe

------------------------------

[

    {

        "path": "system/chassis/motherboard",

        "endpoints":

        [

            {

                "types":

                {

                    "rType": "inventory",

                    "fType": "sensors"

                },

                "paths":

                [

                    "/xyz/openbmc_project/sensors/temperature/BMC_Temp"

                ]

            }

        ]

    },

      {

        "path": "system/chassis/motherboard/bmc",

        "endpoints":

        [

            {

                "types":

                {

                    "rType": "inventory",

                    "fType": "sensors"

                },

                "paths":

                [

                     "/xyz/openbmc_project/sensors/temperature/BMC_Temp"

                ]

            }

        ]

    },

    {

        "path": "system/chassis",

        "endpoints":

        [

            {

                "types":

                {

                    "rType": "chassis",

                    "fType": "all_sensors"

                },

                "paths":

                [

                    "/xyz/openbmc_project/sensors/temperature/BMC_Temp"

                ]

            }

        ]

    }

]

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Tuesday, 30 March 2021 07:38, Lei Yu <yulei.sh@bytedance.com> wrote:

> On Mon, Mar 29, 2021 at 11:37 PM rgrs rgrs@protonmail.com wrote:
>
> > Hi Lei,
> > Thanks, phosphor-sel-logger logs to phosphor-logging after enabling SEL=
_LOGGER_SEND_TO_LOGGING_SERVICE.
> > The APIs IpmiSelAdd() adds entry to SELs (tested using busctl)
> > But, "ipmitool sel list" doesn't print correctly. It prints "Undetermin=
ed Hardware Failure" for these entries.
>
> You need to define the inventory-sensor yaml for ipmid so that it
> knows how to map the sensor id to inventories.
> Then ipmid will construct the expected sel data.
> See details in https://github.com/openbmc/phosphor-host-ipmid/blob/master=
/selutility.cpp#L149
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------------
>
> BRs,
> Lei YU


