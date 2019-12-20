Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40855128371
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 22:00:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fh3B2hPpzDqty
	for <lists+openbmc@lfdr.de>; Sat, 21 Dec 2019 08:00:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fh2K2jSFzDqZQ
 for <openbmc@lists.ozlabs.org>; Sat, 21 Dec 2019 07:59:34 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 12:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,337,1571727600"; d="scan'208";a="267617753"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2019 12:59:30 -0800
Subject: Re: Exposing sensors to IPMI over dbus
To: AKASH G J <akashgj91@gmail.com>
References: <CAE33tLFu8BVN0s0sf3AT9e9dkBEqhZ2xqMSotpCMwbO0Jia-iA@mail.gmail.com>
 <b8f62b3b-e18a-d6a0-f0c2-07e079bb301b@linux.intel.com>
 <CAE33tLFOw1R=CvTMDvetBrtdRcWhKNv_Hf=xBQgJtP1xM8i_sw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <7d8ab7b4-b896-f805-2886-8cafc0e4c487@linux.intel.com>
Date: Fri, 20 Dec 2019 12:59:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAE33tLFOw1R=CvTMDvetBrtdRcWhKNv_Hf=xBQgJtP1xM8i_sw@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/20/19 4:08 AM, AKASH G J wrote:
> Thanks for the help.
> 
> I changed  "Probe" : "TRUE", now entity manager configuration file is 
> parsed and published to dbus a configuration.
> 
> root@rudra:~# busctl introspect --no-pager 
> xyz.openbmc_project.EntityManager \
>> /xyz/openbmc_project/inventory/system/board/Rudra_Baseboard/bmc_temp
> NAME                                                TYPE      SIGNATURE 
> RESULT/VALUE     FLAGS
> org.freedesktop.DBus.Introspectable                 interface -         
> -                -
> .Introspect                                         method    -         
> s                -
> org.freedesktop.DBus.Peer                           interface -         
> -                -
> .GetMachineId                                       method    -         
> s                -
> .Ping                                               method    -         
> -                -
> org.freedesktop.DBus.Properties                     interface -         
> -                -
> .Get                                                method    ss       
>   v                -
> .GetAll                                             method    s         
> a{sv}            -
> .Set                                                method    ssv       
> -                -
> .PropertiesChanged                                  signal    sa{sv}as 
>   -                -
> xyz.openbmc_project.Configuration.TMP75             interface -         
> -                -
> .Address                                            property  s         
> "0x4a"           emits-change


This should have been translated to an int, and is most likely the 
issue. Are you using an old version of entity-manager? If not it is a 
bug. You can also write it as the int version in the configuration file 
as a workaround, but I think this was fixed and was specifically an 
issue with using the TRUE probe.


