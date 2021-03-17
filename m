Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321B33F4A5
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 16:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0vny1xYnz30Dx
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 02:53:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=K580CP3a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=K580CP3a; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0vnk1SVSz30CL
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 02:53:11 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id x16so2346633wrn.4
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4SNSwY5ijt5cKGhYizRYyQG48DLBTB+xznML0VReGpA=;
 b=K580CP3aYZHkoRavBfdT/sqW32P7/3zKEsIgUQ78WTWfPzmoSPQ8gaq8fyZgxxtB5W
 PYT+QDcREfbWgx4aEitN9+1suANsGtL1p5gIYQPBf0CncQ+CVOd0bKy3V7yzPCPfM3KQ
 TDWGRfDIwbw2GHMTlPo77j+Etmrvs/nR9ZNkJyGSFENKz7fUpChAwpU4M0tLvc5S3OYg
 bB9XCYj0gCJGchMCz9sbRrp2hjjh9wVcUV/A5UzgnJNyX8RScMY6VIznkoq++tfQQnrt
 yliTaDVLjQgNpZDerj/c3e4uezUIQSSZqAHpXiNiBEW9hKkskUGV+PzKiYQ3gHCHNgWr
 aXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4SNSwY5ijt5cKGhYizRYyQG48DLBTB+xznML0VReGpA=;
 b=uRIQLEJGIxg4dmg9GJy5omh+fCalhUiWH6wiq2l5VEBR8v+Mas0Xmx6II1CSoQZdEs
 5Ldga54siBQOgVBkmuy0evU4xVPi5juc4ZeJ3FcYfi+3o8Gc8/JTlC/Lle4HI/l9JVBL
 HBBn7FTA3ssUT0sHqp0gf798JtbLizM9b10GXV2GFLP7xKR61HG0hgU3ewZoyjs/s34x
 C8wjLbya1MJ0raekP3wM0v2oItJmfIZUFHj9ANns09NYz96hIN36eQrqMSKAY8RGs7Tm
 vXDYniAwyPO69DfCCxXL1KeQQIsAvHhB1QvqnX1Xh4Kvx9sk2D/KR7TNz8jtbsoVWuVG
 cSQg==
X-Gm-Message-State: AOAM531/IZaF5rZYWZfHyBW6XIvAD4u6UHE4b74zFw/2Tp0t2ZEJu7Jp
 VmOPTl0XbpbyOndZy0SkXxJOm+eJsbT75zN++sIzhQ==
X-Google-Smtp-Source: ABdhPJxN1GEX+q/iKLi3NxzL2pqiRaGSPGVSUJ11CfWnR4q3VVamR+R2woYCVI6RpGszy3ftplSlovrp04Ey8jyNeao=
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr5080453wry.407.1615996385045; 
 Wed, 17 Mar 2021 08:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <PSAPR04MB423111B8AD11A19255C79215F86F9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxAf2H2KXcFM2FkmaOdaxLdcSPWWnwe4uapt3DZzT9=3tA@mail.gmail.com>
 <PSAPR04MB42319855C13384AA43CEBE48F86B9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxAgikHVL8yg59e_VnmSxAyEe_AXsR4CiP_JpKZsEWNDuQ@mail.gmail.com>
 <PSAPR04MB42315FBEF04B03F2CC4C38D3F86A9@PSAPR04MB4231.apcprd04.prod.outlook.com>
In-Reply-To: <PSAPR04MB42315FBEF04B03F2CC4C38D3F86A9@PSAPR04MB4231.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 17 Mar 2021 08:52:53 -0700
Message-ID: <CAH2-KxD=bkDhYtHaqNNqDo+j94qyHVG0rLki3by4NU6sVKO=8A@mail.gmail.com>
Subject: Re: Fan PWM settings via Redfish
To: =?UTF-8?B?QnJ1Y2UgTGVlICjmnY7mmIDls7sp?= <Bruce_Lee@quantatw.com>
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
 Nan Zhou <nanzhou@google.com>, "rhanley@google.com" <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 17, 2021 at 3:17 AM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Br=
