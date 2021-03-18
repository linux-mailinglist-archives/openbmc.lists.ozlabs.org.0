Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B33409A9
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 17:09:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1X5V6zxgz3bpV
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 03:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=mpHO1MEM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mpHO1MEM; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1X5G0M83z30D6
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 03:08:47 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id j7so6137396wrd.1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8RJKMRLRUWG3bOkaOgWGe9Us86TiYeVX41pB3g65qJ4=;
 b=mpHO1MEMFlLJB06Z9m7aWrRUUoxkRjQSiZHoDqY2D+uRdPXXadNmwDhs47OhYuQdmL
 g1BlYBwcIMZLa2EsSSOm7jtFnku8ynYe+F3fzOecQKGDO6dtNGzEr/28Tcf/tTVfYJ88
 guuOT6muLNpWdLcII23c5tg3oRqkIyy8WTzEvAP3Hg5691EZy+wFUHYUKfSFGNzqNNvW
 pCC/n8XpRG6cDmsd9das7nq2kLIWlBMZTYn8zCFUDQmPer55wSzTUaiwRDDXZLXUk233
 XZJY3KYqS3dNBOV4FBk2K8Cjs0nmdJVDzltqFYiZSoU0CN4FkMBT8NJjvll6+JMI7MEO
 yqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8RJKMRLRUWG3bOkaOgWGe9Us86TiYeVX41pB3g65qJ4=;
 b=Zq4s8/H18aKol7Nuifg50eNf/db0DW5JxjqEY2z30Lsxz/3/Dn02Owaa6W0Xk4slOo
 SFVelO458Ub0HHfNPBxtWOPNrSNDN4uLMN9LiPpb1EG5RslpXFklrP05+iAKVkb9x5KI
 IOsTfoXduVZvmIKo2g3vmoItNrv5hXMXTPOlliFwmlXmBo8iSgJq82SFEHtkZBwLnV66
 091gvpSArQcrFHmMB2i1D96HOy7Ynpp5K3y9/Ea6phvZGbSdsY3SZaofSvO1OjvL8cTW
 1y/7fNpYWUWpQMp2PtmSDxfWodSt9iZxQUXk0X1yswe+2kG5Bwehogmixz8Br/XWOR4k
 LAuA==
X-Gm-Message-State: AOAM5328lX6DpSmy4ettgmhlvSdCGNAfCYsSjYqmpEW1hx1Mu4yc4myA
 7OomgmUuFUmLy2P22YLz1kIS32NEjscUsrpZ5ObaGA==
X-Google-Smtp-Source: ABdhPJwbD2+EZDh5lVDv1Rv3kr1DsKncB6OXNtU3hTX9ulKcwm9OTGDQNDXY2/k7fGSW4y5YH3HcOQR0CvayfHBLvNc=
X-Received: by 2002:adf:de92:: with SMTP id w18mr10328453wrl.217.1616083723525; 
 Thu, 18 Mar 2021 09:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <PSAPR04MB423111B8AD11A19255C79215F86F9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxAf2H2KXcFM2FkmaOdaxLdcSPWWnwe4uapt3DZzT9=3tA@mail.gmail.com>
 <PSAPR04MB42319855C13384AA43CEBE48F86B9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxAgikHVL8yg59e_VnmSxAyEe_AXsR4CiP_JpKZsEWNDuQ@mail.gmail.com>
 <PSAPR04MB42315FBEF04B03F2CC4C38D3F86A9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <CAH2-KxD=bkDhYtHaqNNqDo+j94qyHVG0rLki3by4NU6sVKO=8A@mail.gmail.com>
 <PSAPR04MB42318D9300B2BF9C3745C6DDF8699@PSAPR04MB4231.apcprd04.prod.outlook.com>
In-Reply-To: <PSAPR04MB42318D9300B2BF9C3745C6DDF8699@PSAPR04MB4231.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 18 Mar 2021 09:08:32 -0700
Message-ID: <CAH2-KxDiAA0Z-Xn0nh+Rm+d=FtB=NF2XVo_WMr0HY0Jy2nKMJw@mail.gmail.com>
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

