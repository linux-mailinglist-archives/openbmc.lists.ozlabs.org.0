Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25173560742
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 19:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY7Wr0wWHz3cdr
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 03:20:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dF+/mH1d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dF+/mH1d;
	dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY7WN1jkHz3bsB
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2022 03:19:58 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id z191so16655251iof.6
        for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/haTTKb4Ny+xEs7uM3ekqHJjDrWz8g2ZKS06wEHO24=;
        b=dF+/mH1dnL8INa1b9CKKtj9MNpCpxw5jrA1iph11jBG8gYkbAvFzoSWvKs7V+8ivi2
         O2ZTZUtHHf8R9G2f6/Zm4W4AK+d3hDmpfBwdLbpOys/A1iZqO+qtM6Erg1Su9t+fzPwA
         zqvzzh4W079pyDuBpEBNAZISuRZqpia2hd/Nev92GvMNiYOfeiYQAuVCQywY/VGVfaFU
         27qaklWtnl9gW8R7VoacUyFSamc5DKN8NGLysHqQjd7IapC2J/hY1mZ6+/Y7+OGiKtGK
         lMVMjwSGyd9MAXp/RSd89dkHcFafU/KCmvRlqeblTSgji0Z9IGynfJTIZI5RT9Z3n30v
         uJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/haTTKb4Ny+xEs7uM3ekqHJjDrWz8g2ZKS06wEHO24=;
        b=3tObRLi/dgVfc0GRuTureJwpvrpSwUChr5AouVyqxqh2GIP5tyGWiWPNuE2um+KfCY
         92gFrK7PXd57r0mGp56sGKy4uCGYbFPgywYcCWpnkvmEDbkXn3WsoRN6+K4INkVZiQTX
         8OD7Yx9RdjGF5N0ERSzsaCZXXOFkgmzWaiR0iGbiGH7LQQfPkIqSpqfJqqdUS5T1wufb
         ujqs3Fb0FnTBJJ8DPY2UiD/MJ9hW76Xp9oCZeJn3ANsTvpjbzEHOzN2t9cL1qq9/pg1S
         cNUQ13Bz4LpKJecE8l/9Ur3W2/oWbloqgRefB0xLhv2jaORrbnP/OndFVcwzwSslGsFn
         wCMg==
X-Gm-Message-State: AJIora/Gq+b9sfw5Iw1IrNKZyLK4h1B/AYxW7pDK8mnqveM/RSklW4JM
	yjN3Niv4aLQsP27grA+j0gKltUWXVXYvgIjbcfTKbw==
X-Google-Smtp-Source: AGRyM1tuScp96AQ3iqUkK4TTdrs+9EfDu1UUvec9Z+LhmXRaIfkyGI23wo10tuBLkDcdsbg4i4IsZFSeZhydg14IIF4=
X-Received: by 2002:a05:6638:248d:b0:33c:dc25:bf1b with SMTP id
 x13-20020a056638248d00b0033cdc25bf1bmr37061jat.247.1656523195307; Wed, 29 Jun
 2022 10:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514E14B450A17E9CA173B4CDCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGO0Y6FGTYu1rqH-YJCZgKXsPBHjjERmU7_5tOa0xg3M=A@mail.gmail.com>
 <CAHwn2XnPHOQzBq1MOpEG+4nD=AY3x40w1UV29jKK+w4pnvNEOQ@mail.gmail.com> <DM6PR08MB551486002B71DF6FE9FA3154DCBB9@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB551486002B71DF6FE9FA3154DCBB9@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 29 Jun 2022 10:19:44 -0700
Message-ID: <CALGRKGN7HJ7wDO4y1Ld5-qUuDNfiFN+ii0O0KmgD-WQr+=2vog@mail.gmail.com>
Subject: Re: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
Content-Type: multipart/alternative; boundary="0000000000009eb02c05e2995cbe"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Willy Tu <wltu@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009eb02c05e2995cbe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

However, I encountered other fatal errors when building the
> "phosphor-host-ipmid" package as below. (Overall there are three kinds of
> fatal errors, which is missing gtest.h, json.hpp, and log.hpp, that occur=
ed
> in several files, so I just list one message of each error for reference.=
)
> =3D=3D=3D=3D=3D
> ../subprojects/phosphor-objmgr/libmapper/test/mapper.cpp:4:10: fatal
> error: gtest/gtest.h: No such file or directory
>     4 | #include <gtest/gtest.h>
>

Hmm it's strange that gtest is being pulled in when you have Dtest=3Ddisabl=
ed
for the build. Could you try `rm -rf build` directory for
phosphor-host-ipmid before doing the same command again?

../entity_map_json.hpp:5:10: fatal error: nlohmann/json.hpp: No such file
> or directory
>     5 | #include <nlohmann/json.hpp>
> ../include/ipmid/message.hpp:26:10: fatal error: phosphor-logging/log.hpp=
:
> No such file or directory
>    26 | #include <phosphor-logging/log.hpp>


These should have been built as part of "subprojects". Could you make sure
phosphor-host-ipmid is pulled to the latest, clear the build directory and
build again just to make sure?

Thanks,
Brandon


On Wed, Jun 29, 2022 at 12:57 AM Chris Chen (TPI) <Chris.Chen3@flex.com>
wrote:

