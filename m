Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48024A516
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 19:40:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWw6D6mnVzDqxf
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 03:40:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32;
 helo=mail-yb1-xb32.google.com; envelope-from=maxims@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CUK7Jnoh; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWw5P1YflzDqG6
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 03:39:30 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id m200so13764910ybf.10
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vMgEwm/I1M76GwZPqrbHV1Fs9F8hFf4rIv4S8Hv6gZ0=;
 b=CUK7JnohiDxW2HTRhiT6tbpwQQ5vkg65vR434PopbhhDNe383drupFas3eR98utDtA
 xC4RlepBhjnX6/1t0l2DXUiZn+3lWMs+NzL6Tx6pXmZuiyncXvXfNYZqz8Z6CJXHoSR4
 z6WtBMu1DABY81AgWQaLmmrXqI/R+Dg5wK3ritk+A1jnTAJPZVWDq6EJcKTUGzU5soPB
 WjpZctv+knDv5HIP3vYp0oONXMdJfXtGZKw/jiDt5UfbGZVB5wsGZRyc2J808F9q6gEz
 4IaOuO8kPMyYOsGW2lHRptcRXVicyJ+I0lMKJlvUSfb7eD4OgrxViiawDASCv1uujPUl
 wZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vMgEwm/I1M76GwZPqrbHV1Fs9F8hFf4rIv4S8Hv6gZ0=;
 b=Yr/rwUxfzzrlZVJCKgx8icH6qHesAIstvpPTRli6/BMDe+oDrCUP2gCJCUtDHsbqRH
 jzqq0pC/ItmM6Y9Aure1oyf20eJZgPtu+1CzJq9o2bekCH6P3BbbsdRgHv+S2+H49gcu
 ru+rr2OdKRJT2DBtuEBi9ePxQ5aZsFEZwzYx1EiZlJEmp8Y2eKpViIRLFI5lnfK65yRO
 2eoOx0IoZmBbC4AZCv6XeA5rx8PEqw1lAWzEsrL4c9EOJtS0araANHr7zplrDaVxMErC
 /mh+m3Yi4DJbTuNpXYoFDtNEylJDPqHrlHpE4KPkIb83BbZCWKRef60GgxWlDjGUkoZa
 WW8A==
X-Gm-Message-State: AOAM5301mNO/6KkWmZdKtgCpkDjak6g9qNEwaUTpdRZJrAwLTiW0Gu+A
 MymFccQk8TD0Sd541sNk8HXosTaV84N8qJ8TKHGDBB6bkPk=
X-Google-Smtp-Source: ABdhPJwHJWQWPkeYWax74x8Dx1J/bIKc43U7ikj5LL5+mlEEZqsXjs6KRBHjdBiWKiXpcEzSyD2TkodhfWaTj9JMJck=
X-Received: by 2002:a25:6ad6:: with SMTP id
 f205mr33814243ybc.220.1597858766351; 
 Wed, 19 Aug 2020 10:39:26 -0700 (PDT)
MIME-Version: 1.0
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 19 Aug 2020 10:39:15 -0700
Message-ID: <CAFR_W8pG0gLhS5Ycxdhvx=1xdm7J2mCP0VfiHyuZOofB3gWHhw@mail.gmail.com>
Subject: Board Sensor Calibration
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002bfaa505ad3e7c2b"
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

--0000000000002bfaa505ad3e7c2b
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC!

We would like to have a value reported by a certain sensor changed
according to our calibration results. This is a temperature sensor and the
calibration has nothing to do with the sensor itself -- so no need to
change the driver or anything -- but with a sensor placement on the board.
Basically we want to infer the temperature at a different location by
calibrating the sensor.

Are there any tools in OpenBMC that would allow us to add the calibration
curve to, say, phosphor-hwmon and have it report the value different from
the one reported by the underlying sensor? Did anybody else have to deal
with something like this and what was your solution? Do people more
familiar with sensor architecture have any recommendations on how best to
handle this?

Thank you.

-- 
-MS

--0000000000002bfaa505ad3e7c2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC!<div><br></div><div>We would like to have a val=
ue reported by a certain sensor changed according to our calibration result=
s. This is a temperature sensor and the calibration has nothing to do with =
the sensor itself -- so no need to change the driver or anything -- but wit=
h a sensor placement on the board. Basically we want to infer the temperatu=
re at a different location by calibrating the sensor.</div><div><br></div><=
div>Are there any tools in OpenBMC that would allow us to add the calibrati=
on curve to, say, phosphor-hwmon and have it report the value different fro=
m the one reported by the underlying=C2=A0sensor? Did anybody else have to =
deal with something like this and what was your solution? Do people=C2=A0mo=
re familiar=C2=A0with sensor architecture have any recommendations on how b=
est to handle this?</div><div><br></div><div>Thank you.<br clear=3D"all"><d=
iv><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr">-MS</div></div></div></div>

--0000000000002bfaa505ad3e7c2b--
