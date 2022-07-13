Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 979E3573EB7
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 23:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljr843m3Yz3c4G
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 07:18:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sIgCUeZ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sIgCUeZ0;
	dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljr7d50B4z3bZc
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 07:18:04 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id i21so11664405qtw.12
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 14:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cXIWEBSR8KuIZ9j3PCtu+sD0YqoDf953EskqLMmQcBo=;
        b=sIgCUeZ0WqZcCHpNIhLwPzMcc0Md72vj3aNr533csOSLOvIJoMYUq7CHaSLY8nLqfw
         MGSNFqKDcavHyAo3asbNcX2OF7qN1SOdMZMCSpmboAH1rUZrnSlCuzJuBlDp12xBCO40
         Snr0nYKHzHNMMrqhowOKyePqLmaSxrtZ/t5DGlI0NW02dhE6lo7Npqvs7GpM4BEKMssP
         BnnLLduQvt3xYaLnnYE69M/3izftmiXI6MW942S57kcLe/mHU/NRV6HTSMXOFewEA/ha
         McFWyRW4ER+MfmeDuD2bqSRBHbFBkG7u5bPC5wCxK2J6cjF0xr0NTICPQhnsBMkRfL6a
         TmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cXIWEBSR8KuIZ9j3PCtu+sD0YqoDf953EskqLMmQcBo=;
        b=5A5uf79C8iikU+4ZNrCFnGRGsfpTdUQubCXxtwItOkUBb3jmddEkxVQhtD4amgxbnM
         joDiSDIBw8ix5pwtKDPpd1WSwc9cGB0SL19VOAl2yJtISvnMOb1XhMhP11ZX6B+6nWeK
         tZkFb/XQjhXYOVEGlb9dvkMxmResD7zGvTmVGeRRm9FOeDV0eMjv685R1UMNgaiJpA5I
         pnp+UbNlJAW8/LGede03hyQ4EaYgME3A7DWS/U3k02T5x3Ev2upNk5yf35jJKtjXED2q
         aCtUJIuuBwRZm+bjJTvoCdnV1J+Iyz5FtXZQVOONLolOrS/rXAdxDkYlWnMsWjRVsFnG
         UA1w==
X-Gm-Message-State: AJIora8lgWA8R74Okt8OyUxWlu/3TU4WbfVgyG6hMKtEur2EhzDY7Acd
	v7Ik8PS6quFRekagPCPxxKXrr6CuFdK0VwL65ELliw==
X-Google-Smtp-Source: AGRyM1vHF+vi1PloAHQwA0jeCxDXqOMTI6603LLFl8rocc+Jo617/FTfJd20sso9ZlcC/TMKmCgtgXGbhh2KktshNRg=
X-Received: by 2002:ac8:5982:0:b0:31b:1a18:b1b7 with SMTP id
 e2-20020ac85982000000b0031b1a18b1b7mr4924731qte.366.1657747080581; Wed, 13
 Jul 2022 14:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514E14B450A17E9CA173B4CDCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGO0Y6FGTYu1rqH-YJCZgKXsPBHjjERmU7_5tOa0xg3M=A@mail.gmail.com>
 <CAHwn2XnPHOQzBq1MOpEG+4nD=AY3x40w1UV29jKK+w4pnvNEOQ@mail.gmail.com>
 <DM6PR08MB551486002B71DF6FE9FA3154DCBB9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGN7HJ7wDO4y1Ld5-qUuDNfiFN+ii0O0KmgD-WQr+=2vog@mail.gmail.com>
 <DM6PR08MB5514548095DC6D6C6CE6DFA0DCBD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB5514278B5BED680CEE13065CDCBD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55141DE74F25A04EF6F526A5DCBD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGPZ9pyn4WkTbqq4UaVZdTLJEvrSfsT6jLwjVytrg_LMwQ@mail.gmail.com> <DM6PR08MB5514B9F5F40626AB11AC1CFBDC819@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514B9F5F40626AB11AC1CFBDC819@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 13 Jul 2022 14:17:49 -0700
Message-ID: <CALGRKGNtGAvw0oizrks0eNeDWRr9X2rNC4gcmEmQFazawxz82Q@mail.gmail.com>
Subject: Re: FW: [phosphor-ipmi-flash]: stdplus build failed before building
 the host-tool on the Host
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Willy Tu <wltu@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Just to update this as I was setting up a new workstation and was
hitting some of these (when not building with a docker)