> Hi Brandon and Willy,
>
>    - First of all, I would like to say thanks for your answer and
>    confirmation, the problems I listed are solved.
>
>
>    - For Brandon's question,
>    - > It is totally possible that our instructions in the README is not
>    up to date anymore, but just to make sure - are you building each of t=
he
>    components as specified by
>    https://github.com/openbmc/phosphor-ipmi-flash#building-the-host-tool?
>    -
>    Yes, I followed the README.md to build each of the components.
>
>
>    - However, I encountered other fatal errors when building the
>    "phosphor-host-ipmid" package as below. (Overall there are three kinds=
 of
>    fatal errors, which is missing gtest.h, json.hpp, and log.hpp, that oc=
cured
>    in several files, so I just list one message of each error for referen=
ce.)
>    - =3D=3D=3D=3D=3D
>    - ../subprojects/phosphor-objmgr/libmapper/test/mapper.cpp:4:10: fatal
>    error: gtest/gtest.h: No such file or directory
>    -     4 | #include <gtest/gtest.h>
>    - ../entity_map_json.hpp:5:10: fatal error: nlohmann/json.hpp: No such
>    file or directory
>    -     5 | #include <nlohmann/json.hpp>
>    - ../include/ipmid/message.hpp:26:10: fatal error:
>    phosphor-logging/log.hpp: No such file or directory
>    -    26 | #include <phosphor-logging/log.hpp>
>    - =3D=3D=3D=3D=3D
>    -
>    - Do you have any suggestions on this?
>    -
>    - BTW. I use following commands to build the "phosphor-host-ipmid"
>    package, it should be correct, right?
>    - -----
>    - meson setup -Dtests=3Ddisabled builddir
>    - ninja -C builddir
>    - ninja -C builddir install
>    - -----
>
>
>    - I don't insist to build locally, so as per your recommendation I'm
>    trying to build it by using docker. However, I have limit capability w=
ith
>    docker, I for now met a question on building docker image by using the
>    "build-unit-test-docker" script you mentioned, that is after installin=
g the
>    docker-desktop on my Host, I referred to
>    https://github.com/openbmc/docs/blob/master/testing/run-test-docker.md=
#build-docker-image to
>    build the docker image, of course, I replace the command as below,
>
>
>    ./scripts/build-qemu-robot-docker.sh
>
>
>    - Then, the error came out after several minutes. (I retried few
>    times, some images are already exists.) Could you help to take a look =
at
>    this, and give me some suggestions as well?
>    - =3D=3D=3D=3D=3D
>    - archer@archer-ArcherCityM:openbmc-build-scripts$
>    ./scripts/build-unit-test-docker
>    - Image openbmc/ubuntu-unit-test-base:2022-W26-e79767e5378d5a0f
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-uscilab-cereal:2022-W26-ab72d4495979e830 alre=
ady
>    exists.  Skipping.
>    Image openbmc/ubuntu-unit-test-nlohmann-json:2022-W26-ffba809170eb0a41
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-naios-function2:2022-W26-3b876756bb76be23 alr=
eady
>    exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-cliutils-cli11:2022-W26-f53b55bea30b21c6 alre=
ady
>    exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-libvnc-libvncserver:2022-W26-90d3acb2a0df9617
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-cppalliance-url:2022-W26-460f317503ba9422 alr=
eady
>    exists.  Skipping.
>    Image openbmc/ubuntu-unit-test-boost:2022-W26-d87626309071f65f already
>    exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-catchorg-catch2:2022-W26-3439038e67e82304 alr=
eady
>    exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-leethomason-tinyxml2:2022-W26-323efeff9db5338=
2
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-facebookexperimental-libunifex:2022-W26-1eff6=
ee41b25d7e1
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-linux-test-project-lcov:2022-W26-13690675d4cd=
a956
>    already exists.  Skipping.
>    Image openbmc/ubuntu-unit-test-fmtlib-fmt:2022-W26-8c08817ee76f296a
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-google-googletest:2022-W26-41755ba7fe770d1e
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-tristanpenman-valijson:2022-W26-2d55955ffea82=
018
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-open-power-pdbg:2022-W26-ea1338b7d5bcf717 alr=
eady
>    exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-openbmc-sdbusplus:2022-W26-4de3de6a7dd74c72
>    already exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-openbmc-stdplus:2022-W26-fcc6d0d878d82435 alr=
eady
>    exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-openbmc-gpioplus:2022-W26-6e12ea9e28a38a45 al=
ready
>    exists.  Skipping.
>    Image
>    openbmc/ubuntu-unit-test-openbmc-sdeventplus:2022-W26-077c15efe62026d9
>    already exists.  Skipping.
>    - Package openbmc/linux failed!
>    Traceback (most recent call last):
>      File
>    "/home/archer/Downloads/openbmc-build-scripts/./scripts/build-unit-tes=
t-docker",
>    line 852, in <module>
>        Package.generate_all()
>      File
>    "/home/archer/Downloads/openbmc-build-scripts/./scripts/build-unit-tes=
t-docker",
>    line 396, in generate_all
>        raise t.exception
>      File
>    "/home/archer/Downloads/openbmc-build-scripts/./scripts/build-unit-tes=
t-docker",
>    line 365, in run
>        Docker.build(self.package, tag, dockerfile)
>      File
>    "/home/archer/Downloads/openbmc-build-scripts/./scripts/build-unit-tes=
t-docker",
>    line 620, in build
>        docker.build(
>      File "/home/archer/.local/lib/python3.10/site-packages/sh.py", line
>    1566, in __call__
>        return RunningCommand(cmd, call_args, stdin, stdout, stderr)
>      File "/home/archer/.local/lib/python3.10/site-packages/sh.py", line
>    822, in __init__
>        self.wait()
>      File "/home/archer/.local/lib/python3.10/site-packages/sh.py", line
>    879, in wait
>        self.handle_command_exit_code(exit_code)
>      File "/home/archer/.local/lib/python3.10/site-packages/sh.py", line
>    905, in handle_command_exit_code
>        raise exc
>    sh.ErrorReturnCode_1:
>
>      RAN: /usr/local/bin/docker build --network=3Dhost --force-rm
>    --no-cache=3Dfalse -t
>    openbmc/ubuntu-unit-test-openbmc-linux:2022-W26-4d748d691e37a3f6 -
>
>      STDOUT:
>
>
>      STDERR:
>    #1 [internal] load build definition from Dockerfile
>    #1
>    sha256:7b1d92eec8d42e247f2bb4fd1260a7b209eb6af9dab84c342a27d5cdd089f3f=
8
>    #1 transferring dockerfile: 307B 0.0s done
>    #1 DONE 0.1s
>
>    #2 [internal] load .dockerignore
>    #2
>    sha256:c8396637158fe442f7870c427fb14a5e1f1f71b781353fcff1a75b6301070bc=
b
>    #2 transferring context: 2B done
>    #2 DONE 0.0s
>
>    #3 [internal] load metadata for
>    docker.io/openbmc/ubuntu-unit-test-base:2022-W26-e79767e5378d5a0f
>    #3
>    sha256:053b27ec734906a3cbf79dc0bc99b133a80abc1aa2fd5545010138b72cf16ee=
0
>    #3 DONE 0.0s
>
>    #4 [1/2] FROM
>    docker.io/openbmc/ubuntu-unit-test-base:2022-W26-e79767e5378d5a0f
>    #4
>    sha256:e6e9b48a100df776a75b8dc934e85d3f5282ade34c031f25e3dd74a0ecd1384=
2
>    #4 CACHED
>
>    #5 [2/2] RUN curl -L https://github.com/openbmc/linux/arch... (3475
>    more, please see e.stderr)
>    - =3D=3D=3D=3D=3D
>
> Regards,
> Chris Chen
>
> ------------------------------
> *=E5=AF=84=E4=BB=B6=E8=80=85:* Willy Tu <wltu@google.com>
> *=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F:* 2022=E5=B9=B46=E6=9C=8828=E6=97=
=A5 =E4=B8=8B=E5=8D=88 11:56
> *=E6=94=B6=E4=BB=B6=E8=80=85:* Brandon Kim <brandonkim@google.com>
> *=E5=89=AF=E6=9C=AC:* Chris Chen (TPI) <Chris.Chen3@flex.com>; Patrick Wi=
lliams <
> patrick@stwcx.xyz>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> *=E4=B8=BB=E6=97=A8:* Re: [phosphor-ipmi-flash]: stdplus build failed bef=
ore building the
> host-tool on the Host
>
> Oh yeah, the README is 100% outdated. We have moved to meson and we
> should update it at some point in life.
>
> I think your command to build burn_my_bmc should be fine. The
> `host-tool` should be enabled by default.
>
> Can try the following, just in case.
> ```
> meson setup -Dhost-tool=3Denabled builddir
> ninja -C builddir
> ninja -C builddir install
> ```
>
> Willy Tu
>
>
> On Tue, Jun 28, 2022 at 8:51 AM Brandon Kim <brandonkim@google.com> wrote=
:
> >
> > Ah, it seems like the email chains were broken up for some reason -
> seeing this now after I replied to the other email chain.
> >
> > It is totally possible that our instructions in the README is not up to
> date anymore, but just to make sure - are you building each of the
> components as specified by
> https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-flas=
h*building-the-host-tool__;Iw!!HSntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAEnz7sb96UQ=
2IJR62gd5toQOBTYp5LubQOq6YnHBYCe7qVRsw7I7w$
> ?
> >
> > It details the commands to use for each of the dependencies.
> >
> > Good point on the burn_my_bmc command in the README description not
> being not up to date and still using automake (
> https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-flas=
h*building-the-host-tool__;Iw!!HSntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAEnz7sb96UQ=
2IJR62gd5toQOBTYp5LubQOq6YnHBYCe7qVRsw7I7w$
> ) - I'll try to run this to verify when I get time later today, but in th=
e
> meantime perhaps @Willy Tu may know the command off the top of his head a=
s
> he performed the big meson migration. As a first glance the command looks
> correct.
> >
> > Willy recently also migrated phospohr-host-ipmid to meson, so he may
> know more about the PAM dependency as well.
> >
> > Thanks,
> > Brandon
> >
> >
> > On Tue, Jun 28, 2022 at 8:04 AM Chris Chen (TPI) <Chris.Chen3@flex.com>
> wrote:
> >>
> >> Hi Patrick,
> >>
> >> Thanks for your prompt reply, and the issue is solved after installing
> Ubuntu "libfmt-dev" package.
> >>
> >> >> Do you know why you disabled C++20?  This shouldn't have been
> necessary
> >> >> and some of our code now requires C++20.
> >>
> >> I disabled C++20 of the "ipmi-blob-tool" package because I got errors
> below:
> >> =3D=3D=3D=3D=3D
> >> archer@archer-ArcherCityM:ipmi-blob-tool$ ./bootstrap.sh
> >> + autoreconf -v -f -i
> >> autoreconf: export WARNINGS=3D
> >> autoreconf: Entering directory '.'
> >> autoreconf: configure.ac: not using Gettext
> >> autoreconf: running: aclocal --force -I m4
> >> configure.ac:38: error: invalid first argument `20' to
> AX_CXX_COMPILE_STDCXX
> >> /usr/share/aclocal/ax_cxx_compile_stdcxx.m4:50: AX_CXX_COMPILE_STDCXX
> is expanded from...
> >> configure.ac:38: the top level
> >> autom4te: error: /usr/bin/m4 failed with exit status: 1
> >> aclocal: error: /usr/bin/autom4te failed with exit status: 1
> >> autoreconf: error: aclocal failed with exit status: 1
> >> =3D=3D=3D=3D=3D
> >> Do you have ideas about how to solve it correctly?
> >>
> >> In addition, i have started to build the burn_my_bmc (the host-tool) o=
n
> the Host by cloning the "phosphor-ipmi-flash" source. There are some
> questions came out:
> >>
> >> The "phosphor-ipmi-flash" package seems became to use "meson" rather
> than "bootstrap.sh", so I run these commands in the source directory. Is =
it
> correct?
> >> -----
> >> meson setup -Dbmc-blob-handler=3Ddisabled builddir
> >> ninja -C builddir
> >> ninja -C builddir install
> >> -----
> >>
> >> After running "meson setup -Dbmc-blob-handler=3Ddisabled builddir", it
> occurred dependency errors, like 'sdbusplus', 'phosphor-dbus-interfaces',
> 'libipmid', and so on is required respectively, is it correct?
> >>
> >> I for now have tried to install these dependencies one-by-one, but be
> stuck at 'libipmid'. That is I clone the "phosphor-host-ipmid" and run
> "meson builddir" command to build it, however, I got an error in blow and=
 I
> can't solve it. Could you please give me some suggestions?
> >> =3D=3D=3D=3D=3D
> >> Dependency sdeventplus from subproject subprojects/sdeventplus found:
> YES 0.1
> >> Dependency systemd found: YES 249 (cached)
> >> Run-time dependency libcrypto found: YES 3.0.2
> >>
> >> meson.build:89:0: ERROR: C++ shared or static library 'pam' not found
> >> =3D=3D=3D=3D=3D
> >>
> >> Thanks.
> >>
> >> Regards,
> >> Chris Chen
> >>
> >> ________________________________ =E5=AF=84=E4=BB=B6=E8=80=85: Patrick =
Williams
> >> =E5=B7=B2=E5=82=B3=E9=80=81: =E6=98=9F=E6=9C=9F=E4=BA=8C, 2022 6 =E6=
=9C=88 28 =E6=97=A5 =E4=B8=8B=E5=8D=88 07:20
> >> =E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI)
> >> =E5=89=AF=E6=9C=AC: openbmc@lists.ozlabs.org
> >> =E4=B8=BB=E6=97=A8: Re: [phosphor-ipmi-flash]: stdplus build failed be=
fore building the
> host-tool on the Host
> >>
> >> On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:
> >> > And each library and tool is built successful(only one thing that is
> I had to disable C++20 for the ipmi-blob-tool, others were fine) untilI
> started to build the stdplus. I encountered a build failed issue as below=
.
> It looks like there is a problem for using libfmt.a, I tried to figure ou=
t
> a solution on google but nothing is related to this. Could anyone help on
> this? Thanks.
> >>
> >> Do you know why you disabled C++20?  This shouldn't have been necessar=
y
> >> and some of our code now requires C++20.
> >>
> >> >
> >> > =3D=3D=3D=3D=3D
> >> > archer@archer-ArcherCityM:stdplus$
> >> > archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse
> -Dtests=3Ddisabled builddir
> >> > The Meson build system
> >> > Version: 0.61.2
> >> > Source dir: /home/archer/Downloads/host-tool/stdplus
> >> > Build dir: /home/archer/Downloads/host-tool/stdplus/builddir
> >> > Build type: native build
> >> > Project name: stdplus
> >> > Project version: 0.1
> >> > C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (Ubuntu
> 11.2.0-19ubuntu1) 11.2.0")
> >> > C++ linker for the host machine: c++ ld.bfd 2.38
> >> > Host machine cpu family: x86_64
> >> > Host machine cpu: x86_64
> >> > Found pkg-config: /usr/bin/pkg-config (0.29.2)
> >> > Run-time dependency fmt found: YES 8.1.2
> >>
> >> Where did this `fmt` come from?  Ubuntu has `libfmt-dev` that you can
> >> install which is version 8.1.1 on Jammy right now.
> >>
> >> > Library dl found: YES
> >> > Run-time dependency liburing found: YES 2.0
> >> > Build targets in project: 1
> >> >
> >> > stdplus 0.1
> >> >
> >> >   User defined options
> >> >     examples: false
> >> >     tests   : disabled
> >> >
> >> > Found ninja-1.10.1 at /usr/bin/ninja
> >> > archer@archer-ArcherCityM:stdplus$
> >> > archer@archer-ArcherCityM:stdplus$
> >> > archer@archer-ArcherCityM:stdplus$ ninja -C builddir
> >> > ninja: Entering directory `builddir'
> >> > [9/9] Linking target src/libstdplus.so.0.1
> >> > FAILED: src/libstdplus.so.0.1
> >> > c++  -o src/libstdplus.so.0.1
> src/libstdplus.so.0.1.p/stdplus_exception.cpp.o
> src/libstdplus.so.0.1.p/stdplus_signal.cpp.o
> src/libstdplus.so.0.1.p/stdplus_dl.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_dupable.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_impl.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_managed.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_mmap.cpp.o
> src/libstdplus.so.0.1.p/stdplus_fd_ops.cpp.o
> src/libstdplus.so.0.1.p/stdplus_io_uring.cpp.o -Wl,--as-needed
> -Wl,--no-undefined -shared -fPIC -Wl,--start-group
> -Wl,-soname,libstdplus.so.0 /usr/local/lib/libfmt.a -ldl
> /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group
> >> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning:
> relocation against `stdout@@GLIBC_2.2.5' in read-only section `.text'
> >> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation
> R_X86_64_PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when
> making a shared object; recompile with -fPIC
> >>
> >> However you obtained your libfmt, it was compiled incorrectly.  It
> >> shouldn't have a static library but a dynamic one.
> >>
> >> The `libfmt-dev` package has `libfmt.so` which should be sufficient fo=
r
> >> linking as a shared library.
> >>
> >> --
> >> Patrick Williams
> >> Legal Disclaimer :
> >> The information contained in this message may be privileged and
> confidential.
> >> It is intended to be read only by the individual or entity to whom it
> is addressed
> >> or by their designee. If the reader of this message is not the intende=
d
> recipient,
> >> you are on notice that any distribution of this message, in any form,
> >> is strictly prohibited. If you have received this message in error,
> >> please immediately notify the sender and delete or destroy any copy of
> this message!
>

