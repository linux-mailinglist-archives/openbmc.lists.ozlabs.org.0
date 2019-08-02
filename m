Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375A80052
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 20:42:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460bcW1QXLzDrGs
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2019 04:42:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HxHOFHEy"; 
 dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460bbW5yqzzDrDQ
 for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2019 04:41:26 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id s19so53624715lfb.9
 for <openbmc@lists.ozlabs.org>; Fri, 02 Aug 2019 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MzDZh9uIsaGO8w25eXgtHj0pbRFHIVHigbn6+ekHndU=;
 b=HxHOFHEyt4qxb5a1aeZwXFTXgeTOcjS36v+bsbb6NUyVPqeXtrzKHIh9OCHy/+DZ/M
 BglLfzEqC9fF/cYL9fs8TUfUr1anIbjh66KdwSoStAggCSa1g/OYmN8CNSUasSCGEjvH
 rwcqm/vFnEk8BHuXLa3Y/NjTBKtu8su9MTTjZ2i5g1kkU1sSHXBHnT/K8QVb8CJepGzn
 gYYUQT8zczcqX/IQP7X+CW4LDuXwIhlPMslLBBzwiP93Eiw1irrNLFACV51aY6zf6TAO
 EYR1ZA60omZDueNhLRyRWA184/E1+MJWlKC37p0lnWHDO6gpvJ/RQL63xMJDUQaEMPhy
 0sVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MzDZh9uIsaGO8w25eXgtHj0pbRFHIVHigbn6+ekHndU=;
 b=MXSIMibdIxgJuU09D5knndfP39BBCGtTGl/O2c5fUpB3mtspRvBrW+ZjyHV7hxmCkI
 R68AYrtAQz1XJWGyr915aK4HPPB5rCd8H/+dYj7x5c7pd7vGdOMBS+vU6XrHO7gA59UN
 y/tfksSuJjxpYeGeO7ugA44EMS7VNB9KTO4nmzwWTfVYXGfm5AMtpo/7CYK7zaA57FEe
 XxjiILu+b4yc2pmSZYL2x9b0uglZRoNENyXfr3bdedfRqeIkF70EbTqoewj5myv0m+8k
 xNQ/Bq6m/Z06vhZoynyE1moGyCYiLTtiptTTCs8HczOLdqZRXRFW6ij/yV9qaM0jCAqH
 AiAg==
X-Gm-Message-State: APjAAAXgB9fxCe1MGeK8J6uy8uJtwa0Q62p7vJjNWb1fUlt0CCYZpNe+
 kBPFQCL0PUnayKbbt4gwGe+zfZDH+t2+MO9v5ksAtA==
X-Google-Smtp-Source: APXvYqxErWMdB8pxYYHB/TtWt+KrJ4/MWyU7oJDJovkcKr6PiG61uUlw1CrxEYmOQMvykJ+A53umDjbGn6XM3YZ0kT8=
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr6453981lfm.143.1564771281524; 
 Fri, 02 Aug 2019 11:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=-WgcYhXVd9WOxtgE54C4QCqatpM0nAeaaqc_h4tKWVg@mail.gmail.com>
In-Reply-To: <CAARXrt=-WgcYhXVd9WOxtgE54C4QCqatpM0nAeaaqc_h4tKWVg@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Fri, 2 Aug 2019 11:41:10 -0700
Message-ID: <CAPnigK=PhKkJUk6wDVnRwxqkFvh2YgpivCQYgVuyOfnC3+a0WQ@mail.gmail.com>
Subject: Re: Using meson unittest in OE SDK environment
To: Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

It seems like a complete misuse of the SDK if you have to hardcode
that much of the toolchain information into the build scripts. This
should all be handled outside of your meson build.