uce_Lee@quantatw.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ed Tanous <edtanous@google.com>
> > Sent: Tuesday, March 16, 2021 11:18 PM
> > To: Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Bruce_Lee@quantatw.com>
> > Cc: Nan Zhou <nanzhou@google.com>; rhanley@google.com;
> > openbmc@lists.ozlabs.org
> > Subject: Re: Fan PWM settings via Redfish
> >
> > On Tue, Mar 16, 2021 at 2:35 AM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB)
> > <Bruce_Lee@quantatw.com> wrote:
> > >
> > >
> > >
> > > -----Original Message-----
> > > From: Ed Tanous <edtanous@google.com>
> > > Sent: Saturday, March 13, 2021 1:40 AM
> > > To: Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Bruce_Lee@quantatw.com>
> > > Cc: Nan Zhou <nanzhou@google.com>; rhanley@google.com;
> > > openbmc@lists.ozlabs.org
> > > Subject: Re: Fan PWM settings via Redfish
> > >
> > > On Thu, Mar 11, 2021 at 10:37 PM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=
=BB)
> > <Bruce_Lee@quantatw.com> wrote:
> > > >
> > > > Hi All,
> > > >
> > > >
> > > >
> > > > We are designing and implementing the Fan PWM settings via Redfish.=
 The
> > goal is that clients can set sensor value to bmc via Redfish.
> > > >
> > > >
> > > >
> > > > We divide the work into three phases.
> > > >
> > > >
> > > >
> > > > Phase 1 is to remove the definition
> > =E2=80=9CBMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE=E2=80=9D and use =
new
> > definition to =E2=80=9CBMCWEB_SPECIAL_MODE_SENSOR_OVERRIDE=E2=80=9D.
> > > >
> > > > The =E2=80=9CBMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE=E2=80=9D =
was added
> > by
> > > > Intel group, please refer to
> > > > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fge
> > > > rr
> > > >
> > it.openbmc-project.xyz%2Fc%2Fopenbmc%2Fbmcweb%2F%2B%2F30000&am
> > p;data
> > > > =3D0
> > > >
> > 4%7C01%7CBruce_Lee%40quantatw.com%7C64a1153cd45b46eeca4008d8e5
> > 7df35c
> > > > %7
> > > >
> > C179b032707fc4973ac738de7313561b2%7C1%7C0%7C63751167640422711
> > 3%7CUnk
> > > > no
> > > >
> > wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> > Ww
> > > > iL
> > > >
> > CJXVCI6Mn0%3D%7C1000&amp;sdata=3Df604Piz1vDfItDZ3docZOPfryJesavkbOw
> > hKy
> > > > wJ
> > > > oXlU%3D&amp;reserved=3D0,
> > > >
> > > > The Intel solution has 4 conditions needs to match one of them and =
that can
> > be work to override sensor but actually not all project needs those con=
ditions, so
> > we want to propose to remove the insecure definition and use new defini=
tion to
> > include the intel solution and execute when compile. It would be no com=
pile time
> > with option for common project. And the insecure issue we will discuss =
in phase
> > 2.
> > > >
> > > >
> > > >
> > > > Example below:
> > > >
> > > > -------------------------------------------------------------------=
-
> > > > --
> > > > -------------------------------
> > > >
> > > > [Before modified]
> > > >
> > > > #ifdef BMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE
> > > >
> > > > // Proceed with sensor override
> > > >
> > > > setSensorsOverride(sensorAsyncResp, allCollections);
> > > >
> > > > return;
> > > >
> > > > #endif
> > > >
> > > > doIntelSpecialModeManager code =E2=80=A6
> > > >
> > > > -------------------------------------------------------------------=
-
> > > > --
> > > > -------------------------------
> > > >
> > > > [After modified]
> > > >
> > > > #ifdef BMCWEB_SPECIAL_MODE_SENSOR_OVERRIDE
> > > >
> > > >       doIntelSpecialModeManager code =E2=80=A6
> > > >
> > > >       return;
> > > >
> > > > #endif
> > > >
> > > > //Proceed with sensor override
> > > >
> > > > setSensorsOverride(sensorAsyncResp, allCollections);
> > > >
> > > > -------------------------------------------------------------------=
-
> > > > --
> > > > -------------------------------
> > > >
> > > >
> > > >
> > > >
> > >
> > > >I suspect this check and option needs to be moved into the individua=
l sensors,
> > so that we can differentiate between "should be settable in a test cont=
ext" and
> > "should be settable in a normal context".
> > > 1. Does you mean don't change the Intel definition and keep the origi=
n code
> > when compile time?
> >
> > No, this means that the checking code needs to move from redfish into
> > dbus-sensors.
> >
> > > 2. What do you mean this option needs to be moved into the individual=
 sensors
