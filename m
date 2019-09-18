Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E369B67B7
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 18:06:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YPx80SvQzF4jF
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 02:06:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="q5CdoM3L"; 
 dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YPwJ5W8GzF4h6
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 02:05:52 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id q21so249596pfn.11
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sti7tVqwTfW/QvJw76lSDkQBCjQCx5MmVgRqHRUPdng=;
 b=q5CdoM3LzTIYfcXCSfpAVE7ay9VafuVadz/5v+juPSiAXfk69o7oG6dt5wI0IjCjTX
 8X6KHcTL2O6zb6J7CV5tl5cjbRz60XLYJOMEh1/8lHWePPrxzTzaro0tm1/4bDqAI7mG
 U+v3wRS4j5ai2w1T0VYaKiVVYAUT71PMEqe5539F9wYzOwI+YtIRv9Ejj+0RJI5xn+JD
 9HL6QnATZ/XjKuQDmjDKYhQjAX4WP33TQ/CkEKCddpn3BduPMvBdXdILoCcEuoa8cJhv
 k9sv+qXNyU6tlq0Ul0N4Yv9wfY5qR9emfEdvVOW4Ni/Ha3nKdD+AjT/3tf68NLpuQ6GR
 LHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sti7tVqwTfW/QvJw76lSDkQBCjQCx5MmVgRqHRUPdng=;
 b=cpR4mS532c6o+OcwZYH3cCFHRbmZnWTpQ8c2/CgkmlejpU99CyGag/2WH4eyhIUONS
 G4BSQoK1Lhu3WrySM25SsoxwYNZ4/eAMsbbxEIcQxE6qihZPQ999NtqdxZO9O1ce4nw5
 8NOcXhfQBgQ5sfU7qFOdWnucDu3WYVi4SMUEOp0ReGZqES2HLhtO8jTy0OtOnEsJFzIx
 boAoPMuFwgymxCKFQDzUMPx/w7RGP4HOFACwY1mPQXZ9dRzEvjxpQRZVh4vGWu/f40hz
 8LqcjcBZTibcpARtlZvKS3VAqZEEHiLCEPHTLM+yNEytYPE9mVRFbo3BtbU8No1EEmrx
 uudQ==
X-Gm-Message-State: APjAAAXfTISEnOVhA/ruQEtMhZP95LjXuIJCxLWubJbuVnXOoOFA4mBk
 menZWVFgPd9vF6Y6huy2thFOhPkhkrAfQWY1uERIDA==
X-Google-Smtp-Source: APXvYqxvftukDKItRXUtJCLqiuCZy7tk0n34+Kw00NSVoTe7CMBzCh9pLQAGYksg4VcIlLXQARKZVGNUBZI5pgQ7O7Y=
X-Received: by 2002:a63:2784:: with SMTP id n126mr4546205pgn.92.1568822748093; 
 Wed, 18 Sep 2019 09:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <87e610aa-72c7-32d2-9281-2c89023d397a@linux.ibm.com>
 <CAO=notzaok+dsfR0uRJUy2ZGHMiMZZC9Jm704B5HfCS8CLPnEQ@mail.gmail.com>
 <_Nl9cDEblRON25jUEVZy-xP4bxr_xoMpODmc9FCcRWNpgk3sFL_ZHmcHAwVQaEdzB1V8KjJ1k3U_a90MQMP2nIzosFt_jwC3j3vSPxTvEGs=@protonmail.com>
In-Reply-To: <_Nl9cDEblRON25jUEVZy-xP4bxr_xoMpODmc9FCcRWNpgk3sFL_ZHmcHAwVQaEdzB1V8KjJ1k3U_a90MQMP2nIzosFt_jwC3j3vSPxTvEGs=@protonmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 18 Sep 2019 09:05:37 -0700
Message-ID: <CAO=notxUENhPn4bYZVzgyuy-tn6OxP3ojE29MBtXHLGAgkfj_w@mail.gmail.com>
Subject: Re: Fan PWM monitoring and control
To: rgrs <rgrs@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 18, 2019 at 2:30 AM rgrs <rgrs@protonmail.com> wrote:
>
> Hi Patrick, Matt,
>
> I tried instructions from this wiki: https://developer.ibm.com/linuxonpow=
er/2019/01/07/how-to-port-openbmc/
> There is no GPIO to detect presence of fans, so tach readings is used ins=
tead.
>
> Here's what I did while trying to enable Fan control:
>
> 1. Added Fan tach sensor in hwmon (adt7462.conf) is in the form LABEL=3DF=
ANx_RPM
> 2. "ipmi-sensor-inventory.yaml" has below config:
>
> 60: &fan_tach
>   sensorType: 0x04
>   path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
>   sensorReadingType: 0x01
>   multiplierM: 100
>   offsetB: 0
>   bExp: 0
>   unit: xyz.openbmc_project.Sensor.Value.Unit.RPMS
>   scale: 0
>   rExp: 0
>   serviceInterface: org.freedesktop.DBus.Properties
>   readingType: readingData
>   interfaces:
>         xyz.openbmc_project.Sensor.Value:
>             Value:
>                 Offsets:
>                     0xFF:
>                         type: int64_t
>
> and FAN PWM as
>
> 89: &fanpwm
>     sensorType: 0x04
>     path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
>     sensorReadingType: 0x01
>     multiplierM: 1
>     offsetB: 0
>     bExp: 0
>     mutability: Mutability::Write

You may need to add ::Read here too, I'm not sure anymore, but you can
check the script that builds this:

https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/writesen=
sor.mako.cpp#L69

