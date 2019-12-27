Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE1112B22B
	for <lists+openbmc@lfdr.de>; Fri, 27 Dec 2019 07:56:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47kd0H0WBMzDqGt
	for <lists+openbmc@lfdr.de>; Fri, 27 Dec 2019 17:56:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=akashgj91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OllicQu4"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47kczb4dBSzDqFB
 for <openbmc@lists.ozlabs.org>; Fri, 27 Dec 2019 17:55:52 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id r27so35212673otc.8
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 22:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pMASe6GbqBMeUL7HEHkldVEin9T4CVrF8kJ7kKJ27CQ=;
 b=OllicQu4ouVqEMYzmYmztrEDeXGWGngviU+n6sqtusd0u3UCEdxaPkcliIqR8DzQSD
 Wood0UxPkrFqKOAs/tF3piSHRkMjHoNhilmqwrPuy/XdWUKZL6XhrlwbRnTqzfptF+ai
 VeQ2A6iNUV0hFVbPPjiamLADQ4F7OaLUYM0FUk9Pm03u97kdu5ox2ua0hv3T8X4xeab0
 B2hRQkgEyasoDC3JhGqDPYSQlh27CJfhf69AlMTwDbuQ7d+/BfRWAK5HzIyNRxL4jfcX
 vucKLAIJvGGM2BGUKTq3PjsrqiK5mpd2NLb3Sj6GP0+yP4VsO3L6wuFJtiwsbocx7G4n
 cGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pMASe6GbqBMeUL7HEHkldVEin9T4CVrF8kJ7kKJ27CQ=;
 b=nkwfBdJndGqrQ+nnk+s85lLBSRuAS9aUhrIhkVdWS83iS0wjaTJsM7NghXrPvqmrBv
 BQrpD7K9eUzwQx6e//9yXEtHyQKdk545CkZ1TbGeNNC1UFCo4eI4nFn05An2LwdSwdCr
 1ddF4gsSoNuoU5YcD0N22DTlTlShXVZuhBM9awwFxrDiQ3GWEjBnSyYSWAjnvTOWU0PP
 c0h1DVn/JSDGuyfhPaPDTh3KuebEcDClecDrrgWJP2w5IeTycReD3wLHmmNEOo3xyn4L
 uPWA2tRJ1Qvg86A94u15+BSpOH42k/0GXp8WiBUzaUFRxSNKOC7UhijuWy+PyDLFWt48
 Gxeg==
X-Gm-Message-State: APjAAAVJuk9F6Y+95eIhQefdVRApY8pbGU4a9Exh2X5UNADmO2ELAxTf
 xtXMZIJvkiwamqDC0sKUdSCQC3bV+tHjDjHBz3Ttd3x7xSI=
X-Google-Smtp-Source: APXvYqztIBOvg7JXp8xMo9Hym3ZGvdW2odqZDlTRb644G/9+RRpT8W1cwXsHRPwFn8+pmxDFcZojyMKp3BD6qavXqNg=
X-Received: by 2002:a05:6830:1d59:: with SMTP id
 p25mr57042734oth.308.1577429748988; 
 Thu, 26 Dec 2019 22:55:48 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 27 Dec 2019 12:24:28 +0530
Message-ID: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
Subject: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d8bc8f059aa9fb6f"
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

--000000000000d8bc8f059aa9fb6f
Content-Type: text/plain; charset="UTF-8"

Hi all,

We are using BMC Aspeed AST-2500 in our motherboard with OpenBMC firmware.
'obmc-console' is used to get host messages over BMC. obmc-console.conf
looks like




*lpc-address = 0x3f8sirq = 4local-tty = ttyS4local-tty-baud = 115200*

BIOS serial redirection is enabled over COM port 0 (*0x3f8, sirq=4,
baudrate=115200*) for super-IO.

we set */dev/ttyS0* in CentOS to work in polling mode by making its *irq=0*
using the following command

$ setserial /dev/ttyS0 uart 16550a irq 0

Now we are getting CentOS login prompt on SOL.

When we change /dev/ttyS0 back to interrupt mode with irq=4, we are not
getting login prompt on SOL.

Whether anything is required to be done in OpenBMC firmware/BIOS to enable
irq mode for SOL ?



Thanks,

Akash

--000000000000d8bc8f059aa9fb6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font size=3D"2"><span style=3D"font-family:arial,san=
s-serif">Hi all,</span></font></div><div><font size=3D"2"><span style=3D"fo=
nt-family:arial,sans-serif"><br></span></font></div><div><font size=3D"2"><=
span style=3D"font-family:arial,sans-serif">We are using BMC Aspeed AST-250=
0 in our motherboard with OpenBMC=20
firmware. &#39;obmc-console&#39; is used to get host messages over BMC.=20
obmc-console.conf looks like <br><br><span style=3D"color:rgb(0,0,255)"><i>=
lpc-address =3D 0x3f8<br>sirq =3D 4<br>local-tty =3D ttyS4<br>local-tty-bau=
d =3D 115200</i></span></span></font></div><div><font size=3D"2"><span styl=
e=3D"font-family:arial,sans-serif"><i><br></i></span></font></div><div><fon=
t size=3D"2"><span style=3D"font-family:arial,sans-serif">BIOS serial redir=
ection is enabled over COM port 0 (<i>0x3f8, sirq=3D4, baudrate=3D115200</i=
>) for super-IO.</span></font></div><div><font size=3D"2"><span style=3D"fo=
nt-family:arial,sans-serif"><i><br></i></span></font></div><div><div><font =
size=3D"2"><span style=3D"font-family:arial,sans-serif">we set <i>/dev/ttyS=
0</i> in CentOS to work in polling mode by making its <i>irq=3D0</i> using =
the following command <br></span></font></div><div><font size=3D"2"><span s=
tyle=3D"font-family:arial,sans-serif"><br></span></font></div><font size=3D=
"2"><span style=3D"font-family:arial,sans-serif"> <span style=3D"color:rgb(=
0,0,255)">$ setserial /dev/ttyS0 uart 16550a irq 0 </span><br> <br> Now we =
are getting CentOS login prompt on SOL. <br> <br></span></font><div><font s=
ize=3D"2"><span style=3D"font-family:arial,sans-serif"> When we change /dev=
/ttyS0 back to interrupt mode with irq=3D4, we are not getting login prompt=
 on SOL.<br></span></font></div><div><font size=3D"2"><span style=3D"font-f=
amily:arial,sans-serif"><br></span></font></div><div><font size=3D"2"><span=
 style=3D"font-family:arial,sans-serif"><span style=3D"font-family:&quot;Ti=
mes&quot;,&quot;serif&quot;"><span style=3D"font-family:arial,sans-serif">W=
hether anything is required to be done in OpenBMC firmware/BIOS to enable i=
rq mode for SOL</span> ?<br></span></span></font></div><div><font size=3D"2=
"><span style=3D"font-family:arial,sans-serif"><br></span></font></div><div=
><font size=3D"2"><span style=3D"font-family:arial,sans-serif"><br></span><=
/font></div><div><font size=3D"2"><span style=3D"font-family:arial,sans-ser=
if"><br></span></font></div><div><font size=3D"2"><span style=3D"font-famil=
y:arial,sans-serif">Thanks,</span></font></div><div><font size=3D"2"><span =
style=3D"font-family:arial,sans-serif"><br></span></font></div><div><span s=
tyle=3D"font-family:&quot;Times&quot;,&quot;serif&quot;"><font size=3D"2"><=
span style=3D"font-family:arial,sans-serif">Akash</span></font><br></span><=
/div></div></div>

--000000000000d8bc8f059aa9fb6f--
