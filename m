Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CCA49114F
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 22:25:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jd4gk6l6Zz302S
	for <lists+openbmc@lfdr.de>; Tue, 18 Jan 2022 08:25:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XRie9QzH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XRie9QzH; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jd4gJ06N7z302S
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jan 2022 08:24:57 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id g205so25489724oif.5
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jan 2022 13:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=7x2pWKIDEhaX8szRb6EI/VMu2yBa+y683gNUYhyQVm8=;
 b=XRie9QzH97MKupf+iapuV8cNyV1m2zP52IbBhKewdEfViT1IovEoL+9aaud/i0sDMu
 wP8CfXdvzoO4JmnCQ2cqeMt+62b1MDqnonLprTxh1S0r1DyJv65hq12qwjDDK+NMzDBq
 nVY19eHC9LpetkRUAcyefZTtFhFmh93wjQ0VIe2DFzkyRiKhECxMqqotOXnsGAZuq9xI
 zt5hJKinYBcaD9DRJf13RFFRUuDUM6JqN84CgIuG6ATBO4zBUAnN6Ti/QIU7O/9014FK
 4qebMDlyyZYKZplAv55lSZsSA48P2/AmuDezyiqF2jcdL/c1f+OsUqpWonOkau9o9ZYm
 pJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=7x2pWKIDEhaX8szRb6EI/VMu2yBa+y683gNUYhyQVm8=;
 b=uBLHld/m4QFz6VrBfZClD8LGJaiYfYgWTCJNXUmAfkXHuME2zEH1D5A9O+VPj8jCqe
 PSpfLPU+E8TC3ge6SKSix5q81ktZUEpJeKR1EaqoduSOS3MN9XMtQn+mu4Nb3BFj5EPu
 oozQco1gPgpJVzxIak5YU8sJNBTJ9M37BPbGffdUCXKeaRr5o0TA60Ba7aVxC/ZXqq2R
 aWcoRSMwfCmlYp1qhnDBSFc3RTPJQcJTgvJjd4rM6SYnsnWlklMjjJ6/c2tFIq/lkEYj
 N+p9V0RK0LCU8UIU7iBGPDel9cxITq9VwaO95PWURLsYp0j3wf2LDzKweqsyPoErHBEn
 L6oQ==
X-Gm-Message-State: AOAM5330Wli/PkZ+aTq5FDPYTuHSrhcucWg2YMQv3cFm40lQTtpEsp7w
 sc4XGvBJV+72rCbN3eWx8Hiu9upRyl0=
X-Google-Smtp-Source: ABdhPJxw8ggw3uawi7Dhw0wCLMS7mLKjy1x9Q8zcS3xQBhXH0asm8bTChFHC5kQTm3J4bXvKSr0Vmw==
X-Received: by 2002:aca:1010:: with SMTP id 16mr18683573oiq.68.1642454692788; 
 Mon, 17 Jan 2022 13:24:52 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b060:1439:89b4:7366:b093:c2bc])
 by smtp.gmail.com with ESMTPSA id s11sm1724835otv.19.2022.01.17.13.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 13:24:52 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Sanitycheck problem
Date: Mon, 17 Jan 2022 14:24:51 -0700
Message-Id: <19C743A1-9BAA-4C34-A55C-C5344B8456C7@gmail.com>
References: <6B9402E7-B169-4ADA-AF7C-FA4C574E0A70@gmail.com>
In-Reply-To: <6B9402E7-B169-4ADA-AF7C-FA4C574E0A70@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: iPad Mail (19C56)
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

Patrick,

I figured out how to build and install and sdk, and then I could compile pro=
perly.

Mike

Sent from my iPad

> On Jan 17, 2022, at 10:17 AM, Mike Jones <proclivis@gmail.com> wrote:
>=20
> =EF=BB=BFPatrick,
>=20
> There is no ninja.build file, so it won=E2=80=99t compile.
>=20
> Nonetheless, in general, how are people developing, compiling, testing thi=
ngs like dbus_semsors? I spent some time trying to compile it on Ubuntu, and=
 I just went down a rabbit hole. I assume yocto has some general cross compi=
lation other than devtool?
>=20
> Sorry for such a newbie question. Just a pointer and a url and I=E2=80=99l=
l go do the learning.
>=20
> Mike
>=20
> Sent from my iPad
>=20
>>> On Jan 14, 2022, at 11:41 AM, Patrick Williams <patrick@stwcx.xyz> wrote=
:
>>>=20
>>> =EF=BB=BFOn Thu, Jan 13, 2022 at 05:24:00PM -0700, Mike Jones wrote:
>>> This is the error:
>>>=20
>>> root@ubuntu:~/share/design/code/openbmc/build/ast2600-default/tmp/work/a=
rmv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-r0/git# <mailto:root@ubuntu:~/share/design/code/openbmc/build/ast2600-defa=
ult/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUT=
OINC+26601e8919-r0/git#> meson build
>>> The Meson build system
>>> Version: 0.58.1
>>> Source dir: /home/openbmc/share/design/code/openbmc/build/ast2600-defaul=
t/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOI=
NC+26601e8919-r0/git
>>> Build dir: /home/openbmc/share/design/code/openbmc/build/ast2600-default=
/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOIN=
C+26601e8919-r0/git/build
>>> Build type: native build
>>> Project name: dbus-sensors
>>> Project version: 0.1
>>>=20
>>> meson.build:1:0: ERROR: Could not invoke sanity test executable: [Errno 8=
] Exec format error: '/home/openbmc/share/design/code/openbmc/build/ast2600-=
default/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gi=
tAUTOINC+26601e8919-r0/git/build/meson-private/sanitycheckcpp.exe'.
>>>=20
>>> A full log can be found at /home/openbmc/share/design/code/openbmc/build=
/ast2600-default/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-senso=
rs/0.1+gitAUTOINC+26601e8919-rroot@ubuntu:~root@ubrootroot@ubuntu:~/share/de=
sign/code/openbmc/build/ast2600-default/tmp/work/armv7ahf-vfpv4d16-openbmc-l=
inux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e8919-r0/git#
>>>=20
>>> The path to sanitycheckcpp.exe is there, but fails, as if it must run on=
 a different architecture.
>>=20
>> I'm not sure what is going on and I don't really use devtool very often. =
 The
>> "Build type: native build" is where things are going wrong though.  You'v=
e tried
>> to get bitbake to set you up a cross-compile environment (targeting ARM) a=
nd
>> yet meson thinks you're building a native (targeting x86 likely).  Usuall=
y
>> bitbake has some special environment settings or a cross-env file for Mes=
on, so
>> however you're invoking meson might be missing that.
>>=20
>> Is it actually necessary to call meson anyhow?  Hasn't the 'configure' st=
ep
>> already ran when devtool sets up the environment?  `meson build` says "se=
t up
>> a new meson directory named build".  Did you intend something like
>> `ninja -C build`?
>>=20
>> --=20
>> Patrick Williams
