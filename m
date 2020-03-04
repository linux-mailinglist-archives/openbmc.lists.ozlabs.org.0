Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B996179B4B
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 22:52:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xnfj3cS1zDqYY
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 08:52:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=akKunSq4; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XndQ6k2LzDqM2
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 08:51:22 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id f21so3592341otp.12
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 13:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JJPycKz/YY1Gdao2BwCXHkfh6EhEJsGovm3N8RiTt/o=;
 b=akKunSq4lsAesARp1N4aYcbPuTfuml4a4+9HmcJZqFfpxqIZNqjrJq3NvfE5tR+AVS
 zkcKclP2Jb6fF7j9MsKrfduUpzKvT4dmFe7SSN7Q3BlvtN7L6f9cMBfYl+AYhNEZFetF
 uR9tNdk5yyEQ+zh/QyYv0ciDzkB34MTxUVqb6suWQ6tHIDXdmpf9VK5X1YT49S9VtSmF
 9JlyKt59DPeJB9Gir7Wr9MaUPmY0Acia4DGK5Q8tPkP/Qn5aqpVhxM1NGUMPwiwNNRtf
 10luZ8rLwTMQh+RpemRsJ9ABW9C3I/lw+GzSwviDvPb/MjluVFx1nuMx8w9HpQc8fR7n
 FdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JJPycKz/YY1Gdao2BwCXHkfh6EhEJsGovm3N8RiTt/o=;
 b=ENrfKyFmrhEtD4iZhqiY3Kjr4yAOY19PwVdLSHyTaNcCTWJ5fxalC8t5kRuTq9j8Vk
 SZIehZeqNcyufZbyDhh5PEy5+bYE1tWC93CZe/HcvCmMR75lzXHsUBQDmbPWMpqY0oxq
 YfrhRM9DmDsVHerEBkqvQ5V4X6opZHB96hVBwHwx9i+8yAjD6WyKwKc3uEEXYwqZ7CWj
 9CIPxHJl2uqAYsn9R/tTq8P5lzEgl8aqlVlaJDVvNvxt4lSceiE0jVefWUIMLbIWNNcw
 +M4Mc20zgv2hF6fMtVYjafl7QcZXyJUT2IvGKV0SYbjPyXc/Rdi9JKCEZS0F5GF4VG1b
 mEeg==
X-Gm-Message-State: ANhLgQ3wAUZO2sR5Fq02iT43F3zW88SRQyE8VZhQfMi/lMY8qd10h/az
 foXUokI/oVSpkQJIknQgAbArKDRnmpQ=
X-Google-Smtp-Source: ADFU+vt8NE/10bEWxBSnF/PtazmNPU+J3z1G2Qz551Tq8VjprknF85mZUYfSe84GdhIvfHUw74MaSw==
X-Received: by 2002:a9d:6197:: with SMTP id g23mr4074097otk.239.1583358675863; 
 Wed, 04 Mar 2020 13:51:15 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:5187:9c8f:6e2f:fa36])
 by smtp.gmail.com with ESMTPSA id p5sm673639otp.4.2020.03.04.13.51.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Mar 2020 13:51:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: BMC Compiling and running
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CA+k9xxYnQEZu=_ig+rRDJ8mMxyFDmg0MFgvOpAt-cf=t=vE8fQ@mail.gmail.com>
Date: Wed, 4 Mar 2020 15:51:14 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <8D31D6B1-20C3-4AD2-87B4-C01E84867D15@gmail.com>
References: <CA+k9xxb=5KMq+yruOAja9L9asquJ=FNPMoajyOsdHda2Ae3jTw@mail.gmail.com>
 <31609.1583172370@localhost> <5B1DBB16-3568-482E-91DC-5E35399D1888@gmail.com>
 <CA+k9xxYnQEZu=_ig+rRDJ8mMxyFDmg0MFgvOpAt-cf=t=vE8fQ@mail.gmail.com>
To: Samuel Herts <sdherts@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: openbmc@lists.ozlabs.org, Michael Richardson <mcr@sandelman.ca>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Mar 4, 2020, at 12:46 PM, Samuel Herts <sdherts@gmail.com> wrote:
>=20
> Yes, this seems to have fixed that issue. Thank you.
>=20
> When starting up the phosphor-bmc-state-manager on its own, everything =
appears to work fine, but when I restart using systemctl the journal =
entries do not appear to show any of my functions working. Previously =
the hello world would show up in the journal entry, but after adding =
more code, specifically the code seen below, nothing appears after =
systemctl starts it.

If you cat the system service file,
cat /lib/systemd/system/xyz.openbmc_project.State.BMC.service

you=E2=80=99ll see that it hard codes the path to the state manager =
binary,
ExecStart=3D/usr/bin/phosphor-bmc-state-manager

So on Romulus QEMU you should be able to directly edit the
file and point to your binary.  You=E2=80=99ll need to tell systemd to =
reload
once you edit the file:
systemctl daemon-reload

Or just stop the service and copy your version of the binary over
/usr/bin/phosphor-bmc-state-manager

On some systems, the filesystem may be read-only, you can mount
an overlay and then do the copy:
mkdir -p /tmp/persist/usr
mkdir -p /tmp/persist/work/usr
mount -t overlay -o =
lowerdir=3D/usr,upperdir=3D/tmp/persist/usr,workdir=3D/tmp/persist/work/us=
r overlay /usr

> <image.png>
> And here is the journal entry. All of the compiling has been working =
flawlessly since.
> <image.png>
>=20
> On Mon, Mar 2, 2020 at 9:51 PM Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
>=20
> > On Mar 2, 2020, at 12:06 PM, Michael Richardson <mcr@sandelman.ca> =
wrote:
> >=20
> > Samuel Herts <sdherts@gmail.com> wrote:
> >> Apologies for all the constant questions. I am trying to add code =
to the
> >> Hello World tutorial, specifically a system call to run a shell =
script on
> >> the QEMU BMC. The problem I run into is in the image below. My bmc =
state
> >> manager main looks like the following as well.
> >=20
> > It looks like your hello world program was not properly linked.
> > Usually, that results in no executable being created.
> > Maybe, you linked against a different version of a share library =
than is in
> > the target image.
>=20
> Yes, most likely your SDK that you are using to build the bmc =
application
> does not match the level of code your are running in QEMU.
>=20
> If you=E2=80=99re using images from jenkins, try and match the git =
commit
> id=E2=80=99s up in these 2 jobs (for your image and SDK)
>=20
> =
https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dromul=
us/=20
> =
https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,label=3Dbuilder,ta=
rget=3Dromulus/=20
>=20
> >=20
> > --
> > ]               Never tell me the odds!                 | ipv6 mesh =
networks [
> > ]   Michael Richardson, Sandelman Software Works        |    IoT =
architect   [
> > ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on =
rails    [
> >=20
> >=20
> >=20
>=20
>=20
>=20
> --=20
> Sincerely,=20
> Samuel Herts

