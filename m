Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 229DE2976DC
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 20:23:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHszf5WlZzDqMG
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 05:23:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=pfNfa3ha; dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHsys3CtSzDr39
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 05:22:27 +1100 (AEDT)
Received: by mail-il1-x133.google.com with SMTP id p10so2303481ile.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LsJoQNzAkY5zwOucQ5aAg+H7RsrPyVP3dAGNr0RKAGE=;
 b=pfNfa3ha67vlzWsVSmqsADJ/3lB3qhSA2Cspsu73q8EtTq7FTqQDYMQrT2mnn4aewi
 2g2VA8UMsrpX9ePK3jqBU8TkISzDiMEaIGkKIGeiSkQfwM0FoJnHP89mklXs8Pfyja/T
 ZE0xp5in1Sq73DMQLxQcOj0vuegkFduAPzSyHHIGtwJRqpZtW2KBOeYn8HxNeX9IHrQ5
 J5XRGYNNrXmKjwUeAoMWaehbUixoCFtF7md+bXfpCqSMZQVG8A2kBKVTKCbUE0cG1s6b
 6xeWbiFMWptcj4JIkDI2XhjIniK/uigA7P2OvBeSCdfBfuYOfwLp7Q0dR8mAANF/vWJK
 RIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LsJoQNzAkY5zwOucQ5aAg+H7RsrPyVP3dAGNr0RKAGE=;
 b=bMUSalhIbz3yCTh06zrIbACtNnOcoKU0cQn7PLANkaeqRB/8CuSuCnPW7ZpoXUGR2t
 hyjMky1SlP4hI/ZAr9P7hIDZE/jWEvEV42eHta+VzAYdmYo91WqXjUL/sd44Tay7x9Pu
 RHjUsfn4U9Bc5zDXrrKo9n4y/vZF9yl4rgnoBD7gIDGXVAfG1QK9i74rxjkJTQpYrREm
 eLUr1tZqMM04jqpWXiJxzGG5dXrLGPrSipKJpBF4aSNwOk+sb9ycATKzfhLOsx23EUba
 gBfOA9eKSz0uoi6liSaOCK6oo3CqEoaknABpb4JHgdRvUi6SddhZ633Z49j7Fmu9YM4x
 MTOA==
X-Gm-Message-State: AOAM532KVu81skki/dYAkq+Y/q4ojPEqzeMTb8xlUjSARL2QvUmO141u
 FLNvpgC8DluAylogyFsSz32PdPGmu1Pl8G+1DYulSXoA5ViIxylR
X-Google-Smtp-Source: ABdhPJyWhpWFEh1R1m4M35nKoPC24gAvPGsLuDY7veftD2gJtC5gRHqOGa38Vj0aPCckeIba1WuBDmm8+btFANAHO4Y=
X-Received: by 2002:a05:6e02:4aa:: with SMTP id
 e10mr2570329ils.58.1603477342964; 
 Fri, 23 Oct 2020 11:22:22 -0700 (PDT)
MIME-Version: 1.0
From: Anton Kachalov <rnouse@google.com>
Date: Fri, 23 Oct 2020 20:22:12 +0200
Message-ID: <CADVsX8_pFwe-Zef0fpNfZFL3s9fiJrvRFAfwjZNt911hUq341Q@mail.gmail.com>
Subject: Current master is broken
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000007057b105b25aa9b6"
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

--0000000000007057b105b25aa9b6
Content-Type: text/plain; charset="UTF-8"

The recent commit af5e4ef732faedf66c6dc1756432e9de2ac72988 broke the build:

https://pastebin.com/5tTYHd68

The do_package() step tries to chown the base-files/3.0.14-r89/package/usr
directory to 0:0 uid/gid

I've tried to remove build/tmp and re-run several times. Fails with the
same error. If I use the previous commit
(36fe5df200a94e3ce82ba2dcad16c0a4127f6d46) it builds without any issues.

--0000000000007057b105b25aa9b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The recent commit=C2=A0af5e4ef732faedf66c6dc1756432e9de2ac=
72988 broke the build:<div><br></div><div><a href=3D"https://pastebin.com/5=
tTYHd68">https://pastebin.com/5tTYHd68</a><br></div><div><br></div><div>The=
 do_package() step tries to chown the=C2=A0base-files/3.0.14-r89/package/us=
r directory to 0:0 uid/gid</div><div><br></div><div>I&#39;ve tried to remov=
e build/tmp and re-run several times. Fails with the same error. If I use t=
he previous commit (36fe5df200a94e3ce82ba2dcad16c0a4127f6d46) it builds wit=
hout any issues.</div></div>

--0000000000007057b105b25aa9b6--