> > so that we can differentiate between "should be settable in a test cont=
ext" and
> > "should be settable in a normal context".
> > > Please provide more details about your thinking.
> >
> > Individual sensors need to provide an appropriate dbus interface.
> > Part of that is enforcing whether or not they're writable, and checking=
 for the
> > debug state of the system to do so.
> >
> > >
> > >
> > > >
> > > > Phase 2 is to add a condition to check the sensor name=E2=80=99s Mu=
table value of
> > EM if the value is true do the sensor override function else not do.
> > >
> > > >I suspect this patchset needs to be moved forward if you're hoping t=
o use the
> > mutable param:
> > > >https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
ger
> > >
> > >rit.openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-dbus-interfaces%2F%
> > 2
> > >
> > >B%2F36333&amp;data=3D04%7C01%25>7CBruce_Lee%40quantatw.com%7C64
> > a1153cd4
> > >
> > >5b46eeca4008d8e57df35c%7C179b032707fc4973ac738de7313561b2%7C1
> > %7C0%7C6
> > >
> > >37511676404227113%7CUnknown%>7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIj
> > >
> > >oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DtdExxB%
> > 2BY7
> > > >O1cKb%2FYMdvPGnw7YThW7J55jytDPh4YWYo%3D&amp;reserved=3D0
> >
> > Not quite, but close.  I wouldn't expect the configurability to be dire=
ctly
> > configurable.  External sensor types should be mutable, all other types=
 should
> > not be mutable (except in a debug context).  I don't think there's any =
reason to
> > add a separate "IsMutable" parameter into the EM json, unless it really=
 needs to
> > be configurable per sensor, which I don't think is the case.
> >
> > >
> > > >
> > > > The Mutable value can be set in the sensor configuration of Entity-=
Manage,
> > when using the patch command to override the sensor, it needs to check =
the
> > EntityManager subtree=E2=80=99s sensor name and its interface
> > =E2=80=9Cxyz.openbmc_project.Configuration.I2CFan.Connector=E2=80=9D to=
 check the
> > corresponding property name=E2=80=99s mutable value to decide whether e=
xecuting the
> > override function.
> > >
> > > >See above.  I suspect that the redfish code doesn't need to check th=
e
> > mutability of the sensor, the interface should just have the correct be=
havior.
> > The only place I would expect to need to know the >mutability of a sens=
or is in
> > the IPMI sdr, where we will need to set the modifiable bit appropriatel=
y.
> > >
> > > For now, the function to set sensor in redfish code is to set the d-b=
us value
> > directly (internally writable),  if we don't check the EM mutability in=
 Redfish,
> > follow the Add Mutable property to Sensor Value interface, we still nee=
d to check
> > the sensor mutable property to know whether or not to write the d-bus v=
alue in
> > redfish or we need other external services to know whether or not to gr=
ant write
> > permission to their users like IPMI sensor.
> >
> > I'm not really following this.  My point is that the only thing that re=
ally needs to
> > "check" the mutability requirement is dbus-sensors.
> > They should only allow setting when sensors are mutable, and reject whe=
n
> > they're not.
> >
>
> IPMI has an external service to check the Mutability and allow setting wh=
en it is "Write" and reject when it's "not write".

I think we're talking past eachother a little.  My point is that dbus
should allow setting, and enforce the check, not IPMI.  That means
that we don't have to duplicate the is settable logic between IPMI and
Redfish.

> Today if we add a mutable property in the d-bus sensor, we also need an e=
xternal-service like IPMI sensor-handler to check the mutable value to gran=
t write access or not.
> You stated that "They should only allow setting when sensors are mutable =
and reject when they're not." are means an external-service as I mention ab=
ove?

I'm not following what external service would be needed in this case.
Sensors know their specific type, and the only type of sensor that
should be settable at this point is external sensor, so we can just
encode that logic into the sensor system.

