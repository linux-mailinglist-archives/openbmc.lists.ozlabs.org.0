Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55610339538
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 18:40:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxtQF2ldgz3d8W
	for <lists+openbmc@lfdr.de>; Sat, 13 Mar 2021 04:40:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=ov9wMDrK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ov9wMDrK; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxtQ1419sz3ckr
 for <openbmc@lists.ozlabs.org>; Sat, 13 Mar 2021 04:40:38 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id o14so1456115wrm.11
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 09:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t9NKzFe8+frHWt4qj4hgJ5Ox6u/9Ht7nPMdA3yd1drA=;
 b=ov9wMDrKFiJ9nEozvXqZeExMwIH4cknHRtgIw8LHiGVr33EH9WiDuf01imQ8y8yzQ/
 sFU3VdWAXn8Q7zvSxf2Z79muAr8QD8/vCCnd0O7lgQS/fkrnpqsGQhSq7fR7uO798Ju+
 5ROV7ENqLYZ1GAn73ZvQgvhpMukWMvFqCA0qYGKkEnjVTYdI77TFBCZPk/lmqj7q6Wjn
 r98vUHD3NzvlzDlLwRgaxSeH7E3io7T5V8McFkaeLC2u6s0r1ZBWRTkV0ku7kYHl1gIH
 EoW2jGh9xPj0ff16D6eJjuqnUsf5U7N5J37B2HGqPAlDh1phiCQRnB9orIYjzOwbauY7
 OiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t9NKzFe8+frHWt4qj4hgJ5Ox6u/9Ht7nPMdA3yd1drA=;
 b=DCbd94UBl+tj8XXTcDTVGfGc7FtCzFtR3uOR9vegvKnZnH2gNGY7L36M1TBVhAeH0Z
 hCrb3MDH4jSyh3VQXkJM1hhmTzaSGfSLkRUhUX0a2kIvpSX4TFHUVTKWa4HwNnjAFF5A
 zqMHtguvdB3WIIdACXIKB6bikERGSDc1F196A8IjVvW2pNEvItGKxWAY5S8yXer8os0K
 AQpevMYo8T0uVeXWb8WhQaSAG9N0HEpz69X74Ni7Ue9/WpVq6DBg0xZDe33KM49sT6ES
 TYu/RVtRaWrdOOIuYV2gqrvnAJsa7cXp3n9Sbz7nZIB7nsd+m/eFsm/URTPhoXPJvEJP
 JS+g==
X-Gm-Message-State: AOAM532PBM5VZYUI3NjeYfUHibjZHPUY+CuKqhgPzLvk+BW8Yz8x+Mkz
 I359QrgD1bha2U06qn9rvyytdsA/9HEeN593E8wELw==
X-Google-Smtp-Source: ABdhPJwSvAxFfZZKfTsqk2krgKfqYYADohssVX/4B/rhq8tQFdwa98MaGyug3mTBZZz+v+y3V0OGko8xHixp3Pufl/Y=
X-Received: by 2002:adf:9bce:: with SMTP id e14mr15843313wrc.29.1615570831921; 
 Fri, 12 Mar 2021 09:40:31 -0800 (PST)
MIME-Version: 1.0
References: <PSAPR04MB423111B8AD11A19255C79215F86F9@PSAPR04MB4231.apcprd04.prod.outlook.com>
In-Reply-To: <PSAPR04MB423111B8AD11A19255C79215F86F9@PSAPR04MB4231.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 12 Mar 2021 09:40:20 -0800
Message-ID: <CAH2-KxAf2H2KXcFM2FkmaOdaxLdcSPWWnwe4uapt3DZzT9=3tA@mail.gmail.com>
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

On Thu, Mar 11, 2021 at 10:37 PM Bruce Lee (=E6=9D=8E=E6=98=80=E5=B3=BB) <B=
ruce_Lee@quantatw.com> wrote:
>
> Hi All,
>
>
>
> We are designing and implementing the Fan PWM settings via Redfish. The g=
oal is that clients can set sensor value to bmc via Redfish.
>
>
>
> We divide the work into three phases.
>
>
>
> Phase 1 is to remove the definition =E2=80=9CBMCWEB_INSECURE_UNRESTRICTED=
_SENSOR_OVERRIDE=E2=80=9D and use new definition to =E2=80=9CBMCWEB_SPECIAL=
_MODE_SENSOR_OVERRIDE=E2=80=9D.
>
> The =E2=80=9CBMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE=E2=80=9D was ad=
ded by Intel group, please refer to https://gerrit.openbmc-project.xyz/c/op=
enbmc/bmcweb/+/30000,
>
> The Intel solution has 4 conditions needs to match one of them and that c=
an be work to override sensor but actually not all project needs those cond=
itions, so we want to propose to remove the insecure definition and use new=
 definition to include the intel solution and execute when compile. It woul=
d be no compile time with option for common project. And the insecure issue=
 we will discuss in phase 2.