> .Bus                                                property  t         
> 5                emits-change
> .Name                                               property  s         
> "bmc_temp"       emits-change
> .Type                                               property  s         
> "TMP75"          emits-change
> xyz.openbmc_project.Configuration.TMP75.Thresholds0 interface -         
> -                -
> .Delete                                             method    -         
> i                -
> .Direction                                          property  s         
> "greater than"   emits-change writable
> .Name                                               property  s         
> "upper critical" emits-change writable
> .Severity                                           property  d         
> 1                emits-change writable
> .Value                                              property  d         
> 80               emits-change writable
> 
> dbus-sensors hwmon temperature sensor daemon is not recognizing the 
> configuration interface: xyz.openbmc_project.Configuration.TMP75
> 
> root@rudra:~# busctl tree --no-pager xyz.openbmc_project.HwmonTempSensor
> Failed to introspect object / of service 
> xyz.openbmc_project.HwmonTempSensor: The name is not activatable
> No objects discovered.
> 
> In journalctl log the following messages are coming.
> 
> hwmontempsensor[153]: Error communicating to entity manager
> hwmontempsensor[566]: terminate called after throwing an instance of 
> 'std::bad_variant_access'
> hwmontempsensor[566]:   what():  Unexpected index
> phosphor-mapper[210]: Introspect call failed with error: generic:110, 
> Connection timed out on process: xyz.openbmc_project.HwmonTempSensor path: /
> systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Main process 
> exited, code=killed, status=6/ABRT
> systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Failed with 
> result 'signal'.
> systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Service 
> RestartSec=5s expired, scheduling restart.
> systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Scheduled 
> restart job, restart counter is at 4.
> systemd[1]: Stopped Hwmon Temp Sensor.
> phosphor-mapper[210]: Introspect call failed with error: generic:110, 
> Connection timed out on process: xyz.openbmc_project.HwmonTempSensor path: /
> systemd-udevd[97]: Spawned process '/usr/bin/start_hwmon.sh start 
> /devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a180.i2c-bus/i2c-5/5-004c/hwmon/hwmon2 
> /ahb/apb/bus@1e78a000/i2c-bus@180/tmp75@4c' [104] is taking longer than 
> 59s to complete
> 
> 
> 
> Thanks and Regards,
> 
> Akash
> 
> On Fri, Dec 20, 2019 at 12:42 AM James Feist 
> <james.feist@linux.intel.com <mailto:james.feist@linux.intel.com>> wrote:
> 
>     On 12/19/19 1:12 AM, AKASH G J wrote:
>      > Hi all,
>      > I am using OpenBMC firmware for server board having Aspeed AST-2500.
>      >
>      > Followed
>      >
>     https://github.com/openbmc/entity-manager/blob/master/docs/my_first_sensors.md
> 
>      > for populating sensor value to dbus. Entity manager configuration
>     file
>      > is given below.
>      > {
>      >      "Exposes": [
>      >          {
>      >              "Address": "0x4f",
>      >              "Bus": 5,
>      >              "Name": "cpu0_vrd_temp",
>      >              "Thresholds": [
>      >                  {
>      >                      "Direction": "greater than",
>      >                      "Name": "upper critical",
>      >                      "Severity": 1,
>      >                      "Value": 80
>      >                  }
>      >              ],
>      >              "Type": "TMP75"
>      >          }
>      >      ],
>      >      "Name": "Rudra Baseboard",
>      >      "Probe":
>     "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
>      > 'RUDRA'})",
>      >      "Type": "Board",
>      >      "xyz.openbmc_project.Inventory.Decorator.Asset": {
>      >          "Manufacturer": "$BOARD_MANUFACTURER",
>      >          "Model": "$BOARD_PRODUCT_NAME",
>      >          "PartNumber": "$BOARD_PART_NUMBER",
>      >          "SerialNumber": "$BOARD_SERIAL_NUMBER"
>      >      }
>      > }
>      >
>      > Wrote sample FRU information on eeprom with the following
>     content. Used
>      > dd command for writing to eeprom.
>      >
>      > root@s2600wf:/sys/bus/i2c/devices/3-0056# cat eeprom
>      > Product:
>      >    MANUFACTURER  "ABC"
>      >    PART_NUMBER   "12345"
>      >    PRODUCT_NAME  "SAMPLENAME"
>      >    SERIAL_NUMBER "12312490840"
> 
>     This is not a legal IMPI FRU. FRU Device only allows legal fru based on
>     the spec:
>     https://www.intel.com/content/www/us/en/servers/ipmi/ipmi-platform-mgt-fru-infostorage-def-v1-0-rev-1-3-spec-update.html
> 
>     For testing purposes using "Probe" : "TRUE" can be used as well.
>      >
>      > The dbus tree not showing /xyz/openbmc_project/FruDevice/SAMPLENAME
>      >
>      > root@s2600wf:~# busctl tree --no-pager xyz.openbmc_project.FruDevice
>      > `-/xyz
>      >    `-/xyz/openbmc_project
>      >      `-/xyz/openbmc_project/FruDevice
>      >
>      > In journalctl log the following messages are printed.
>      >
>      > systemd[1]: Started Hwmon Temp Sensor.
>      > hwmontempsensor[120]: Error communicating to entity manager
>      > hwmontempsensor[120]: error communicating to entity manager
>      >
>      > Look like FruDevice daemon is not parsing the contents of eeprom and
>      > publish them to dbus.
>      >
>      > Is there any thing missing in configuration? Please help to
>     resolve the
>      > problem.
>      >
>      >
>      >
>      > Thanks,
>      >
>      > Akash
>      >
> 