--0000000000009eb02c05e2995cbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Chris,<br><br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">However, I encountered other fatal errors when building the &quo=
t;phosphor-host-ipmid&quot; package as below. (Overall there are three kind=
s of fatal errors, which is missing gtest.h, json.hpp, and log.hpp, that oc=
cured in several files, so I just list one message of each error for refere=
nce.)<br>=3D=3D=3D=3D=3D<br>../subprojects/phosphor-objmgr/libmapper/test/m=
apper.cpp:4:10: fatal error: gtest/gtest.h: No such file or directory<br>=
=C2=A0 =C2=A0 4 | #include &lt;gtest/gtest.h&gt;<br></blockquote><br>Hmm it=
&#39;s strange that gtest is being pulled in when you have Dtest=3Ddisabled=
 for the build. Could you try `rm -rf build` directory for phosphor-host-ip=
mid before doing the same command again?<div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">../entity_map_json.hpp:5:10: fatal error: nlo=
hmann/json.hpp: No such file or directory<br>=C2=A0 =C2=A0 5 | #include &lt=
;nlohmann/json.hpp&gt;<br>../include/ipmid/message.hpp:26:10: fatal error: =
phosphor-logging/log.hpp: No such file or directory<br>=C2=A0 =C2=A026 | #i=
nclude &lt;phosphor-logging/log.hpp&gt;</blockquote><div><br></div><div>The=
se should have been built as part of &quot;subprojects&quot;. Could you mak=
e sure phosphor-host-ipmid is pulled to the latest, clear the build directo=
ry and build again just to make sure?</div><div><br></div><div>Thanks,</div=
><div>Brandon</div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Jun 29, 2022 at 12:57 AM Chris Chen (TPI) &l=
t;<a href=3D"mailto:Chris.Chen3@flex.com">Chris.Chen3@flex.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Brandon and Willy,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<ul>
<li>First of all, I would like to say thanks for your answer and confirmati=
on, the problems I listed are solved.</li></ul>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<ul>
<li>For Brandon&#39;s question,</li><li style=3D"display:block">&gt; <span =
style=3D"color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif;font-siz=
e:11pt">
It is totally possible that our instructions in the README is not up to dat=
e anymore, but just to make sure - are you building each of the components =
as specified by</span><span style=3D"color:rgb(0,0,0);font-family:&quot;Mic=
rosoft Jhenghei UI&quot;,Pmingliu,&quot;Segoe UI&quot;,-apple-system,BlinkM=
acSystemFont,Roboto,&quot;Helvetica Neue&quot;,sans-serif;font-size:14.6667=
px"><span style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt"=
>=C2=A0</span></span><a href=3D"https://github.com/openbmc/phosphor-ipmi-fl=
ash#building-the-host-tool" id=3D"gmail-m_1825173308285465586LPNoLPOWALinkP=
review" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:1=
2pt" target=3D"_blank"><span style=3D"font-family:Calibri,Helvetica,sans-se=
rif;font-size:11pt">https://github.com/openbmc/phosphor-ipmi-flash#building=
-the-host-tool</span></a><span style=3D"color:rgb(0,0,0);font-family:Calibr=
i,Helvetica,sans-serif;font-size:11pt">?</span></li><li style=3D"display:bl=
ock"><span style=3D"color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-ser=
if;font-size:11pt"><br>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:16p=
x;text-align:start;background-color:rgb(255,255,255);display:inline">Yes, I=
 followed the README.md to build each of the components.</span></span></li>=
