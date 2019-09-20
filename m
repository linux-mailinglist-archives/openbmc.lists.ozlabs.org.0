Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB98B8E1E
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 11:56:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZTcr0ztHzF1Qx
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 19:56:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=protonmail.com
 (client-ip=185.70.40.136; helo=mail-40136.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="CuG24pyM"; 
 dkim-atps=neutral
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZT0K6WRpzF3CH
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 19:27:58 +1000 (AEST)
Date: Fri, 20 Sep 2019 09:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1568971673;
 bh=gseuDCBUt7/QK4uJGWr2xt9QJlpFWIDPoL0DGfjxlXM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=CuG24pyMGI3TTkRm2beSjFzphFFr7fBtW2zNYN06cwY/me6en7diRR1ljkJC6dl5B
 DJjrQMmTaFcmL4qnRyGwDa08yVxAJvMB641fk6zetqcXhY2IH3L7fF0XVa+g3wBqRP
 7P0f0kEvMrAVhFnSXxD6Dk8VJGv9fTpHLQb4MuuI=
To: Matthew Barth <msbarth@linux.ibm.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Fan PWM monitoring and control
Message-ID: <DPtOWfYe4jWodafub9fy5O2kam1xxcqYVW-AwwODBWTmNr0VBvHQulRT6eAywSOxzlmbCuHhLW9vJ_alhSn-fuDwyh_KvJdUYz4AqWcThTE=@protonmail.com>
In-Reply-To: <b8234b9b-1409-33dc-930f-21b8aab590e2@linux.ibm.com>
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <87e610aa-72c7-32d2-9281-2c89023d397a@linux.ibm.com>
 <CAO=notzaok+dsfR0uRJUy2ZGHMiMZZC9Jm704B5HfCS8CLPnEQ@mail.gmail.com>
 <_Nl9cDEblRON25jUEVZy-xP4bxr_xoMpODmc9FCcRWNpgk3sFL_ZHmcHAwVQaEdzB1V8KjJ1k3U_a90MQMP2nIzosFt_jwC3j3vSPxTvEGs=@protonmail.com>
 <CAO=notxUENhPn4bYZVzgyuy-tn6OxP3ojE29MBtXHLGAgkfj_w@mail.gmail.com>
 <Eoms3BmA_hZ-IwjRbWQGhnKCH-ijQ3Am7q1DrTqo73DtZSdsXaMbAcVInBw-SBdTgeqbpsHRuqvkEoAM04KKIqvJnsIv67WATAPVeM9TGv8=@protonmail.com>
 <b8234b9b-1409-33dc-930f-21b8aab590e2@linux.ibm.com>
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

>> Not sure I follow what you mean by "no pwm writes", is there an
application writing to the fan sensor's pwm interface target property?

I thought phoshor-fan control writes to pwm to increase fan speed based on =
temperature sensors mentioned in events.yaml
(recipes-phosphor/fans/phosphor-fan-control-events-config/events.yaml)

Is it not the case?

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Thursday, September 19, 2019 8:26 PM, Matthew Barth <msbarth@linux.ibm.c=
om> wrote:

> On 9/19/19 5:16 AM, rgrs wrote:
>
> > Hi Patrick, Lei,
> > Thank you, I made some changes according your comments
> >
> > -   added Mutability::Read to fan yaml.
> > -   I didn't see ipmi-sensor-inventory.yaml of romulus having fan senso=
rs, so removed them from IPMI.
> >
> > Now,"busctl monitor" displays Fan tach reads, no pwm writes.
>
> Not sure I follow what you mean by "no pwm writes", is there an
> application writing to the fan sensor's pwm interface target property?
>
> > Is there any way to manually set PWM value and test this?
> > How do I verify PWM values are being written to ADT7462?
>
> If no other application are writing to the PWM sysfs entries, you should
> be able to `echo` a value to each fan's PWM sysfs file to alter the fan
> speeds.
>
> > Another observation is Inventory.Item seems to have invalid(stale) entr=
ies.
>
> I believe inventory is persisted by default so that could explain why
> these entries are still showing up. These are persisted under
> `/var/lib/phosphor-inventory-manager/..`.
>
> > IPMI sensor names appear in inventory even after removing from IPMI sen=
sor yaml files (exported JSON in attachment).
> >
> > Logs:
> >
> > ------
> >
> > busctl monitor | grep -i fan
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >
> > Monitoring bus message stream.
> > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN0 Interf=
ace=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN1 Interf=
ace=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN2 Interf=
ace=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > [...]
> > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN1 Interf=
ace=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_tach/FAN3 Interf=
ace=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChanged
> > ^C
> >
> > busctl get-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/op=
enbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Targ=
et
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >
> > t 0
> >
> > busctl set-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/op=
enbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Targ=
et 8000
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> This is not a valid call to `busctl set-property...`, its missing the
> property's signature type (refer to `busctl help`). Also, a target PWM
> of 8000 is invalid, PWM is 0 - 255.
>
> > Failed to create bus message: Invalid argument
> >
> > busctl introspect --no-pager xyz.openbmc_project.Hwmon-2429843755.Hwmon=
1 /xyz/openbmc_project/sensors/fan_tach/FAN1
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > NAME TYPE SIGNATURE RESULT/VALUE FLAGS
> > org.freedesktop.DBus.Introspectable interface - - -
> > .Introspect method - s -
> > org.freedesktop.DBus.Peer interface - - -
> > .GetMachineId method - s -
> > .Ping method - - -
> > org.freedesktop.DBus.Properties interface - - -
> > .Get method ss v -
> > .GetAll method s a{sv} -
> > .Set method ssv - -
> > .PropertiesChanged signal sa{sv}as - -
> > xyz.openbmc_project.Control.FanPwm interface - - -
> > .Target property t 0 emits-change writable
> > xyz.openbmc_project.Sensor.Value interface - - -
> > .MaxValue property x 0 emits-change writable
> > .MinValue property x 0 emits-change writable
> > .Scale property x 0 emits-change writable
> > .Unit property s "xyz.openbmc_project.Sensor.Value.Unit.=E2=80=A6 emits=
-change writable
> > .Value property x 2983 emits-change writable
> > xyz.openbmc_project.State.Decorator.OperationalStatus interface - - -
> > .Functional property b true emits-change writable
> > Thanks,
> > Raj
> > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Origina=
l Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90
> > On Wednesday, September 18, 2019 9:35 PM, Patrick Venture venture@googl=
e.com wrote:
> >
> > > On Wed, Sep 18, 2019 at 2:30 AM rgrs rgrs@protonmail.com wrote:
> > >
> > > > Hi Patrick, Matt,
> > > > I tried instructions from this wiki: https://developer.ibm.com/linu=
xonpower/2019/01/07/how-to-port-openbmc/
> > > > There is no GPIO to detect presence of fans, so tach readings is us=
ed instead.
> > > > Here's what I did while trying to enable Fan control:
> > > >
> > > > 1.  Added Fan tach sensor in hwmon (adt7462.conf) is in the form LA=
BEL=3DFANx_RPM
> > > > 2.  "ipmi-sensor-inventory.yaml" has below config:
> > > >
> > > > 60: &fan_tach
> > > > sensorType: 0x04
> > > > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > > sensorReadingType: 0x01
> > > > multiplierM: 100
> > > > offsetB: 0
> > > > bExp: 0
> > > > unit: xyz.openbmc_project.Sensor.Value.Unit.RPMS
> > > > scale: 0
> > > > rExp: 0
> > > > serviceInterface: org.freedesktop.DBus.Properties
> > > > readingType: readingData
> > > > interfaces:
> > > > xyz.openbmc_project.Sensor.Value:
> > > > Value:
> > > > Offsets:
> > > > 0xFF:
> > > > type: int64_t
> > > > and FAN PWM as
> > > > 89: &fanpwm
> > > > sensorType: 0x04
> > > > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > > sensorReadingType: 0x01
> > > > multiplierM: 1
> > > > offsetB: 0
> > > > bExp: 0
> > > > mutability: Mutability::Write
> > >
> > > You may need to add ::Read here too, I'm not sure anymore, but you ca=
n
> > > check the script that builds this:
> > > https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/wr=
itesensor.mako.cpp#L69
> > > It'll default to read, but if you've only set write, I don't know.
> > >
> > > >      serviceInterface: org.freedesktop.DBus.Properties
> > > >      readingType: readingData
> > > >      interfaces:
> > > >          xyz.openbmc_project.Control.FanPwm:
> > > >              Target:
> > > >                  Offsets:
> > > >                      0xFF:
> > > >                          type: uint64_t
> > > >
> > > >
> > > > 3.  I copied meta-romulus/recipes-phosphor/fans to my platform and =
changed FAN names from "fanx" to "FANx_RPM" in yaml files.
> > > >
> > > > This is what get in busctl tree related to Fans:
> > > > (I expected to see FanPwm entries in busctl and I'm not sure why th=
ere are multiple entries in inventory).
> > > > Service xyz.openbmc_project.Hwmon-2429843755.Hwmon1:
> > > > `-/xyz`-/xyz/openbmc_project
> > > > `-/xyz/openbmc_project/sensors |-/xyz/openbmc_project/sensors/fan_t=
ach | |-/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM | |-/xyz/openbmc_pro=
ject/sensors/fan_tach/FAN1_RPM | |-/xyz/openbmc_project/sensors/fan_tach/FA=
N2_RPM |`-/xyz/openbmc_project/sensors/fan_tach/FAN3_RPM
> > > > `-/xyz/openbmc_project/sensors/temperature`-/xyz/openbmc_project/se=
nsors/temperature/BACKPLANE_TEMP
> > >
> > > You don't get a separate entry for the PWM from phosphor-hwmon.
> > > It's a separate interface on the same service and path.
> > > I recommend you introspect on the path and see what interfaces are
> > > available (as well as adding "| read" above):
> > > busctl introspect --no-pager
> > > xyz.openbmc_project.Hwmon-2429843755.Hwmon1
> > > /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > >
> > > > Service xyz.openbmc_project.Inventory.Manager:
> > > > `-/xyz`-/xyz/openbmc_project
> > > > `-/xyz/openbmc_project/inventory`-/xyz/openbmc_project/inventory/sy=
stem
> > > > `-/xyz/openbmc_project/inventory/system/chassis`-/xyz/openbmc_proje=
ct/inventory/system/chassis/motherboard
> > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0
> > > > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0/=
FAN0 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0_RPM |=
`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0_RPM/FAN0_R=
PM
> > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1
> > > > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1/=
FAN1 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1_RPM |=
`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1_RPM/FAN1_R=
PM
> > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2
> > > > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2/=
FAN2 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2_RPM |=
`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2_RPM/FAN2_R=
PM
> > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3
> > > > | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3/=
FAN3 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3_RPM |=
`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3_RPM/FAN3_R=
PM
> > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0
> > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1
> > > > |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan2
> > > > `-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan3
> > > > Thanks,
> > > > Raj
> > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Ori=
ginal Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90
> > > > On Tuesday, September 17, 2019 9:18 PM, Patrick Venture venture@goo=
gle.com wrote:
> > > >
> > > > > On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth msbarth@linux.ibm.c=
om wrote:
> > > > >
> > > > > > On 9/17/19 5:40 AM, rgrs wrote:
> > > > > >
> > > > > > > Hi,
> > > > > > > I need some help with phosphor hwmon related to fan sensors.
> > > > > > > I'm trying to control Fans in a server motherboard using ADT7=
462
> > > > > > > controller. Hw mon porting is done and the sysfs interfaces a=
re working
> > > > > > > as expected.
> > > > > > > While I am able to read RPM, i don't find pwm/target to contr=
ol the fans
> > > > > > > exposed as dbus objects.
> > > > > > > Do you have the hwmon config set similar to this to denote th=
e fan
> > > > > > > targets are of PWM type?
> > > > > >
> > > > > > https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-ro=
mulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/pwm-tacho-=
controller%401e786000.conf
> > > > > >
> > > > > > > busctl --no-page tree xyz.openbmc_project.FanSensor
> > > > > > >
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > Failed to introspect object / of service xyz.openbmc_project.=
FanSensor:
> > > > > > > The name is not activatable
> > > > > > > No objects discovered.
> > > > > > > That does not look like a hwmon service name. If you are usin=
g
> > > > > > > phosphor-objmgr, you can use `# mapper get-service /xyz/openb=
mc_project/sensors/fan_tach` otherwise you'll need to find the
> > > > > > > hwmon service name associated with your fan controller device=
.
> > > > >
> > > > > running`busctl tree --no-pager` will just list everything, and yo=
u
> > > > > should see your fans in there. You can use the mapper too. I was
> > > > > curious, are you using entity-manager/dbus-sensors? When you ment=
ion
> > > > > FanSensor as the service, that's what it sounds like.
> > > > >
> > > > > > > I came across this post, I think it is similar to my issue.
> > > > > > > (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/=
+/8353)
> > > > > > > Please someone point to latest documentation or reference Fan=
 porting
> > > > > > > from openBMC repo?
> > > > > > > What are the exact fields in YAML that are used create FanPWM=
 objects.
> > > > > > > The Romulus machine should be a good reference for PWM based =
fan control
> > > > > > > using phosphor-hwmon. It uses the
> > > > > > > phosphor-fan-presence/[control|monitor] apps for controlling =
and
> > > > > > > monitoring fans
> > > > > >
> > > > > > https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-ro=
mulus
> > > > > >
> > > > > > > (I'm using Feb release in my sandbox,
> > > > > > > https://github.com/openbmc/docs/blob/master/release/release-n=
otes.md#26-feb-4-2019)
> > > > > > > Thanks,
> > > > > > > Raj
> > > > > >
> > > > > > Matt