On Thu, Mar 18, 2021 at 2:24 AM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Br=
uce_Lee@quantatw.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ed Tanous <edtanous@google.com>
> > Sent: Wednesday, March 17, 2021 11:53 PM
> > To: Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Bruce_Lee@quantatw.com>
> > Cc: Nan Zhou <nanzhou@google.com>; rhanley@google.com;
> > openbmc@lists.ozlabs.org
> > Subject: Re: Fan PWM settings via Redfish
> >
> > On Wed, Mar 17, 2021 at 3:17 AM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB)
> > <Bruce_Lee@quantatw.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Ed Tanous <edtanous@google.com>
> > > > Sent: Tuesday, March 16, 2021 11:18 PM
> > > > To: Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Bruce_Lee@quantatw.com=
>
> > > > Cc: Nan Zhou <nanzhou@google.com>; rhanley@google.com;
> > > > openbmc@lists.ozlabs.org
> > > > Subject: Re: Fan PWM settings via Redfish
> > > >
> > > > On Tue, Mar 16, 2021 at 2:35 AM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=
=BB)
> > > > <Bruce_Lee@quantatw.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > -----Original Message-----
> > > > > From: Ed Tanous <edtanous@google.com>
> > > > > Sent: Saturday, March 13, 2021 1:40 AM
> > > > > To: Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <Bruce_Lee@quantatw.c=
om>
> > > > > Cc: Nan Zhou <nanzhou@google.com>; rhanley@google.com;
> > > > > openbmc@lists.ozlabs.org
> > > > > Subject: Re: Fan PWM settings via Redfish
> > > > >
> > > > > On Thu, Mar 11, 2021 at 10:37 PM Bruce Lee (=E6=9D=8E=E6=98=80=E5=
=B3=BB)
> > > > <Bruce_Lee@quantatw.com> wrote:
> > > > > >
> > > > > > Hi All,
> > > > > >
> > > > > >
> > > > > >
> > > > > > We are designing and implementing the Fan PWM settings via
> > > > > > Redfish. The
> > > > goal is that clients can set sensor value to bmc via Redfish.
> > > > > >
> > > > > >
> > > > > >
> > > > > > We divide the work into three phases.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Phase 1 is to remove the definition
> > > > =E2=80=9CBMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE=E2=80=9D and =
use new
> > > > definition to =E2=80=9CBMCWEB_SPECIAL_MODE_SENSOR_OVERRIDE=E2=80=9D=
.
> > > > > >
> > > > > > The =E2=80=9CBMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE=E2=80=
=9D was
> > added
> > > > by
> > > > > > Intel group, please refer to
> > > > > > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%
> > > > > > 2Fge
> > > > > > rr
> > > > > >
> > > >
> > it.openbmc-project.xyz%2Fc%2Fopenbmc%2Fbmcweb%2F%2B%2F30000&am
> > > > p;data
> > > > > > =3D0
> > > > > >
> > > >
> > 4%7C01%7CBruce_Lee%40quantatw.com%7C64a1153cd45b46eeca4008d8e5
> > > > 7df35c
> > > > > > %7
> > > > > >
> > > >
> > C179b032707fc4973ac738de7313561b2%7C1%7C0%7C63751167640422711
> > > > 3%7CUnk
> > > > > > no
> > > > > >
> > > >
> > wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> > > > Ww
> > > > > > iL
> > > > > >
> > > >
> > CJXVCI6Mn0%3D%7C1000&amp;sdata=3Df604Piz1vDfItDZ3docZOPfryJesavkbOw
> > > > hKy
> > > > > > wJ
> > > > > > oXlU%3D&amp;reserved=3D0,
> > > > > >
> > > > > > The Intel solution has 4 conditions needs to match one of them
> > > > > > and that can
> > > > be work to override sensor but actually not all project needs those
> > > > conditions, so we want to propose to remove the insecure definition
> > > > and use new definition to include the intel solution and execute
> > > > when compile. It would be no compile time with option for common
> > > > project. And the insecure issue we will discuss in phase 2.
> > > > > >
> > > > > >
> > > > > >
> > > > > > Example below:
> > > > > >
> > > > > > ---------------------------------------------------------------=
-
> > > > > > ----
> > > > > > --
> > > > > > -------------------------------
> > > > > >
> > > > > > [Before modified]
> > > > > >
> > > > > > #ifdef BMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE
> > > > > >
> > > > > > // Proceed with sensor override
> > > > > >
> > > > > > setSensorsOverride(sensorAsyncResp, allCollections);
> > > > > >
> > > > > > return;
> > > > > >
> > > > > > #endif
> > > > > >
> > > > > > doIntelSpecialModeManager code =E2=80=A6
> > > > > >
> > > > > > ---------------------------------------------------------------=
-
> > > > > > ----
> > > > > > --
> > > > > > -------------------------------
> > > > > >
> > > > > > [After modified]
> > > > > >
> > > > > > #ifdef BMCWEB_SPECIAL_MODE_SENSOR_OVERRIDE
> > > > > >
> > > > > >       doIntelSpecialModeManager code =E2=80=A6
> > > > > >
> > > > > >       return;
> > > > > >
> > > > > > #endif
> > > > > >
> > > > > > //Proceed with sensor override
> > > > > >
> > > > > > setSensorsOverride(sensorAsyncResp, allCollections);
> > > > > >
> > > > > > ---------------------------------------------------------------=
-
> > > > > > ----
> > > > > > --
> > > > > > -------------------------------
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > > >I suspect this check and option needs to be moved into the
> > > > > >individual sensors,
> > > > so that we can differentiate between "should be settable in a test
> > > > context" and "should be settable in a normal context".
> > > > > 1. Does you mean don't change the Intel definition and keep the
> > > > > origin code
> > > > when compile time?
> > > >
> > > > No, this means that the checking code needs to move from redfish
> > > > into dbus-sensors.
> > > >
> > > > > 2. What do you mean this option needs to be moved into the
> > > > > individual sensors
> > > > so that we can differentiate between "should be settable in a test
> > > > context" and "should be settable in a normal context".
> > > > > Please provide more details about your thinking.
> > > >
> > > > Individual sensors need to provide an appropriate dbus interface.
> > > > Part of that is enforcing whether or not they're writable, and
> > > > checking for the debug state of the system to do so.
> > > >
> > > > >
> > > > >
> > > > > >
> > > > > > Phase 2 is to add a condition to check the sensor name=E2=80=99=
s Mutable
> > > > > > value of
> > > > EM if the value is true do the sensor override function else not do=
.
> > > > >
> > > > > >I suspect this patchset needs to be moved forward if you're
> > > > > >hoping to use the
> > > > mutable param:
> > > > > >https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2
> > > > > >Fger
> > > > >
> > > >
> > >rit.openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-dbus-interfaces%2F
> > > > >%
> > > > 2
> > > > >
> > > >
> > >B%2F36333&amp;data=3D04%7C01%25>7CBruce_Lee%40quantatw.com%7C64
> > > > a1153cd4
> > > > >
> > > >
> > >5b46eeca4008d8e57df35c%7C179b032707fc4973ac738de7313561b2%7C1
> > > > %7C0%7C6
> > > > >
> > > >
> > >37511676404227113%7CUnknown%>7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > > > MDAiLCJQIj
> > > > >
> > > >
> > >oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DtdExxB%
> > > > 2BY7
> > > > > >O1cKb%2FYMdvPGnw7YThW7J55jytDPh4YWYo%3D&amp;reserved=3D0
> > > >
> > > > Not quite, but close.  I wouldn't expect the configurability to be
> > > > directly configurable.  External sensor types should be mutable, al=
l
> > > > other types should not be mutable (except in a debug context).  I
> > > > don't think there's any reason to add a separate "IsMutable"
> > > > parameter into the EM json, unless it really needs to be configurab=
le per
> > sensor, which I don't think is the case.
> > > >
> > > > >
> > > > > >
> > > > > > The Mutable value can be set in the sensor configuration of
> > > > > > Entity-Manage,
> > > > when using the patch command to override the sensor, it needs to
> > > > check the EntityManager subtree=E2=80=99s sensor name and its inter=
face
> > > > =E2=80=9Cxyz.openbmc_project.Configuration.I2CFan.Connector=E2=80=
=9D to check the
> > > > corresponding property name=E2=80=99s mutable value to decide wheth=
er
> > > > executing the override function.
> > > > >
> > > > > >See above.  I suspect that the redfish code doesn't need to chec=
k
> > > > > >the
> > > > mutability of the sensor, the interface should just have the correc=
t behavior.
> > > > The only place I would expect to need to know the >mutability of a
> > > > sensor is in the IPMI sdr, where we will need to set the modifiable=
 bit
