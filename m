Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64901B8E29
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 11:57:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZTfp4jrrzF1ZS
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 19:57:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=protonmail.com
 (client-ip=185.70.40.133; helo=mail-40133.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="LLlajkiu"; 
 dkim-atps=neutral
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZTcb6lZ9zF1QJ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 19:55:56 +1000 (AEST)
Date: Fri, 20 Sep 2019 09:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1568973350;
 bh=t8Z7SMRvsoN7qv0WGkcNchNlooXAglLnR5q2jwHRlI4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=LLlajkiuXRCI+/eAQOxAcPspeynTzhlibbWln3/BA0towVYZbEqPDICIruy/DfOYT
 Y6F+E0fgCzWPDVSnSu9wW9fr1Ku8trvmjo6D954j4yukns9HqO1S64kcc8ED1LzxAd
 noRkrxCw/pptNAY6FHSdIamhOlEl8//r6/jJ2+AA=
To: Matthew Barth <msbarth@linux.ibm.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Fan PWM monitoring and control
Message-ID: <LgdPnRYBfplNFAYHlgeIeqcfaFAY3YBlIY29oEdpPzlBlptZTxYA7eQDOAJL9IWz_b_GYz9PCAMxoudn2QA1ArWs1r74LSBcdkOdlXQ1Slk=@protonmail.com>
In-Reply-To: <DPtOWfYe4jWodafub9fy5O2kam1xxcqYVW-AwwODBWTmNr0VBvHQulRT6eAywSOxzlmbCuHhLW9vJ_alhSn-fuDwyh_KvJdUYz4AqWcThTE=@protonmail.com>
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <87e610aa-72c7-32d2-9281-2c89023d397a@linux.ibm.com>
 <CAO=notzaok+dsfR0uRJUy2ZGHMiMZZC9Jm704B5HfCS8CLPnEQ@mail.gmail.com>
 <_Nl9cDEblRON25jUEVZy-xP4bxr_xoMpODmc9FCcRWNpgk3sFL_ZHmcHAwVQaEdzB1V8KjJ1k3U_a90MQMP2nIzosFt_jwC3j3vSPxTvEGs=@protonmail.com>
 <CAO=notxUENhPn4bYZVzgyuy-tn6OxP3ojE29MBtXHLGAgkfj_w@mail.gmail.com>
 <Eoms3BmA_hZ-IwjRbWQGhnKCH-ijQ3Am7q1DrTqo73DtZSdsXaMbAcVInBw-SBdTgeqbpsHRuqvkEoAM04KKIqvJnsIv67WATAPVeM9TGv8=@protonmail.com>
 <b8234b9b-1409-33dc-930f-21b8aab590e2@linux.ibm.com>
 <DPtOWfYe4jWodafub9fy5O2kam1xxcqYVW-AwwODBWTmNr0VBvHQulRT6eAywSOxzlmbCuHhLW9vJ_alhSn-fuDwyh_KvJdUYz4AqWcThTE=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Matt,

I'm able to control fan speed via busctl.

root@saber:/sys/class/hwmon/hwmon0# busctl set-property xyz.openbmc_project=
.Hwmon-2429843755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN0 xyz.ope=
nbmc_project.Control.FanPwm Target t '250'

root@saber:/sys/class/hwmon/hwmon0# cat fan*_input
12498
0

I need a way to verify if the sensor associations are working properly that=
 fans will ramp up when associated temperature sensor's value increases.

Thanks,
Raj


=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, September 20, 2019 2:57 PM, rgrs <rgrs@protonmail.com> wrote:

> Hi Matt,
>
> > > Not sure I follow what you mean by "no pwm writes", is there an
>
> application writing to the fan sensor's pwm interface target property?
>
> I thought phoshor-fan control writes to pwm to increase fan speed based o=
n temperature sensors mentioned in events.yaml
> (recipes-phosphor/fans/phosphor-fan-control-events-config/events.yaml)
>
> Is it not the case?
>
> Thanks,
> Raj
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> On Thursday, September 19, 2019 8:26 PM, Matthew Barth msbarth@linux.ibm.=
com wrote:
>
> > On 9/19/19 5:16 AM, rgrs wrote:
> >
> > > Hi Patrick, Lei,
> > > Thank you, I made some changes according your comments
> > >
> > > -   added Mutability::Read to fan yaml.
> > > -   I didn't see ipmi-sensor-inventory.yaml of romulus having fan sen=
sors, so removed them from IPMI.
> > >
> > > Now,"busctl monitor" displays Fan tach reads, no pwm writes.
> >
> > Not sure I follow what you mean by "no pwm writes", is there an
> > application writing to the fan sensor's pwm interface target property?
> >
> > > Is there any way to manually set PWM value and test this?
> > > How do I verify PWM values are being written to ADT7462?
> >
> > If no other application are writing to the PWM sysfs entries, you shoul=
d
> > be able to `echo` a value to each fan's PWM sysfs file to alter the fan
> > speeds.
> >
> > > Another observation is Inventory.Item seems to have invalid(stale) en=
tries.
> >
> > I believe inventory is persisted by default so that could explain why
> > these entries are still showing up. These are persisted under
> > `/var/lib/phosphor-inventory-manager/..`.
> >
> > > IPMI sensor names appear in inventory even after removing from IPMI s=
ensor yaml files (exported JSON in attachment).
> > > Logs:
> > >
> > > busctl monitor | grep -i fan
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > > Monitoring bus message stream.
> > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN0 Inte=
rface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN1 Inte=
rface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN2 Inte=
rface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > > [...]
> > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN1 Inte=
rface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN3 Inte=
rface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > > ^C
> > > busctl get-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/=
openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Ta=
rget
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > t 0
> > > busctl set-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/=
openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Ta=
rget 8000
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >
> > This is not a valid call to `busctl set-property...`, its missing the
> > property's signature type (refer to `busctl help`). Also, a target PWM
> > of 8000 is invalid, PWM is 0 - 255.
> >
> > > Failed to create bus message: Invalid argument
> > > busctl introspect --no-pager xyz.openbmc_project.Hwmon-2429843755.Hwm=
on1 /xyz/openbmc_project/sensors/fan_tach/FAN1
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > NAME TYPE SIGNATURE RESULT/VALUE FLAGS
> > > org.freedesktop.DBus.Introspectable interface - - -
> > > .Introspect method - s -
> > > org.freedesktop.DBus.Peer interface - - -
> > > .GetMachineId method - s -
> > > .Ping method - - -
> > > org.freedesktop.DBus.Properties interface - - -
> > > .Get method ss v -
> > > .GetAll method s a{sv} -
> > > .Set method ssv - -
> > > .PropertiesChanged signal sa{sv}as - -
> > > xyz.openbmc_project.Control.FanPwm interface - - -
> > > .Target property t 0 emits-change writable
> > > xyz.openbmc_project.Sensor.Value interface - - -
> > > .MaxValue property x 0 emits-change writable
> > > .MinValue property x 0 emits-change writable
> > > .Scale property x 0 emits-change writable
> > > .Unit property s "xyz.openbmc_project.Sensor.Value.Unit.=E2=80=A6 emi=
ts-change writable
> > > .Value property x 2983 emits-change writable
> > > xyz.openbmc_project.State.Decorator.OperationalStatus interface - - -
> > > .Functional property b true emits-change writable
> > > Thanks,
> > > Raj
> > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Origi=
nal Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90
> > > On Wednesday, September 18, 2019 9:35 PM, Patrick Venture venture@goo=
gle.com wrote:
> > >
> > > > On Wed, Sep 18, 2019 at 2:30 AM rgrs rgrs@protonmail.com wrote:
> > > >
> > > > > Hi Patrick, Matt,
> > > > > I tried instructions from this wiki: https://developer.ibm.com/li=
nuxonpower/2019/01/07/how-to-port-openbmc/
> > > > > There is no GPIO to detect presence of fans, so tach readings is =
used instead.
> > > > > Here's what I did while trying to enable Fan control:
> > > > >
> > > > > 1.  Added Fan tach sensor in hwmon (adt7462.conf) is in the form =
LABEL=3DFANx_RPM
> > > > > 2.  "ipmi-sensor-inventory.yaml" has below config:
> > > > >
> > > > > 60: &fan_tach
> > > > > sensorType: 0x04
> > > > > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > > > sensorReadingType: 0x01
> > > > > multiplierM: 100
> > > > > offsetB: 0
> > > > > bExp: 0
> > > > > unit: xyz.openbmc_project.Sensor.Value.Unit.RPMS
> > > > > scale: 0
> > > > > rExp: 0
> > > > > serviceInterface: org.freedesktop.DBus.Properties
> > > > > readingType: readingData
> > > > > interfaces:
> > > > > xyz.openbmc_project.Sensor.Value:
> > > > > Value:
> > > > > Offsets:
> > > > > 0xFF:
> > > > > type: int64_t
> > > > > and FAN PWM as
> > > > > 89: &fanpwm
> > > > > sensorType: 0x04
> > > > > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > > > sensorReadingType: 0x01
> > > > > multiplierM: 1
> > > > > offsetB: 0
> > > > > bExp: 0
> > > > > mutability: Mutability::Write
> > > >
> > > > You may need to add ::Read here too, I'm not sure anymore, but you =
can
> > > > check the script that builds this:
> > > > https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/=
writesensor.mako.cpp#L69
> > > > It'll default to read, but if you've only set write, I don't know.
> > > >
> > > > >      serviceInterface: org.freedesktop.DBus.Properties
> > > > >      readingType: readingData
> > > > >      interfaces:
> > > > >          xyz.openbmc_project.Control.FanPwm:
> > > > >              Target:
> > > > >                  Offsets:
> > > > >                      0xFF:
> > > > >                          type: uint64_t
> > > > >
> > > > >
> > > > > 3.  I copied meta-romulus/recipes-phosphor/fans to my platform an=
d changed FAN names from "fanx" to "FANx_RPM" in yaml files.
> > > > >
> > > > > This is what get in busctl tree related to Fans:
> > > > > (I expected to see FanPwm entries in busctl and I'm not sure why =
there are multiple entries in inventory).
> > > > > Service xyz.openbmc_project.Hwmon-2429843755.Hwmon1:
> > > > > `-/xyz`-/xyz/openbmc_project
> > > > > `-/xyz/openbmc_project/sensors |-/xyz/openbmc_project/sensors/fan=
_tach | |-/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM | |-/xyz/openbmc_p=
roject/sensors/fan_tach/FAN1_RPM | |-/xyz/openbmc_project/sensors/fan_tach/=
FAN2_RPM |`-/xyz/openbmc_project/sensors/fan_tach/FAN3_RPM
> > > > > `-/xyz/openbmc_project/sensors/temperature`-/xyz/openbmc_project/=
sensors/temperature/BACKPLANE_TEMP
> > > >
> > > > You don't get a separate entry for the PWM from phosphor-hwmon.
> > > > It's a separate interface on the same service and path.
> > > > I recommend you introspect on the path and see what interfaces are
> > > > available (as well as adding "| read" above):
> > > > busctl introspect --no-pager
> > > > xyz.openbmc_project.Hwmon-2429843755.Hwmon1
> > > > /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > >
> > > > > Service xyz.openbmc_project.Inventory.Manager:
> > > > > `-/xyz`-/xyz/openbmc_project
> > > > > `-/xyz/openbmc_project/inventory`-/xyz/openbmc_project/inventory/=
system
> > > > > `-/xyz/openbmc_project/inventory/system/chassis`-/xyz/openbmc_pro=
ject/inventory/system/chassis/motherboard
> > > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0
> > > > > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
0/FAN0 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0_RPM=
 |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0_RPM/FAN0=
_RPM
> > > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1
> > > > > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
1/FAN1 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1_RPM=
 |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1_RPM/FAN1=
_RPM
> > > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2
> > > > > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
2/FAN2 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2_RPM=
 |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2_RPM/FAN2=
_RPM
> > > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3
> > > > > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
3/FAN3 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3_RPM=
 |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3_RPM/FAN3=
_RPM
> > > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0
> > > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1
> > > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan2
> > > > > `-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan3
> > > > > Thanks,
> > > > > Raj
> > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90=E2=80=90
> > > > > On Tuesday, September 17, 2019 9:18 PM, Patrick Venture venture@g=
oogle.com wrote:
> > > > >
> > > > > > On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth msbarth@linux.ibm=
.com wrote:
> > > > > >
> > > > > > > On 9/17/19 5:40 AM, rgrs wrote:
> > > > > > >
> > > > > > > > Hi,
> > > > > > > > I need some help with phosphor hwmon related to fan sensors=
.
> > > > > > > > I'm trying to control Fans in a server motherboard using AD=
T7462
> > > > > > > > controller. Hw mon porting is done and the sysfs interfaces=
 are working
> > > > > > > > as expected.
> > > > > > > > While I am able to read RPM, i don't find pwm/target to con=
trol the fans
> > > > > > > > exposed as dbus objects.
> > > > > > > > Do you have the hwmon config set similar to this to denote =
the fan
> > > > > > > > targets are of PWM type?
> > > > > > >
> > > > > > > https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-=
romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/pwm-tach=
o-controller%401e786000.conf
> > > > > > >
> > > > > > > > busctl --no-page tree xyz.openbmc_project.FanSensor
> > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > Failed to introspect object / of service xyz.openbmc_projec=
t.FanSensor:
> > > > > > > > The name is not activatable
> > > > > > > > No objects discovered.
> > > > > > > > That does not look like a hwmon service name. If you are us=
ing
> > > > > > > > phosphor-objmgr, you can use `# mapper get-service /xyz/ope=
nbmc_project/sensors/fan_tach` otherwise you'll need to find the
> > > > > > > > hwmon service name associated with your fan controller devi=
ce.
> > > > > >
> > > > > > running`busctl tree --no-pager` will just list everything, and =
you
> > > > > > should see your fans in there. You can use the mapper too. I wa=
s
> > > > > > curious, are you using entity-manager/dbus-sensors? When you me=
ntion
> > > > > > FanSensor as the service, that's what it sounds like.
> > > > > >
> > > > > > > > I came across this post, I think it is similar to my issue.
> > > > > > > > (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmo=
n/+/8353)
> > > > > > > > Please someone point to latest documentation or reference F=
an porting
> > > > > > > > from openBMC repo?
> > > > > > > > What are the exact fields in YAML that are used create FanP=
WM objects.
> > > > > > > > The Romulus machine should be a good reference for PWM base=
d fan control
> > > > > > > > using phosphor-hwmon. It uses the
> > > > > > > > phosphor-fan-presence/[control|monitor] apps for controllin=
g and
> > > > > > > > monitoring fans
> > > > > > >
> > > > > > > https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-=
romulus
> > > > > > >
> > > > > > > > (I'm using Feb release in my sandbox,
> > > > > > > > https://github.com/openbmc/docs/blob/master/release/release=
-notes.md#26-feb-4-2019)
> > > > > > > > Thanks,
> > > > > > > > Raj
> > > > > > >
> > > > > > > Matt


