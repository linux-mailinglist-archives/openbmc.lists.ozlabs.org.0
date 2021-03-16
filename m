Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303FC33D72E
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 16:18:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0H4R17Zxz30JY
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 02:18:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=r6RlhxnP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=r6RlhxnP; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0H4C4YJWz309w
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 02:18:32 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id l12so10675304wry.2
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 08:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ryNVjMVntkFAFhl9NVH2uJCyeEaoXLXkoZx72hKyt3Y=;
 b=r6RlhxnPzl7xldVLkXJn4H/htSWmktmVC5qbZ2l8P/KFKrekbzDOXdbsMDXkDPhrUQ
 rdS/gXrc/O1z076fzctzkbN9FlxLEmTpU96IRSo8COeMMPmM07PCA8Z1AGY/3qcZtfnG
 3WZyGRu08XMX8+Vhfoc7vxa4z/alMW8D2mV4pFKFhOVmfzDamvCfxVYXr11Y2fe7mATg
 nebRObUyaqT/YYUfL5S1jSv8RWACGYrW9PjHi5g2RhYcX53pTktk5/1Uyvr/Cdsx6a7B
 iGwAalqrM+Y2WwAoucKYyDDwb7sqXcy4537jiL6kXco+koSkUlqzMl/IMRfdZBS9kXKK
 AoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ryNVjMVntkFAFhl9NVH2uJCyeEaoXLXkoZx72hKyt3Y=;
 b=Nhk+iFA1BGuJ8Tpo1qGJJSaQynjNlr2M3wXdYXLppxmURjyYPOapDoc9bVEnBaeXhX
 pZbgNvorEfRZW7kNrNoOtmE/gRykba2/29lOhiktYUgX87xJhESfGVHpAJOWtzoRaSp4
 JxXoOjKCt0ccrE8Rt9M8Y5+9jerdtP0iTS6g9S8lgzJxuhUEuu5nxUBre5DSqUO2fCtO
 9VZzG3rFMxvgYDN3I+KQikmIwWj9MM6qI5KUzfYGtPwhidh8dmOLbY0ufV1HeGMcAk1I
 /Nrdiajjv8+jisuPQ+f5tBBKO0k/g2fjF3qE33scePbY5iJQ9LZMsaw2nYEGKui+OKdm
 mL0g==
X-Gm-Message-State: AOAM533sQil3nWEnwWCHJU10hM5kicYwvQSr7jQBN/QUIyjnOFamD1xd
 FlXNmRtNlMg7KJb7ptz2OYa+BDYSZhRI/kMpw1G/ZQ==
X-Google-Smtp-Source: ABdhPJyTgTYhoL2p+mKRaPJp5vDCPMBzgo5RwyMIdxX6E4WDBZScCYgzY8qIiP/By7JL6gtIEGZoCOTIqaK3mCzQlu4=
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr2546975wry.407.1615907906162; 
 Tue, 16 Mar 2021 08:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <PSAPR04MB423111B8AD11A19255C79215F86F9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxAf2H2KXcFM2FkmaOdaxLdcSPWWnwe4uapt3DZzT9=3tA@mail.gmail.com>
 <PSAPR04MB42319855C13384AA43CEBE48F86B9@PSAPR04MB4231.apcprd04.prod.outlook.com>
In-Reply-To: <PSAPR04MB42319855C13384AA43CEBE48F86B9@PSAPR04MB4231.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 16 Mar 2021 08:18:15 -0700
Message-ID: <CAH2-KxAgikHVL8yg59e_VnmSxAyEe_AXsR4CiP_JpKZsEWNDuQ@mail.gmail.com>
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

On Tue, Mar 16, 2021 at 2:35 AM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Br=
uce_Lee@quantatw.com> wrote:
>
>
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Saturday, March 13, 2021 1:40 AM
> To: Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Bruce_Lee@quantatw.com>
> Cc: Nan Zhou <nanzhou@google.com>; rhanley@google.com; openbmc@lists.ozla=
bs.org
> Subject: Re: Fan PWM settings via Redfish
>
> On Thu, Mar 11, 2021 at 10:37 PM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) =
<Bruce_Lee@quantatw.com> wrote:
> >
> > Hi All,
> >
> >
> >
> > We are designing and implementing the Fan PWM settings via Redfish. The=
 goal is that clients can set sensor value to bmc via Redfish.
