Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173CBD32C
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 21:56:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dBlj5kk9zDqTK
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:56:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ADYyH0Wl"; 
 dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBYb1TF8zDqZx
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:47:44 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id u28so2337228lfc.5
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tT0pmxtV619V7Db7Fy/xwhFOtOKHsB42ZwdLIUcRJ3A=;
 b=ADYyH0Wld1bqDYGbEBSMHx8r0RV2Q19ySQkfM85BgmDlj3M9db2SuyuYE0jUWcMWF5
 RCO+PCRomjMaj1jP1glnQkIy2lv/WO3mmMMRavPfGQboRUn5XFm5n6Tt7w19tL9Mw6hy
 oMSloxaqCffFoL1vRsjN5tVxhP9CnAJu5PN4cx9bZNNS5JHFqxzDm5OKZu9zbziA74qe
 z26HlPes5Zkks8wAqAieFsH1WqVWBJe3P1r0O7crDe/YMbdex93TyZ9PCVnzODEZOoSP
 pRrlMtqy/cI84hcdoZz/919twbei2Ez+oCN5a1bwl6Ew9rHlxN/3EnCUF/zJNq0vRs9j
 zpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tT0pmxtV619V7Db7Fy/xwhFOtOKHsB42ZwdLIUcRJ3A=;
 b=VfiARoL3MeEJK3r43ZmzeRbFzEhpr8APOzOSZWOztPwJFLjls+rv0S6tQWDVgdguHe
 4/PbAB5ER2lJwk2WkljZ0AGdl+WtFTnWLQgMdlaNX0YGWt5MrnfWhoEfNm8YVCXfUIZd
 WcPWKIyam7YURPDLr6p8VvkpHiA+qok5sfNy6pJpoBdEi54zQ0/0dji+ucT3kyi7UksR
 WIL9586Pb6NcpWi735Yd3fV8zxTIcCi3z7dr0pX7TIBcTUKyrUsX4DVxXPjm1w6CpK14
 H8R7RqIJbK+1WLiHPB7ISgtDx/MD0IATL6poRNfc0F73n25V/w0BPdJztPtTMgu7xijW
 rNaw==
X-Gm-Message-State: APjAAAVP56HMWI4ijH8oerlNKh1cqU/pG8pJjVXhoLfyhk9DEECIxR+B
 3xCT926NlQ2ySkVfpTSSBpEI/T0G4Z+aFoOaTwTkZw==
X-Google-Smtp-Source: APXvYqxtIhKphSm3iOSEHgvhWD5oG+uGUMM/7/6TsLQk2WAurLmUuoyiP/bWSzyKkhJPYXon+g/6Xq+GqRlpjTFahO4=
X-Received: by 2002:a19:a408:: with SMTP id q8mr2904587lfc.94.1569354459560;
 Tue, 24 Sep 2019 12:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
 <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
 <49a51252.bd96.16d632cf2be.Coremail.xiaoqian1641@163.com>
In-Reply-To: <49a51252.bd96.16d632cf2be.Coremail.xiaoqian1641@163.com>
From: William Kennington <wak@google.com>
Date: Tue, 24 Sep 2019 12:47:28 -0700
Message-ID: <CAPnigK=YTuEese1LcdLE=wKEYHAEDWcyci59hiQAWyM=6vgvGg@mail.gmail.com>
Subject: Re: sdbusplus make check error
To: =?UTF-8?B?5bi45pmT5piO?= <xiaoqian1641@163.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

You might not have a session DBus that satisfies the needs of the test
suite. I recommend running it in the docker container.

On Tue, Sep 24, 2019 at 5:13 AM =E5=B8=B8=E6=99=93=E6=98=8E <xiaoqian1641@1=
63.com> wrote:
>
> Hi=EF=BC=8CAll,
>
> I'm running tests in SDK . In sdbusplus, follow the steps:
>
> ./bootstrap.sh
> ./configure ${CONFIGURE_FLAGS} --enable-oe-sdk
> make check
>
> when "make check", It shows next , I don't konw what went wrong, and how =
to fix it?
>
> make[3]: Leaving directory `/home/root1/sdbusplus/test'
> make  check-TESTS
> make[3]: Entering directory `/home/root1/sdbusplus/test'
> make[4]: Entering directory `/home/root1/sdbusplus/test'
> FAIL: bus_list_names
> FAIL: bus_match
> FAIL: exception_sdbus_error
> FAIL: message_append
> FAIL: message_read
> FAIL: message_native_types
> FAIL: message_types
> FAIL: utility_tuple_to_array
> FAIL: utility_type_traits
> FAIL: vtable_vtable
> FAIL: timer
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> Testsuite summary for sdbusplus 1.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> # TOTAL: 11
> # PASS:  0
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  11
> # XPASS: 0
> # ERROR: 0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> See test/test-suite.log
> Please report to https://github.com/openbmc/sdbusplus/issues
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> make[4]: *** [test-suite.log] Error 1
> make[4]: Leaving directory `/home/root1/sdbusplus/test'
> make[3]: *** [check-TESTS] Error 2
> make[3]: Leaving directory `/home/root1/sdbusplus/test'
> make[2]: *** [check-am] Error 2
> make[2]: Target `check' not remade because of errors.
> make[2]: Leaving directory `/home/root1/sdbusplus/test'
> make[1]: *** [check-recursive] Error 1
> make[1]: Target `check' not remade because of errors.
> make[1]: Leaving directory `/home/root1/sdbusplus'
> make: [check-code-coverage] Error 2 (ignored)
> make[1]: Entering directory `/home/root1/sdbusplus'
>   LCOV   --capture sdbusplus-1.0-coverage.info
> geninfo: ERROR: no .gcda files found in .!
> make[1]: *** [code-coverage-capture] Error 255
> make[1]: Leaving directory `/home/root1/sdbusplus'
> make: *** [check-code-coverage] Error 2
>
>
> Johny
> Thanks
>
>
>
>
>
>
>
>
>
>
>
