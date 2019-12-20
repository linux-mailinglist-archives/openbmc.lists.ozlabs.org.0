Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4A127AC2
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 13:11:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fSJc6D9PzDqx1
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 23:11:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=akashgj91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xs6wzIQq"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fSHG4VKQzDqtl
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 23:10:00 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id p67so4286026oib.13
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 04:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ce+lTSx+leVfmasEiFTElDp7prcVJQQJgnim4+yCr9k=;
 b=Xs6wzIQqiu9RWoBEAW9QlQgA3PgLG22cN8bQqDxfrQRUouVAw4gRhjpdnzhJIntO6J
 X0/7r+Vh3//RnzSJvgH3pjI7+VWk+H5maoHLb2jqYsGaI86AA1ZoEx5Gd1mgkWfqx519
 JxLGxZhe4EvcDtUVYNPjacE0gXSH+8ff5lYt6Qrs+5t7CJdSDVrEQlD+1iAyY/4Y3+i8
 j35u5SpRatMyXngLjdBeZIZZg44OX5blScY7hOIiLXY/UkbU4dh7eC40OOYJBX0hnxUw
 2GpA2yld52+SI9ZwTeEGtPzX367xy5gSQYZEU6zaVlQ1l98bWDQEdTGrDVrpcDg0ITjb
 wGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ce+lTSx+leVfmasEiFTElDp7prcVJQQJgnim4+yCr9k=;
 b=RSITJo0RJgAs40HyT6vpPth40DjLZLIqK7o0EtdiRxLmx/te1KvyQdb3x+/OtMcPAC
 AmAEA7xaX52rq1IqDLSzmtTya1MjQLWxCT3hNnyALNOujdarGrvOzVFI8/ES/48ZaIfB
 ZILgkhYhobKtyVMzxZQVvivB4Em/7aZHFR2qZ7L7jIxUxxOR1jKL2TOoOSr/iYMO5AMB
 exREBs761zyDAhyxavgAd3uMipcBP0bIte1adnAwujkd/1eALj/ljln9gQh0x23Ymss6
 QK4MoeVxSlLB3TvTzFy55Kt5v9SYL5YvQihq+7NSyURZktsdjXjBpyBGT+LvyUVGO2Vh
 gCww==
X-Gm-Message-State: APjAAAW85oBZ+VIfKb/FViM9TpcDjZhKxCeZmH4zw4X7FChsYzcrms6F
 5hlAGhPa73obVWMhx/++i1NNhcztaiW3fFKFPCM=
X-Google-Smtp-Source: APXvYqzxA7W1Dba5ZimGwGIyuVlaiTaTlSrFeQ66Cr7Nx7ebFfQ0zwkdbBduNGvB0pVgmDmI5DcmWT6TYIktYgjrcWI=
X-Received: by 2002:aca:5cc1:: with SMTP id q184mr3260820oib.122.1576843796395; 
 Fri, 20 Dec 2019 04:09:56 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLFu8BVN0s0sf3AT9e9dkBEqhZ2xqMSotpCMwbO0Jia-iA@mail.gmail.com>
 <b8f62b3b-e18a-d6a0-f0c2-07e079bb301b@linux.intel.com>
In-Reply-To: <b8f62b3b-e18a-d6a0-f0c2-07e079bb301b@linux.intel.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 20 Dec 2019 17:38:39 +0530
Message-ID: <CAE33tLFOw1R=CvTMDvetBrtdRcWhKNv_Hf=xBQgJtP1xM8i_sw@mail.gmail.com>
Subject: Re: Exposing sensors to IPMI over dbus
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000059bf96059a218e2e"
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

--00000000000059bf96059a218e2e
Content-Type: text/plain; charset="UTF-8"

Thanks for the help.

I changed  "Probe" : "TRUE", now entity manager configuration file is
parsed and published to dbus a configuration.

root@rudra:~# busctl introspect --no-pager
xyz.openbmc_project.EntityManager \
> /xyz/openbmc_project/inventory/system/board/Rudra_Baseboard/bmc_temp
NAME                                                TYPE      SIGNATURE
RESULT/VALUE     FLAGS
org.freedesktop.DBus.Introspectable                 interface -         -
             -
.Introspect                                         method    -         s
             -
org.freedesktop.DBus.Peer                           interface -         -
             -
.GetMachineId                                       method    -         s
             -
.Ping                                               method    -         -
             -
org.freedesktop.DBus.Properties                     interface -         -
             -
.Get                                                method    ss        v
             -
.GetAll                                             method    s
a{sv}            -
.Set                                                method    ssv       -
             -
.PropertiesChanged                                  signal    sa{sv}as  -
             -
xyz.openbmc_project.Configuration.TMP75             interface -         -
             -
