Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18010248DCC
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 20:16:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJyJ6yR7zDqbv
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 04:16:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::632;
 helo=mail-ej1-x632.google.com; envelope-from=pparth@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=WpOPQN3w; dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHrd1V8dzDqZX
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 03:26:18 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id bo3so22989850ejb.11
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 10:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uq2h3ZaM54uahW88JHOGoefuOeEkH6Wc3jrfveoYx/M=;
 b=WpOPQN3w5uvrkKSfz4YNzwCjVbwhulcSEocITEh2f3CD9BVrvROR5zFJSpR9G6xME/
 8ojhVJ+mKUc8iC5YhFI0fMD1PsNv4/fAz7xhLr5yxjaPzZjm3/PJ8hFWEAnLfCacYr7d
 nM9QffhI8PXe2CRaS34CH58E/4/zSwVmhIBVRgtySOagKzWqaLmpY+WUIbmUKoH6Cki6
 T0B+xzxsk8rZ9VypZn/pdEE8jatkXoF6mlARhuscAIY8zmmPxL7mopP/afz5ZNmJ3c0Y
 Eyz0OY5liHy2iEvsMTLtUnS5cK/esqZMqytq4cmmUamZHevoY07bFKsIZT25dW072O2s
 7twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uq2h3ZaM54uahW88JHOGoefuOeEkH6Wc3jrfveoYx/M=;
 b=q5wu4Gvcex6hVoBVezhAJNJ78RL247NIpL6BFs3CbP/2hA10Szi3H8U2wBYL1ktTtx
 8473c5m5zGY/SSR2Oqr6ohpODYK7H3Tk7AJopldwwACP7QoJYlFbiyGKihgHPyGP97lJ
 zUfb+HlQaQKk/q1DBC6FZPky/1+06ux8VHSj+rFhCzaehyhrNAxhFocPxzPf05SAYmdv
 Q2tAiH8blIXEJ8YtWAEXAyIgP6gtiz9lVQwepD95Pw7UJYapN1R758st7H+FG2CQJBGo
 sr4MOpiwqAQOtYf32MUDQAfdPMltPvA8zyoZI6lbmhPegrx/GK5vtXSnY3JjyDKT7NQB
 03YA==
X-Gm-Message-State: AOAM533TAF8TRJo0Cv2CgcYjOGxtj2OKUl9DO3pbYh63zmg+WwuOowQS
 lk609/+4jZHft0FBF/Y4n1LNVK2Etl8fGgCvbPEBybteMe+nTg==
X-Google-Smtp-Source: ABdhPJw26fqV/Hx6apBPpp9xSGjonvHwMHjLYBIoZWpbZSvLZPumySheH8n5UMm5751uyCaQoZywQ8JzT4L4oA8sneE=
X-Received: by 2002:a17:906:8050:: with SMTP id
 x16mr20817603ejw.441.1597771573587; 
 Tue, 18 Aug 2020 10:26:13 -0700 (PDT)
MIME-Version: 1.0
From: Parth Shukla <timevortex@google.com>
Date: Tue, 18 Aug 2020 19:25:36 +0200
Message-ID: <CAC1Cx+uU6LWYmWxCU_0vkPxw8NOdrLPeOXHzpdaQZhrPt7n3cQ@mail.gmail.com>
Subject: Security Working Group Meeting - Wed 19 August
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000013f17e05ad2a2fdb"
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

--00000000000013f17e05ad2a2fdb
Content-Type: text/plain; charset="UTF-8"

This is a reminder of the OpenBMC Security Working Group meeting scheduled
for this Wednesday August 19 at 10:00am PDT.

We'll discuss the following items on the agenda, and anything else that
comes up:

   1. Chris from Google will talk about GLOME:
   https://github.com/google/glome
   2. Gerrit code review: BMCWeb webUI login change:
   https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35457
   3. Gerrit code review: BMCWeb HTTP redirect to HTTPS:
   https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265

Access, agenda, and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group

Regards,
Parth

--00000000000013f17e05ad2a2fdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a reminder of the OpenBMC Security Working Group m=
eeting scheduled for this Wednesday August 19 at 10:00am PDT.<br><div><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><br></div><div dir=3D"ltr">We&#39;ll discuss the following i=
tems on the agenda, and anything else that comes up:</div><div><ol><li>Chri=
s from Google will talk about GLOME: <a href=3D"https://github.com/google/g=
lome">https://github.com/google/glome</a></li><li>Gerrit code review: BMCWe=
b webUI login change: <a href=3D"https://gerrit.openbmc-project.xyz/c/openb=
mc/bmcweb/+/35457">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35=
457</a> </li><li>Gerrit code review: BMCWeb HTTP redirect to HTTPS: <a href=
=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265">https://ge=
rrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35265</a>=C2=A0</li></ol></div>=
<div dir=3D"ltr">Access, agenda, and notes are in the wiki:<br><a href=3D"h=
ttps://github.com/openbmc/openbmc/wiki/Security-working-group" rel=3D"noref=
errer" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/Security-w=
orking-group</a><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Regar=
ds,<div>Parth</div></div></div></div></div>

--00000000000013f17e05ad2a2fdb--
