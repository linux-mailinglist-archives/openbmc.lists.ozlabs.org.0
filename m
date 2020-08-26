Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0025341C
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 17:56:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc9Tb4XWYzDqXV
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 01:56:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TlYRVqyv; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc9SP67lqzDqHg
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 01:55:47 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id v13so1908094oiv.13
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Q1HoWrDXIuYhVRh+6EpUeDpo++nvKzx8NdRH3fOgoz8=;
 b=TlYRVqyv14So0UK2H9rsQBSKkkrJDeJOu3PCNFfVQ3LE7P9ClCLstxsi70FmiC7DkI
 fN+crYpXF9RPsbzzbDR3jylEws1yF1566f1YkyJIccZpI321ZKbgR9lMRPVpP3citmTx
 Z8Wy9BESMKJEd0MvijEvFVe3ptPWmmI56Lhl6iFgavRumNtBzZ7CFalmyXgDP36Sgp2c
 W+Qord7un+9wWi+zKGSZ+zZFi1Ei+E0avLq6n5y7z+KfPuzEKLHF0SJZrDY2LxB0m3+O
 mKEZ+uevgB7DCv8mUOXgEOXqMgI+YfZn0wR8ZWuQ+x5k7wfD9zEMVn+cczxWDWhpY3ae
 1r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Q1HoWrDXIuYhVRh+6EpUeDpo++nvKzx8NdRH3fOgoz8=;
 b=m6GMj6DkFVk9Inp++R91Kko1sZ/K/dYOXLh1lcTPWx4yGx0XF9scJauPWawQMwTkyf
 ofq32SGgL3psJbkReGo+4VPtx0JXQM1njFnjupsXO0fdVf7JcjOA2+K8RTZP+QlkSbV+
 JnZKw9u6STq9Ob8wSL7Yi4D3lHX22Rg1Ce/hfT2MitcE+sCaeDidgZvhh2jy8aiMOB9j
 UDAl1uL1QTOgyE/jBNZL5mmeBqn9kCtMyYjWgLW/1GAZl43ZeSyGcT5giM58eWG0P087
 DRlCLdXr2i31iz9Uyig9nRRnmGbqb8TkQrCrGPHPkYaNVs8JC3CLg91ZEzj6F/jkybvY
 3bYQ==
X-Gm-Message-State: AOAM533BLPSW25dEwqIARwaL69lva831JQQ1Q/MQ6u9ADiFhmTYDuJBZ
 dpWZSsLtHNJ8BEsqi/MIBKbyor1x+lFnwg==
X-Google-Smtp-Source: ABdhPJxkBcwEBlrSco9T4nfVHWYfvV+24aqV4bBYhAH7ksjBXD/cKt8rKDMrWGG2Q+0l6OG+zXMfxQ==
X-Received: by 2002:aca:5cd5:: with SMTP id q204mr4445062oib.107.1598457344762; 
 Wed, 26 Aug 2020 08:55:44 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:1c43:f98b:2c1c:5311?
 ([2601:281:c001:2359:1c43:f98b:2c1c:5311])
 by smtp.gmail.com with ESMTPSA id k23sm586048oig.28.2020.08.26.08.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 08:55:44 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: systemd clarification
Date: Wed, 26 Aug 2020 09:55:43 -0600
Message-Id: <90526515-D0E4-4B36-96C1-2E5C05539029@gmail.com>
References: <a9e18e05-4dde-61cd-a25c-c4072bfc676f@linux.ibm.com>
In-Reply-To: <a9e18e05-4dde-61cd-a25c-c4072bfc676f@linux.ibm.com>
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Bruno Cornec <Bruno.Cornec@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Matt,

Cool, I will have a look.

I also found there is i2cset -f.

I need to find out if it is atomic wrt hwmon. If it is, I could use PAGE_PLU=
S to get around hwmon mucking with PAGE. Not as general purpose though, and s=
ome of our devices don=E2=80=99t support PAGE_PLUS

Mike

Sent from my iPad

> On Aug 26, 2020, at 9:37 AM, Matt Spinler <mspinler@linux.ibm.com> wrote:
>=20
> =EF=BB=BFHi,
>=20
> Not sure you will find it useful, but have a regular control app, phosphor=
-regulators, that uses /dev/i2c along with
> JSON configuration files to do arbitrary regulator control and configurati=
on.  It also does its own sensor monitoring as
> the devices can't use hwmon since it already uses /dev/i2c.  It has D-Bus i=
nterfaces into it to kick things off.
>=20
> https://github.com/openbmc/phosphor-power/tree/master/phosphor-regulators
>=20
> Ideally this would all have been done using device drivers, but we were re=
source constrained and also have to deal
> with our hardware teams wanting to be able to do last minute configuration=
 changes to all sorts of models of