</ul>
</div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<ul>
<li><span>However, I encountered other fatal errors when building the &quot=
;phosphor-host-ipmid&quot; package as below. (Overall there are three kinds=
 of fatal errors, which is missing gtest.h, json.hpp, and log.hpp, that occ=
ured in several files, so I just list one
 message of each error for reference.)</span></li><li style=3D"display:bloc=
k">=3D=3D=3D=3D=3D</li><li style=3D"display:block"><span style=3D"color:rgb=
(0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt">../s=
ubprojects/phosphor-objmgr/libmapper/test/mapper.cpp:4:10: fatal error: gte=
st/gtest.h: No such file or directory</span></li><li style=3D"display:block=
"><span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-=
serif;font-size:12pt"><span style=3D"text-align:start;background-color:rgb(=
255,255,255);display:inline">=C2=A0 =C2=A0<span>=C2=A0</span></span>4 | #in=
clude
 &lt;gtest/gtest.h&gt;</span></li><li style=3D"display:block"><span style=
=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif;font-si=
ze:12pt">../entity_map_json.hpp:5:10: fatal error: nlohmann/json.hpp: No su=
ch file or directory</span></li><li style=3D"display:block"><span style=3D"=
color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif;font-size:1=
2pt"><span style=3D"text-align:start;background-color:rgb(255,255,255);disp=
lay:inline">=C2=A0 =C2=A0<span>=C2=A0</span></span>5 | #include
 &lt;nlohmann/json.hpp&gt;</span></li><li style=3D"display:block"><span sty=
le=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif;font-=
size:12pt">../include/ipmid/message.hpp:26:10: fatal error: phosphor-loggin=
g/log.hpp: No such file or directory</span></li><li style=3D"display:block"=
><span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-s=
erif;font-size:12pt">=C2=A0 =C2=A026 | #include &lt;phosphor-logging/log.hp=
p&gt;</span></li><li style=3D"display:block"><span style=3D"font-size:12pt"=
>=3D=3D=3D=3D=3D</span></li><li style=3D"display:block"><span style=3D"colo=
r:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt"=
><br>
</span></li><li style=3D"display:block"><span style=3D"color:rgb(0,0,0);fon=
t-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt">Do you have any=
 suggestions on this?</span></li><li style=3D"display:block"><span style=3D=
"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif;font-size:=
12pt"><br>
</span></li><li style=3D"display:block"><span style=3D"color:rgb(0,0,0);fon=
t-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt">BTW. I use foll=
owing commands to build the</span><span style=3D"color:rgb(0,0,0);font-fami=
ly:Calibri,Arial,Helvetica,sans-serif;font-size:12pt">=C2=A0&quot;phosphor-=
host-ipmid&quot;
 package, it should be correct, right?</span></li><li style=3D"display:bloc=
k">-----</li><li style=3D"display:block">meson setup -Dtests=3Ddisabled bui=
lddir</li><li style=3D"display:block">ninja -C builddir</li><li style=3D"di=
splay:block">ninja -C builddir install</li><li style=3D"display:block">----=
-</li></ul>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<ul>
<li style=3D"font-size:12pt;font-family:Calibri,Arial,Helvetica,sans-serif;=
color:rgb(0,0,0)">
<span><span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,s=
ans-serif;font-size:12pt">I don&#39;t insist to build locally, so as per yo=
ur recommendation I&#39;m trying to build it by using docker. However, I ha=
ve limit capability with docker,
 I for now met a question on building docker image by using the &quot;build=
-unit-test-docker&quot; script you mentioned, that is after installing the =
docker-desktop on my Host, I referred to=C2=A0</span></span><a href=3D"http=
s://github.com/openbmc/docs/blob/master/testing/run-test-docker.md#build-do=
cker-image" id=3D"gmail-m_1825173308285465586LPNoLPOWALinkPreview_1" target=
=3D"_blank">https://github.com/openbmc/docs/blob/master/testing/run-test-do=
cker.md#build-docker-image</a>=C2=A0to
 build the docker image, of course, I replace the command as below,</li><di=
v></div>
</ul>
<ul>
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt">./scripts/build-qemu-robot-docker.sh<br>
</span></ul>
<ul>
<li style=3D"display:block;font-size:12pt;font-family:Calibri,Arial,Helveti=
ca,sans-serif;color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt">Then, the error came out after several minutes. (I retr=
ied few times, some images are already exists.) Could you help to take a lo=
ok at this, and give me
 some suggestions as well?</span></li><li style=3D"display:block;font-size:=
