Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF3253040
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 15:48:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc6d758cDzDqSp
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 23:48:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=toyE2Jun; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc6Z15vGtzDqTg
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 23:45:28 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id d189so1096249oig.12
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=QbFxPNmHZtYB4SvLd0PHmQIBEJSj7nYpu4pZB23JNyg=;
 b=toyE2Junec/ArXc1mr7V4NLXAXS/3shj05zxsMfkOYHaU2cULm+hAig+W6roUepuO4
 4WjOOP413FyfjjKvmsiBioRiiryQNKe9oCzY30wO8MV5dOi5CgnsspnJXrifwdP1snkp
 UwnIpx9RM+FYupaosHSwmEcyZPQZnJbtXk4e+6jO1Dt3RuZ0ESm958KEHcKI+w1lUw7m
 E4uzyJaVV515ECjrffazPsy2Ju5VRtnYMiYBrHGzhokVmbvuBiqb5SPpam7uYoGAvQW5
 e15j0PvzOb6z3GdF2oHgID7q9gdvnwOik0tLP+l2FK4ZoTyuPi3MubRlf1fyavsd6O9L
 F4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=QbFxPNmHZtYB4SvLd0PHmQIBEJSj7nYpu4pZB23JNyg=;
 b=LkolZOFRcIzo1bmQBjLE9WD6SSbSpv3S7rQvvQCVgeSTPUa+2+lZILD1ZqrZtVO3Zw
 Ba8UcWXYNcCLdIvLomfQpm+78o83YNo4J2YwSflMA//A10Irlfkxhm33tfupQbF7Hwiy
 poWyo4jXwmKb70a8x5/LCh2xczNP60MS3YL/hBPoEorLuGwCXEwR8CaFmquOky8w8Xqt
 nHZDchgxL6zHFtYut+I6kpdp/4uq8qvQdyLRZJ2VuzgsqMuXXC4R7mUqi7pHMkzOt9rZ
 O0YbTccGG60f7ZVBTA03AW6jIuqMo+GH6/Qr5pDNDvBS1i2hrWANOs4eQ+i3wTTabuBx
 NFNA==
X-Gm-Message-State: AOAM530XMM2zQGyIUnpV3JmpOhvoDWrgX7wsR2jmwFW+KgQ1kkQB9VBB
 NouKsifZwf+xey3LCCXsoOAWTTl+ySo=
X-Google-Smtp-Source: ABdhPJxx4m5pxjcJ7DMDoVt7aEMNGtsBnzF3TFUT/16DtMpSSLO8w/uokqBG3J6SZH0uLtSBpaZv0A==
X-Received: by 2002:aca:a88d:: with SMTP id r135mr3701870oie.7.1598449524645; 
 Wed, 26 Aug 2020 06:45:24 -0700 (PDT)
Received: from ?IPv6:2600:100e:b025:e709:4965:73eb:3f95:6a2e?
 ([2600:100e:b025:e709:4965:73eb:3f95:6a2e])
 by smtp.gmail.com with ESMTPSA id l6sm509320otd.20.2020.08.26.06.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 06:45:24 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: systemd clarification
Date: Wed, 26 Aug 2020 07:45:23 -0600
Message-Id: <61CFB1DD-83E4-4664-A807-43A8F00F91CB@gmail.com>
References: <20200826091619.GG2172@morley.fr.hpecorp.net>
In-Reply-To: <20200826091619.GG2172@morley.fr.hpecorp.net>
To: Bruno Cornec <Bruno.Cornec@hpe.com>
X-Mailer: iPad Mail (17G68)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Bruno,

I found an example meta layer that modifies a service and uses gpio to power=
 on/off.

My bigger problem is linux. =46rom studying the regulator driver, the intent=
 is when controlling power to hardware that is auxiliary to the device runni=
ng the kernel, like ethernet or a RF power amplifier, the driver for that un=
it makes client driver calls to regulator.

For obmc, reg control for the host is similar. Current designs use gpio. Thi=
s is limiting for non cpu based designs with complex sequencing, and does no=
t allow for PMBus devices with margin capability in cases where the bmc is p=
art of system testing/diagnostics.

