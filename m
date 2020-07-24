Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6522D202
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 01:00:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD4Rn4kYhzF1Yx
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 09:00:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QYiUzGaW; dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD4Qq081xzF1SM
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 08:59:42 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id t18so8550517ilh.2
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 15:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eU9bhq/2jIrNWR1RmRXTKnzYB0ItnYEB+sw0rBO7rB8=;
 b=QYiUzGaWUszwZmCBC5LKd84l0IO0BiVEbRfTWkzemwGgwDYxytxC6cP6k/8FBkrIwU
 mVKb6M/D6J2rlbzoGnDorXFiNgeaqAOoD9Quepg3cPFiENswBGZf//HcMynhzyhgrukx
 cAJmeo3hJWimEqwwu33zcKdoNxsjM7qWy97+qZehV8P5DT8h+snMULMWgN18AUzVBUX2
 5+nbeXEykSodnOotf77vX8f0gC4UpQ3zXWhdspzZ/e5TYpSjAgSgygT4zhV2Y5WgW9n5
 POvylJIQdvnNxfF+gn0Fu8WAi2Z5hADZRd16ucMidrwjlK0dSp74IH7VbtjA4ptvwOfV
 dG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eU9bhq/2jIrNWR1RmRXTKnzYB0ItnYEB+sw0rBO7rB8=;
 b=tecuIBJhpMD4LdkV+/OZA5V8G7EiKDqMbJnkq29PKpIzpx9WTdABPQgX2Qof7E9L8u
 u1jyslTRrx0EwyiYJ/tih2Fz2fN/bVjzm2I/ckJtNbst67PIjL0ZN+B5cExokkTugeHK
 XGrnpN7uOwZrLPBhOID+vSj+RqlkvwvnT7vbZeV3n27TsxFFp7wfQhHNcEAnfd1TmHPn
 JB2p1i2dhzOQYUsSnaZ8BwyquoeUD1jvqafrQ6S1q8H8yEGNPia9G5XAnisUulFTVvLA
 +QfQ2M80AHQ1g6AgDS1MZLTZXGIUfLonAh5kKvFELubeHj+qGNAr/uWHIF8kzAS03FxR
 rkuA==
X-Gm-Message-State: AOAM530HjTg2Nv8+r528Z1X3Mda+YuQc/5f5DM2shzrZQlpNlmWzVDfV
 BY2LLwixxV7wj0hA3JNbOM5s8wlsOzBVrCB6QAlBpYYcmLs=
X-Google-Smtp-Source: ABdhPJySvgJf81iuar7ke3rc7UGTvuBik2rutqeBaYHsy3O8LZL6qbTRbR1L9duXhvQV+l5nuG3O8BMRfyyDR2c0Tq4=
X-Received: by 2002:a92:6008:: with SMTP id u8mr12401592ilb.196.1595631578609; 
 Fri, 24 Jul 2020 15:59:38 -0700 (PDT)
MIME-Version: 1.0
From: Sui Chen <suichen6@gmail.com>
Date: Fri, 24 Jul 2020 15:59:27 -0700
Message-ID: <CAFaEeaE+xp89Q4dc0uS_-mdwy=ngb6-1XqnfdtTZ_1CW-GCE_A@mail.gmail.com>
Subject: [openbmc-tools] dbus-vis: DBus capture visualization tool
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000006f83e505ab37ed2c"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006f83e505ab37ed2c
Content-Type: text/plain; charset="UTF-8"

Hello,

dbus-vis is a GUI tool that does the following:
- It visualizes busctl pcap files, the same format that dbus-pcap reads and
parses.
- It somewhat half-automates the process of doing a capture on the BMC and
transferring back to the host for analysis (console access to the BMC is
required for this purpose.)

dbus-vis started from an IPMI timeline visualization tool that only
processes IPMI requests exposed on DBus. After I learned about dbus-pcap
<https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/dbus-pcap>,
it turns out DBus visualization is a natural extension to this
visualization tool. Because this tool currently accepts the same packet
capture format that dbus-pcap uses (by using a slightly modified version of
dbus-pcap), it kind of functions like a GUI version of dbus-pcap, and is
therefore named "dbus-vis" to indicate what it does.

The main difference between this tool and other existing dbus visualizers
(such as GNU bustle) is that dbus-vis shows data in a compact timeline
format, making it possible to show >10K events simultaneously on the screen
at an acceptable frame rate, as well as making it easier to focus on DBus
performance rather than the dependency of different DBus units (that other
existing tools seem to be focusing on.)

The changes for the first commit of dbus-vis is listed below; any comment
is greatly appreciated.
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/34263

Thanks!
Sui

--0000000000006f83e505ab37ed2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif"><div class=3D"gmail_d=
efault">Hello,</div><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_d=
efault"><br></div><div class=3D"gmail_default"><div class=3D"gmail_default"=
>dbus-vis is a GUI tool that does the following:</div><div class=3D"gmail_d=
efault">- It visualizes busctl pcap files, the same format that dbus-pcap r=
eads and parses.</div><div class=3D"gmail_default">- It somewhat half-autom=
ates the process of doing a capture on the BMC and transferring back to the=
 host for analysis (console access to the BMC is required for this purpose.=
)</div></div><div class=3D"gmail_default"><br></div><div class=3D"gmail_def=
ault">dbus-vis started from an IPMI timeline visualization tool that only p=
rocesses IPMI requests exposed on DBus. After I learned about=C2=A0<a href=
=3D"https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-script=
s/dbus-pcap">dbus-pcap</a>, it turns out DBus visualization is a natural ex=
tension to this visualization tool. Because this tool currently accepts the=
 same packet capture format that dbus-pcap uses (by using a slightly modifi=
ed version of dbus-pcap), it kind of functions like a GUI version of dbus-p=
cap, and is therefore named &quot;dbus-vis&quot; to indicate what it does.<=
/div><div class=3D"gmail_default"><br></div><div class=3D"gmail_default">Th=
e main difference between this tool and other existing dbus visualizers (su=
ch as GNU bustle) is that dbus-vis shows data in a compact timeline format,=
 making it possible to show &gt;10K events simultaneously on the screen at =
an acceptable frame rate, as well as making it easier to focus on DBus perf=
ormance rather than the dependency of different DBus units (that other exis=
ting tools seem to be focusing on.)</div><div class=3D"gmail_default"><br><=
/div><div class=3D"gmail_default">The changes for the first commit of dbus-=
vis is listed below; any comment is greatly appreciated.</div><div class=3D=
"gmail_default"><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/ope=
nbmc-tools/+/34263">https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-to=
ols/+/34263</a></div></div></div><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:arial,helvetica,sans-serif">Thanks!</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif">Sui</div></di=
v></div></div>

--0000000000006f83e505ab37ed2c--
