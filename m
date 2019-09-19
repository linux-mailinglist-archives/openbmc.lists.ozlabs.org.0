Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04704B773A
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 12:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Yt8P0xg7zF4XZ
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 20:17:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=protonmail.com
 (client-ip=185.70.40.133; helo=mail-40133.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="YPYhFwez"; 
 dkim-atps=neutral
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Yt7R39zRzF4X6
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 20:17:05 +1000 (AEST)
Date: Thu, 19 Sep 2019 10:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1568888220;
 bh=JJ7RmXDtHsPP16T2sC2MwJT7LPpWkhpUn9dH3SB5U1Q=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=YPYhFwezEhwngid8xqi57kLtLX6qKlnLVeaOXlMWcCa3H7VBkRJv3RI7TIp1m4Nq6
 XwGJ6VEAF9ntA+ZfhDt8wIGkn4kHzIyUQbTXFXg5alXNwy2rMjXYuqAPoJYIVCWmGL
 75FWO2pqmsungTAfEGx5tfHpm8MTVffKoxuL0uWo=
To: Patrick Venture <venture@google.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Fan PWM monitoring and control
Message-ID: <Eoms3BmA_hZ-IwjRbWQGhnKCH-ijQ3Am7q1DrTqo73DtZSdsXaMbAcVInBw-SBdTgeqbpsHRuqvkEoAM04KKIqvJnsIv67WATAPVeM9TGv8=@protonmail.com>
In-Reply-To: <CAO=notxUENhPn4bYZVzgyuy-tn6OxP3ojE29MBtXHLGAgkfj_w@mail.gmail.com>
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <87e610aa-72c7-32d2-9281-2c89023d397a@linux.ibm.com>
 <CAO=notzaok+dsfR0uRJUy2ZGHMiMZZC9Jm704B5HfCS8CLPnEQ@mail.gmail.com>
 <_Nl9cDEblRON25jUEVZy-xP4bxr_xoMpODmc9FCcRWNpgk3sFL_ZHmcHAwVQaEdzB1V8KjJ1k3U_a90MQMP2nIzosFt_jwC3j3vSPxTvEGs=@protonmail.com>
 <CAO=notxUENhPn4bYZVzgyuy-tn6OxP3ojE29MBtXHLGAgkfj_w@mail.gmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="b1_63482ded74719489de69bb8c51a6654e"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.

--b1_63482ded74719489de69bb8c51a6654e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Patrick, Lei,

Thank you, I made some changes according your comments
- added Mutability::Read to fan yaml.
- I didn't see ipmi-sensor-inventory.yaml of romulus having fan sensors, so=
 removed them from IPMI.

Now,"busctl monitor" displays Fan tach reads, no pwm writes.
Is there any way to manually set PWM value and test this?
How do I verify PWM values are being written to ADT7462?

Another observation is Inventory.Item seems to have invalid(stale) entries.
IPMI sensor names appear in inventory even after removing from IPMI sensor =
yaml files (exported JSON in attachment).

Logs:
-----

# busctl monitor | grep -i fan
Monitoring bus message stream.
  Sender=3D:1.45  Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN0  Interf=
ace=3Dorg.freedesktop.DBus.Properties  Member=3DPropertiesChanged
  Sender=3D:1.45  Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN1  Interf=
ace=3Dorg.freedesktop.DBus.Properties  Member=3DPropertiesChanged
  Sender=3D:1.45  Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN2  Interf=
ace=3Dorg.freedesktop.DBus.Properties  Member=3DPropertiesChanged
  [...]
  Sender=3D:1.45  Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN1  Interf=
ace=3Dorg.freedesktop.DBus.Properties  Member=3DPropertiesChanged
  Sender=3D:1.45  Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN3  Interf=
ace=3Dorg.freedesktop.DBus.Properties  Member=3DPropertiesChanged
^C


# busctl get-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/open=
bmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Target
t 0
# busctl set-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/open=
bmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Target=
 8000
Failed to create bus message: Invalid argument

# busctl introspect --no-pager xyz.openbmc_project.Hwmon-2429843755.Hwmon1 =
/xyz/openbmc_project/sensors/fan_tach/FAN1
NAME                                                  TYPE      SIGNATURE R=
ESULT/VALUE                             FLAGS
org.freedesktop.DBus.Introspectable                   interface -         -=
                                        -
.Introspect                                           method    -         s=
                                        -
org.freedesktop.DBus.Peer                             interface -         -=
                                        -
.GetMachineId                                         method    -         s=
                                        -
.Ping                                                 method    -         -=
                                        -
org.freedesktop.DBus.Properties                       interface -         -=
                                        -
.Get                                                  method    ss        v=
                                        -
.GetAll                                               method    s         a=
{sv}                                    -
.Set                                                  method    ssv       -=
                                        -
.PropertiesChanged                                    signal    sa{sv}as  -=
                                        -
xyz.openbmc_project.Control.FanPwm                    interface -         -=
                                        -
.Target                                               property  t         0=
                                        emits-change writable
xyz.openbmc_project.Sensor.Value                      interface -         -=
                                        -
.MaxValue                                             property  x         0=
                                        emits-change writable
.MinValue                                             property  x         0=
                                        emits-change writable
.Scale                                                property  x         0=
                                        emits-change writable
.Unit                                                 property  s         "=
xyz.openbmc_project.Sensor.Value.Unit.=E2=80=A6 emits-change writable
.Value                                                property  x         2=
983                                     emits-change writable
xyz.openbmc_project.State.Decorator.OperationalStatus interface -         -=
                                        -
.Functional                                           property  b         t=
rue                                     emits-change writable



Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Wednesday, September 18, 2019 9:35 PM, Patrick Venture <venture@google.c=
om> wrote:

> On Wed, Sep 18, 2019 at 2:30 AM rgrs rgrs@protonmail.com wrote:
>
> > Hi Patrick, Matt,
> > I tried instructions from this wiki: https://developer.ibm.com/linuxonp=
ower/2019/01/07/how-to-port-openbmc/
> > There is no GPIO to detect presence of fans, so tach readings is used i=
nstead.
> > Here's what I did while trying to enable Fan control:
> >
> > 1.  Added Fan tach sensor in hwmon (adt7462.conf) is in the form LABEL=
=3DFANx_RPM
> > 2.  "ipmi-sensor-inventory.yaml" has below config:
> >
> > 60: &fan_tach
> > sensorType: 0x04
> > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > sensorReadingType: 0x01
> > multiplierM: 100
> > offsetB: 0
> > bExp: 0
> > unit: xyz.openbmc_project.Sensor.Value.Unit.RPMS
> > scale: 0
> > rExp: 0
> > serviceInterface: org.freedesktop.DBus.Properties
> > readingType: readingData
> > interfaces:
> > xyz.openbmc_project.Sensor.Value:
> > Value:
> > Offsets:
> > 0xFF:
> > type: int64_t
> > and FAN PWM as
> > 89: &fanpwm
> > sensorType: 0x04
> > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > sensorReadingType: 0x01
> > multiplierM: 1
> > offsetB: 0
> > bExp: 0
> > mutability: Mutability::Write
>
> You may need to add ::Read here too, I'm not sure anymore, but you can
> check the script that builds this:
>
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/writes=
ensor.mako.cpp#L69
>
> It'll default to read, but if you've only set write, I don't know.
>
> >     serviceInterface: org.freedesktop.DBus.Properties
> >     readingType: readingData
> >     interfaces:
> >         xyz.openbmc_project.Control.FanPwm:
> >             Target:
> >                 Offsets:
> >                     0xFF:
> >                         type: uint64_t
> >
> >
> > 3.  I copied meta-romulus/recipes-phosphor/fans to my platform and chan=
ged FAN names from "fanx" to "FANx_RPM" in yaml files.
> >
> > This is what get in busctl tree related to Fans:
> > (I expected to see FanPwm entries in busctl and I'm not sure why there =
are multiple entries in inventory).
> > Service xyz.openbmc_project.Hwmon-2429843755.Hwmon1:
> > `-/xyz`-/xyz/openbmc_project
> > `-/xyz/openbmc_project/sensors |-/xyz/openbmc_project/sensors/fan_tach =
| |-/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM | |-/xyz/openbmc_project=
/sensors/fan_tach/FAN1_RPM | |-/xyz/openbmc_project/sensors/fan_tach/FAN2_R=
PM |`-/xyz/openbmc_project/sensors/fan_tach/FAN3_RPM
> > `-/xyz/openbmc_project/sensors/temperature`-/xyz/openbmc_project/sensor=
s/temperature/BACKPLANE_TEMP
>
> You don't get a separate entry for the PWM from phosphor-hwmon.
>
> It's a separate interface on the same service and path.
>
> I recommend you introspect on the path and see what interfaces are
> available (as well as adding "| read" above):
>
> busctl introspect --no-pager
> xyz.openbmc_project.Hwmon-2429843755.Hwmon1
> /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
>
> > Service xyz.openbmc_project.Inventory.Manager:
> > `-/xyz`-/xyz/openbmc_project
> > `-/xyz/openbmc_project/inventory`-/xyz/openbmc_project/inventory/system
> > `-/xyz/openbmc_project/inventory/system/chassis`-/xyz/openbmc_project/i=
nventory/system/chassis/motherboard
> > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0
> > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0/FAN0=
 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0_RPM |`-/x=
yz/openbmc_project/inventory/system/chassis/motherboard/FAN0_RPM/FAN0_RPM
> > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1
> > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1/FAN1=
 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1_RPM |`-/x=
yz/openbmc_project/inventory/system/chassis/motherboard/FAN1_RPM/FAN1_RPM
> > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2
> > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2/FAN2=
 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2_RPM |`-/x=
yz/openbmc_project/inventory/system/chassis/motherboard/FAN2_RPM/FAN2_RPM
> > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3
> > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3/FAN3=
 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3_RPM |`-/x=
yz/openbmc_project/inventory/system/chassis/motherboard/FAN3_RPM/FAN3_RPM
> > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0
> > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1
> > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan2
> > `-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan3
> > Thanks,
> > Raj
> > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Origina=
l Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90
> > On Tuesday, September 17, 2019 9:18 PM, Patrick Venture venture@google.=
com wrote:
> >
> > > On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth msbarth@linux.ibm.com w=
rote:
> > >
> > > > On 9/17/19 5:40 AM, rgrs wrote:
> > > >
> > > > > Hi,
> > > > > I need some help with phosphor hwmon related to fan sensors.
> > > > > I'm trying to control Fans in a server motherboard using ADT7462
> > > > > controller. Hw mon porting is done and the sysfs interfaces are w=
orking
> > > > > as expected.
> > > > > While I am able to read RPM, i don't find pwm/target to control t=
he fans
> > > > > exposed as dbus objects.
> > > > > Do you have the hwmon config set similar to this to denote the fa=
n
> > > > > targets are of PWM type?
> > > >
> > > > https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-romulu=
s/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/pwm-tacho-cont=
roller%401e786000.conf
> > > >
> > > > > busctl --no-page tree xyz.openbmc_project.FanSensor
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > > > > Failed to introspect object / of service xyz.openbmc_project.FanS=
ensor:
> > > > > The name is not activatable
> > > > > No objects discovered.
> > > > > That does not look like a hwmon service name. If you are using
> > > > > phosphor-objmgr, you can use `# mapper get-service /xyz/openbmc_p=
roject/sensors/fan_tach` otherwise you'll need to find the
> > > > > hwmon service name associated with your fan controller device.
> > >
> > > running`busctl tree --no-pager` will just list everything, and you
> > > should see your fans in there. You can use the mapper too. I was
> > > curious, are you using entity-manager/dbus-sensors? When you mention
> > > FanSensor as the service, that's what it sounds like.
> > >
> > > > > I came across this post, I think it is similar to my issue.
> > > > > (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/83=
53)
> > > > > Please someone point to latest documentation or reference Fan por=
ting
> > > > > from openBMC repo?
> > > > > What are the exact fields in YAML that are used create FanPWM obj=
ects.
> > > > > The Romulus machine should be a good reference for PWM based fan =
control
> > > > > using phosphor-hwmon. It uses the
> > > > > phosphor-fan-presence/[control|monitor] apps for controlling and
> > > > > monitoring fans
> > > >
> > > > https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulu=
s
> > > >
> > > > > (I'm using Feb release in my sandbox,
> > > > > https://github.com/openbmc/docs/blob/master/release/release-notes=
.md#26-feb-4-2019)
> > > > > Thanks,
> > > > > Raj
> > > >
> > > > Matt



--b1_63482ded74719489de69bb8c51a6654e
Content-Type: application/json; name="export_inventory.json"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=export_inventory.json

eyIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtIjp7IkFzc2V0VGFnIjoiIiwi
QnVpbGREYXRlIjoiIiwiTWFudWZhY3R1cmVyIjoiIiwiTW9kZWwiOiIiLCJQYXJ0TnVtYmVyIjoi
IiwiUHJlc2VudCI6ZmFsc2UsIlByZXR0eU5hbWUiOiIiLCJTZXJpYWxOdW1iZXIiOiIifSwiL3h5
ei9vcGVuYm1jX3Byb2plY3QvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL2FjdGl2YXRpb24iOnsi
ZW5kcG9pbnRzIjpbIi94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlL2UyOWU1YjQ3IiwiL3h5
ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdhcmUvN2IxZDkxMDAiXX0sIi94eXovb3BlbmJtY19wcm9q
ZWN0L2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9GQU4wIjp7IkZ1bmN0aW9u
YWwiOnRydWUsIlByZXNlbnQiOnRydWUsIlByZXR0eU5hbWUiOiJGQU4wIn0sIi94eXovb3BlbmJt
Y19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9GQU4wL0ZBTjAi
OnsiRnVuY3Rpb25hbCI6dHJ1ZX0sIi94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0
ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9GQU4wX1JQTSI6eyJGdW5jdGlvbmFsIjpmYWxzZSwiUHJl
c2VudCI6ZmFsc2UsIlByZXR0eU5hbWUiOiJGQU4wX1JQTSJ9LCIveHl6L29wZW5ibWNfcHJvamVj
dC9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvRkFOMF9SUE0vRkFOMF9SUE0i
OnsiRnVuY3Rpb25hbCI6ZmFsc2V9LCIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lz
dGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvRkFOMSI6eyJGdW5jdGlvbmFsIjp0cnVlLCJQcmVzZW50
Ijp0cnVlLCJQcmV0dHlOYW1lIjoiRkFOMSJ9LCIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRv
cnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvRkFOMS9GQU4xIjp7IkZ1bmN0aW9uYWwiOnRy
dWV9LCIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVy
Ym9hcmQvRkFOMV9SUE0iOnsiRnVuY3Rpb25hbCI6ZmFsc2UsIlByZXNlbnQiOmZhbHNlLCJQcmV0
dHlOYW1lIjoiRkFOMV9SUE0ifSwiL3h5ei9vcGVuYm1jX3Byb2plY3QvaW52ZW50b3J5L3N5c3Rl
bS9jaGFzc2lzL21vdGhlcmJvYXJkL0ZBTjFfUlBNL0ZBTjFfUlBNIjp7IkZ1bmN0aW9uYWwiOmZh
bHNlfSwiL3h5ei9vcGVuYm1jX3Byb2plY3QvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhl
cmJvYXJkL0ZBTjIiOnsiRnVuY3Rpb25hbCI6dHJ1ZSwiUHJlc2VudCI6dHJ1ZSwiUHJldHR5TmFt
ZSI6IkZBTjIifSwiL3h5ei9vcGVuYm1jX3Byb2plY3QvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lz
L21vdGhlcmJvYXJkL0ZBTjIvRkFOMiI6eyJGdW5jdGlvbmFsIjp0cnVlfSwiL3h5ei9vcGVuYm1j
X3Byb2plY3QvaW52ZW50b3J5L3N5c3RlbS9jaGFzc2lzL21vdGhlcmJvYXJkL0ZBTjJfUlBNIjp7
IkZ1bmN0aW9uYWwiOmZhbHNlLCJQcmVzZW50IjpmYWxzZSwiUHJldHR5TmFtZSI6IkZBTjJfUlBN
In0sIi94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJi
b2FyZC9GQU4yX1JQTS9GQU4yX1JQTSI6eyJGdW5jdGlvbmFsIjpmYWxzZX0sIi94eXovb3BlbmJt
Y19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9GQU4zIjp7IkZ1
bmN0aW9uYWwiOnRydWUsIlByZXNlbnQiOnRydWUsIlByZXR0eU5hbWUiOiJGQU4zIn0sIi94eXov
b3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9GQU4z
L0ZBTjMiOnsiRnVuY3Rpb25hbCI6dHJ1ZX0sIi94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9y
eS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9GQU4zX1JQTSI6eyJGdW5jdGlvbmFsIjpmYWxz
ZSwiUHJlc2VudCI6ZmFsc2UsIlByZXR0eU5hbWUiOiJGQU4zX1JQTSJ9LCIveHl6L29wZW5ibWNf
cHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvRkFOM19SUE0vRkFO
M19SUE0iOnsiRnVuY3Rpb25hbCI6ZmFsc2V9LCIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRv
cnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvZmFuMCI6eyJQcmVzZW50Ijp0cnVlLCJQcmV0
dHlOYW1lIjoiZmFuMCJ9LCIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtL2No
YXNzaXMvbW90aGVyYm9hcmQvZmFuMSI6eyJQcmVzZW50Ijp0cnVlLCJQcmV0dHlOYW1lIjoiZmFu
MSJ9LCIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVy
Ym9hcmQvZmFuMiI6eyJQcmVzZW50Ijp0cnVlLCJQcmV0dHlOYW1lIjoiZmFuMiJ9LCIveHl6L29w
ZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvZmFuMyI6
eyJQcmVzZW50Ijp0cnVlLCJQcmV0dHlOYW1lIjoiZmFuMyJ9fQo=


--b1_63482ded74719489de69bb8c51a6654e--