> >
> >
> >
> > We divide the work into three phases.
> >
> >
> >
> > Phase 1 is to remove the definition =E2=80=9CBMCWEB_INSECURE_UNRESTRICT=
ED_SENSOR_OVERRIDE=E2=80=9D and use new definition to =E2=80=9CBMCWEB_SPECI=
AL_MODE_SENSOR_OVERRIDE=E2=80=9D.
> >
> > The =E2=80=9CBMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE=E2=80=9D was =
added by Intel
> > group, please refer to
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fger=
r
> > it.openbmc-project.xyz%2Fc%2Fopenbmc%2Fbmcweb%2F%2B%2F30000&amp;data=3D=
0
> > 4%7C01%7CBruce_Lee%40quantatw.com%7C64a1153cd45b46eeca4008d8e57df35c%7
> > C179b032707fc4973ac738de7313561b2%7C1%7C0%7C637511676404227113%7CUnkno
> > wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> > CJXVCI6Mn0%3D%7C1000&amp;sdata=3Df604Piz1vDfItDZ3docZOPfryJesavkbOwhKyw=
J
> > oXlU%3D&amp;reserved=3D0,
> >
> > The Intel solution has 4 conditions needs to match one of them and that=
 can be work to override sensor but actually not all project needs those co=
nditions, so we want to propose to remove the insecure definition and use n=
ew definition to include the intel solution and execute when compile. It wo=
uld be no compile time with option for common project. And the insecure iss=
ue we will discuss in phase 2.
> >
> >
> >
> > Example below:
> >
> > ----------------------------------------------------------------------
> > -------------------------------
> >
> > [Before modified]
> >
> > #ifdef BMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE
> >
> > // Proceed with sensor override
> >
> > setSensorsOverride(sensorAsyncResp, allCollections);
> >
> > return;
> >
> > #endif
> >
> > doIntelSpecialModeManager code =E2=80=A6
> >
> > ----------------------------------------------------------------------
> > -------------------------------
> >
> > [After modified]
> >
> > #ifdef BMCWEB_SPECIAL_MODE_SENSOR_OVERRIDE
> >
> >       doIntelSpecialModeManager code =E2=80=A6
> >
> >       return;
> >
> > #endif
> >
> > //Proceed with sensor override
> >
> > setSensorsOverride(sensorAsyncResp, allCollections);
> >
> > ----------------------------------------------------------------------
> > -------------------------------
> >
> >
> >
> >
>
> >I suspect this check and option needs to be moved into the individual se=
nsors, so that we can differentiate between "should be settable in a test c=
ontext" and "should be settable in a normal context".
> 1. Does you mean don't change the Intel definition and keep the origin co=
de when compile time?

No, this means that the checking code needs to move from redfish into
dbus-sensors.

> 2. What do you mean this option needs to be moved into the individual sen=
sors so that we can differentiate between "should be settable in a test con=
text" and "should be settable in a normal context".
> Please provide more details about your thinking.

Individual sensors need to provide an appropriate dbus interface.
Part of that is enforcing whether or not they're writable, and
checking for the debug state of the system to do so.

>
>
> >
> > Phase 2 is to add a condition to check the sensor name=E2=80=99s Mutabl=
e value of EM if the value is true do the sensor override function else not=
 do.
>
> >I suspect this patchset needs to be moved forward if you're hoping to us=
e the mutable param:
> >https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerr=
it.openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-dbus-interfaces%2F%2B%2F363=
33&amp;data=3D04%7C01%>7CBruce_Lee%40quantatw.com%7C64a1153cd45b46eeca4008d=
8e57df35c%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C637511676404227113%7=
CUnknown%>7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DtdExxB%2BY7O1cKb%2FYMdvPGnw7YThW7J55jytD=
Ph4YWYo%3D&amp;reserved=3D0

Not quite, but close.  I wouldn't expect the configurability to be
directly configurable.  External sensor types should be mutable, all
other types should not be mutable (except in a debug context).  I
don't think there's any reason to add a separate "IsMutable" parameter
into the EM json, unless it really needs to be configurable per
sensor, which I don't think is the case.

>
> >
> > The Mutable value can be set in the sensor configuration of Entity-Mana=
ge, when using the patch command to override the sensor, it needs to check =
the EntityManager subtree=E2=80=99s sensor name and its interface =E2=80=9C=
xyz.openbmc_project.Configuration.I2CFan.Connector=E2=80=9D to check the co=
rresponding property name=E2=80=99s mutable value to decide whether executi=
ng the override function.
>
> >See above.  I suspect that the redfish code doesn't need to check the mu=
tability of the sensor, the interface should just have the correct behavior=
.  The only place I would expect to need to know the >mutability of a senso=
r is in the IPMI sdr, where we will need to set the modifiable bit appropri=
ately.
>
> For now, the function to set sensor in redfish code is to set the d-bus v=
alue directly (internally writable),  if we don't check the EM mutability i=
n Redfish, follow the Add Mutable property to Sensor Value interface, we st=
ill need to check the sensor mutable property to know whether or not to wri=
te the d-bus value in redfish or we need other external services to know wh=
ether or not to grant write permission to their users like IPMI sensor.