What is missing is dbus access to the PMBus OPERATION command.

You can=E2=80=99t use /dev/i2c because hwmon locks it, amd hwmon is used for=
 sensor monitoring.

I think the solution is to configure the regulator in the devicetree such th=
at suspend and other state like changes don=E2=80=99t enable/disable, the ad=
d a regulatorctl driver that dbus can use for control.=20

Then we have to chose a user mode interface like ioctl, debugfs, or sysfs. I=
=E2=80=99m thinking sysfs, so that it is easy to script and we don=E2=80=99t=
 need a compiled user mode application.=20

=46rom the point of view of cpu based systems, nobody may care. But I am loo=
king beyond that. I see so many custom bmc designs that could use obmc with s=
ome extra infrastructure. My interest is the power control, because that my a=
rea of specialty and applications, both for work, and as a PMBus standards c=
ommittee member.

Anybody have thoughts on how to structure a regulatorctl client driver user m=
ode interface?

Mike

Sent from my iPad

> On Aug 26, 2020, at 3:16 AM, Bruno Cornec <Bruno.Cornec@hpe.com> wrote:
>=20
> =EF=BB=BFSorry Mike, I can't really comment on the OpenBMC side, as I'm mo=
re a reader here than a contriutor myself. Someone else more accustomed to t=
hat will surely give you an answer.
>=20
> Best regards,
> Bruno.
>=20
> Mike Jones said on Tue, Aug 25, 2020 at 12:03:23PM -0600:
>=20
>> Bruno,
>>=20
>> A related question.
>>=20
>> When I look through the services and targets installed when including met=
a-phosphor, power on/off seems to lead to dead ends, meaning no exe to do th=
e work.
>>=20
>> So I looked at meta-facebook, and it adds host-poweron.service, which cal=
ls exec power-util=E2=80=A6
>>=20
>> So it seems to me that meta-phosphor only puts in the infrastructure, and=
 a particular use/design requires adding services to do the actual work of p=
ower on/off. This seems logical wrt factoring out behaviors. Is this correct=
?
>>=20
>> This would mean in my cause of use meta-raspberrypi, I need to add the mi=
ssing pieces if I want power control of my externally connected regulators t=
o get powered on/off.
>>=20
>> Mike
>>=20
>>>> On Aug 25, 2020, at 10:52 AM, Bruno Cornec <Bruno.Cornec@hpe.com> wrote=
:
>>>=20
>>> Hello,
>>>=20
>>> /etc/systemd is used to override or add locally units which are not deli=
vered as part of the std systemd delivery which is under /lib/systemd (or /u=
sr/lib/systemd depending on Linux distribuions). It's an easy way to modify a=
 std unit file and change say the options used to start the daemon e.g.
>>> So:
>>>=20
>>> Mike Jones said on Tue, Aug 25, 2020 at 10:20:54AM -0600:
>>>> The lib path is not a search path in the systemd documentation, and the=
 etc path has links into the lib path. So I assume services in the lib path a=
re only run if they are linked into the etc path. Is this correct?
>>>=20
>>> No. they are run if they are enabled (systemctl list-units to see that)
>>>=20
>>>> If there is a an After=3D that lists something found only in the lib pa=
th, I assume it will run because After is not strong enough to prevent start=
. But if it was Requires=3D, then I assume it cannot start unless it is link=
ed into the etc path so that it is available. Is this correct?
>>>=20
>>> No. No link is necessary.
>>> Best regards,
>>> Bruno.
>>> --
>>> HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/openso=
urce
>>> Open Source Profession, WW Linux Community Lead    http://github.com/bco=
rnec
>>> FLOSS projects:     http://mondorescue.org         http://project-builde=
r.org
>>> Musique ancienne?   http://www.musique-ancienne.org   http://www.medieva=
l.org
>=20
> --=20
> HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/opensour=
ce
> Open Source Profession, WW Linux Community Lead    http://github.com/bcorn=
ec
> FLOSS projects:     http://mondorescue.org        http://project-builder.o=
rg
> Musique ancienne?   http://www.musique-ancienne.org  http://www.medieval.o=
rg