On Fri, Aug 2, 2019 at 3:22 AM Lei YU <mine260309@gmail.com> wrote:
>
> It looks like more and more OpenBMC repos are going to use meson to replace
> autotools.
> I tried to use meson in a new repo, it works fine for builds, but I got some
> problems on running tests in OE SDK environment.
>
> I tried to pass rpath to link_args, but meson seems a bit weird on using this.
> (If interested) Please check the details in
> https://github.com/mine260309/phosphor-psu-code-mgmt/blob/cc35c10b5416dbcec0dfd6eaaa7d096d9ec4e733/test/meson.build#L45
>
> I was gathering correct `-Wl,-rpath,` options, save it in `testcase_flags`, and
> pass it to `link_args`.
> It is expected to work, and it's really close...
>
> However, meson passes the `testcase_flags` to the link command, but with an
> extra single-quote `'`, and unfortunately, it does not work as expected.
>
> See below detailed command meson executes:
>
> ```
> x86_64-openbmc-linux-g++ -m64 -march=core2 -mtune=core2 -msse3
> -mfpmath=sse --sysroot=/usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux
>  -o test/utest 'test/9f86d08@@utest@exe/.._src_ut
> ils.cpp.o' 'test/9f86d08@@utest@exe/test_utils.cpp.o'
> -Wl,--no-undefined -Wl,--as-needed -Wl,--start-group -lstdc++fs
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -flto
> '-Wl,-rpath,/usr/local/oecore
> -x86_64/sysroots/core2-64-openbmc-linux/lib
> -Wl,-rpath,/usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib
> -Wl,-dynamic-linker,/usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/l
> ib/ld-2.29.so' /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libgtest_main.a
> -pthread /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libgtest.a
> /usr/local/oecore
> -x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libgmock.a
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libphosphor_logging.so
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-
> linux/usr/lib/libsdbusplus.so
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/libsystemd.so
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libphosphor_dbus.so
> -Wl,--en
> d-group
>
> $ ldd ./x86-build/test/utest
> ./x86-build/test/utest: /usr/lib/x86_64-linux-gnu/libstdc++.so.6:
> version `GLIBCXX_3.4.26' not found (required by
> ./x86-build/test/utest)
>         linux-vdso.so.1 (0x00007ffd569f9000)
>         libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
> (0x00007ff67df87000)
>         libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1
> (0x00007ff67dd6f000)
>         libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
> (0x00007ff67db50000)
>         libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007ff67d75f000)
>         libsdbusplus.so.1 => not found
>         libsystemd.so.0 => /lib/x86_64-linux-gnu/libsystemd.so.0
> (0x00007ff67d4db000)
>         libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007ff67d13d000)
>         /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/ld-2.29.so
> => /lib64/ld-linux-x86-64.so.2 (0x00007ff67e310000)
>         librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007ff67cf35000)
>         liblzma.so.5 => /lib/x86_64-linux-gnu/liblzma.so.5 (0x00007ff67cd0f000)
>         liblz4.so.1 => /usr/lib/x86_64-linux-gnu/liblz4.so.1
> (0x00007ff67caf3000)
>         libgcrypt.so.20 => /lib/x86_64-linux-gnu/libgcrypt.so.20
> (0x00007ff67c7d8000)
>         libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007ff67c5d4000)
>         libgpg-error.so.0 => /lib/x86_64-linux-gnu/libgpg-error.so.0
> (0x00007ff67c3bf000)
> ```
>
> If I manually remove the extra single-quote `'`, it works just fine:
>
> ```
> x86_64-openbmc-linux-g++ -m64 -march=core2 -mtune=core2 -msse3
> -mfpmath=sse --sysroot=/usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux
>  -o test/utest 'test/9f86d08@@utest@exe/.._src_ut
> ils.cpp.o' 'test/9f86d08@@utest@exe/test_utils.cpp.o'
> -Wl,--no-undefined -Wl,--as-needed -Wl,--start-group -lstdc++fs
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -flto
> -Wl,-rpath,/usr/local/oecore
> -x86_64/sysroots/core2-64-openbmc-linux/lib
> -Wl,-rpath,/usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib
> -Wl,-dynamic-linker,/usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/l
> ib/ld-2.29.so /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libgtest_main.a
> -pthread /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libgtest.a
> /usr/local/oecore
> -x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libgmock.a
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libphosphor_logging.so
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-
> linux/usr/lib/libsdbusplus.so
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/libsystemd.so
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libphosphor_dbus.so
> -Wl,--en
> d-group
>
> $ ldd ./x86-build/test/utest
>         linux-vdso.so.1 (0x00007ffe3fdef000)
>         libstdc++.so.6 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libstdc++.so.6
> (0x00007fde0340d000)
>         libgcc_s.so.1 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/libgcc_s.so.1
> (0x00007fde033f4000)
>         libpthread.so.0 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/libpthread.so.0
> (0x00007fde033a0000)
>         libc.so.6 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/libc.so.6
> (0x00007fde031e8000)
>         libsdbusplus.so.1 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/libsdbusplus.so.1
> (0x00007fde033ea000)
>         libsystemd.so.0 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/libsystemd.so.0
> (0x00007fde03131000)
>         libm.so.6 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/libm.so.6
> (0x00007fde02fee000)
>         /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/ld-2.29.so
> => /lib64/ld-linux-x86-64.so.2 (0x00007fde033c0000)
>         librt.so.1 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/librt.so.1
> (0x00007fde02fe3000)
>         liblzma.so.5 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/usr/lib/liblzma.so.5
> (0x00007fde02fbb000)
>         libcap.so.2 =>
> /usr/local/oecore-x86_64/sysroots/core2-64-openbmc-linux/lib/libcap.so.2
> (0x00007fde02fb3000)
>
> ```
>
> So my question is, has anyone successfully run a unit test case in OE SDK
> environment? And if yes, how it is done?