I'm not really following this.  My point is that the only thing that
really needs to "check" the mutability requirement is dbus-sensors.
They should only allow setting when sensors are mutable, and reject
when they're not.

>
> >
> > This achieves feature parity with the ipmi::sensor::Mutability
> > parameter of the old hardcoded YAML configuration files
>
> >Not sure what you're referring to.  That may have been something done in=
 a fork.
>
> >
> >
> >
> > Execute steps:
> >
> > 1.       Patch command to override sensor.
> >
> > 2.       Check the EM of sensor=E2=80=99s Mutable value
> >
> > 3.       If Mutable value is true do sensor override action else not do=
.
> >
> >
> >
> >
> >
> > Phase 3 is to add a new get command to get the Zone_$id=E2=80=99s "Manu=
al" value and patch command to change the fan mode from auto to manual mode=
 ("Manual":true).
> >
> > Because the fan control is use package phosphor-pid-control, when we ne=
ed to set fan pwm, it needs to set the fan mode from auto mode to manual mo=
de, for now, the phosphor-pid-control has already provided ipmi-oem command=
 to achieve this feature, so we need to implement this fan mode change via =
redfish command.
>
> >Doesn't this already work today?  I thought we had all that sorted a lon=
g time ago.  For some reason I thought we intentionally didn't expose the m=
anual/automatic param, because that only applied to >the PID loops, and PWM=
 sensor didn't expose that interface.  I need to go look at the code at som=
e point.
>
> Yes, ipmi-oem is work today. I agree it is not properly to show on redfis=
h to let users can easily change the fan mode, the reason to change fan mod=
e to the manual is for debugging. Maybe let users use ipmi-oem to replace s=
how on Redfish URLs.
>
> >
> >
> >
> > Example URLs                            |Method     |Example Payload
> >
> > --------------------------------------- |-------------- |--
> >
> > /redfish/v1/Managers/bmc      |GET           |"Oem": {
> >
> >                                                       |                =
   |         Fan": {
> >
> >                                                      |                 =
  |                    "FanZones": {
> >
> >                                                       |                =
   |                              "@odata.id": "/redfish/v1/Managers/bmc#/O=
em/OpenBmc/Fan/FanZones",
> >
> >                                                       |                =
   |                              "@odata.type": "#OemManager.FanZones",
> >
> >                                                       |                =
   |                              "Zone_0": {
> >
> >                                                       |                =
   |                                         "@odata.id": "/redfish/v1/Mana=
gers/bmc#/Oem/OpenBmc/Fan/FanZones/Zone_0",
> >
> >                                                       |                =
   |                                         "@odata.type": "#OemManager.Fa=
nZone",
> >
> >                                                       |                =
   |                                         "Chassis": {
> >
> >                                                       |                =
   |                                                    "@odata.id": "/redf=
ish/v1/Chassis/GSZ_EVT"
> >
> >                                                       |                =
   |                                         },
> >
> >                                                       |                =
   |                                         "FailSafePercent": 100.0,
> >
> >                                                       |                =
   |                                         "MinThermalOutput": 0.0,
> >
> >                                                       |                =
   |                                         "ZoneIndex": 0.0,
> >
> >                                                       |                =
   |                                         "Manual":false
> >
> >                                                       |                =
   |                              },
> >
> >                                                       |                =
   |                   },
> >
> >                                                       |                =
   |         },
> >
> >                                                      |                 =
  |}
> >
> > --------------------------------------- |-------------- |----
> >
> > /redfish/v1/Managers/bmc    | PATCH      |"Oem": { "Fan": { "FanZones":=
 { "Zone_0": { "Manual":true } } }
> >
> >
>
> >It should be noted, this schema needs some serious cleanup to make it pr=
oper resources, paths, and collections, and should version the schema files=
 appropriately.  If you're planning on extending it, I ?>would expect _some=
_ effort to be put into cleanup.  There's several github bugs that have mor=
e details, and I will leave it up to you to decide how much you'd like to d=
o as part of this work, but please >plan on some.
>
> >
> > If any thoughts on this topic, feel free to give your comments. Thanks!
> >
> >
> >
> > Sincerely,
> >
> > Bruce
