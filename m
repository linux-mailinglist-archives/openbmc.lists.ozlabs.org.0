Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D518113D225
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 03:24:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yp1c4YwkzDqW6
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 13:24:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=krellan@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gZcWA7ey; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynf31l9HzDqVJ
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 13:07:54 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id f15so14277734lfl.13
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 18:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IFWGR1NMWYINJuBZHrmgb0HfZLRyNyzaw9S0+x++2lI=;
 b=gZcWA7ey70z89c+3OVHuYjAgUJBm3DK3tWn9MF8FqytNrB2hNrOB9cwQtjUZB/D/8H
 zSuxV0B9gB4Q4m07+bOmZJrCxUD1a+6GwMoOS8p1742fd+m8e5n6s1FKFoKFyOp4zZUj
 gO9QpplRNkOIG5YAWcte3tnZ7PwNnmpLjz9bg3nEtxop6TU+K/t6VQ0bu7/s5Q/joFYe
 Ar95AsI4SoLs2TFL+8fbv6b0T2xbFExO3VlO+mvErUbIteQVk4CC4NSDS5d32xbIhbBc
 1gyzoSytUvv6ZzHslV7I/zxAC6w5p1Sr82P6VY9dX2so+V1U1ju0OCW1fDvgI1XRQOJP
 kRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IFWGR1NMWYINJuBZHrmgb0HfZLRyNyzaw9S0+x++2lI=;
 b=t4JUMdFBcIkNcNx7pI+vjB8B7hNJvNShYvNoS0zjJ+fDePurKW+wbzLONoYWRyIhPV
 szfhMhqOelDhwgdLaMD1IfJE970Aa2nWWnRO93pRyzn8zAQ96MWc8PvWUIZsjZrLLcja
 RG5Y+oieIDp3t+Lap2gZ9BO3RHRZk5cbpQOZNWzX4G+IFY6psbWKYI6bvYFWbOTU7C2r
 0IX8DdgykLZ9zDrTb5oOwFTjaulG6J88uMawQ1lRc8VOBuUCDP0H+xaQCHEEUPS5P7eF
 e3KLs5yN00qB0ywWDmetHo9k7073EudY0gL+mSqg9HWx41KcuJC6qyNnoQ39iwdiRYDo
 M0bg==
X-Gm-Message-State: APjAAAVB97VAaoJdxm+gRXmHp0vMV2yotppGsi3gOFi26uc6s0Dfa5S/
 JWmuUlVdAfx0QGKrtUAxxBuUrd9XUHo7S4KM1nojUWf7L4Y=
X-Google-Smtp-Source: APXvYqwx0Ytt7zcQzKz4ZATOln0gm/FfMRcugGAEZyvH5u/IDixGKQmDIfW5AGEU3DzoWjdYP+JsMkge+wrVhk/O4+8=
X-Received: by 2002:ac2:5dc7:: with SMTP id x7mr987171lfq.24.1579140057379;
 Wed, 15 Jan 2020 18:00:57 -0800 (PST)
MIME-Version: 1.0
From: Josh Lehan <krellan@google.com>
Date: Wed, 15 Jan 2020 18:00:41 -0800
Message-ID: <CANPkJS9ggqARodBg+dhUEBBXKXANFJ=bJEDEyTmPQbVF=oLOkA@mail.gmail.com>
Subject: Change 27956 dbus-sensors PSUSensor appears to break Entity ID
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, mutyalax.jayaprakash@intel.com
Content-Type: multipart/alternative; boundary="0000000000002c1c61059c3832ef"
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
Cc: Peter Lundgren <peterlundgren@google.com>, Alex Qiu <xqiu@google.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002c1c61059c3832ef
Content-Type: text/plain; charset="UTF-8"

Hello there.

A recent change to dbus-sensors, 27956 on Gerrit, appears to have
introduced a difference which breaks the Entity ID field.

Alex Qiu has written what the symptom is, and I traced through the code.
Both findings are written as comments, to that change on Gerrit.

I'm open to suggestions on how to resolve this. There are probably many
people using the PSUSensor program in different ways.

I am curious as to the behavior Intel was seeing in their project. There
must be a difference in the way we are using the PSUSensor program, in
which the way we're using it sees this as a breakage, but Intel sees this
as a fix. Any details that can be provided?

Thanks!
Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941

--0000000000002c1c61059c3832ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello there.<div><br></div><div>A recent change to dbus-se=
nsors, 27956 on Gerrit, appears to have introduced a difference which break=
s the Entity ID field.</div><div><br></div><div>Alex Qiu has written what t=
he symptom is, and I traced through the code. Both findings are written as =
comments, to that change on Gerrit.</div><div><br></div><div>I&#39;m open t=
o suggestions on how to resolve this. There are probably many people using =
the PSUSensor program in different ways.</div><div><br></div><div>I am curi=
ous as to the behavior Intel was seeing in their project. There must be a d=
ifference in the way we are using the PSUSensor program, in which the way w=
e&#39;re using it sees this as a breakage, but Intel sees this as a fix. An=
y details that can be provided?</div><div><br></div><div>Thanks!</div><div>=
Josh</div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div style=3D"line-height:1.5em;padding-top:10px;margin-top:10px;color:rg=
b(85,85,85);font-family:sans-serif"><span style=3D"border-width:2px 0px 0px=
;border-style:solid;border-color:rgb(213,15,37);padding-top:2px;margin-top:=
2px">Josh Lehan=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border=
-style:solid;border-color:rgb(51,105,232);padding-top:2px;margin-top:2px">=
=C2=A0Software Engineer=C2=A0|</span><span style=3D"border-width:2px 0px 0p=
x;border-style:solid;border-color:rgb(0,153,57);padding-top:2px;margin-top:=
2px">=C2=A0<a href=3D"mailto:krellan@google.com" target=3D"_blank">krellan@=
google.com</a>=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-=
style:solid;border-color:rgb(238,178,17);padding-top:2px;margin-top:2px">=
=C2=A0+1 650-733-8941</span></div><br></div></div></div></div></div></div><=
/div>

--0000000000002c1c61059c3832ef--