1. ipmi-blob-tool is being migrated to meson to avoid the problem with
AX_CXX_COMPILE_STDCXX or using autoconf-legacy (code review WIP)
2. The issue with libfmt was because fmtlib/fmt seems to have moved to
default making static library instead of dynamic library - the
instruction is being updated here:
https://gerrit.openbmc.org/c/openbmc/phosphor-ipmi-flash/+/55330
(issue discussed here: https://github.com/fmtlib/fmt/issues/548)

Thanks,
Brandon


On Tue, Jul 5, 2022 at 1:20 AM Chris Chen (TPI) <Chris.Chen3@flex.com> wrot=
e:
>
> Hi Brandom,
>
> It's no problem when I directly built phosphor-objmgr and do a ninja buil=
d install. I for now have got the burn_my_bmc this host-tool.
> Thanks for your help.
>
> Regards,
> Chris Chen
>
>
> -----Original Message-----
> From: Brandon Kim <brandonkim@google.com>
> Sent: Saturday, July 2, 2022 12:35 AM
> To: Chris Chen (TPI) <Chris.Chen3@flex.com>
> Cc: Willy Tu <wltu@google.com>; Patrick Williams <patrick@stwcx.xyz>; ope=
nbmc@lists.ozlabs.org
> Subject: Re: FW: [phosphor-ipmi-flash]: stdplus build failed before build=
ing the host-tool on the Host
>
> Attempting to send this again, as I forgot to do "plain text" mode and
> I think it held back the email send.
>
> Ah it looks like the problem is with phosphor-objmgr build - seems
> like they may not have propagated the test=3Ddisabled flag down to that
> build for some reason - I wonder if it'll work if you could try
> building phosphor-objmgr and do a ninja build install first.
>
> Otherwise, we should fix the underlying problem which is that you may
> not have gtest installed in your workstation:
> https://urldefense.com/v3/__https://stackoverflow.com/questions/13513905/=
how-to-set-up-googletest-as-a-shared-library-on-linux__;!!HSntlCg!RUZM2VCNp=
HIF_D2Mv6DyxuWFsXxHUogP0GsvCS3oY-r1R1SwgBZlSWL5x5_4WroyEovw-sh0F4Ungs7C8UxW=
9A$
>
> Thanks,
> Brandon
>
>
> On Fri, Jul 1, 2022 at 1:42 AM Chris Chen (TPI) <Chris.Chen3@flex.com> wr=
ote:
> >
> > Hi Brandon,
> >
> >
> >
> > I have pulled the latest code of the phosphor-host-ipmid package and tr=
ied to clean build with -Dtests=3Ddisabled configuration a couple of times,=
 but the error of "fatal error: gtest/gtest.h: No such file or directory" i=
s still there.
> >
> > Is there an opportunity that you could give it a shot when you have fre=
e time? And it would be great if you are able to share your build environme=
nt configuration and steps with me. Thanks.
> >
> >
> >
> > Here are my completed logs for your reference.
> >
> > =3D=3D=3D=3D=3D
> >
> > archer@archer-ArcherCityM:phosphor-host-ipmid$ git log
> >
> > commit 25035b8898367bc25a3b5ace7ad08728de7476c6 (HEAD -> master, origin=
/master, origin/HEAD)
> >
> > Author: Patrick Williams <patrick@stwcx.xyz>
> >
> > Date:   Thu Jun 16 16:35:58 2022 -0500
> >
> >
> >
> >     gitignore: minor fixup for symlink workflow
> >
> >
> >
> >     It is convenient to have the subprojects source populated by symlin=
king
> >
> >     to a common workspace so that cross-repository development can be d=
one.
> >
> >     The previous .gitignore caused 'untracked file' for each subproject
> >
> >     symlink because it was a symlink instead of a directory.  Modify th=
e
> >
> >     .gitignore to match what most other meson repositories have done.
> >
> >
> >
> >     Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> >
> >     Change-Id: I303effd3c8e7099aaade4a3ac1e81ac7f55cdec0
> >
> >
> >
> > archer@archer-ArcherCityM:phosphor-host-ipmid$ meson setup -Dtests=3Ddi=
sabled -Dwhitelist-conf=3Dhost-ipmid-whitelist.conf builddir
> >
> > The Meson build system
> >
> > Version: 0.61.2
> >
> > Source dir: /home/archer/Downloads/host-tool/phosphor-host-ipmid
> >
> > Build dir: /home/archer/Downloads/host-tool/phosphor-host-ipmid/builddi=
r
> >
> > Build type: native build
> >
> > Project name: phosphor-host-ipimd
> >
> > Project version: 0.1
> >
> > C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (Ubuntu 11.2.0-=
19ubuntu1) 11.2.0")
> >
> > C++ linker for the host machine: c++ ld.bfd 2.38
> >
> > Host machine cpu family: x86_64
> >
> > Host machine cpu: x86_64
> >
> > Configuring config.h using configuration
> >
> > Compiler for C++ supports arguments -DBOOST_ERROR_CODE_HEADER_ONLY: YES
> >
> > Compiler for C++ supports arguments -DBOOST_SYSTEM_NO_DEPRECATED: YES
> >
> > Compiler for C++ supports arguments -DBOOST_COROUTINES_NO_DEPRECATION_W=
ARNING: YES
> >
> > Compiler for C++ supports arguments -DBOOST_ASIO_DISABLE_THREADS: YES
> >
> > Compiler for C++ supports arguments -DBOOST_ALL_NO_LIB: YES
> >
> > Compiler for C++ supports arguments -flto: YES
> >
> > Compiler for C++ supports arguments -Wno-psabi: YES
> >
> > Compiler for C++ supports arguments -Wno-missing-field-initializers: YE=
S
> >
> > Compiler for C++ supports arguments -Wno-pedantic: YES
> >
> > Compiler for C++ supports arguments -Wno-non-virtual-dtor: YES
> >
> > Found pkg-config: /usr/bin/pkg-config (0.29.2)
> >
> > Found CMake: /usr/bin/cmake (3.22.1)
> >
> > Run-time dependency phosphor-logging found: NO (tried pkgconfig and cma=
ke)
> >
> > Looking for a fallback subproject for the dependency phosphor-logging
> >
> >
> >
> > Executing subproject phosphor-logging
> >
> >
> >
> > phosphor-logging| Project name: phosphor-logging
> >
> > phosphor-logging| Project version: 1.0.0
> >
> > phosphor-logging| C++ compiler for the host machine: c++ (gcc 11.2.0 "c=
++ (Ubuntu 11.2.0-19ubuntu1) 11.2.0")
> >
> > phosphor-logging| C++ linker for the host machine: c++ ld.bfd 2.38
> >
> > phosphor-logging| Program python3 found: YES (/usr/bin/python3)
> >
> > phosphor-logging| Run-time dependency systemd found: YES 249
> >
> > phosphor-logging| Run-time dependency sdbusplus found: YES 1.0.0
> >
> > phosphor-logging| Fallback to subproject sdbusplus which provides progr=
am sdbus++
> >
> >
> >
> > Executing subproject phosphor-logging:sdbusplus
> >
> >
> >
> > sdbusplus| Project name: sdbusplus
> >
> > sdbusplus| Project version: 1.0.0
> >
> > sdbusplus| C compiler for the host machine: cc (gcc 11.2.0 "cc (Ubuntu =
11.2.0-19ubuntu1) 11.2.0")
> >
> > sdbusplus| C linker for the host machine: cc ld.bfd 2.38
> >
> > sdbusplus| C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (Ubu=
ntu 11.2.0-19ubuntu1) 11.2.0")
> >
> > sdbusplus| C++ linker for the host machine: c++ ld.bfd 2.38
> >
> > sdbusplus| Run-time dependency libsystemd found: YES 249
> >
> > sdbusplus| Program python3 (inflection, yaml, mako) found: YES (/usr/bi=
n/python3) modules: inflection, yaml, mako
> >
> > sdbusplus| WARNING: Python files installed by Meson might not be found =
by python interpreter.
> >
> > sdbusplus| This warning can be avoided by setting "python.platlibdir" o=
ption.
> >
> > sdbusplus| WARNING: Python files installed by Meson might not be found =
by python interpreter.
> >
> > sdbusplus| This warning can be avoided by setting "python.purelibdir" o=
ption.
> >
> > sdbusplus| Run-time dependency Boost found: YES 1.74.0 (/usr/include)
> >
> > sdbusplus| Program .sdbus++ found: YES (/home/archer/Downloads/host-too=
l/phosphor-host-ipmid/subprojects/sdbusplus/tools/.sdbus++)
> >
> > sdbusplus| Program .sdbus++-gendir found: YES (/home/archer/Downloads/h=
ost-tool/phosphor-host-ipmid/subprojects/sdbusplus/tools/.sdbus++-gendir)
> >
> > sdbusplus| Program .sdbus++-gen-meson found: YES (/home/archer/Download=
s/host-tool/phosphor-host-ipmid/subprojects/sdbusplus/tools/.sdbus++-gen-me=
son)
> >
> > sdbusplus| Build targets in project: 1
> >
> > sdbusplus| Subproject sdbusplus finished.
> >
> >
> >
> > phosphor-logging| Program .sdbus++ found: YES (overridden)
> >
> > phosphor-logging| Program .sdbus++-gen-meson found: YES (overridden)
> >
> > phosphor-logging| Run-time dependency phosphor-dbus-interfaces found: Y=
ES 1.0.0
> >
> > phosphor-logging| Configuring config.h using configuration
> >
> > phosphor-logging| Build targets in project: 3
> >
> > phosphor-logging| Subproject phosphor-logging finished.
> >
> >
> >
> > Dependency phosphor-logging from subproject subprojects/phosphor-loggin=
g found: YES 1.0.0
> >
> > Dependency phosphor-dbus-interfaces found: YES 1.0.0 (cached)
> >
> > Run-time dependency sdeventplus found: NO (tried pkgconfig and cmake)
> >
> > Looking for a fallback subproject for the dependency sdeventplus
> >
> >
> >
> > Executing subproject sdeventplus
> >
> >
> >
> > sdeventplus| Project name: sdeventplus
> >
> > sdeventplus| Project version: 0.1
> >
> > sdeventplus| C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (U=
buntu 11.2.0-19ubuntu1) 11.2.0")
> >
> > sdeventplus| C++ linker for the host machine: c++ ld.bfd 2.38
> >
> > sdeventplus| Run-time dependency function2 found: NO (tried pkgconfig a=
nd cmake)
> >
> > sdeventplus| Header <function2/function2.hpp> has symbol "fu2::unique_f=
unction" with dependency function2: NO
> >
> > sdeventplus| Using subprojects/sdeventplus/subprojects/function2.wrap
> >
> >
> >
> > Executing subproject sdeventplus:function2 method cmake
> >
> >
> >
> > function2| Found CMake: /usr/bin/cmake (3.22.1)
> >
> >
> >
> > | Configuring the build directory with CMake version 3.22.1
> >
> > | Running CMake with: -G Ninja -DCMAKE_INSTALL_PREFIX=3D/usr/local -DBU=
ILD_TESTING=3DOFF
> >
> > |   - build directory:          /home/archer/Downloads/host-tool/phosph=
or-host-ipmid/builddir/subprojects/function2/__CMake_build
> >
> > |   - source directory:         /home/archer/Downloads/host-tool/phosph=
or-host-ipmid/subprojects/function2
> >
> > |   - toolchain file:           /home/archer/Downloads/host-tool/phosph=
or-host-ipmid/builddir/subprojects/function2/__CMake_build/CMakeMesonToolch=
ainFile.cmake
> >
> > |   - preload file:             /home/archer/Downloads/host-tool/phosph=
or-host-ipmid/builddir/meson-private/data/preload.cmake
> >
> > |   - trace args:               --trace-expand --trace-format=3Djson-v1=
 --no-warn-unused-cli --trace-redirect=3Dcmake_trace.txt
> >
> > |   - disabled policy warnings: [CMP0025, CMP0047, CMP0056, CMP0060, CM=
P0065, CMP0066, CMP0067, CMP0082, CMP0089, CMP0102]
> >
> >
> >
> > | Running with expanded trace output on.
> >
> > | Not searching for unused variables given on the command line.
> >
> > | Trace will be written to cmake_trace.txt
> >
> > | -- The CXX compiler identification is GNU 11.2.0
> >
> > | -- Detecting CXX compiler ABI info
> >
> > | -- Detecting CXX compiler ABI info - done
> >
> > | -- Check for working CXX compiler: /usr/bin/c++ - skipped
> >
> > | -- Detecting CXX compile features
> >
> > | -- Detecting CXX compile features - done
> >
> > | -- Configuring done
> >
> > | -- Generating done
> >
> > | -- Build files have been written to: /home/archer/Downloads/host-tool=
/phosphor-host-ipmid/builddir/subprojects/function2/__CMake_build
> >
> >
> >
> > function2| CMake configuration: SUCCEEDED
> >
> > function2| CMake project function2 has 1 build targets.
> >
> >
> >
> > cmake-ast| Processing generated meson AST
> >
> > cmake-ast| Build file: /home/archer/Downloads/host-tool/phosphor-host-i=
pmid/builddir/subprojects/function2/meson.build
> >
> >
> >
> > function2| Project name: function2
> >
> > function2| Project version: undefined
> >
> > function2| Build targets in project: 3
> >
> > function2| Subproject function2 finished.
> >
> >
> >
> >
> >
> > sdeventplus| Dependency libsystemd found: YES 249 (cached)
> >
> > sdeventplus| Run-time dependency stdplus found: YES 0.1
> >
> > sdeventplus| Build targets in project: 4
> >
> > sdeventplus| Subproject sdeventplus finished.
> >
> >
> >
> > Dependency sdeventplus from subproject subprojects/sdeventplus found: Y=
ES 0.1
> >
> > Dependency systemd found: YES 249 (cached)
> >
> > Run-time dependency libcrypto found: YES 3.0.2
> >
> > Library pam found: YES
> >
> > Run-time dependency libmapper found: NO (tried pkgconfig and cmake)
> >
> > Looking for a fallback subproject for the dependency libmapper
> >
> >
> >
> > Executing subproject phosphor-objmgr
> >
> >
> >
> > phosphor-objmgr| Project name: phosphor-objmgr
> >
> > phosphor-objmgr| Project version: 1.0
> >
> > phosphor-objmgr| C compiler for the host machine: cc (gcc 11.2.0 "cc (U=
buntu 11.2.0-19ubuntu1) 11.2.0")
> >
> > phosphor-objmgr| C linker for the host machine: cc ld.bfd 2.38
> >
> > phosphor-objmgr| C++ compiler for the host machine: c++ (gcc 11.2.0 "c+=
+ (Ubuntu 11.2.0-19ubuntu1) 11.2.0")
> >
> > phosphor-objmgr| C++ linker for the host machine: c++ ld.bfd 2.38
> >
> > phosphor-objmgr| Dependency phosphor-logging found: YES 1.0.0 (cached)
> >
> > phosphor-objmgr| Dependency phosphor-dbus-interfaces found: YES 1.0.0 (=
cached)
> >
> > phosphor-objmgr| Dependency sdbusplus found: YES 1.0.0 (cached)
> >
> > phosphor-objmgr| WARNING: Inconsistency: Subproject has overridden the =
dependency with another variable than 'sdbusplus_dep'
> >
> > phosphor-objmgr| Run-time dependency GTest found: YES (prebuilt)
> >
> > phosphor-objmgr| Run-time dependency GMock found: YES (prebuilt)
> >
> > phosphor-objmgr| Dependency libsystemd found: YES 249 (cached)
> >
> > phosphor-objmgr| Dependency libsystemd found: YES 249 (cached)
> >
> > phosphor-objmgr| Dependency libsystemd found: YES 249 (cached)
> >
> > phosphor-objmgr| Dependency boost found: YES 1.74.0 (cached)
> >
> > phosphor-objmgr| Dependency libsystemd found: YES 249 (cached)
> >
> > phosphor-objmgr| Dependency systemd found: YES 249 (cached)
> >
> > phosphor-objmgr| Run-time dependency threads found: YES
> >
> > phosphor-objmgr| Run-time dependency tinyxml2 found: YES 9.0.0
> >
> > phosphor-objmgr| Build targets in project: 14
> >
> > phosphor-objmgr| Subproject phosphor-objmgr finished.
> >
> >
> >
> > Dependency libmapper from subproject subprojects/phosphor-objmgr found:=
 YES 1.0
> >
> > Library boost_coroutine found: YES
> >
> > Dependency sdbusplus found: YES 1.0.0 (cached)
> >
> > WARNING: Inconsistency: Subproject has overridden the dependency with a=
nother variable than 'sdbusplus_dep'
> >
> > Header <nlohmann/json.hpp> has symbol "nlohmann::json::string_t" : NO
> >
> > Run-time dependency nlohmann-json found: NO (tried pkgconfig and cmake)
> >
> > Looking for a fallback subproject for the dependency nlohmann-json
> >
> > Cloning into 'nlohmann-json'...
> >
> > remote: Enumerating objects: 90268, done.
> >
> > remote: Counting objects: 100% (270/270), done.
> >
> > remote: Compressing objects: 100% (168/168), done.
> >
> > Receiving objects:  48% (43386/90268), 131.73 MiB | 74.00 KiB/s
> >
> > Receiving objects:  48% (43386/90268), 131.85 MiB | 61.00 KiB/s
> >
> > Receiving objects:  48% (44154/90268), 176.82 MiB | 82.00 KiB/s
> >
> > Receiving objects:  48% (44154/90268), 176.96 MiB | 97.00 KiB/s
> >
> >
> >
> > remote: Total 90268 (delta 101), reused 240 (delta 83), pack-reused 899=
98
> >
> > Receiving objects: 100% (90268/90268), 289.00 MiB | 94.00 KiB/s, done.
> >
> > Resolving deltas: 100% (71440/71440), done.
> >
> >
> >
> > Executing subproject nlohmann-json
> >
> >
> >
> > nlohmann-json| Project name: nlohmann_json
> >
> > nlohmann-json| Project version: 3.10.5
> >
> > nlohmann-json| C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ =
(Ubuntu 11.2.0-19ubuntu1) 11.2.0")
> >
> > nlohmann-json| C++ linker for the host machine: c++ ld.bfd 2.38
> >
> > nlohmann-json| Build targets in project: 14
> >
> > nlohmann-json| Subproject nlohmann-json finished.
> >
> >
> >
> > Dependency nlohmann-json from subproject subprojects/nlohmann-json foun=
d: YES 3.10.5
> >
> > Program python3 found: YES (/usr/bin/python3)
> >
> > WARNING: You should add the boolean check kwarg to the run_command call=
.
> >
> >          It currently defaults to false,
> >
> >          but it will default to true in future releases of meson.
> >
> >          See also: https://urldefense.com/v3/__https://github.com/meson=
build/meson/issues/9300__;!!HSntlCg!RUZM2VCNpHIF_D2Mv6DyxuWFsXxHUogP0GsvCS3=
oY-r1R1SwgBZlSWL5x5_4WroyEovw-sh0F4Ungs7LoQlzXA$
> >
> > Program .sdbus++ found: YES (overridden)
> >
> > Dependency phosphor-dbus-interfaces found: YES 1.0.0 (cached)
> >
> > Dependency sdbusplus found: YES 1.0.0 (cached)
> >
> > WARNING: Inconsistency: Subproject has overridden the dependency with a=
nother variable than 'sdbusplus_dep'
> >
> > Build targets in project: 30
> >
> >
> >
> > phosphor-host-ipimd 0.1
> >
> >
> >
> >   Subprojects
> >
> >     function2       : YES
> >
> >     nlohmann-json   : YES
> >
> >     phosphor-logging: YES
> >
> >     phosphor-objmgr : YES 1 warnings
> >
> >     sdbusplus       : YES 2 warnings
> >
> >     sdeventplus     : YES
> >
> >
> >
> >   User defined options
> >
> >     tests           : disabled
> >
> >     whitelist-conf  : host-ipmid-whitelist.conf
> >
> >
> >
> > Found ninja-1.10.1 at /usr/bin/ninja
> >
> > archer@archer-ArcherCityM:phosphor-host-ipmid$
> >
> > archer@archer-ArcherCityM:phosphor-host-ipmid$ ninja -C builddir
> >
> > ninja: Entering directory `builddir'
> >
> > [1/128] Compiling C++ object sub...apper/test/mapper.p/mapper.cpp.o
> >
> > FAILED: subprojects/phosphor-objmgr/libmapper/test/mapper.p/mapper.cpp.=
o
> >
> > c++ -Isubprojects/phosphor-objmgr/libmapper/test/mapper.p -Isubprojects=
/phosphor-objmgr -I../subprojects/phosphor-objmgr -I/usr/local/include -fdi=
agnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon=
-virtual-dtor -Wextra -Wpedantic -Werror -std=3Dc++20 -g -DMAPPER_ENABLE_DE=
BUG -DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB -DBOOST_SYSTEM_NO_DEPRE=
CATED -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_COROUTINES_NO_DEPRECATION_WARN=
ING -pthread -MD -MQ subprojects/phosphor-objmgr/libmapper/test/mapper.p/ma=
pper.cpp.o -MF subprojects/phosphor-objmgr/libmapper/test/mapper.p/mapper.c=
pp.o.d -o subprojects/phosphor-objmgr/libmapper/test/mapper.p/mapper.cpp.o =
-c ../subprojects/phosphor-objmgr/libmapper/test/mapper.cpp
> >
> > ../subprojects/phosphor-objmgr/libmapper/test/mapper.cpp:4:10: fatal er=
ror: gtest/gtest.h: No such file or directory
> >
> >     4 | #include <gtest/gtest.h>
> >
> >       |          ^~~~~~~~~~~~~~~
> >
> > compilation terminated.
> >
> > [9/128] Compiling C++ object sub...s_added.p/interfaces_added.cpp.o
> >
> > FAILED: subprojects/phosphor-objmgr/src/test/interfaces_added.p/interfa=
ces_added.cpp.o
> >
> > c++ -Isubprojects/phosphor-objmgr/src/test/interfaces_added.p -Isubproj=
ects/phosphor-objmgr -I../subprojects/phosphor-objmgr -I/usr/local/include =
-fdiagnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -=
Wnon-virtual-dtor -Wextra -Wpedantic -Werror -std=3Dc++20 -g -DMAPPER_ENABL=
E_DEBUG -DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB -DBOOST_SYSTEM_NO_D=
EPRECATED -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_COROUTINES_NO_DEPRECATION_=
WARNING -pthread -MD -MQ subprojects/phosphor-objmgr/src/test/interfaces_ad=
ded.p/interfaces_added.cpp.o -MF subprojects/phosphor-objmgr/src/test/inter=
faces_added.p/interfaces_added.cpp.o.d -o subprojects/phosphor-objmgr/src/t=
est/interfaces_added.p/interfaces_added.cpp.o -c ../subprojects/phosphor-ob=
jmgr/src/test/interfaces_added.cpp
> >
> > In file included from ../subprojects/phosphor-objmgr/src/test/interface=
s_added.cpp:2:
> >
> > ../subprojects/phosphor-objmgr/src/test/util/asio_server_class.hpp:9:10=
: fatal error: gtest/gtest.h: No such file or directory
> >
> >     9 | #include <gtest/gtest.h>
> >
> >       |          ^~~~~~~~~~~~~~~
> >
> > compilation terminated.
> >
> > [11/128] Compiling C++ object su.../name_change.p/name_change.cpp.o
> >
> > FAILED: subprojects/phosphor-objmgr/src/test/name_change.p/name_change.=
cpp.o
> >
> > c++ -Isubprojects/phosphor-objmgr/src/test/name_change.p -Isubprojects/=
phosphor-objmgr -I../subprojects/phosphor-objmgr -I/usr/local/include -fdia=
gnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon-=
virtual-dtor -Wextra -Wpedantic -Werror -std=3Dc++20 -g -DMAPPER_ENABLE_DEB=
UG -DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB -DBOOST_SYSTEM_NO_DEPREC=
ATED -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_COROUTINES_NO_DEPRECATION_WARNI=
NG -pthread -MD -MQ subprojects/phosphor-objmgr/src/test/name_change.p/name=
_change.cpp.o -MF subprojects/phosphor-objmgr/src/test/name_change.p/name_c=
hange.cpp.o.d -o subprojects/phosphor-objmgr/src/test/name_change.p/name_ch=
ange.cpp.o -c ../subprojects/phosphor-objmgr/src/test/name_change.cpp
> >
> > In file included from ../subprojects/phosphor-objmgr/src/test/name_chan=
ge.cpp:2:
> >
> > ../subprojects/phosphor-objmgr/src/test/util/asio_server_class.hpp:9:10=
: fatal error: gtest/gtest.h: No such file or directory
> >
> >     9 | #include <gtest/gtest.h>
> >
> >       |          ^~~~~~~~~~~~~~~
> >
> > compilation terminated.
> >
> > [12/128] Compiling C++ object su...ssociations.p/associations.cpp.o
> >
> > FAILED: subprojects/phosphor-objmgr/src/test/associations.p/association=
s.cpp.o
> >
> > c++ -Isubprojects/phosphor-objmgr/src/test/associations.p -Isubprojects=
/phosphor-objmgr -I../subprojects/phosphor-objmgr -I/usr/local/include -fdi=
agnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon=
-virtual-dtor -Wextra -Wpedantic -Werror -std=3Dc++20 -g -DMAPPER_ENABLE_DE=
BUG -DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB -DBOOST_SYSTEM_NO_DEPRE=
CATED -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_COROUTINES_NO_DEPRECATION_WARN=
ING -pthread -MD -MQ subprojects/phosphor-objmgr/src/test/associations.p/as=
sociations.cpp.o -MF subprojects/phosphor-objmgr/src/test/associations.p/as=
sociations.cpp.o.d -o subprojects/phosphor-objmgr/src/test/associations.p/a=
ssociations.cpp.o -c ../subprojects/phosphor-objmgr/src/test/associations.c=
pp
> >
> > In file included from ../subprojects/phosphor-objmgr/src/test/associati=
ons.cpp:3:
> >
> > ../subprojects/phosphor-objmgr/src/test/util/asio_server_class.hpp:9:10=
: fatal error: gtest/gtest.h: No such file or directory
> >
> >     9 | #include <gtest/gtest.h>
> >
> >       |          ^~~~~~~~~~~~~~~
> >
> > compilation terminated.
> >
> > [13/128] Compiling C++ object su...st/well_known.p/well_known.cpp.o
> >
> > FAILED: subprojects/phosphor-objmgr/src/test/well_known.p/well_known.cp=
p.o
> >
> > c++ -Isubprojects/phosphor-objmgr/src/test/well_known.p -Isubprojects/p=
hosphor-objmgr -I../subprojects/phosphor-objmgr -I/usr/local/include -fdiag=
nostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon-v=
irtual-dtor -Wextra -Wpedantic -Werror -std=3Dc++20 -g -DMAPPER_ENABLE_DEBU=
G -DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB -DBOOST_SYSTEM_NO_DEPRECA=
TED -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_COROUTINES_NO_DEPRECATION_WARNIN=
G -pthread -MD -MQ subprojects/phosphor-objmgr/src/test/well_known.p/well_k=
nown.cpp.o -MF subprojects/phosphor-objmgr/src/test/well_known.p/well_known=
.cpp.o.d -o subprojects/phosphor-objmgr/src/test/well_known.p/well_known.cp=
p.o -c ../subprojects/phosphor-objmgr/src/test/well_known.cpp
> >
> > ../subprojects/phosphor-objmgr/src/test/well_known.cpp:3:10: fatal erro=
r: gtest/gtest.h: No such file or directory
> >
> >     3 | #include <gtest/gtest.h>
> >
> >       |          ^~~~~~~~~~~~~~~
> >
> > compilation terminated.
> >
> > [14/128] Compiling C++ object su...spect.p/need_to_introspect.cpp.o
> >
> > FAILED: subprojects/phosphor-objmgr/src/test/need_to_introspect.p/need_=
to_introspect.cpp.o
> >
> > c++ -Isubprojects/phosphor-objmgr/src/test/need_to_introspect.p -Isubpr=
ojects/phosphor-objmgr -I../subprojects/phosphor-objmgr -I/usr/local/includ=
e -fdiagnostics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch=
 -Wnon-virtual-dtor -Wextra -Wpedantic -Werror -std=3Dc++20 -g -DMAPPER_ENA=
BLE_DEBUG -DBOOST_ASIO_DISABLE_THREADS -DBOOST_ALL_NO_LIB -DBOOST_SYSTEM_NO=
_DEPRECATED -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_COROUTINES_NO_DEPRECATIO=
N_WARNING -pthread -MD -MQ subprojects/phosphor-objmgr/src/test/need_to_int=
rospect.p/need_to_introspect.cpp.o -MF subprojects/phosphor-objmgr/src/test=
/need_to_introspect.p/need_to_introspect.cpp.o.d -o subprojects/phosphor-ob=
jmgr/src/test/need_to_introspect.p/need_to_introspect.cpp.o -c ../subprojec=
ts/phosphor-objmgr/src/test/need_to_introspect.cpp
> >
> > ../subprojects/phosphor-objmgr/src/test/need_to_introspect.cpp:3:10: fa=
tal error: gtest/gtest.h: No such file or directory
> >
> >     3 | #include <gtest/gtest.h>
> >
> >       |          ^~~~~~~~~~~~~~~
> >
> > compilation terminated.
> >
> > [33/128] Compiling C++ object su...aces_added.p/.._processing.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/processing.hpp=
:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/processing.cpp=
:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > [34/128] Compiling C++ object su...introspect.p/.._processing.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/processing.hpp=
:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/processing.cpp=
:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > [35/128] Compiling C++ object su...ame_change.p/.._processing.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/processing.hpp=
:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/processing.cpp=
:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > [36/128] Compiling C++ object su...well_known.p/.._processing.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/processing.hpp=
:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/processing.cpp=
:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > [37/128] Compiling C++ object su...ll_known.p/.._associations.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.c=
pp:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > [38/128] Compiling C++ object su...e_change.p/.._associations.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.c=
pp:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > [39/128] Compiling C++ object su...trospect.p/.._associations.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.c=
pp:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > [40/128] Compiling C++ object su...ciations.p/.._associations.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.c=
pp:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > [41/128] Compiling C++ object su...es_added.p/.._associations.cpp.o
> >
> > In file included from /usr/include/boost/config/header_deprecated.hpp:1=
8,
> >
> >                  from /usr/include/boost/detail/scoped_enum_emulation.h=
pp:15,
> >
> >                  from /usr/include/boost/coroutine/exceptions.hpp:14,
> >
> >                  from /usr/include/boost/coroutine/asymmetric_coroutine=
.hpp:24,
> >
> >                  from /usr/include/boost/coroutine/coroutine.hpp:10,
> >
> >                  from /usr/include/boost/coroutine/all.hpp:11,
> >
> >                  from /usr/include/boost/asio/spawn.hpp:19,
> >
> >                  from /usr/local/include/sdbusplus/asio/object_server.h=
pp:10,
> >
> >                  from ../subprojects/phosphor-objmgr/src/types.hpp:5,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.h=
pp:3,
> >
> >                  from ../subprojects/phosphor-objmgr/src/associations.c=
pp:1:
> >
> > /usr/include/boost/detail/scoped_enum_emulation.hpp:17:1: note: =E2=80=
=98#pragma message: This header is deprecated. Use <boost/core/scoped_enum.=
hpp> instead.=E2=80=99
> >
> >    17 | BOOST_HEADER_DEPRECATED("<boost/core/scoped_enum.hpp>")
> >
> >       | ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > ninja: build stopped: subcommand failed.
> >
> > archer@archer-ArcherCityM:phosphor-host-ipmid$
> >
> > =3D=3D=3D=3D=3D
> >
> >
> >
> > Regards,
> >
> > Chris Chen
> >
> >
> >
> > ________________________________
> >
> > =E5=AF=84=E4=BB=B6=E8=80=85: Brandon Kim <brandonkim@google.com>
> > =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B46=E6=9C=8830=E6=97=
=A5 =E4=B8=8A=E5=8D=88 01:19
> > =E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI) <Chris.Chen3@flex.com>
> > =E5=89=AF=E6=9C=AC: Willy Tu <wltu@google.com>; Patrick Williams <patri=
ck@stwcx.xyz>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> > =E4=B8=BB=E6=97=A8: Re: [phosphor-ipmi-flash]: stdplus build failed bef=
ore building the host-tool on the Host
> >
> >
> >
> > Hi Chris,
> >
> > However, I encountered other fatal errors when building the "phosphor-h=
ost-ipmid" package as below. (Overall there are three kinds of fatal errors=
, which is missing gtest.h, json.hpp, and log.hpp, that occured in several =
files, so I just list one message of each error for reference.)
> > =3D=3D=3D=3D=3D
> > ../subprojects/phosphor-objmgr/libmapper/test/mapper.cpp:4:10: fatal er=
ror: gtest/gtest.h: No such file or directory
> >     4 | #include <gtest/gtest.h>
> >
> >
> > Hmm it's strange that gtest is being pulled in when you have Dtest=3Ddi=
sabled for the build. Could you try `rm -rf build` directory for phosphor-h=
ost-ipmid before doing the same command again?
> >
> >
> >
> > ../entity_map_json.hpp:5:10: fatal error: nlohmann/json.hpp: No such fi=
le or directory
> >     5 | #include <nlohmann/json.hpp>
> > ../include/ipmid/message.hpp:26:10: fatal error: phosphor-logging/log.h=
pp: No such file or directory
> >    26 | #include <phosphor-logging/log.hpp>
> >
> >
> >
> > These should have been built as part of "subprojects". Could you make s=
ure phosphor-host-ipmid is pulled to the latest, clear the build directory =
and build again just to make sure?
> >
> >
> >
> > Thanks,
> >
> > Brandon
> >
> >
> >
> > On Wed, Jun 29, 2022 at 12:57 AM Chris Chen (TPI) <Chris.Chen3@flex.com=
> wrote:
> >
> > Hi Brandon and Willy,
> >
> > =C2=B7       First of all, I would like to say thanks for your answer a=
nd confirmation, the problems I listed are solved.
> >
> > =C2=B7       For Brandon's question,> It is totally possible that our i=
nstructions in the README is not up to date anymore, but just to make sure =
- are you building each of the components as specified by https://urldefens=
e.com/v3/__https://github.com/openbmc/phosphor-ipmi-flash*building-the-host=
-tool?__;Iw!!HSntlCg!RUZM2VCNpHIF_D2Mv6DyxuWFsXxHUogP0GsvCS3oY-r1R1SwgBZlSW=
L5x5_4WroyEovw-sh0F4Ungs5a0ndQVw$
> >
> > Yes, I followed the README.md to build each of the components.
> >
> > =C2=B7       However, I encountered other fatal errors when building th=
e "phosphor-host-ipmid" package as below. (Overall there are three kinds of=
 fatal errors, which is missing gtest.h, json.hpp, and log.hpp, that occure=
d in several files, so I just list one message of each error for reference.=
)
> >
> > =3D=3D=3D=3D=3D
> > ../subprojects/phosphor-objmgr/libmapper/test/mapper.cpp:4:10: fatal er=
ror: gtest/gtest.h: No such file or directory
> >     4 | #include <gtest/gtest.h>
> > ../entity_map_json.hpp:5:10: fatal error: nlohmann/json.hpp: No such fi=
le or directory
> >     5 | #include <nlohmann/json.hpp>
> > ../include/ipmid/message.hpp:26:10: fatal error: phosphor-logging/log.h=
pp: No such file or directory
> >     26 | #include <phosphor-logging/log.hpp>
> > =3D=3D=3D=3D=3D
> >
> > Do you have any suggestions on this?
> > BTW. I use following commands to build the "phosphor-host-ipmid" packag=
e, it should be correct, right?
> >
> > -----
> > meson setup -Dtests=3Ddisabled builddir
> > ninja -C builddir
> > ninja -C builddir install
> > -----
> >
> > =C2=B7       I don't insist to build locally, so as per your recommenda=
tion I'm trying to build it by using docker. However, I have limit capabili=
ty with docker, I for now met a question on building docker image by using =
the "build-unit-test-docker" script you mentioned, that is after installing=
 the docker-desktop on my Host, I referred to https://urldefense.com/v3/__h=
ttps://github.com/openbmc/docs/blob/master/testing/run-test-docker.md*build=
-docker-image__;Iw!!HSntlCg!RUZM2VCNpHIF_D2Mv6DyxuWFsXxHUogP0GsvCS3oY-r1R1S=
wgBZlSWL5x5_4WroyEovw-sh0F4Ungs7GBQqFpQ$  to build the docker image, of cou=
rse, I replace the command as below,
> >
> > ./scripts/build-unit-test-docker
> >
> > Then, the error came out after several minutes. (I retried few times, s=
ome images are already exists.) Could you help to take a look at this, and =
give me some suggestions as well?
> >
> > =3D=3D=3D=3D=3D
> > archer@archer-ArcherCityM:openbmc-build-scripts$ ./scripts/build-unit-t=
est-docker
> > Image openbmc/ubuntu-unit-test-base:2022-W26-e79767e5378d5a0f already e=
xists.  Skipping.
> > Image openbmc/ubuntu-unit-test-uscilab-cereal:2022-W26-ab72d4495979e830=
 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-nlohmann-json:2022-W26-ffba809170eb0a41 =
already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-naios-function2:2022-W26-3b876756bb76be2=
3 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-cliutils-cli11:2022-W26-f53b55bea30b21c6=
 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-libvnc-libvncserver:2022-W26-90d3acb2a0d=
f9617 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-cppalliance-url:2022-W26-460f317503ba942=
2 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-boost:2022-W26-d87626309071f65f already =
exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-catchorg-catch2:2022-W26-3439038e67e8230=
4 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-leethomason-tinyxml2:2022-W26-323efeff9d=
b53382 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-facebookexperimental-libunifex:2022-W26-=
1eff6ee41b25d7e1 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-linux-test-project-lcov:2022-W26-1369067=
5d4cda956 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-fmtlib-fmt:2022-W26-8c08817ee76f296a alr=
eady exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-google-googletest:2022-W26-41755ba7fe770=
d1e already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-tristanpenman-valijson:2022-W26-2d55955f=
fea82018 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-open-power-pdbg:2022-W26-ea1338b7d5bcf71=
7 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-openbmc-sdbusplus:2022-W26-4de3de6a7dd74=
c72 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-openbmc-stdplus:2022-W26-fcc6d0d878d8243=
5 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-openbmc-gpioplus:2022-W26-6e12ea9e28a38a=
45 already exists.  Skipping.
> > Image openbmc/ubuntu-unit-test-openbmc-sdeventplus:2022-W26-077c15efe62=
026d9 already exists.  Skipping.
> > Package openbmc/linux failed!
> > Traceback (most recent call last):
> >   File "/home/archer/Downloads/openbmc-build-scripts/./scripts/build-un=
it-test-docker", line 852, in <module>
> >     Package.generate_all()
> >   File "/home/archer/Downloads/openbmc-build-scripts/./scripts/build-un=
it-test-docker", line 396, in generate_all
> >     raise t.exception
> >   File "/home/archer/Downloads/openbmc-build-scripts/./scripts/build-un=
it-test-docker", line 365, in run
> >     Docker.build(self.package, tag, dockerfile)
> >   File "/home/archer/Downloads/openbmc-build-scripts/./scripts/build-un=
it-test-docker", line 620, in build
> >     docker.build(
> >   File "/home/archer/.local/lib/python3.10/site-packages/sh.py", line 1=
566, in __call__
> >     return RunningCommand(cmd, call_args, stdin, stdout, stderr)
> >   File "/home/archer/.local/lib/python3.10/site-packages/sh.py", line 8=
22, in __init__
> >     self.wait()
> >   File "/home/archer/.local/lib/python3.10/site-packages/sh.py", line 8=
79, in wait
> >     self.handle_command_exit_code(exit_code)
> >   File "/home/archer/.local/lib/python3.10/site-packages/sh.py", line 9=
05, in handle_command_exit_code
> >     raise exc
> > sh.ErrorReturnCode_1:
> >
> >   RAN: /usr/local/bin/docker build --network=3Dhost --force-rm --no-cac=
he=3Dfalse -t openbmc/ubuntu-unit-test-openbmc-linux:2022-W26-4d748d691e37a=
3f6 -
> >
> >   STDOUT:
> >
> >   STDERR:
> > #1 [internal] load build definition from Dockerfile
> > #1 sha256:7b1d92eec8d42e247f2bb4fd1260a7b209eb6af9dab84c342a27d5cdd089f=
3f8
> > #1 transferring dockerfile: 307B 0.0s done
> > #1 DONE 0.1s
> >
> > #2 [internal] load .dockerignore
> > #2 sha256:c8396637158fe442f7870c427fb14a5e1f1f71b781353fcff1a75b6301070=
bcb
> > #2 transferring context: 2B done
> > #2 DONE 0.0s
> >
> > #3 [internal] load metadata for docker.io/openbmc/ubuntu-unit-test-base=
:2022-W26-e79767e5378d5a0f
> > #3 sha256:053b27ec734906a3cbf79dc0bc99b133a80abc1aa2fd5545010138b72cf16=
ee0
> > #3 DONE 0.0s
> >
> > #4 [1/2] FROM docker.io/openbmc/ubuntu-unit-test-base:2022-W26-e79767e5=
378d5a0f
> > #4 sha256:e6e9b48a100df776a75b8dc934e85d3f5282ade34c031f25e3dd74a0ecd13=
842
> > #4 CACHED
> >
> > #5 [2/2] RUN curl -L https://urldefense.com/v3/__https://github.com/ope=
nbmc/linux/arch__;!!HSntlCg!RUZM2VCNpHIF_D2Mv6DyxuWFsXxHUogP0GsvCS3oY-r1R1S=
wgBZlSWL5x5_4WroyEovw-sh0F4Ungs7JcHcBSQ$ ... (3475 more, please see e.stder=
r)
> > =3D=3D=3D=3D=3D
> >
> >
> >
> > Regards,
> >
> > Chris Chen
> >
> >
> >
> > ________________________________
> >
> > =E5=AF=84=E4=BB=B6=E8=80=85: Willy Tu <wltu@google.com>
> > =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B46=E6=9C=8828=E6=97=
=A5 =E4=B8=8B=E5=8D=88 11:56
> > =E6=94=B6=E4=BB=B6=E8=80=85: Brandon Kim <brandonkim@google.com>
> > =E5=89=AF=E6=9C=AC: Chris Chen (TPI) <Chris.Chen3@flex.com>; Patrick Wi=
lliams <patrick@stwcx.xyz>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.=
org>
> > =E4=B8=BB=E6=97=A8: Re: [phosphor-ipmi-flash]: stdplus build failed bef=
ore building the host-tool on the Host
> >
> >
> >
> > Oh yeah, the README is 100% outdated. We have moved to meson and we
> > should update it at some point in life.
> >
> > I think your command to build burn_my_bmc should be fine. The
> > `host-tool` should be enabled by default.
> >
> > Can try the following, just in case.
> > ```
> > meson setup -Dhost-tool=3Denabled builddir
> > ninja -C builddir
> > ninja -C builddir install
> > ```
> >
> > Willy Tu
> >
> >
> > On Tue, Jun 28, 2022 at 8:51 AM Brandon Kim <brandonkim@google.com> wro=
te:
> > >
> > > Ah, it seems like the email chains were broken up for some reason - s=
eeing this now after I replied to the other email chain.
> > >
> >
> > > It is totally possible that our instructions in the README is not up =
to date anymore, but just to make sure - are you building each of the compo=
nents as specified by https://urldefense.com/v3/__https://github.com/openbm=
c/phosphor-ipmi-flash*building-the-host-tool__;Iw!!HSntlCg!UGWKiK4C2gPBrPnK=
MLNL78cKJAEnz7sb96UQ2IJR62gd5toQOBTYp5LubQOq6YnHBYCe7qVRsw7I7w$  ?
> >
> > >
> > > It details the commands to use for each of the dependencies.
> > >
> > > Good point on the burn_my_bmc command in the README description not b=
eing not up to date and still using automake (https://urldefense.com/v3/__h=
ttps://github.com/openbmc/phosphor-ipmi-flash*building-the-host-tool__;Iw!!=
HSntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAEnz7sb96UQ2IJR62gd5toQOBTYp5LubQOq6YnHBYC=
e7qVRsw7I7w$ ) - I'll try to run this to verify when I get time later today=
, but in the meantime perhaps @Willy Tu may know the command off the top of=
 his head as he performed the big meson migration. As a first glance the co=
mmand looks correct.
> > >
> > > Willy recently also migrated phospohr-host-ipmid to meson, so he may =
know more about the PAM dependency as well.
> > >
> > > Thanks,
> > > Brandon
> > >
> > >
> > > On Tue, Jun 28, 2022 at 8:04 AM Chris Chen (TPI) <Chris.Chen3@flex.co=
m> wrote:
> > >>
> > >> Hi Patrick,
> > >>
> > >> Thanks for your prompt reply, and the issue is solved after installi=
ng Ubuntu "libfmt-dev" package.
> > >>
> > >> >> Do you know why you disabled C++20?  This shouldn't have been nec=
essary
> > >> >> and some of our code now requires C++20.
> > >>
> > >> I disabled C++20 of the "ipmi-blob-tool" package because I got error=
s below:
> > >> =3D=3D=3D=3D=3D
> > >> archer@archer-ArcherCityM:ipmi-blob-tool$ ./bootstrap.sh
> > >> + autoreconf -v -f -i
> > >> autoreconf: export WARNINGS=3D
> > >> autoreconf: Entering directory '.'
> > >> autoreconf: configure.ac: not using Gettext
> > >> autoreconf: running: aclocal --force -I m4
> > >> configure.ac:38: error: invalid first argument `20' to AX_CXX_COMPIL=
E_STDCXX
> > >> /usr/share/aclocal/ax_cxx_compile_stdcxx.m4:50: AX_CXX_COMPILE_STDCX=
X is expanded from...
> > >> configure.ac:38: the top level
> > >> autom4te: error: /usr/bin/m4 failed with exit status: 1
> > >> aclocal: error: /usr/bin/autom4te failed with exit status: 1
> > >> autoreconf: error: aclocal failed with exit status: 1
> > >> =3D=3D=3D=3D=3D
> > >> Do you have ideas about how to solve it correctly?
> > >>
> > >> In addition, i have started to build the burn_my_bmc (the host-tool)=
 on the Host by cloning the "phosphor-ipmi-flash" source. There are some qu=
estions came out:
> > >>
> > >> The "phosphor-ipmi-flash" package seems became to use "meson" rather=
 than "bootstrap.sh", so I run these commands in the source directory. Is i=
t correct?
> > >> -----
> > >> meson setup -Dbmc-blob-handler=3Ddisabled builddir
> > >> ninja -C builddir
> > >> ninja -C builddir install
> > >> -----
> > >>
> > >> After running "meson setup -Dbmc-blob-handler=3Ddisabled builddir", =
it occurred dependency errors, like 'sdbusplus', 'phosphor-dbus-interfaces'=
, 'libipmid', and so on is required respectively, is it correct?
> > >>
> > >> I for now have tried to install these dependencies one-by-one, but b=
e stuck at 'libipmid'. That is I clone the "phosphor-host-ipmid" and run "m=
eson builddir" command to build it, however, I got an error in blow and I c=
an't solve it. Could you please give me some suggestions?
> > >> =3D=3D=3D=3D=3D
> > >> Dependency sdeventplus from subproject subprojects/sdeventplus found=
: YES 0.1
> > >> Dependency systemd found: YES 249 (cached)
> > >> Run-time dependency libcrypto found: YES 3.0.2
> > >>
> > >> meson.build:89:0: ERROR: C++ shared or static library 'pam' not foun=
d
> > >> =3D=3D=3D=3D=3D
> > >>
> > >> Thanks.
> > >>
> > >> Regards,
> > >> Chris Chen
> > >>
> > >> ________________________________ =E5=AF=84=E4=BB=B6=E8=80=85: Patric=
k Williams
> > >> =E5=B7=B2=E5=82=B3=E9=80=81: =E6=98=9F=E6=9C=9F=E4=BA=8C, 2022 6 =E6=
=9C=88 28 =E6=97=A5 =E4=B8=8B=E5=8D=88 07:20
> > >> =E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI)
> > >> =E5=89=AF=E6=9C=AC: openbmc@lists.ozlabs.org
> > >> =E4=B8=BB=E6=97=A8: Re: [phosphor-ipmi-flash]: stdplus build failed =
before building the host-tool on the Host
> > >>
> > >> On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:
> > >> > And each library and tool is built successful(only one thing that =
is I had to disable C++20 for the ipmi-blob-tool, others were fine) untilI =
started to build the stdplus. I encountered a build failed issue as below. =
It looks like there is a problem for using libfmt.a, I tried to figure out =
a solution on google but nothing is related to this. Could anyone help on t=
his? Thanks.
> > >>
> > >> Do you know why you disabled C++20?  This shouldn't have been necess=
ary
> > >> and some of our code now requires C++20.
> > >>
> > >> >
> > >> > =3D=3D=3D=3D=3D
> > >> > archer@archer-ArcherCityM:stdplus$
> > >> > archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse =
-Dtests=3Ddisabled builddir
> > >> > The Meson build system
> > >> > Version: 0.61.2
> > >> > Source dir: /home/archer/Downloads/host-tool/stdplus
> > >> > Build dir: /home/archer/Downloads/host-tool/stdplus/builddir
> > >> > Build type: native build
> > >> > Project name: stdplus
> > >> > Project version: 0.1
> > >> > C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (Ubuntu 11=
.2.0-19ubuntu1) 11.2.0")
> > >> > C++ linker for the host machine: c++ ld.bfd 2.38
> > >> > Host machine cpu family: x86_64
> > >> > Host machine cpu: x86_64
> > >> > Found pkg-config: /usr/bin/pkg-config (0.29.2)
> > >> > Run-time dependency fmt found: YES 8.1.2
> > >>
> > >> Where did this `fmt` come from?  Ubuntu has `libfmt-dev` that you ca=
n
> > >> install which is version 8.1.1 on Jammy right now.
> > >>
> > >> > Library dl found: YES
> > >> > Run-time dependency liburing found: YES 2.0
> > >> > Build targets in project: 1
> > >> >
> > >> > stdplus 0.1
> > >> >
> > >> >   User defined options
> > >> >     examples: false
> > >> >     tests   : disabled
> > >> >
> > >> > Found ninja-1.10.1 at /usr/bin/ninja
> > >> > archer@archer-ArcherCityM:stdplus$
> > >> > archer@archer-ArcherCityM:stdplus$
> > >> > archer@archer-ArcherCityM:stdplus$ ninja -C builddir
> > >> > ninja: Entering directory `builddir'
> > >> > [9/9] Linking target src/libstdplus.so.0.1
> > >> > FAILED: src/libstdplus.so.0.1
> > >> > c++  -o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/stdplus_exce=
ption.cpp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libstdplus.so.=
0.1.p/stdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o src/=
libstdplus.so.0.1.p/stdplus_fd_dupable.cpp.o src/libstdplus.so.0.1.p/stdplu=
s_fd_impl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_managed.cpp.o src/libstd=
plus.so.0.1.p/stdplus_fd_mmap.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_ops.=
cpp.o src/libstdplus.so.0.1.p/stdplus_io_uring.cpp.o -Wl,--as-needed -Wl,--=
no-undefined -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /u=
sr/local/lib/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-=
group
> > >> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: reloca=
tion against `stdout@@GLIBC_2.2.5' in read-only section `.text'
> > >> > /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation R_X8=
6_64_PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when making =
a shared object; recompile with -fPIC
> > >>
> > >> However you obtained your libfmt, it was compiled incorrectly.  It
> > >> shouldn't have a static library but a dynamic one.
> > >>
> > >> The `libfmt-dev` package has `libfmt.so` which should be sufficient =
for
> > >> linking as a shared library.
> > >>
> > >> --
> > >> Patrick Williams
> > >> Legal Disclaimer :
> > >> The information contained in this message may be privileged and conf=
idential.
> > >> It is intended to be read only by the individual or entity to whom i=
t is addressed
> > >> or by their designee. If the reader of this message is not the inten=
ded recipient,
> > >> you are on notice that any distribution of this message, in any form=
,
> > >> is strictly prohibited. If you have received this message in error,
> > >> please immediately notify the sender and delete or destroy any copy =
of this message!