It'll default to read, but if you've only set write, I don't know.

>     serviceInterface: org.freedesktop.DBus.Properties
>     readingType: readingData
>     interfaces:
>         xyz.openbmc_project.Control.FanPwm:
>             Target:
>                 Offsets:
>                     0xFF:
>                         type: uint64_t
>
>
> 3. I copied meta-romulus/recipes-phosphor/fans to my platform and changed=
 FAN names from "fanx" to "FANx_RPM" in yaml files.
>
> This is what get in busctl tree related to Fans:
> (I expected to see FanPwm entries in busctl and I'm not sure why there ar=
e multiple entries in inventory).
>
> Service xyz.openbmc_project.Hwmon-2429843755.Hwmon1:
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/sensors
>       |-/xyz/openbmc_project/sensors/fan_tach
>       | |-/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
>       | |-/xyz/openbmc_project/sensors/fan_tach/FAN1_RPM
>       | |-/xyz/openbmc_project/sensors/fan_tach/FAN2_RPM
>       | `-/xyz/openbmc_project/sensors/fan_tach/FAN3_RPM
>       `-/xyz/openbmc_project/sensors/temperature
>         `-/xyz/openbmc_project/sensors/temperature/BACKPLANE_TEMP

You don't get a separate entry for the PWM from phosphor-hwmon.

It's a separate interface on the same service and path.

I recommend you introspect on the path and see what interfaces are
available (as well as adding "| read" above):

busctl introspect --no-pager
xyz.openbmc_project.Hwmon-2429843755.Hwmon1
/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM

>
> Service xyz.openbmc_project.Inventory.Manager:
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/inventory
>       `-/xyz/openbmc_project/inventory/system
>         `-/xyz/openbmc_project/inventory/system/chassis
>           `-/xyz/openbmc_project/inventory/system/chassis/motherboard
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN0
>             | `-/xyz/openbmc_project/inventory/system/chassis/motherboard=
/FAN0/FAN0
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN0_RPM
>             | `-/xyz/openbmc_project/inventory/system/chassis/motherboard=
/FAN0_RPM/FAN0_RPM
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN1
>             | `-/xyz/openbmc_project/inventory/system/chassis/motherboard=
/FAN1/FAN1
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN1_RPM
>             | `-/xyz/openbmc_project/inventory/system/chassis/motherboard=
/FAN1_RPM/FAN1_RPM
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN2
>             | `-/xyz/openbmc_project/inventory/system/chassis/motherboard=
/FAN2/FAN2
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN2_RPM
>             | `-/xyz/openbmc_project/inventory/system/chassis/motherboard=
/FAN2_RPM/FAN2_RPM
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN3
>             | `-/xyz/openbmc_project/inventory/system/chassis/motherboard=
/FAN3/FAN3
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN3_RPM
>             | `-/xyz/openbmc_project/inventory/system/chassis/motherboard=
/FAN3_RPM/FAN3_RPM
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/f=
an0
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/f=
an1
>             |-/xyz/openbmc_project/inventory/system/chassis/motherboard/f=
an2
>             `-/xyz/openbmc_project/inventory/system/chassis/motherboard/f=
an3
>
>
> Thanks,
> Raj
>
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> On Tuesday, September 17, 2019 9:18 PM, Patrick Venture <venture@google.c=
om> wrote:
>
> > On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth msbarth@linux.ibm.com wro=
te:
> >
> > > On 9/17/19 5:40 AM, rgrs wrote:
> > >
> > > > Hi,
> > > > I need some help with phosphor hwmon related to fan sensors.
> > > > I'm trying to control Fans in a server motherboard using ADT7462
> > > > controller. Hw mon porting is done and the sysfs interfaces are wor=
king
> > > > as expected.
> > > > While I am able to read RPM, i don't find pwm/target to control the=
 fans
> > > > exposed as dbus objects.
> > > > Do you have the hwmon config set similar to this to denote the fan
> > > > targets are of PWM type?
> > >
> > > https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-romulus/=
recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/pwm-tacho-contro=
ller%401e786000.conf
> > >
> > > > busctl --no-page tree xyz.openbmc_project.FanSensor
> > > >
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > >
> > > > Failed to introspect object / of service xyz.openbmc_project.FanSen=
sor:
> > > > The name is not activatable
> > > > No objects discovered.
> > > > That does not look like a hwmon service name. If you are using
> > > > phosphor-objmgr, you can use `# mapper get-service /xyz/openbmc_pro=
ject/sensors/fan_tach` otherwise you'll need to find the
> > > > hwmon service name associated with your fan controller device.
> >
> > running`busctl tree --no-pager` will just list everything, and you
> > should see your fans in there. You can use the mapper too. I was
> > curious, are you using entity-manager/dbus-sensors? When you mention
> > FanSensor as the service, that's what it sounds like.
> >
> > > > I came across this post, I think it is similar to my issue.
> > > > (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/8353=
)
> > > > Please someone point to latest documentation or reference Fan porti=
ng
> > > > from openBMC repo?
> > > > What are the exact fields in YAML that are used create FanPWM objec=
ts.
> > > > The Romulus machine should be a good reference for PWM based fan co=
ntrol
> > > > using phosphor-hwmon. It uses the
> > > > phosphor-fan-presence/[control|monitor] apps for controlling and
> > > > monitoring fans
> > >
> > > https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus
> > >
> > > > (I'm using Feb release in my sandbox,
> > > > https://github.com/openbmc/docs/blob/master/release/release-notes.m=
d#26-feb-4-2019)
> > > > Thanks,
> > > > Raj
> > >
> > > Matt
>
>