>
>
>
> Example below:
>
> -------------------------------------------------------------------------=
----------------------------
>
> [Before modified]
>
> #ifdef BMCWEB_INSECURE_UNRESTRICTED_SENSOR_OVERRIDE
>
> // Proceed with sensor override
>
> setSensorsOverride(sensorAsyncResp, allCollections);
>
> return;
>
> #endif
>
> doIntelSpecialModeManager code =E2=80=A6
>
> -------------------------------------------------------------------------=
----------------------------
>
> [After modified]
>
> #ifdef BMCWEB_SPECIAL_MODE_SENSOR_OVERRIDE
>
>       doIntelSpecialModeManager code =E2=80=A6
>
>       return;
>
> #endif
>
> //Proceed with sensor override
>
> setSensorsOverride(sensorAsyncResp, allCollections);
>
> -------------------------------------------------------------------------=
----------------------------
>
>
>
>

I suspect this check and option needs to be moved into the individual
sensors, so that we can differentiate between "should be settable in a
test context" and "should be settable in a normal context".

>
> Phase 2 is to add a condition to check the sensor name=E2=80=99s Mutable =
value of EM if the value is true do the sensor override function else not d=
o.

I suspect this patchset needs to be moved forward if you're hoping to
use the mutable param:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/363=
33

>
> The Mutable value can be set in the sensor configuration of Entity-Manage=
, when using the patch command to override the sensor, it needs to check th=
e EntityManager subtree=E2=80=99s sensor name and its interface =E2=80=9Cxy=
z.openbmc_project.Configuration.I2CFan.Connector=E2=80=9D to check the corr=
esponding property name=E2=80=99s mutable value to decide whether executing=
 the override function.

See above.  I suspect that the redfish code doesn't need to check the
mutability of the sensor, the interface should just have the correct
behavior.  The only place I would expect to need to know the
mutability of a sensor is in the IPMI sdr, where we will need to set
the modifiable bit appropriately.

>
> This achieves feature parity with the ipmi::sensor::Mutability parameter =
of the old hardcoded YAML configuration files

Not sure what you're referring to.  That may have been something done in a =
fork.

>
>
>
> Execute steps:
>
> 1.       Patch command to override sensor.
>
> 2.       Check the EM of sensor=E2=80=99s Mutable value
>
> 3.       If Mutable value is true do sensor override action else not do.
>
>
>
>
>
> Phase 3 is to add a new get command to get the Zone_$id=E2=80=99s "Manual=
" value and patch command to change the fan mode from auto to manual mode (=
"Manual":true).
>
> Because the fan control is use package phosphor-pid-control, when we need=
 to set fan pwm, it needs to set the fan mode from auto mode to manual mode=
, for now, the phosphor-pid-control has already provided ipmi-oem command t=
o achieve this feature, so we need to implement this fan mode change via re=
dfish command.

Doesn't this already work today?  I thought we had all that sorted a
long time ago.  For some reason I thought we intentionally didn't
expose the manual/automatic param, because that only applied to the
PID loops, and PWM sensor didn't expose that interface.  I need to go
look at the code at some point.

>
>
>
> Example URLs                            |Method     |Example Payload
>
> --------------------------------------- |-------------- |--
>
> /redfish/v1/Managers/bmc      |GET           |"Oem": {
>
>                                                       |                  =
 |         Fan": {
>
>                                                      |                   =
|                    "FanZones": {
>
>                                                       |                  =
 |                              "@odata.id": "/redfish/v1/Managers/bmc#/Oem=
/OpenBmc/Fan/FanZones",
>
>                                                       |                  =
 |                              "@odata.type": "#OemManager.FanZones",
>
>                                                       |                  =
 |                              "Zone_0": {
>
>                                                       |                  =
 |                                         "@odata.id": "/redfish/v1/Manage=
rs/bmc#/Oem/OpenBmc/Fan/FanZones/Zone_0",
>
>                                                       |                  =
 |                                         "@odata.type": "#OemManager.FanZ=
one",
>
>                                                       |                  =
 |                                         "Chassis": {
>
>                                                       |                  =
 |                                                    "@odata.id": "/redfis=
h/v1/Chassis/GSZ_EVT"
>
>                                                       |                  =
 |                                         },
>
>                                                       |                  =
 |                                         "FailSafePercent": 100.0,
>
>                                                       |                  =
 |                                         "MinThermalOutput": 0.0,
>
>                                                       |                  =
 |                                         "ZoneIndex": 0.0,
>
>                                                       |                  =
 |                                         "Manual":false
>
>                                                       |                  =
 |                              },
>
>                                                       |                  =
 |                   },
>
>                                                       |                  =
 |         },
>
>                                                      |                   =
|}
>
> --------------------------------------- |-------------- |----
>
> /redfish/v1/Managers/bmc    | PATCH      |"Oem": { "Fan": { "FanZones": {=
 "Zone_0": { "Manual":true } } }
>
>

It should be noted, this schema needs some serious cleanup to make it
proper resources, paths, and collections, and should version the
schema files appropriately.  If you're planning on extending it, I
would expect _some_ effort to be put into cleanup.  There's several
github bugs that have more details, and I will leave it up to you to
decide how much you'd like to do as part of this work, but please plan
on some.

>
> If any thoughts on this topic, feel free to give your comments. Thanks!
>
>
>
> Sincerely,
>
> Bruce
