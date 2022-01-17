Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90678490FDA
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 18:46:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jczq934YNz3jMs
	for <lists+openbmc@lfdr.de>; Tue, 18 Jan 2022 04:46:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JW3JMHZl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JW3JMHZl; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcz9P0KPDz3fwm
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jan 2022 04:17:12 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id r131so24446027oig.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jan 2022 09:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=uF8AqlNCsd386klzV0QYQZt/vo2pDiQuBmrYStMgjC8=;
 b=JW3JMHZlzM+Zn/L1rxCbHvvmSD/biGUTyZ2O3RSCXmL01XWasSYX6oHAxa+4y98j7A
 qoWUMjPpftZ0W/YbhD15WFyvO4qXEJZe0fBsvC3YCE6jdPP1lFbCIwrqnC61u3QyBAMh
 Z9h0tavfJNf9Qp/0F9V5HkY5Y/Z++lmHtwmNN/ULlasBMbmda7buGztuHsYVwhGRpU8D
 jHv9BzW18lumJB7pnimlqelWSdSKtT8sH6FkxHQioxVbvRdCvE4Ks8cjsQ+gk3DBT3wS
 fzHO1F+1OqA9c7DeTbj81hPtHse7MbCBnuchvLKm+VPFSjEvEOOEWx01S8Kp5sLAN66h
 fY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=uF8AqlNCsd386klzV0QYQZt/vo2pDiQuBmrYStMgjC8=;
 b=7+i+BerlSr+/5pKoX7QFsa4R6i4WFCxzLNpukzXl4qe2r8L+BG2sA+y8J1etATWlR0
 xzCh9i/ZunRTwQeezzfORj8LXD6NcACKdhBOMpnU5FVrS2EZzQAnqSEjUQSW06ym9sxy
 AEo5v+r27t0M8uu7qe6jrDFQcGuzBHTLCAnIi3FC6Yqy7gYwg3TVvnJ/i7O82XwK7GR6
 KzLuys+3yQ3/Wy6FLmR1gIv8aefuYvTMyinIZ5PgFx1PFCLvpy7BOPGqdaFhN1owPpXm
 PFuY6euYvdK1mAE/ixi8iJgUGcEVR7aKoBhTRXC7b+U/UdjQVxnsGTxOLB02hbMq8vSH
 36Kg==
X-Gm-Message-State: AOAM533O8D8ezSCzZBz7YF+0r+dzjv1DwoJRj2d48QJbYNTIdLaFv37B
 dO+E1ElXLViK/Sb+Hn/NwTvfOk8I1ho=
X-Google-Smtp-Source: ABdhPJwjaeRBJgOxsLunl8PETFZTxM+kdzDhu9kuIfo+BH5jqqzxXkpFA0TP741NeL2RezycWcjYTg==
X-Received: by 2002:a05:6808:13c3:: with SMTP id
 d3mr5061557oiw.140.1642439828668; 
 Mon, 17 Jan 2022 09:17:08 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b060:1439:89b4:7366:b093:c2bc])
 by smtp.gmail.com with ESMTPSA id q145sm5587678ooq.31.2022.01.17.09.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 09:17:08 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Sanitycheck problem
Date: Mon, 17 Jan 2022 10:17:06 -0700
Message-Id: <6B9402E7-B169-4ADA-AF7C-FA4C574E0A70@gmail.com>
References: <YeHDwS7/D9JY4XXw@heinlein>
In-Reply-To: <YeHDwS7/D9JY4XXw@heinlein>
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

There is no ninja.build file, so it won=E2=80=99t compile.

Nonetheless, in general, how are people developing, compiling, testing thing=
s like dbus_semsors? I spent some time trying to compile it on Ubuntu, and I=
 just went down a rabbit hole. I assume yocto has some general cross compila=
tion other than devtool?

Sorry for such a newbie question. Just a pointer and a url and I=E2=80=99ll g=
o do the learning.

Mike

Sent from my iPad

> On Jan 14, 2022, at 11:41 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> =EF=BB=BFOn Thu, Jan 13, 2022 at 05:24:00PM -0700, Mike Jones wrote:
>> This is the error:
>>=20
>> root@ubuntu:~/share/design/code/openbmc/build/ast2600-default/tmp/work/ar=
mv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e8919=
-r0/git# <mailto:root@ubuntu:~/share/design/code/openbmc/build/ast2600-defau=
lt/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTO=
INC+26601e8919-r0/git#> meson build
>> The Meson build system
>> Version: 0.58.1
>> Source dir: /home/openbmc/share/design/code/openbmc/build/ast2600-default=
/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOIN=
C+26601e8919-r0/git
>> Build dir: /home/openbmc/share/design/code/openbmc/build/ast2600-default/=
tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC=
+26601e8919-r0/git/build
>> Build type: native build
>> Project name: dbus-sensors
>> Project version: 0.1
>>=20
>> meson.build:1:0: ERROR: Could not invoke sanity test executable: [Errno 8=
] Exec format error: '/home/openbmc/share/design/code/openbmc/build/ast2600-=
default/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gi=
tAUTOINC+26601e8919-r0/git/build/meson-private/sanitycheckcpp.exe'.
>>=20
>> A full log can be found at /home/openbmc/share/design/code/openbmc/build/=
ast2600-default/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensor=
s/0.1+gitAUTOINC+26601e8919-rroot@ubuntu:~root@ubrootroot@ubuntu:~/share/des=
ign/code/openbmc/build/ast2600-default/tmp/work/armv7ahf-vfpv4d16-openbmc-li=
nux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e8919-r0/git#
>>=20
>> The path to sanitycheckcpp.exe is there, but fails, as if it must run on a=
 different architecture.
>=20
> I'm not sure what is going on and I don't really use devtool very often.  T=
he
> "Build type: native build" is where things are going wrong though.  You've=
 tried
> to get bitbake to set you up a cross-compile environment (targeting ARM) a=
nd
> yet meson thinks you're building a native (targeting x86 likely).  Usually=

> bitbake has some special environment settings or a cross-env file for Meso=
n, so
> however you're invoking meson might be missing that.
>=20
> Is it actually necessary to call meson anyhow?  Hasn't the 'configure' ste=
p
> already ran when devtool sets up the environment?  `meson build` says "set=
 up
> a new meson directory named build".  Did you intend something like
> `ninja -C build`?
>=20
> --=20
> Patrick Williams
