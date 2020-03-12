Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B2183C80
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 23:30:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dk6T0yC0zDqJC
	for <lists+openbmc@lfdr.de>; Fri, 13 Mar 2020 09:30:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=ryanarnellibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EsAevCN3; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dk4n1vYfzDqG1
 for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2020 09:28:35 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id u12so8393287ljo.2
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 15:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1pJmPzn1wGOmXkhjv5vcTDOb88CZb3oNCos/01yLpa0=;
 b=EsAevCN3gwod66HfFigYNWRa1uYGCwD7z+lAhhMW6zXjqXocQLKnw+q1ev7AUFfwXn
 xX7Qbgl5t6dnJpZ4WU8KSkLGSu8Qum+ygt3w5omgrcnHOXYTtrW/52JEqKgiqDYFnb/c
 NAze18AoOQcGG6UXSfnNFP8le77rkWs1lrQQMOCnvmXhNgJFUZudNA+G+89X/eubS37w
 MtIV9BucUmk6ZBdTik6sRrvTXDRJs25mBzWoTTkuw4A9RuujFIMqbWeL4VHYY0KjmJdQ
 9sD/mCGXswwzbt4NfM2kkw4lPkysqD9OXu0m2SzS0pgNzx09sTQjkEZnk/aqd4yTdv8l
 fqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1pJmPzn1wGOmXkhjv5vcTDOb88CZb3oNCos/01yLpa0=;
 b=q6XOmT7/KVWI5iOoZshhIfzhvwsSsDlWQeiByraQZePxIRMwJDPJCVKvc/3WNNVcCP
 JVI/FFKPtJWVcL3BJQ4Fs2WXaRgz9EQqq+5gaOBdkW9Z18Q7DXiGt1sBkE9awDhOg8kQ
 G3WCK70GlSw4QCxjeSIBxLC0GXnLqYK/4AN8zAbEokRbXWdlDWWv4Wh+J0MqW1wJV0ea
 5PZqHN732kXOhGFkVolu/dQjG7o52GaX+oVnG6+0CqnmxzpROYIXbCoMxPhHkc1B24Qy
 sDDZ4fQnph2+CuBsgoKoA4S5MD3mck7pXTt58tAJXwetSDL0kiJ2upXBaeWRzmGwJKSs
 LmVw==
X-Gm-Message-State: ANhLgQ0n8u+LbeYBKxkYdMd+J/pRbrLuBwZaECtog1J2cscCTA9Jaexn
 KjiwGN0oUGMfG/dgNlg04bvkKwiXSRq+nj1N5iR5xWJA
X-Google-Smtp-Source: ADFU+vtDm+wLLkr9KSrBOM7qF7x/STRJ1ddwB+0hbKlm75ytDxTzpOInrlcXAxyY1XELHHGt8MflJmnUfpdHmEsXSbQ=
X-Received: by 2002:a2e:9bc8:: with SMTP id w8mr6234396ljj.227.1584052110713; 
 Thu, 12 Mar 2020 15:28:30 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Arnell <ryanarnellibm@gmail.com>
Date: Thu, 12 Mar 2020 17:28:20 -0500
Message-ID: <CAH3qHna+U+VcKCKxgMkA0-JSBi0yaSzt_6uCZqLsnFZgumupXw@mail.gmail.com>
Subject: OpenBMC GUI: Date and time settings
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000005d73cd05a0afdf2e"
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

--0000000000005d73cd05a0afdf2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,
Here are the UI design proposals for date and time on the 'Date and time
setting' page under 'Configuration'.

Users would interact with these designs when:
- Checking the BMC=E2=80=99s current time
- Correcting time drift
- Adding an NTP server

*Prototype:*
https://ibm.invisionapp.com/share/Q6NZ13M3A5B#/319420720_01-Date-And-Time-S=
ettings-02
*GitHub story:* https://github.com/openbmc/webui-vue/issues/3

As a reminder, these mockups are static images with clickable hotspots to
indicate the intended path. You can also use your right and left arrows to
navigate through the flow.

To comment you can either:
- Add comment within the Github story (preferred)
- Click on the bottom-right of the Invision prototype and select comment
Thanks in advance for your feedback!

*Ryan Arnell    *
UX Engineer | IBM Design | IBM Studios Austin

--0000000000005d73cd05a0afdf2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br>Here are the UI design proposals for date an=
d time on the &#39;Date and time setting&#39; page under &#39;Configuration=
&#39;.<br><br>Users would interact with these designs when:<br>- Checking t=
he BMC=E2=80=99s current time<br>- Correcting time drift<br>- Adding an NTP=
 server<br><br><b>Prototype:</b> <a href=3D"https://ibm.invisionapp.com/sha=
re/Q6NZ13M3A5B#/319420720_01-Date-And-Time-Settings-02">https://ibm.invisio=
napp.com/share/Q6NZ13M3A5B#/319420720_01-Date-And-Time-Settings-02</a><br><=
b>GitHub story:</b> <a href=3D"https://github.com/openbmc/webui-vue/issues/=
3">https://github.com/openbmc/webui-vue/issues/3</a><br><br>As a reminder, =
these mockups are static images with clickable hotspots to indicate the int=
ended path. You can also use your right and left arrows to navigate through=
 the flow.<br><br>To comment you can either:<br>- Add comment within the Gi=
thub story (preferred)<br>- Click on the bottom-right of the Invision proto=
type and select comment<div class=3D"gmail-" style=3D""><div id=3D"gmail-:m=
r" class=3D"gmail-ii gmail-gt" style=3D"direction:ltr;margin:8px 0px 0px;pa=
dding:0px"><div id=3D"gmail-:mq" class=3D"gmail-a3s gmail-aXjCH" style=3D"o=
verflow:hidden;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;line-height:1.5"><div dir=3D"ltr" style=3D"font-family:A=
rial,Helvetica,sans-serif;font-size:small">Thanks in advance for your feedb=
ack!<br></div><br><b>Ryan Arnell =C2=A0 =C2=A0</b> =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>UX Engineer | IBM Design | IBM Studios Austin</div></d=
iv></div></div>

--0000000000005d73cd05a0afdf2e--