> regulators we use.
>=20
> Also, while this is geared toward regulators, it would work for any PMBus/=
I2C based devices.
>=20
>> On 8/26/2020 8:45 AM, Mike Jones wrote:
>> Bruno,
>>=20
>> I found an example meta layer that modifies a service and uses gpio to po=
wer on/off.
>>=20
>> My bigger problem is linux. =46rom studying the regulator driver, the int=
ent is when controlling power to hardware that is auxiliary to the device ru=
nning the kernel, like ethernet or a RF power amplifier, the driver for that=
 unit makes client driver calls to regulator.
>>=20
>> For obmc, reg control for the host is similar. Current designs use gpio. T=
his is limiting for non cpu based designs with complex sequencing, and does n=
ot allow for PMBus devices with margin capability in cases where the bmc is p=
art of system testing/diagnostics.
>>=20
>> What is missing is dbus access to the PMBus OPERATION command.
>>=20
>> You can=E2=80=99t use /dev/i2c because hwmon locks it, amd hwmon is used f=
or sensor monitoring.
>>=20
>> I think the solution is to configure the regulator in the devicetree such=
 that suspend and other state like changes don=E2=80=99t enable/disable, the=
 add a regulatorctl driver that dbus can use for control.
>>=20
>> Then we have to chose a user mode interface like ioctl, debugfs, or sysfs=
. I=E2=80=99m thinking sysfs, so that it is easy to script and we don=E2=80=99=
t need a compiled user mode application.
>>=20
>> =46rom the point of view of cpu based systems, nobody may care. But I am l=
ooking beyond that. I see so many custom bmc designs that could use obmc wit=
h some extra infrastructure. My interest is the power control, because that m=
y area of specialty and applications, both for work, and as a PMBus standard=
s committee member.
>>=20
>> Anybody have thoughts on how to structure a regulatorctl client driver us=
er mode interface?
>>=20
>> Mike
>>=20
>> Sent from my iPad
>>=20
>>>> On Aug 26, 2020, at 3:16 AM, Bruno Cornec <Bruno.Cornec@hpe.com> wrote:=

>>>=20
>>> =EF=BB=BFSorry Mike, I can't really comment on the OpenBMC side, as I'm m=
ore a reader here than a contriutor myself. Someone else more accustomed to t=
hat will surely give you an answer.
>>>=20
>>> Best regards,
>>> Bruno.
>>>=20
>>> Mike Jones said on Tue, Aug 25, 2020 at 12:03:23PM -0600:
>>>=20
>>>> Bruno,
>>>>=20
>>>> A related question.
>>>>=20
>>>> When I look through the services and targets installed when including m=
eta-phosphor, power on/off seems to lead to dead ends, meaning no exe to do t=
he work.
>>>>=20
>>>> So I looked at meta-facebook, and it adds host-poweron.service, which c=
alls exec power-util=E2=80=A6
>>>>=20
>>>> So it seems to me that meta-phosphor only puts in the infrastructure, a=
nd a particular use/design requires adding services to do the actual work of=
 power on/off. This seems logical wrt factoring out behaviors. Is this corre=
ct?
>>>>=20
>>>> This would mean in my cause of use meta-raspberrypi, I need to add the m=
issing pieces if I want power control of my externally connected regulators t=
o get powered on/off.
>>>>=20
>>>> Mike
>>>>=20
>>>>>> On Aug 25, 2020, at 10:52 AM, Bruno Cornec <Bruno.Cornec@hpe.com> wro=
te:
>>>>> Hello,
>>>>>=20
>>>>> /etc/systemd is used to override or add locally units which are not de=
livered as part of the std systemd delivery which is under /lib/systemd (or /=
usr/lib/systemd depending on Linux distribuions). It's an easy way to modify=
 a std unit file and change say the options used to start the daemon e.g.
>>>>> So:
>>>>>=20
>>>>> Mike Jones said on Tue, Aug 25, 2020 at 10:20:54AM -0600:
>>>>>> The lib path is not a search path in the systemd documentation, and t=
he etc path has links into the lib path. So I assume services in the lib pat=
h are only run if they are linked into the etc path. Is this correct?
>>>>> No. they are run if they are enabled (systemctl list-units to see that=
)
>>>>>=20
>>>>>> If there is a an After=3D that lists something found only in the lib p=
ath, I assume it will run because After is not strong enough to prevent star=
t. But if it was Requires=3D, then I assume it cannot start unless it is lin=
ked into the etc path so that it is available. Is this correct?
>>>>> No. No link is necessary.
>>>>> Best regards,
>>>>> Bruno.
>>>>> --
>>>>> HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/open=
source
>>>>> Open Source Profession, WW Linux Community Lead    http://github.com/b=
cornec
>>>>> FLOSS projects:     http://mondorescue.org         http://project-buil=
der.org
>>>>> Musique ancienne?   http://www.musique-ancienne.org   http://www.medie=
val.org
>>> --=20
>>> HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/openso=
urce
>>> Open Source Profession, WW Linux Community Lead    http://github.com/bco=
rnec
>>> FLOSS projects:     http://mondorescue.org        http://project-builder=
.org
>>> Musique ancienne?   http://www.musique-ancienne.org  http://www.medieval=
.org
>=20
