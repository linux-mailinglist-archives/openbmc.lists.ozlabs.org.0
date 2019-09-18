Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2694B6068
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 11:32:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YF9l59FnzF4VV
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 19:31:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=protonmail.com
 (client-ip=185.70.40.130; helo=mail-40130.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="ds7Sks6m"; 
 dkim-atps=neutral
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YF7p0k3szF4TV
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 19:30:10 +1000 (AEST)
Date: Wed, 18 Sep 2019 09:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1568799003;
 bh=QoLu/vrhZwDdXsCP6Epwz6Fz79Jy8Fl9Wr/gnFy2PxU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=ds7Sks6moR3MERK1PROKUwiWJ6IdfPdjab1wwRf8ongymmR0QRZQgIZhAWqfc8WIZ
 DnZKh7Uqud0HJjaCRjebALIt1qqIjqjOsAbz7hRGDpK+HL03DBMUyjPXQmWypTskV5
 tIkFwkbzxuXMfXkEciVSqWPptC3oqFMAk+1/tRYY=
To: Patrick Venture <venture@google.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Fan PWM monitoring and control
Message-ID: <_Nl9cDEblRON25jUEVZy-xP4bxr_xoMpODmc9FCcRWNpgk3sFL_ZHmcHAwVQaEdzB1V8KjJ1k3U_a90MQMP2nIzosFt_jwC3j3vSPxTvEGs=@protonmail.com>
In-Reply-To: <CAO=notzaok+dsfR0uRJUy2ZGHMiMZZC9Jm704B5HfCS8CLPnEQ@mail.gmail.com>
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <87e610aa-72c7-32d2-9281-2c89023d397a@linux.ibm.com>
 <CAO=notzaok+dsfR0uRJUy2ZGHMiMZZC9Jm704B5HfCS8CLPnEQ@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick, Matt,

I tried instructions from this wiki: https://developer.ibm.com/linuxonpower=
/2019/01/07/how-to-port-openbmc/
There is no GPIO to detect presence of fans, so tach readings is used inste=
ad.

Here's what I did while trying to enable Fan control:

1. Added Fan tach sensor in hwmon (adt7462.conf) is in the form LABEL=3DFAN=
x_RPM
2. "ipmi-sensor-inventory.yaml" has below config:

60: &fan_tach
  sensorType: 0x04
  path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
  sensorReadingType: 0x01
  multiplierM: 100
  offsetB: 0
  bExp: 0
  unit: xyz.openbmc_project.Sensor.Value.Unit.RPMS
  scale: 0
  rExp: 0
  serviceInterface: org.freedesktop.DBus.Properties
  readingType: readingData
  interfaces:
        xyz.openbmc_project.Sensor.Value:
            Value:
                Offsets:
                    0xFF:
                        type: int64_t

and FAN PWM as

89: &fanpwm
    sensorType: 0x04
    path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
    sensorReadingType: 0x01
    multiplierM: 1
    offsetB: 0
    bExp: 0
    mutability: Mutability::Write
    serviceInterface: org.freedesktop.DBus.Properties
    readingType: readingData
    interfaces:
        xyz.openbmc_project.Control.FanPwm:
            Target:
                Offsets:
                    0xFF:
                        type: uint64_t


3. I copied meta-romulus/recipes-phosphor/fans to my platform and changed F=
AN names from "fanx" to "FANx_RPM" in yaml files.

This is what get in busctl tree related to Fans:
(I expected to see FanPwm entries in busctl and I'm not sure why there are =
multiple entries in inventory).

Service xyz.openbmc_project.Hwmon-2429843755.Hwmon1:
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/sensors
      |-/xyz/openbmc_project/sensors/fan_tach
      | |-/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
      | |-/xyz/openbmc_project/sensors/fan_tach/FAN1_RPM
      | |-/xyz/openbmc_project/sensors/fan_tach/FAN2_RPM
      | `-/xyz/openbmc_project/sensors/fan_tach/FAN3_RPM
      `-/xyz/openbmc_project/sensors/temperature
        `-/xyz/openbmc_project/sensors/temperature/BACKPLANE_TEMP

Service xyz.openbmc_project.Inventory.Manager:
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/inventory
      `-/xyz/openbmc_project/inventory/system
        `-/xyz/openbmc_project/inventory/system/chassis
          `-/xyz/openbmc_project/inventory/system/chassis/motherboard
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
0
            | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN0/FAN0
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
0_RPM
            | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN0_RPM/FAN0_RPM
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
1
            | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN1/FAN1
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
1_RPM
            | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN1_RPM/FAN1_RPM
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
2
            | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN2/FAN2
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
2_RPM
            | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN2_RPM/FAN2_RPM
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
3
            | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN3/FAN3
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN=
3_RPM
            | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN3_RPM/FAN3_RPM
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan=
0
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan=
1
            |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan=
2
            `-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan=
3


Thanks,
Raj


=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Tuesday, September 17, 2019 9:18 PM, Patrick Venture <venture@google.com=
> wrote:

> On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth msbarth@linux.ibm.com wrote=
:
>
> > On 9/17/19 5:40 AM, rgrs wrote:
> >
> > > Hi,
> > > I need some help with phosphor hwmon related to fan sensors.
> > > I'm trying to control Fans in a server motherboard using ADT7462
> > > controller. Hw mon porting is done and the sysfs interfaces are worki=
ng
> > > as expected.
> > > While I am able to read RPM, i don't find pwm/target to control the f=
ans
> > > exposed as dbus objects.
> > > Do you have the hwmon config set similar to this to denote the fan
> > > targets are of PWM type?
> >
> > https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-romulus/re=
cipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/pwm-tacho-controll=
er%401e786000.conf
> >
> > > busctl --no-page tree xyz.openbmc_project.FanSensor
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > >
> > > Failed to introspect object / of service xyz.openbmc_project.FanSenso=
r:
> > > The name is not activatable
> > > No objects discovered.
> > > That does not look like a hwmon service name. If you are using
> > > phosphor-objmgr, you can use `# mapper get-service /xyz/openbmc_proje=
ct/sensors/fan_tach` otherwise you'll need to find the
> > > hwmon service name associated with your fan controller device.
>
> running`busctl tree --no-pager` will just list everything, and you
> should see your fans in there. You can use the mapper too. I was
> curious, are you using entity-manager/dbus-sensors? When you mention
> FanSensor as the service, that's what it sounds like.
>
> > > I came across this post, I think it is similar to my issue.
> > > (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/8353)
> > > Please someone point to latest documentation or reference Fan porting
> > > from openBMC repo?
> > > What are the exact fields in YAML that are used create FanPWM objects=
.
> > > The Romulus machine should be a good reference for PWM based fan cont=
rol
> > > using phosphor-hwmon. It uses the
> > > phosphor-fan-presence/[control|monitor] apps for controlling and
> > > monitoring fans
> >
> > https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus
> >
> > > (I'm using Feb release in my sandbox,
> > > https://github.com/openbmc/docs/blob/master/release/release-notes.md#=
26-feb-4-2019)
> > > Thanks,
> > > Raj
> >
> > Matt