.Address                                            property  s
"0x4a"           emits-change
.Bus                                                property  t         5
             emits-change
.Name                                               property  s
"bmc_temp"       emits-change
.Type                                               property  s
"TMP75"          emits-change
xyz.openbmc_project.Configuration.TMP75.Thresholds0 interface -         -
             -
.Delete                                             method    -         i
             -
.Direction                                          property  s
"greater than"   emits-change writable
.Name                                               property  s
"upper critical" emits-change writable
.Severity                                           property  d         1
             emits-change writable
.Value                                              property  d         80
              emits-change writable

dbus-sensors hwmon temperature sensor daemon is not recognizing the
configuration interface: xyz.openbmc_project.Configuration.TMP75

root@rudra:~# busctl tree --no-pager xyz.openbmc_project.HwmonTempSensor
Failed to introspect object / of service
xyz.openbmc_project.HwmonTempSensor: The name is not activatable
No objects discovered.

In journalctl log the following messages are coming.

hwmontempsensor[153]: Error communicating to entity manager
hwmontempsensor[566]: terminate called after throwing an instance of
'std::bad_variant_access'
hwmontempsensor[566]:   what():  Unexpected index
phosphor-mapper[210]: Introspect call failed with error: generic:110,
Connection timed out on process: xyz.openbmc_project.HwmonTempSensor path: /
systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Main process
exited, code=killed, status=6/ABRT
systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Failed with result
'signal'.
systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Service
RestartSec=5s expired, scheduling restart.
systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Scheduled restart
job, restart counter is at 4.
systemd[1]: Stopped Hwmon Temp Sensor.
phosphor-mapper[210]: Introspect call failed with error: generic:110,
Connection timed out on process: xyz.openbmc_project.HwmonTempSensor path: /
systemd-udevd[97]: Spawned process '/usr/bin/start_hwmon.sh start
/devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a180.i2c-bus/i2c-5/5-004c/hwmon/hwmon2
/ahb/apb/bus@1e78a000/i2c-bus@180/tmp75@4c' [104] is taking longer than 59s
to complete



Thanks and Regards,

Akash