> > appropriately.
> > > > >
> > > > > For now, the function to set sensor in redfish code is to set the
> > > > > d-bus value
> > > > directly (internally writable),  if we don't check the EM mutabilit=
y
> > > > in Redfish, follow the Add Mutable property to Sensor Value
> > > > interface, we still need to check the sensor mutable property to
> > > > know whether or not to write the d-bus value in redfish or we need
> > > > other external services to know whether or not to grant write permi=
ssion to
> > their users like IPMI sensor.
> > > >
> > > > I'm not really following this.  My point is that the only thing tha=
t
> > > > really needs to "check" the mutability requirement is dbus-sensors.
> > > > They should only allow setting when sensors are mutable, and reject
> > > > when they're not.
> > > >
> > >
> > > IPMI has an external service to check the Mutability and allow settin=
g when it is
> > "Write" and reject when it's "not write".
> >
> > I think we're talking past eachother a little.  My point is that dbus s=
hould allow
> > setting, and enforce the check, not IPMI.  That means that we don't hav=
e to
> > duplicate the is settable logic between IPMI and Redfish.
> >
> > > Today if we add a mutable property in the d-bus sensor, we also need =
an
> > external-service like IPMI sensor-handler to check the mutable value to=
 grant
> > write access or not.
> > > You stated that "They should only allow setting when sensors are muta=
ble and
> > reject when they're not." are means an external-service as I mention ab=
ove?
> >
> > I'm not following what external service would be needed in this case.
> > Sensors know their specific type, and the only type of sensor that shou=
ld be
> > settable at this point is external sensor, so we can just encode that l=
ogic into the
> > sensor system.
> >
>
> If we can distinguish an external user then we can use mutable property t=
o encode that logic into the sensor system.
> But how to distinguish an external user If no need external service, how =
to know user is from IPMI, Redfish, or console itself?
>

