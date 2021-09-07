Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81514402E84
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 20:46:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3vPV301Kz2yJj
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 04:46:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BDjzOzoB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=johnwedig@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=BDjzOzoB; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3vP43BFgz2xYL
 for <openbmc@lists.ozlabs.org>; Wed,  8 Sep 2021 04:46:14 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id q3so14234515iot.3
 for <openbmc@lists.ozlabs.org>; Tue, 07 Sep 2021 11:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=XB9doDq+YPFLrhfmlvy8ZgtfKobw7s1CSd++l8IV+6M=;
 b=BDjzOzoB7GqJr72yeVoKRyzmQXkW8eH9NwGeH0OyBUX5SXa430ATBrOrMz3KhYeYxt
 kgshRAQFDvSanp/EGZlyQ6qSS58NZPHcbYME6HZbanLbWfTCcCk2DKFVu8N9dpge4J/j
 WrO91kW5OVGrWVyxu/NLiVXKprP+TmF+U5CvgzDIcIRV7DOo/olQkztD9Q+v0gKPgsSY
 JxVAhlZKHY6DUiLRtjEY4g7iy4qlH8nzLfECo9lgWApP1iAukBHjIb2pR7rH/W6zwcMQ
 NT9R6y6gCw0R1U80FueoUyds4BcssqZFi6TitFs47Oamf3W+gk5OX1jNvhsgmFE4jwxS
 CRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XB9doDq+YPFLrhfmlvy8ZgtfKobw7s1CSd++l8IV+6M=;
 b=oZm/UGGZj93RmbDFMVVTDHy4d23nuVU49v7i7XUDfy191oeVAqQ0im/+YcRb4hDz0z
 r2xIHjpK9b3YVnWRyKm5bJSjyeGe5jjdKO2u96ZJETI06HuQtKgcDBcuN8ODTq6Pu5zN
 s5beibyhj68sZ9c3x77KPC6tldqKvn7AnzTcK47i3nlbVVEqNjgXavD9Tx5LR0LJ0aJ8
 JjbpDjv+kaRtKd2//EVGGce+lBnJSmrS859Nx/F6X4RdIGetraNutl2svewQWOu76YVt
 HoBdm2oqSN2lJ67eIqWKxtvyynZq9zO8TwMcw8q9Vg6IMrnQpQBDw/AllvPQr8jGzgOT
 hy1w==
X-Gm-Message-State: AOAM532qRw6cfqJ0o2mLuRXqPxOhBQckHcgETITw37ool//pYegeZ/kL
 u+5vMzfdUQ7kqs6yjJS3Oow8IllTwlGXkJ1T1NjaVoJ11t4MvQ==
X-Google-Smtp-Source: ABdhPJxIapUWaAwHwrdUP7JwXU9IhiTxVkuHM8hXNo7k3fLo/SQwaLvEAGuNlCjeJZaAAcACh037Jr9lRjv/TIc5UP0=
X-Received: by 2002:a02:1dc9:: with SMTP id 192mr17097482jaj.92.1631040369194; 
 Tue, 07 Sep 2021 11:46:09 -0700 (PDT)
MIME-Version: 1.0
From: John Wedig <johnwedig@google.com>
Date: Tue, 7 Sep 2021 11:45:53 -0700
Message-ID: <CACejXs+ZrNNbB4b-oMe_Yh1zoxaEWjyLNcVoRDuMKskdF22Qmg@mail.gmail.com>
Subject: Design proposal: Encrypted storage management daemon
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d2597105cb6c2df6"
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

--000000000000d2597105cb6c2df6
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I have a new design proposal that I'm looking for feedback on:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573

It's a new daemon that will manage an encrypted eMMC device. The idea is to
encapsulate the security functionality and represent the encrypted eMMC as
an object on D-Bus, which would have the following methods:

   - Create a new encrypted filesystem on the device
   - Wipe the device
   - Lock
   - Unlock
   - Change the password

If you have any input or questions, please let me know.

Thank you,
John

--000000000000d2597105cb6c2df6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>I have a new design propos=
al that I&#39;m looking for feedback on:=C2=A0<a href=3D"https://gerrit.ope=
nbmc-project.xyz/c/openbmc/docs/+/46573">https://gerrit.openbmc-project.xyz=
/c/openbmc/docs/+/46573</a></div><div><br></div><div>It&#39;s a new daemon =
that will=C2=A0manage an encrypted eMMC device. The idea is to encapsulate =
the security functionality and represent the encrypted eMMC as an object on=
 D-Bus, which would have the following methods:</div><div><ul><li>Create a =
new encrypted filesystem on the device</li><li>Wipe the device</li><li>Lock=
</li><li>Unlock</li><li>Change the password</li></ul><div>If you have any i=
nput or questions, please let me know.</div></div><div><br></div><div>Thank=
=C2=A0you,</div><div>John</div><div><br></div></div>

--000000000000d2597105cb6c2df6--