>
> > >
> > > >
> > > > This achieves feature parity with the ipmi::sensor::Mutability
> > > > parameter of the old hardcoded YAML configuration files
> > >
> > > >Not sure what you're referring to.  That may have been something don=
e in a
> > fork.
> > >
> > > >
> > > >
> > > >
> > > > Execute steps:
> > > >
> > > > 1.       Patch command to override sensor.
> > > >
> > > > 2.       Check the EM of sensor=E2=80=99s Mutable value
> > > >
> > > > 3.       If Mutable value is true do sensor override action else no=
t do.
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > Phase 3 is to add a new get command to get the Zone_$id=E2=80=99s "=
Manual" value
> > and patch command to change the fan mode from auto to manual mode
> > ("Manual":true).
> > > >
> > > > Because the fan control is use package phosphor-pid-control, when w=
e need
> > to set fan pwm, it needs to set the fan mode from auto mode to manual m=
ode,
> > for now, the phosphor-pid-control has already provided ipmi-oem command=
 to
> > achieve this feature, so we need to implement this fan mode change via =
redfish
> > command.
> > >
> > > >Doesn't this already work today?  I thought we had all that sorted a=
 long
> > time ago.  For some reason I thought we intentionally didn't expose the
> > manual/automatic param, because that only applied to >the PID loops, an=
d
> > PWM sensor didn't expose that interface.  I need to go look at the code=
 at some
> > point.
> > >
> > > Yes, ipmi-oem is work today. I agree it is not properly to show on re=
dfish to let
> > users can easily change the fan mode, the reason to change fan mode to =
the
> > manual is for debugging. Maybe let users use ipmi-oem to replace show o=
n
> > Redfish URLs.
> > >
> > > >
> > > >
> > > >
> > > > Example URLs                            |Method     |Example
> > Payload
> > > >
> > > > --------------------------------------- |-------------- |--
> > > >
> > > > /redfish/v1/Managers/bmc      |GET           |"Oem": {
> > > >
> > > >                                                       |
> > |         Fan": {
> > > >
> > > >                                                      |
> > |                    "FanZones": {
> > > >
> > > >                                                       |
> > |                              "@odata.id":
> > "/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan/FanZones",
> > > >
> > > >                                                       |
> > |                              "@odata.type": "#OemManager.FanZones",
> > > >
> > > >                                                       |
> > |                              "Zone_0": {
> > > >
> > > >                                                       |
> > |                                         "@odata.id":
> > "/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan/FanZones/Zone_0",
> > > >
> > > >                                                       |
> > |                                         "@odata.type":
> > "#OemManager.FanZone",
> > > >
> > > >                                                       |
> > |                                         "Chassis": {
> > > >
> > > >                                                       |
> > |                                                    "@odata.id":
> > "/redfish/v1/Chassis/GSZ_EVT"
> > > >
> > > >                                                       |
> > |                                         },
> > > >
> > > >                                                       |
> > |                                         "FailSafePercent": 100.0,
> > > >
> > > >                                                       |
> > |                                         "MinThermalOutput": 0.0,
> > > >
> > > >                                                       |
> > |                                         "ZoneIndex": 0.0,
> > > >
> > > >                                                       |
> > |                                         "Manual":false
> > > >
> > > >                                                       |
> > |                              },
> > > >
> > > >                                                       |
> > |                   },
> > > >
> > > >                                                       |
> > |         },
> > > >
> > > >                                                      |
> > |}
> > > >
> > > > --------------------------------------- |-------------- |----
> > > >
> > > > /redfish/v1/Managers/bmc    | PATCH      |"Oem": { "Fan":
> > { "FanZones": { "Zone_0": { "Manual":true } } }
> > > >
> > > >
> > >
> > > >It should be noted, this schema needs some serious cleanup to make i=
t proper
> > resources, paths, and collections, and should version the schema files
> > appropriately.  If you're planning on extending it, I ?>would expect _s=
ome_
> > effort to be put into cleanup.  There's several github bugs that have m=
ore details,
> > and I will leave it up to you to decide how much you'd like to do as pa=
rt of this
> > work, but please >plan on some.
> > >
> > > >
> > > > If any thoughts on this topic, feel free to give your comments. Tha=
nks!
> > > >
> > > >
> > > >
> > > > Sincerely,
> > > >
> > > > Bruce
