Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3537031B
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 23:43:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX5T94QChz302c
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 07:43:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rfV1vlUx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rfV1vlUx; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX5Sv18YVz2xxg
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 07:42:52 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id
 v23-20020a9d60570000b02902a53bac99a3so10921058otj.5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 14:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cSs5r0+pSbs5SX9QY+AHQh4iXR3/vXxm2Ozc9fCaxYU=;
 b=rfV1vlUxUhnK7dOj1a0UEj7S1iaRnFbogdX2BdsYNzhfiDE7xwtMpC/4JP6IT0+mCf
 2r3s61NqH38vWt2aURS16yXjBjNooygDqENinqt3qrcEQL3Vtah/WtWHWUMhPDSsbJA1
 xrOrvXloEBI+7+QlDXcJ0tT+zP+TOjvzhLCAQKAKQsVM2SoW3uePz9eR+Xo0pAGuDri6
 Hprm+Wub+DhIgvs3fxOf0gzhyE1AFydh3zFy+9JW0D3/QfXwGeCe+bj9FTvDTSDHutyC
 dfG2Z9ubPyyoZi9Um2P5qrGBhw5FjqRwCph/LEzIROHLF9C2RdwNPoXUpUosHyfU3OLK
 yA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cSs5r0+pSbs5SX9QY+AHQh4iXR3/vXxm2Ozc9fCaxYU=;
 b=r9Zngu01EPIjmou9Va5kERmd++ySffNkXX7fUfR2QbeoHMuuPcUO+GGWYh0qMT3ngU
 jiSkWkjmNET9c73u4OZ+a5iTwpj8tZdbYYvaE2GtvXbAJxIDqXiIAlOcKIUfKO7dokR7
 jbHUfmyR5isLGd7UJv2FxhtxTSLYgrqWs+YnoFBNtq384r0vmSvsDFHxq/o9HAjr7OZz
 wQvczqnprT7cQGheEe9R0kz+NnC9EKt4GySPIsBHpNTHO04NDXGTFutb3bww21ELNIF8
 /EvkEVicBqFQ0nQfPppFCzMdSjOD6o/LHLCZejgbSdzGmFPy5Uk2iDYmq6btjVP/QwJK
 VWUg==
X-Gm-Message-State: AOAM532aHd/XIY0anb7OsyiOGbL211Aidh+a4MrResjMXPTrWZB/hPDk
 DFfQVfi/hOGb9e9GZibnzed0Rvu/FuJ2Jw==
X-Google-Smtp-Source: ABdhPJyHVbYSBtB148uzmI2gKs8/wL8UX6yLA5nAx0rof2aHZVDqFUufGLT0ENEDYfGywU4D5lNErw==
X-Received: by 2002:a05:6830:11d6:: with SMTP id
 v22mr5003656otq.249.1619818968733; 
 Fri, 30 Apr 2021 14:42:48 -0700 (PDT)
Received: from smtpclient.apple ([70.39.113.236])
 by smtp.gmail.com with ESMTPSA id s131sm1067273oib.14.2021.04.30.14.42.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 14:42:48 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <YIxugif2LaXLaL4D@heinlein>
Date: Fri, 30 Apr 2021 15:42:47 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <514EAC3E-1CC6-4FCD-9C28-292E81C4C77F@gmail.com>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein> <2CAF9521-76FA-4160-9711-4267341B018A@gmail.com>
 <YIxugif2LaXLaL4D@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Apr 30, 2021, at 2:54 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Fri, Apr 30, 2021 at 09:43:21AM -0600, Mike Jones wrote:
>=20
>> I had a similar discussion with Guenter, who suggested that any i2c =
code in user space is problematic, but I think it also said there was =
enough locking in the drivers that SMBus transactions from /dev/i2c or =
i2c-tools would not interact with hwmon.
>=20
> I'm pretty sure there is locking such that the kernel won't let you =
talk to a
> device that is already bound to a driver.  Once you unbind the kernel =
side
> you're free to do what you want.
>=20
> What I don't recall is how much of the i2c-mux support gets propagated
> out to userspace.  Hopefully you don't have to mess with moving muxes
> and talking past those devices.  (I've seen some nasty shell scripts
> using i2c-tools doing things like this in the past.)

In networking boards, I have seen many cases where muxes are part of =
programming. Because of this, the data language we are working on, which =
is not very procedural, but does have things like order, polling, retry, =
etc, is a layered system, where there are files/data per device, and =
integration file/data that pulls in the per device files, and deals with =
muxes and such.

That is a little difficult when considering how linux handles them. My =
understanding is they are in a hierarchy, and there are multiple =
/dev/i2cN, and when you write to one of them, linux drivers move the mux =
for you. So any user space application applying a file/data, that =
handles muxes, has to handle this. So we are thinking that each mux has =
an ID, and perhaps there is a translation table that maps an abstract =
mux Id to the actual one, etc.

>=20
>> However, in general, ADI PMBus devices have a PAGE command, =
especially the LTC388X and LTC297X families.
>>=20
>> This means that many actions require locking the bus to create =
compound transactions or the use of PAGE_PLUS.
>>=20
>> The In System Programming code we support on linux via /dev/i2c has =
this issue. If another process touched hwmon during programming, and =
touches a PAGE, the programming may fail, or worse it sends the wrong =
settings.
>=20
> I'm not sure how this is even possible.  How did an hwmon driver touch
> the device and userspace access it?  I'm fairly sure.

I think I have tested this and it worked, but it was long ago. My =
recollection was hwmon and other drivers lock the i2c per transaction, =
not the driver loads/opens and keeps it locked. But I am not an expert =
here, so I could be wrong.

>=20
>> If the work within the PMBus community to have a standard programming =
file format, if it were to be applied in user space, OBMC would have to =
disable hwmon and all telemetry while the programming is in process.
>>=20
>> If the file (or data blob) was applied in a kernel driver, it could =
lock the i2c during the process so that all hwmon activity and telemetry =
are held off.
>=20
> Right.  I would expect the locking at a pmbus level so that the
> pmbus-hwmon parts would block on a mutex until the firmware update is
> complete (if firmware update were done in the pmbus driver).
>=20
>> This problem is not unique to our desire for a file format. That is =
driven by the vendors complexity and business models.
>>=20
>> But, in the context of the ADM1266, it is a multipage device. The DS =
does not say it can do PAGE_PLUS. Therefore, unless I am missing =
something, the above problems apply unless using a PAGEless bulk =
programming mechanism. I don=E2=80=99t know this part well enough to =
know how that works, or if it is published.
>>=20
>> The other two families LTC388X and LTC297X do have a PAGEless bulk =
programming. We don=E2=80=99t like do it with telemetry hammering it, =
mainly because it feels risky.
>>=20
>> Finally, one could argue that most OMBC systems are using the 1266 =
and not the other parts. But I can say I have sent patches for other =
parts to OBMC users, so they are in use.
>=20
> There is already some firmware blob support in the kernel, just not =
for
> pmbus.  Has anyone investigated what (if anything) we'd need to do to =
be
> able to leverage this?
>=20
> --=20
> Patrick Williams

