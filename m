Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEEB17B93A
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 10:28:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yj3F4mNvzDr2K
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 20:28:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AWRziPHx; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yj2L735HzDr1V
 for <openbmc@lists.ozlabs.org>; Fri,  6 Mar 2020 20:27:38 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id w27so1361273lfc.1
 for <openbmc@lists.ozlabs.org>; Fri, 06 Mar 2020 01:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8oT4kqoslgGvoBpyDV82sCndpHS+HGkBqv+2oL7szy8=;
 b=AWRziPHxrhsBjXebAzbL3IZJ/9yO8mYNxBIcWyaDxrkP8YgQFFOrhOE5YhfA5XK2yi
 sFP5ls3/QwFT2aWtFxnI0Xhzi+WaZyGCPDp9ZunaIqwmHMSBkCJxDBI0qJ/YpXg3lCRi
 exsiXOVTALorPTZWd22x9R8mXWbBaSDfXy805MPrUybzY0hcWfXoIQLmsz/sZYBUQyEe
 PK1HLkjaoknl8YqzG8DfDpiv6Lj48E9k9mA/43bPU2iULuYmgGltrBsyfsQs1xvOMJLx
 M5kC4wGw8LKlOZE6ZJAF2c6ZNC2LDZgVu2qw4QBnY5SsjxU3zkuJ6Qc8ZxBHKFbKVX/e
 FyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8oT4kqoslgGvoBpyDV82sCndpHS+HGkBqv+2oL7szy8=;
 b=msRT2Q4vN1sSMX73uk3c/HU2hjgcFzqgUiOqJLk0twXB0Ek9xhgiM5/4OrvB9hPLcA
 f80PcGq27XGMvMMqOZNJLRM7sUpWE7M7CZsMr4jUl5+OzIbQqS9LxyWSgU/frpQqKP3Y
 2fbmZJ323F/MXVkcuUQRDpx2LzyFdaWePY2WfrhFScPfQgLZNnv6pd18SzMXkYqy6ndG
 bFVQu9koHSxpIJ8F8ey/VZRqPVs/Ig1ZqBlP3WlERoMHwZDFb2nayldICe164wyJz+oJ
 V2cBKISjxudPpx/Z5w0GeBvdJ0Sm7OQ6UWxDDjR7SUTNimNUgJuchpIVgDeajff3c3pn
 G/cQ==
X-Gm-Message-State: ANhLgQ10OTn1nBYXM85rHHi6+F7OB5Wl5BOaQ89aX1SyEvDYLmwFwVob
 6M32MnPYfb5SCmvEM5MfKbPCoHuMp8e/RYuKj3k=
X-Google-Smtp-Source: ADFU+vuqwlGCkc9jTGEEvXVJp2U4L1IQBoXfRckK2KTI0c95oZQMZkxARwH8uuOIX1m1QvouvBFr0Xr+spHKIEZ4svA=
X-Received: by 2002:a19:8c1c:: with SMTP id o28mr1327557lfd.185.1583486853637; 
 Fri, 06 Mar 2020 01:27:33 -0800 (PST)
MIME-Version: 1.0
References: <c2ebd229-edfc-4e9c-877e-313bce3a8c3e@www.fastmail.com>
 <OF52780FFD.4F5D715D-ON00258522.002B956C-00258522.002BB560@notes.na.collabserv.com>
In-Reply-To: <OF52780FFD.4F5D715D-ON00258522.002B956C-00258522.002BB560@notes.na.collabserv.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 6 Mar 2020 17:27:21 +0800
Message-ID: <CAARXrtm+dB-pV8H=QxaZ6Q_6tUHuPq8FCrAcWck6ve16zbNQHg@mail.gmail.com>
Subject: Re: [OpenBMC]: Unit test coverage analysis on openbmc repositories
To: Lakshminarayana R Kammath <lkammath@in.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It's found that the test coverage result is not correct for some repos.