On Fri, Dec 20, 2019 at 12:42 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 12/19/19 1:12 AM, AKASH G J wrote:
> > Hi all,
> > I am using OpenBMC firmware for server board having Aspeed AST-2500.
> >
> > Followed
> >
> https://github.com/openbmc/entity-manager/blob/master/docs/my_first_sensors.md
> > for populating sensor value to dbus. Entity manager configuration file
> > is given below.
> > {
> >      "Exposes": [
> >          {
> >              "Address": "0x4f",
> >              "Bus": 5,
> >              "Name": "cpu0_vrd_temp",
> >              "Thresholds": [
> >                  {
> >                      "Direction": "greater than",
> >                      "Name": "upper critical",
> >                      "Severity": 1,
> >                      "Value": 80
> >                  }
> >              ],
> >              "Type": "TMP75"
> >          }
> >      ],
> >      "Name": "Rudra Baseboard",
> >      "Probe": "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
> > 'RUDRA'})",
> >      "Type": "Board",
> >      "xyz.openbmc_project.Inventory.Decorator.Asset": {
> >          "Manufacturer": "$BOARD_MANUFACTURER",
> >          "Model": "$BOARD_PRODUCT_NAME",
> >          "PartNumber": "$BOARD_PART_NUMBER",
> >          "SerialNumber": "$BOARD_SERIAL_NUMBER"
> >      }
> > }
> >
> > Wrote sample FRU information on eeprom with the following content. Used
> > dd command for writing to eeprom.
> >
> > root@s2600wf:/sys/bus/i2c/devices/3-0056# cat eeprom
> > Product:
> >    MANUFACTURER  "ABC"
> >    PART_NUMBER   "12345"
> >    PRODUCT_NAME  "SAMPLENAME"
> >    SERIAL_NUMBER "12312490840"
>
> This is not a legal IMPI FRU. FRU Device only allows legal fru based on
> the spec:
>
> https://www.intel.com/content/www/us/en/servers/ipmi/ipmi-platform-mgt-fru-infostorage-def-v1-0-rev-1-3-spec-update.html
>
> For testing purposes using "Probe" : "TRUE" can be used as well.
> >
> > The dbus tree not showing /xyz/openbmc_project/FruDevice/SAMPLENAME
> >
> > root@s2600wf:~# busctl tree --no-pager xyz.openbmc_project.FruDevice
> > `-/xyz
> >    `-/xyz/openbmc_project
> >      `-/xyz/openbmc_project/FruDevice
> >
> > In journalctl log the following messages are printed.
> >
> > systemd[1]: Started Hwmon Temp Sensor.
> > hwmontempsensor[120]: Error communicating to entity manager
> > hwmontempsensor[120]: error communicating to entity manager
> >
> > Look like FruDevice daemon is not parsing the contents of eeprom and
> > publish them to dbus.
> >
> > Is there any thing missing in configuration? Please help to resolve the
> > problem.
> >
> >
> >
> > Thanks,
> >
> > Akash
> >
>

--00000000000059bf96059a218e2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the help.<br><br>I changed=C2=A0 &quot;Probe&qu=
ot; : &quot;TRUE&quot;, now entity manager configuration file is parsed and=
 published to dbus a configuration.<br><br><span style=3D"color:rgb(0,0,255=
)">root@rudra:~# busctl introspect --no-pager xyz.openbmc_project.EntityMan=
ager \<br>&gt; /xyz/openbmc_project/inventory/system/board/Rudra_Baseboard/=
bmc_temp<br>NAME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE =C2=A0 =C2=A0 =C2=A0SIGNATURE RE=
SULT/VALUE =C2=A0 =C2=A0 FLAGS<br>org.freedesktop.DBus.Introspectable =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
-<br>.Introspect =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 method =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>org.freedesktop.DBus.Peer=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 interface - =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>.GetMachineId =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 s =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-<br>.Ping =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>org.freed=
esktop.DBus.Properties =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 interface - =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>.Get =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method=
 =C2=A0 =C2=A0ss =C2=A0 =C2=A0 =C2=A0 =C2=A0v =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>.GetAll =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0s =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 a{sv} =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>.S=
et =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0method =C2=A0 =C2=A0ssv =C2=A0 =C2=A0 =C2=A0 - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>.PropertiesChanged=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signal =C2=A0 =C2=A0sa{sv}as =
=C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>xyz.ope=
nbmc_project.Configuration.TMP75 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
interface - =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-<br>.Address =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property =C2=A0s =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;0x4a&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emits-ch=
ange<br>.Bus =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property =C2=A0t =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emits-change<br>.=
Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 property =C2=A0s =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bmc_te=
mp&quot; =C2=A0 =C2=A0 =C2=A0 emits-change<br>.Type =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 property=
 =C2=A0s =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;TMP75&quot; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0emits-change<br>xyz.openbmc_project.Configuration.TMP75.Thres=
holds0 interface - =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>.Delete =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =C2=A0 =C2=A0- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 i =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-<br>.Direction =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0property =C2=A0s =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;grea=
ter than&quot; =C2=A0 emits-change writable<br>.Name =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 property=
 =C2=A0s =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;upper critical&quot; emits-chang=
e writable<br>.Severity =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 property =C2=A0d =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emits-change writable<b=
r>.Value =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0property =C2=A0d =C2=A0 =C2=A0 =C2=A0 =C2=A0 80 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emits-change writable</span><br><=
br>dbus-sensors hwmon temperature sensor daemon is not recognizing the conf=
iguration interface: xyz.openbmc_project.Configuration.TMP75 <br><br><span =
style=3D"color:rgb(0,0,255)">root@rudra:~# busctl tree --no-pager xyz.openb=
mc_project.HwmonTempSensor<br>Failed to introspect object / of service xyz.=
openbmc_project.HwmonTempSensor: The name is not activatable<br>No objects =
discovered.</span><br><br>In journalctl log the following messages are comi=
ng.<br><span style=3D"color:rgb(0,0,255)"><br>hwmontempsensor[153]: Error c=
ommunicating to entity manager<br>hwmontempsensor[566]: terminate called af=
ter throwing an instance of &#39;std::bad_variant_access&#39;<br>hwmontemps=
ensor[566]: =C2=A0 what(): =C2=A0Unexpected index<br>phosphor-mapper[210]: =
Introspect call failed with error: generic:110, Connection timed out on pro=
cess: xyz.openbmc_project.HwmonTempSensor path: /<br>systemd[1]: xyz.openbm=
c_project.hwmontempsensor.service: Main process exited, code=3Dkilled, stat=
us=3D6/ABRT<br>systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Fai=
led with result &#39;signal&#39;.<br>systemd[1]: xyz.openbmc_project.hwmont=
empsensor.service: Service RestartSec=3D5s expired, scheduling restart.<br>=
systemd[1]: xyz.openbmc_project.hwmontempsensor.service: Scheduled restart =
job, restart counter is at 4.<br>systemd[1]: Stopped Hwmon Temp Sensor.<br>=
phosphor-mapper[210]: Introspect call failed with error: generic:110, Conne=
ction timed out on process: xyz.openbmc_project.HwmonTempSensor path: /<br>=
systemd-udevd[97]: Spawned process &#39;/usr/bin/start_hwmon.sh start /devi=
ces/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a180.i2c-bus/i2c-5/5-004c=
/hwmon/hwmon2 /ahb/apb/bus@1e78a000/i2c-bus@180/tmp75@4c&#39; [104] is taki=
ng longer than 59s to complete</span><br><br><br><br>Thanks and Regards,<br=
><br>Akash<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 20, 2019 at 12:42 AM James Feist &lt;<a href=3D=
"mailto:james.feist@linux.intel.com">james.feist@linux.intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/19/19=
 1:12 AM, AKASH G J wrote:<br>
&gt; Hi all,<br>
&gt; I am using OpenBMC firmware for server board having Aspeed AST-2500.<b=
r>
&gt; <br>
&gt; Followed <br>
&gt; <a href=3D"https://github.com/openbmc/entity-manager/blob/master/docs/=
my_first_sensors.md" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openbmc/entity-manager/blob/master/docs/my_first_sensors.md</a> <br>
&gt; for populating sensor value to dbus. Entity manager configuration file=
 <br>
&gt; is given below.<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Exposes&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Address&quot;: &=
quot;0x4f&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Bus&quot;: 5,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Name&quot;: &quo=
t;cpu0_vrd_temp&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Thresholds&quot;=
: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;Direction&quot;: &quot;greater than&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;Name&quot;: &quot;upper critical&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;Severity&quot;: 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;Value&quot;: 80<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Type&quot;: &quo=
t;TMP75&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Name&quot;: &quot;Rudra Baseboard&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Probe&quot;: &quot;xyz.openbmc_project.FruDe=
vice({&#39;PRODUCT_PRODUCT_NAME&#39;: <br>
&gt; &#39;RUDRA&#39;})&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Type&quot;: &quot;Board&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;xyz.openbmc_project.Inventory.Decorator.Asse=
t&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Manufacturer&quot;: &quot;$BOA=
RD_MANUFACTURER&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Model&quot;: &quot;$BOARD_PROD=
UCT_NAME&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;PartNumber&quot;: &quot;$BOARD=
_PART_NUMBER&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SerialNumber&quot;: &quot;$BOA=
RD_SERIAL_NUMBER&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; }<br>
&gt; <br>
&gt; Wrote sample FRU information on eeprom with the following content. Use=
d <br>
&gt; dd command for writing to eeprom.<br>
&gt; <br>
&gt; root@s2600wf:/sys/bus/i2c/devices/3-0056# cat eeprom<br>
&gt; Product:<br>
&gt;=C2=A0 =C2=A0 MANUFACTURER =C2=A0&quot;ABC&quot;<br>
&gt;=C2=A0 =C2=A0 PART_NUMBER =C2=A0 &quot;12345&quot;<br>
&gt;=C2=A0 =C2=A0 PRODUCT_NAME =C2=A0&quot;SAMPLENAME&quot;<br>
&gt;=C2=A0 =C2=A0 SERIAL_NUMBER &quot;12312490840&quot;<br>
<br>
This is not a legal IMPI FRU. FRU Device only allows legal fru based on <br=
>
the spec: <br>
<a href=3D"https://www.intel.com/content/www/us/en/servers/ipmi/ipmi-platfo=
rm-mgt-fru-infostorage-def-v1-0-rev-1-3-spec-update.html" rel=3D"noreferrer=
" target=3D"_blank">https://www.intel.com/content/www/us/en/servers/ipmi/ip=
mi-platform-mgt-fru-infostorage-def-v1-0-rev-1-3-spec-update.html</a><br>
<br>
For testing purposes using &quot;Probe&quot; : &quot;TRUE&quot; can be used=
 as well.<br>
&gt; <br>
&gt; The dbus tree not showing /xyz/openbmc_project/FruDevice/SAMPLENAME<br=
>
&gt; <br>
&gt; root@s2600wf:~# busctl tree --no-pager xyz.openbmc_project.FruDevice<b=
r>
&gt; `-/xyz<br>
&gt;=C2=A0 =C2=A0 `-/xyz/openbmc_project<br>
&gt;=C2=A0 =C2=A0 =C2=A0 `-/xyz/openbmc_project/FruDevice<br>
&gt; <br>
&gt; In journalctl log the following messages are printed.<br>
&gt; <br>
&gt; systemd[1]: Started Hwmon Temp Sensor.<br>
&gt; hwmontempsensor[120]: Error communicating to entity manager<br>
&gt; hwmontempsensor[120]: error communicating to entity manager<br>
&gt; <br>
&gt; Look like FruDevice daemon is not parsing the contents of eeprom and <=
br>
&gt; publish them to dbus.<br>
&gt; <br>
&gt; Is there any thing missing in configuration? Please help to resolve th=
e <br>
&gt; problem.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Akash<br>
&gt; <br>
</blockquote></div>

--00000000000059bf96059a218e2e--