12pt;font-family:Calibri,Arial,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt">=3D=3D=3D=3D=3D</span></li><li style=3D"display:block;f=
ont-size:12pt;font-family:Calibri,Arial,Helvetica,sans-serif;color:rgb(0,0,=
0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt">archer@archer-ArcherCityM:openbmc-build-scripts$ ./scri=
pts/build-unit-test-docker<br>
</span></li><li style=3D"display:block;font-size:12pt;font-family:Calibri,A=
rial,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt">Image openbmc/ubuntu-unit-test-base:2022-W26-e79767e537=
8d5a0f already exists.=C2=A0 Skipping.
<div>Image openbmc/ubuntu-unit-test-uscilab-cereal:2022-W26-ab72d4495979e83=
0 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-nlohmann-json:2022-W26-ffba809170eb0a41=
 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-naios-function2:2022-W26-3b876756bb76be=
23 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-cliutils-cli11:2022-W26-f53b55bea30b21c=
6 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-libvnc-libvncserver:2022-W26-90d3acb2a0=
df9617 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-cppalliance-url:2022-W26-460f317503ba94=
22 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-boost:2022-W26-d87626309071f65f already=
 exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-catchorg-catch2:2022-W26-3439038e67e823=
04 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-leethomason-tinyxml2:2022-W26-323efeff9=
db53382 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-facebookexperimental-libunifex:2022-W26=
-1eff6ee41b25d7e1 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-linux-test-project-lcov:2022-W26-136906=
75d4cda956 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-fmtlib-fmt:2022-W26-8c08817ee76f296a al=
ready exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-google-googletest:2022-W26-41755ba7fe77=
0d1e already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-tristanpenman-valijson:2022-W26-2d55955=
ffea82018 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-open-power-pdbg:2022-W26-ea1338b7d5bcf7=
17 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-openbmc-sdbusplus:2022-W26-4de3de6a7dd7=
4c72 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-openbmc-stdplus:2022-W26-fcc6d0d878d824=
35 already exists.=C2=A0 Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-openbmc-gpioplus:2022-W26-6e12ea9e28a38=
a45 already exists.=C2=A0 Skipping.</div>
Image openbmc/ubuntu-unit-test-openbmc-sdeventplus:2022-W26-077c15efe62026d=
9 already exists.=C2=A0 Skipping.<br>
</span></li><li style=3D"display:block;font-size:12pt;font-family:Calibri,A=
rial,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt">Package openbmc/linux failed!
<div>Traceback (most recent call last):</div>
<div>=C2=A0 File &quot;/home/archer/Downloads/openbmc-build-scripts/./scrip=
ts/build-unit-test-docker&quot;, line 852, in &lt;module&gt;</div>
<div>=C2=A0 =C2=A0 Package.generate_all()</div>
<div>=C2=A0 File &quot;/home/archer/Downloads/openbmc-build-scripts/./scrip=
ts/build-unit-test-docker&quot;, line 396, in generate_all</div>
<div>=C2=A0 =C2=A0 raise t.exception</div>
<div>=C2=A0 File &quot;/home/archer/Downloads/openbmc-build-scripts/./scrip=
ts/build-unit-test-docker&quot;, line 365, in run</div>
<div>=C2=A0 =C2=A0 Docker.build(self.package, tag, dockerfile)</div>
<div>=C2=A0 File &quot;/home/archer/Downloads/openbmc-build-scripts/./scrip=
ts/build-unit-test-docker&quot;, line 620, in build</div>
<div>=C2=A0 =C2=A0 docker.build(</div>
<div>=C2=A0 File &quot;/home/archer/.local/lib/python3.10/site-packages/sh.=
py&quot;, line 1566, in __call__</div>
<div>=C2=A0 =C2=A0 return RunningCommand(cmd, call_args, stdin, stdout, std=
err)</div>
<div>=C2=A0 File &quot;/home/archer/.local/lib/python3.10/site-packages/sh.=
py&quot;, line 822, in __init__</div>
<div>=C2=A0 =C2=A0 self.wait()</div>
<div>=C2=A0 File &quot;/home/archer/.local/lib/python3.10/site-packages/sh.=
py&quot;, line 879, in wait</div>
<div>=C2=A0 =C2=A0 self.handle_command_exit_code(exit_code)</div>
<div>=C2=A0 File &quot;/home/archer/.local/lib/python3.10/site-packages/sh.=
py&quot;, line 905, in handle_command_exit_code</div>
<div>=C2=A0 =C2=A0 raise exc</div>
<div>sh.ErrorReturnCode_1: </div>
<div><br>
</div>
<div>=C2=A0 RAN: /usr/local/bin/docker build --network=3Dhost --force-rm --=
no-cache=3Dfalse -t openbmc/ubuntu-unit-test-openbmc-linux:2022-W26-4d748d6=
91e37a3f6 -</div>
<div><br>
</div>
<div>=C2=A0 STDOUT:</div>
<div><br>
</div>
<div><br>
</div>
<div>=C2=A0 STDERR:</div>
<div>#1 [internal] load build definition from Dockerfile</div>
<div>#1 sha256:7b1d92eec8d42e247f2bb4fd1260a7b209eb6af9dab84c342a27d5cdd089=
f3f8</div>
<div>#1 transferring dockerfile: 307B 0.0s done</div>
<div>#1 DONE 0.1s</div>
<div><br>
</div>
<div>#2 [internal] load .dockerignore</div>
<div>#2 sha256:c8396637158fe442f7870c427fb14a5e1f1f71b781353fcff1a75b630107=
0bcb</div>
<div>#2 transferring context: 2B done</div>
<div>#2 DONE 0.0s</div>
<div><br>
</div>
<div>#3 [internal] load metadata for <a href=3D"http://docker.io/openbmc/ub=
untu-unit-test-base:2022-W26-e79767e5378d5a0f" target=3D"_blank">docker.io/=
openbmc/ubuntu-unit-test-base:2022-W26-e79767e5378d5a0f</a></div>
<div>#3 sha256:053b27ec734906a3cbf79dc0bc99b133a80abc1aa2fd5545010138b72cf1=
6ee0</div>
<div>#3 DONE 0.0s</div>
<div><br>
</div>
<div>#4 [1/2] FROM <a href=3D"http://docker.io/openbmc/ubuntu-unit-test-bas=
e:2022-W26-e79767e5378d5a0f" target=3D"_blank">docker.io/openbmc/ubuntu-uni=
t-test-base:2022-W26-e79767e5378d5a0f</a></div>
<div>#4 sha256:e6e9b48a100df776a75b8dc934e85d3f5282ade34c031f25e3dd74a0ecd1=
3842</div>
<div>#4 CACHED</div>
<div><br>
</div>
#5 [2/2] RUN curl -L <a href=3D"https://github.com/openbmc/linux/arch." tar=
get=3D"_blank">https://github.com/openbmc/linux/arch.</a>.. (3475 more, ple=
ase see e.stderr)</span></li><li style=3D"display:block;font-size:12pt;font=
-family:Calibri,Arial,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:12pt">=3D=3D=3D=3D=3D</span></li></ul>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Chris Chen</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_1825173308285465586divRplyFwdMsg" dir=3D"ltr"><font face=
=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>=E5=
=AF=84=E4=BB=B6=E8=80=85:</b> Willy Tu &lt;<a href=3D"mailto:wltu@google.co=
m" target=3D"_blank">wltu@google.com</a>&gt;<br>
<b>=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F:</b> 2022=E5=B9=B46=E6=9C=8828=E6=
=97=A5 =E4=B8=8B=E5=8D=88 11:56<br>
<b>=E6=94=B6=E4=BB=B6=E8=80=85:</b> Brandon Kim &lt;<a href=3D"mailto:brand=
onkim@google.com" target=3D"_blank">brandonkim@google.com</a>&gt;<br>
<b>=E5=89=AF=E6=9C=AC:</b> Chris Chen (TPI) &lt;<a href=3D"mailto:Chris.Che=
n3@flex.com" target=3D"_blank">Chris.Chen3@flex.com</a>&gt;; Patrick Willia=
ms &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx=
.xyz</a>&gt;; <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank"=
>openbmc@lists.ozlabs.org</a> &lt;<a href=3D"mailto:openbmc@lists.ozlabs.or=
g" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>=E4=B8=BB=E6=97=A8:</b> Re: [phosphor-ipmi-flash]: stdplus build failed =
before building the host-tool on the Host</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>Oh yeah, the README is 100% outdated. We have moved to meson and we<br=
>
should update it at some point in life.<br>
<br>
I think your command to build burn_my_bmc should be fine. The<br>
`host-tool` should be enabled by default.<br>
<br>
Can try the following, just in case.<br>
```<br>
meson setup -Dhost-tool=3Denabled builddir<br>
ninja -C builddir<br>
ninja -C builddir install<br>
```<br>
<br>
Willy Tu<br>
<br>
<br>
On Tue, Jun 28, 2022 at 8:51 AM Brandon Kim &lt;<a href=3D"mailto:brandonki=
m@google.com" target=3D"_blank">brandonkim@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Ah, it seems like the email chains were broken up for some reason - se=
eing this now after I replied to the other email chain.<br>
&gt;<br>
</div>
<div>&gt; It is totally possible that our instructions in the README is not=
 up to date anymore, but just to make sure - are you building each of the c=
omponents as specified by
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phosphor-=
ipmi-flash*building-the-host-tool__;Iw!!HSntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAE=
nz7sb96UQ2IJR62gd5toQOBTYp5LubQOq6YnHBYCe7qVRsw7I7w$" target=3D"_blank">
https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-flash*=
building-the-host-tool__;Iw!!HSntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAEnz7sb96UQ2I=
JR62gd5toQOBTYp5LubQOq6YnHBYCe7qVRsw7I7w$</a>=C2=A0 ?<br>
</div>
<div>&gt;<br>
&gt; It details the commands to use for each of the dependencies.<br>
&gt;<br>
&gt; Good point on the burn_my_bmc command in the README description not be=
ing not up to date and still using automake (<a href=3D"https://urldefense.=
com/v3/__https://github.com/openbmc/phosphor-ipmi-flash*building-the-host-t=
ool__;Iw!!HSntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAEnz7sb96UQ2IJR62gd5toQOBTYp5Lub=
QOq6YnHBYCe7qVRsw7I7w$" target=3D"_blank">https://urldefense.com/v3/__https=
://github.com/openbmc/phosphor-ipmi-flash*building-the-host-tool__;Iw!!HSnt=
lCg!UGWKiK4C2gPBrPnKMLNL78cKJAEnz7sb96UQ2IJR62gd5toQOBTYp5LubQOq6YnHBYCe7qV=
Rsw7I7w$</a>
 ) - I&#39;ll try to run this to verify when I get time later today, but in=
 the meantime perhaps @Willy Tu may know the command off the top of his hea=
d as he performed the big meson migration. As a first glance the command lo=
oks correct.<br>
&gt;<br>
&gt; Willy recently also migrated phospohr-host-ipmid to meson, so he may k=
now more about the PAM dependency as well.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Brandon<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jun 28, 2022 at 8:04 AM Chris Chen (TPI) &lt;<a href=3D"mailto=
:Chris.Chen3@flex.com" target=3D"_blank">Chris.Chen3@flex.com</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; Hi Patrick,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for your prompt reply, and the issue is solved after instal=
ling Ubuntu &quot;libfmt-dev&quot; package.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; Do you know why you disabled C++20?=C2=A0 This shouldn&#3=
9;t have been necessary<br>
&gt;&gt; &gt;&gt; and some of our code now requires C++20.<br>
&gt;&gt;<br>
&gt;&gt; I disabled C++20 of the &quot;ipmi-blob-tool&quot; package because=
 I got errors below:<br>
&gt;&gt; =3D=3D=3D=3D=3D<br>
&gt;&gt; archer@archer-ArcherCityM:ipmi-blob-tool$ ./bootstrap.sh<br>
&gt;&gt; + autoreconf -v -f -i<br>
&gt;&gt; autoreconf: export WARNINGS=3D<br>
&gt;&gt; autoreconf: Entering directory &#39;.&#39;<br>
&gt;&gt; autoreconf: <a href=3D"http://configure.ac" target=3D"_blank">conf=
igure.ac</a>: not using Gettext<br>
&gt;&gt; autoreconf: running: aclocal --force -I m4<br>
&gt;&gt; <a href=3D"http://configure.ac:38" target=3D"_blank">configure.ac:=
38</a>: error: invalid first argument `20&#39; to AX_CXX_COMPILE_STDCXX<br>
&gt;&gt; /usr/share/aclocal/ax_cxx_compile_stdcxx.m4:50: AX_CXX_COMPILE_STD=
CXX is expanded from...<br>
&gt;&gt; <a href=3D"http://configure.ac:38" target=3D"_blank">configure.ac:=
38</a>: the top level<br>
&gt;&gt; autom4te: error: /usr/bin/m4 failed with exit status: 1<br>
&gt;&gt; aclocal: error: /usr/bin/autom4te failed with exit status: 1<br>
&gt;&gt; autoreconf: error: aclocal failed with exit status: 1<br>
&gt;&gt; =3D=3D=3D=3D=3D<br>
&gt;&gt; Do you have ideas about how to solve it correctly?<br>
&gt;&gt;<br>
&gt;&gt; In addition, i have started to build the burn_my_bmc (the host-too=
l) on the Host by cloning the &quot;phosphor-ipmi-flash&quot; source. There=
 are some questions came out:<br>
&gt;&gt;<br>
&gt;&gt; The &quot;phosphor-ipmi-flash&quot; package seems became to use &q=
uot;meson&quot; rather than &quot;bootstrap.sh&quot;, so I run these comman=
ds in the source directory. Is it correct?<br>
&gt;&gt; -----<br>
&gt;&gt; meson setup -Dbmc-blob-handler=3Ddisabled builddir<br>
&gt;&gt; ninja -C builddir<br>
&gt;&gt; ninja -C builddir install<br>
&gt;&gt; -----<br>
&gt;&gt;<br>
&gt;&gt; After running &quot;meson setup -Dbmc-blob-handler=3Ddisabled buil=
ddir&quot;, it occurred dependency errors, like &#39;sdbusplus&#39;, &#39;p=
hosphor-dbus-interfaces&#39;, &#39;libipmid&#39;, and so on is required res=
pectively, is it correct?<br>
&gt;&gt;<br>
&gt;&gt; I for now have tried to install these dependencies one-by-one, but=
 be stuck at &#39;libipmid&#39;. That is I clone the &quot;phosphor-host-ip=
mid&quot; and run &quot;meson builddir&quot; command to build it, however, =
I got an error in blow and I can&#39;t solve it. Could you please give
 me some suggestions?<br>
&gt;&gt; =3D=3D=3D=3D=3D<br>
&gt;&gt; Dependency sdeventplus from subproject subprojects/sdeventplus fou=
nd: YES 0.1<br>
&gt;&gt; Dependency systemd found: YES 249 (cached)<br>
&gt;&gt; Run-time dependency libcrypto found: YES 3.0.2<br>
&gt;&gt;<br>
&gt;&gt; meson.build:89:0: ERROR: C++ shared or static library &#39;pam&#39=
; not found<br>
&gt;&gt; =3D=3D=3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; Thanks.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Chris Chen<br>
&gt;&gt;<br>
&gt;&gt; ________________________________ =E5=AF=84=E4=BB=B6=E8=80=85: Patr=
ick Williams<br>
&gt;&gt; =E5=B7=B2=E5=82=B3=E9=80=81: =E6=98=9F=E6=9C=9F=E4=BA=8C, 2022 6 =
=E6=9C=88 28 =E6=97=A5 =E4=B8=8B=E5=8D=88 07:20<br>
&gt;&gt; =E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI)<br>
&gt;&gt; =E5=89=AF=E6=9C=AC: <a href=3D"mailto:openbmc@lists.ozlabs.org" ta=
rget=3D"_blank">openbmc@lists.ozlabs.org</a><br>
&gt;&gt; =E4=B8=BB=E6=97=A8: Re: [phosphor-ipmi-flash]: stdplus build faile=
d before building the host-tool on the Host<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:<=
br>
&gt;&gt; &gt; And each library and tool is built successful(only one thing =
that is I had to disable C++20 for the ipmi-blob-tool, others were fine) un=
tilI started to build the stdplus. I encountered a build failed issue as be=
low. It looks like there is a problem for
 using libfmt.a, I tried to figure out a solution on google but nothing is =
related to this. Could anyone help on this? Thanks.<br>
&gt;&gt;<br>
&gt;&gt; Do you know why you disabled C++20?=C2=A0 This shouldn&#39;t have =
been necessary<br>
&gt;&gt; and some of our code now requires C++20.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Df=
alse -Dtests=3Ddisabled builddir<br>
&gt;&gt; &gt; The Meson build system<br>
&gt;&gt; &gt; Version: 0.61.2<br>
&gt;&gt; &gt; Source dir: /home/archer/Downloads/host-tool/stdplus<br>
&gt;&gt; &gt; Build dir: /home/archer/Downloads/host-tool/stdplus/builddir<=
br>
&gt;&gt; &gt; Build type: native build<br>
&gt;&gt; &gt; Project name: stdplus<br>
&gt;&gt; &gt; Project version: 0.1<br>
&gt;&gt; &gt; C++ compiler for the host machine: c++ (gcc 11.2.0 &quot;c++ =
(Ubuntu 11.2.0-19ubuntu1) 11.2.0&quot;)<br>
&gt;&gt; &gt; C++ linker for the host machine: c++ ld.bfd 2.38<br>
&gt;&gt; &gt; Host machine cpu family: x86_64<br>
&gt;&gt; &gt; Host machine cpu: x86_64<br>
&gt;&gt; &gt; Found pkg-config: /usr/bin/pkg-config (0.29.2)<br>
&gt;&gt; &gt; Run-time dependency fmt found: YES 8.1.2<br>
&gt;&gt;<br>
&gt;&gt; Where did this `fmt` come from?=C2=A0 Ubuntu has `libfmt-dev` that=
 you can<br>
&gt;&gt; install which is version 8.1.1 on Jammy right now.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Library dl found: YES<br>
&gt;&gt; &gt; Run-time dependency liburing found: YES 2.0<br>
&gt;&gt; &gt; Build targets in project: 1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; stdplus 0.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0=C2=A0 User defined options<br>
&gt;&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0 examples: false<br>
&gt;&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0 tests=C2=A0=C2=A0 : disabled<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Found ninja-1.10.1 at /usr/bin/ninja<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$ ninja -C builddir<br>
&gt;&gt; &gt; ninja: Entering directory `builddir&#39;<br>
&gt;&gt; &gt; [9/9] Linking target src/libstdplus.so.0.1<br>
&gt;&gt; &gt; FAILED: src/libstdplus.so.0.1<br>
&gt;&gt; &gt; c++=C2=A0 -o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/st=
dplus_exception.cpp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libs=
tdplus.so.0.1.p/stdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.=
cpp.o src/libstdplus.so.0.1.p/stdplus_fd_dupable.cpp.o
 src/libstdplus.so.0.1.p/stdplus_fd_impl.cpp.o src/libstdplus.so.0.1.p/stdp=
lus_fd_managed.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_mmap.cpp.o src/libs=
tdplus.so.0.1.p/stdplus_fd_ops.cpp.o src/libstdplus.so.0.1.p/stdplus_io_uri=
ng.cpp.o -Wl,--as-needed -Wl,--no-undefined
 -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /usr/local/lib=
/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group<br>
&gt;&gt; &gt; /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: r=
elocation against `stdout@@GLIBC_2.2.5&#39; in read-only section `.text&#39=
;<br>
&gt;&gt; &gt; /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation=
 R_X86_64_PC32 against symbol `stderr@@GLIBC_2.2.5&#39; can not be used whe=
n making a shared object; recompile with -fPIC<br>
&gt;&gt;<br>
&gt;&gt; However you obtained your libfmt, it was compiled incorrectly.=C2=
=A0 It<br>
&gt;&gt; shouldn&#39;t have a static library but a dynamic one.<br>
&gt;&gt;<br>
&gt;&gt; The `libfmt-dev` package has `libfmt.so` which should be sufficien=
t for<br>
&gt;&gt; linking as a shared library.<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Patrick Williams<br>
&gt;&gt; Legal Disclaimer :<br>
&gt;&gt; The information contained in this message may be privileged and co=
nfidential.<br>
&gt;&gt; It is intended to be read only by the individual or entity to whom=
 it is addressed<br>
&gt;&gt; or by their designee. If the reader of this message is not the int=
ended recipient,<br>
&gt;&gt; you are on notice that any distribution of this message, in any fo=
rm,<br>
&gt;&gt; is strictly prohibited. If you have received this message in error=
,<br>
&gt;&gt; please immediately notify the sender and delete or destroy any cop=
y of this message!<br>
</div>
</span></font></div>
</div>

</blockquote></div>

--0000000000009eb02c05e2995cbe--