E.g. for phosphor-psu-code-mgmt, there are quite a few tests for code
in `src`, but it only shows 2.5%:
https://openpower.xyz/job/openbmc-unit-test-coverage/2/artifact/openbmc-bui=
ld-scripts/scripts/unit-test-meta-data/phosphor-psu-code-mgmt/build/meson-l=
ogs/coveragereport/index.html

It looks like `lcov` is not handling such case well, and there is a
similar question on StackOverflow:
https://stackoverflow.com/questions/27556872/lcov-doesnt-match-gcov-coverag=
e-results-for-a-googletest-unit-test

I tried to remove `lcov` and use `gcovr` in local CI, and the result
looks correct.

`lcov` is required for autotools' coverage, so we can not just remove it.
If I add `gcovr` into the docker image without removing `lcov`,
unfortunately, meson still uses `lcov` for `coverage-html` when both
tools are available.

An issue is created at
https://github.com/mesonbuild/meson/issues/6747, hopefully we could
get some feedback from meson.

In OpenBMC, do you have any ideas on how to "fix" the coverage result?


On Thu, Mar 5, 2020 at 3:59 PM Lakshminarayana R Kammath
<lkammath@in.ibm.com> wrote:
>
> Hi All,
>
> please confirm on following
>
> Boost-bus - compilation fails . Is it used? Should be archived @andrewj?
>
> Google-ipmi-i2c - code compiles well, complain in formatting script @pstr=
inkle
> subsys_initcall(i2c_via_ipmi_init);^[[m^M
> Traceback (most recent call last):^M
>   File "/home/lkammath/final_data/unit-test.py", line 826, in <module>^M
>     check_call_cmd("./format-code.sh", CODE_SCAN_DIR)^M
>   File "/home/lkammath/final_data/unit-test.py", line 229, in check_call_=
cmd^M
>     check_call(cmd)^M
>   File "/usr/lib/python2.7/subprocess.py", line 190, in check_call^M
>     raise CalledProcessError(retcode, cmd)^M
> subprocess.CalledProcessError: Command '('./format-code.sh', '/home/lkamm=
ath/final_data/google-ipmi-i2c')' returned non-zero exit status 1^M
> Traceback (most recent call last):^M
>   File "/home/lkammath/final_data/dbus-unit-test.py", line 91, in <module=
>^M
>
> Inarp.git - Should be archived @andrewj?
> Compilation issue
> inarp.c: In function =E2=80=98arp_recv=E2=80=99:
> inarp.c:433:4: error: taking address of packed member of =E2=80=98struct =
arp_packet=E2=80=99 may result in an unaligned pointer value [-Werror=3Dadd=
ress-of-packed-member]
>   433 |    &inarp_req.src_ip);
>       |    ^~~~~~~~~~~~~~~~~
> In function =E2=80=98do_ifreq=E2=80=99,
>     inlined from =E2=80=98get_local_ipaddr=E2=80=99 at inarp.c:182:7,
>     inlined from =E2=80=98arp_recv=E2=80=99 at inarp.c:419:7,
>     inlined from =E2=80=98main=E2=80=99 at inarp.c:480:4:
> inarp.c:170:2: error: =E2=80=98strncpy=E2=80=99 output may be truncated c=
opying 16 bytes from a string of length 16 [-Werror=3Dstringop-truncation]
>   170 |  strncpy(ifreq->ifr_name, ifname, sizeof(ifreq->ifr_name));
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[1]: *** [inarp.o] Error 1
> make[1]: Leaving directory `/esw/san5/lkammath/boost/inarp'
> make: *** [all] Error 2
> In CI environment
> ool.la -lncurses -ltinfo  -lcrypto^M
> copying selected object files to avoid basename conflicts...^M
> ar: `u' modifier ignored since `D' is the default (see `U')^M
> make[4]: Leaving directory '/home/lkammath/final_data/ipmitool/src/plugin=
s/lan'^M
> Making all in lanplus^M
> make[4]: Entering directory '/home/lkammath/final_data/ipmitool/src/plugi=
ns/lanplus'^M
> /bin/bash ../../../libtool --silent  --tag=3DCC   --mode=3Dcompile gcc -D=
HAVE_CONFIG_H -I. -I../../.. -I../../../include    -g -O2 -Wall -Wextra -st=
d=3Dc99 -pedantic -Wformat -Wformat-nonliteral -MT lanplus_crypt_impl.lo -M=
D -MP -MF .deps/lanplus_crypt_impl.Tpo -c -o lanplus_crypt_impl.lo lanplus_=
crypt_impl.c^M
> lanplus_crypt_impl.c: In function 'lanplus_encrypt_aes_cbc_128':^M
> lanplus_crypt_impl.c:158:17: error: storage size of 'ctx' isn't known^M
>   158 |  EVP_CIPHER_CTX ctx;^M
>       |                 ^~~^M
> lanplus_crypt_impl.c:158:17: warning: unused variable 'ctx' [-Wunused-var=
iable]^M
> lanplus_crypt_impl.c: In function 'lanplus_decrypt_aes_cbc_128':^M
> lanplus_crypt_impl.c:233:17: error: storage size of 'ctx' isn't known^M
>   233 |  EVP_CIPHER_CTX ctx;^M
>       |                 ^~~^M
>
> Smbios-mdr - @brad. Please confirm if used?
> No automake env (make)
>
> Thanks & Regards,
> Lakshminarayana Kamath
> -------------------------------------------------------------------------=
-------------------------
>
>
>
> ----- Original message -----
> From: "Andrew Jeffery" <andrew@aj.id.au>
> To: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>, openbmc@lists.ozla=
bs.org
> Cc:
> Subject: [EXTERNAL] Re: [OpenBMC]: Unit test coverage analysis on openbmc=
 repositories
> Date: Tue, Mar 3, 2020 10:18 AM
>
>
> On Sat, 29 Feb 2020, at 02:05, Lakshminarayana R Kammath wrote:
>
> > https://github.com/openbmc/obmc-console.git  YES, UNIT TEST
>
> I need to add coverage support to obmc-console.
>
> > https://github.com/openbmc/openbmc-tools.git  NO
>
> Not sure we can expect anything for openbmc-tools - it's a collection
> of random scripts people have written to make their life developing
> openbmc easier. It's not something that should have strict QA
> processes.
>
> > https://github.com/openbmc/openpower-host-ipmi-flash.git  NO
>
> I should add some tests here where I can.
>
> > https://github.com/openbmc/hiomapd.git  YES, UNIT TEST
> > https://github.com/openbmc/libmctp.git  YES, UNIT TEST
> > https://github.com/openbmc/phosphor-led-sysfs.git  YES, UNIT TEST
>
> These three do in-fact have GCOV/LCOV support, you need to do the usual a=
utotools invocations to get it:
>
> ```
> ./configure --enable-code-coverage && make check-code-coverage
> ```
>
> > https://github.com/openbmc/phosphor-mboxd.git  ERROR
>
> This is archived.
>
> ...
>
> > https://github.com/openbmc/u-boot  NO
>
> This uses Kbuild as a build system. I notice openbmc/linux and openbmc/qe=
mu aren't included in the list.
>
> > https://github.com/openbmc/webui-vue.git  NO
> > https://github.com/openbmc/witherspoon-pfault-analysis.git  YES, COVERA=
GE
> > https://github.com/openbmc/x86-power-control.git  NO
> > *************************UNIT TEST COVERAGE
> > REPORT*************************
> > SUMMARY:
> > TOTAL REPOSITORIES : 110
> > TESTED REPOSITORIES : 43
> > ERROR : 11
> > COVERAGE REPORT : 12
> > UNIT TEST REPORT : 31
> > NO REPORT : 56
> > ***********************************************************************=
****
> > Following actions, we can draw from above
> >
> >  1. *There are 12 repo's that have GCOV/LCOV plugged in* - We need to
> > maintain which has good coverage and try to improve those which has
> > less coverage
> >  2. *There are 31 repo's that have unit test cases added but no
> > coverage analysis because they aren't plugged in yet to GCOV/LCOV* - Is
> > there a plan for plugging in GCOV
>
> As above at least three of these are false-negatives for test coverage.
>
> Andrew
>
>
>
>