No need to distinguish external users from internal users in this
case.  If a sensor is settable, it doesn't matter if it's being set
from within the bmc or outside the BMC.

> > >
> > > > >
> > > > > >
> > > > > > This achieves feature parity with the ipmi::sensor::Mutability
> > > > > > parameter of the old hardcoded YAML configuration files
> > > > >
> > > > > >Not sure what you're referring to.  That may have been something
> > > > > >done in a
> > > > fork.
> > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > Execute steps:
> > > > > >
> > > > > > 1.       Patch command to override sensor.
> > > > > >
> > > > > > 2.       Check the EM of sensor=E2=80=99s Mutable value
> > > > > >
> > > > > > 3.       If Mutable value is true do sensor override action els=
e not do.
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > Phase 3 is to add a new get command to get the Zone_$id=E2=80=
=99s
> > > > > > "Manual" value
> > > > and patch command to change the fan mode from auto to manual mode
> > > > ("Manual":true).
> > > > > >
> > > > > > Because the fan control is use package phosphor-pid-control,
> > > > > > when we need
> > > > to set fan pwm, it needs to set the fan mode from auto mode to
> > > > manual mode, for now, the phosphor-pid-control has already provided
> > > > ipmi-oem command to achieve this feature, so we need to implement
> > > > this fan mode change via redfish command.
> > > > >
> > > > > >Doesn't this already work today?  I thought we had all that
> > > > > >sorted a long
> > > > time ago.  For some reason I thought we intentionally didn't expose
> > > > the manual/automatic param, because that only applied to >the PID
> > > > loops, and PWM sensor didn't expose that interface.  I need to go
> > > > look at the code at some point.
> > > > >
> > > > > Yes, ipmi-oem is work today. I agree it is not properly to show o=
n
> > > > > redfish to let
> > > > users can easily change the fan mode, the reason to change fan mode
> > > > to the manual is for debugging. Maybe let users use ipmi-oem to
> > > > replace show on Redfish URLs.
> > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > Example URLs                            |Method     |Example
> > > > Payload
> > > > > >
> > > > > > --------------------------------------- |-------------- |--
> > > > > >
> > > > > > /redfish/v1/Managers/bmc      |GET           |"Oem": {
> > > > > >
> > > > > >                                                       |
> > > > |         Fan": {
> > > > > >
> > > > > >                                                      |
> > > > |                    "FanZones": {
> > > > > >
> > > > > >                                                       |
> > > > |                              "@odata.id":
> > > > "/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan/FanZones",
> > > > > >
> > > > > >                                                       |
> > > > |                              "@odata.type":
> > > > | "#OemManager.FanZones",
> > > > > >
> > > > > >                                                       |
> > > > |                              "Zone_0": {
> > > > > >
> > > > > >                                                       |
> > > > |                                         "@odata.id":
> > > > "/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan/FanZones/Zone_0",
> > > > > >
> > > > > >                                                       |
> > > > |                                         "@odata.type":
> > > > "#OemManager.FanZone",
> > > > > >
> > > > > >                                                       |
> > > > |                                         "Chassis": {
> > > > > >
> > > > > >                                                       |
> > > > |                                                    "@odata.id":
> > > > "/redfish/v1/Chassis/GSZ_EVT"
> > > > > >
> > > > > >                                                       |
> > > > |                                         },
> > > > > >
> > > > > >                                                       |
> > > > |                                         "FailSafePercent": 100.0,
> > > > > >
> > > > > >                                                       |
> > > > |                                         "MinThermalOutput": 0.0,
> > > > > >
> > > > > >                                                       |
> > > > |                                         "ZoneIndex": 0.0,
> > > > > >
> > > > > >                                                       |
> > > > |                                         "Manual":false
> > > > > >
> > > > > >                                                       |
> > > > |                              },
> > > > > >
> > > > > >                                                       |
> > > > |                   },
> > > > > >
> > > > > >                                                       |
> > > > |         },
> > > > > >
> > > > > >                                                      |
> > > > |}
> > > > > >
> > > > > > --------------------------------------- |-------------- |----
> > > > > >
> > > > > > /redfish/v1/Managers/bmc    | PATCH      |"Oem": { "Fan":
> > > > { "FanZones": { "Zone_0": { "Manual":true } } }
> > > > > >
> > > > > >
> > > > >
> > > > > >It should be noted, this schema needs some serious cleanup to
> > > > > >make it proper
> > > > resources, paths, and collections, and should version the schema
> > > > files appropriately.  If you're planning on extending it, I ?>would
> > > > expect _some_ effort to be put into cleanup.  There's several githu=
b
> > > > bugs that have more details, and I will leave it up to you to decid=
e
> > > > how much you'd like to do as part of this work, but please >plan on=
 some.
> > > > >
> > > > > >
> > > > > > If any thoughts on this topic, feel free to give your comments.=
 Thanks!
> > > > > >
> > > > > >
> > > > > >
> > > > > > Sincerely,
> > > > > >
> > > > > > Bruce
