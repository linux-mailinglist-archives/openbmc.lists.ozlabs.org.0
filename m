Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CE4217BB7
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 01:36:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1f2q0fqqzDqxQ
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 09:36:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=P9YB4pEd; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1f1p1XZXzDqkP
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 09:35:19 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id e4so28164578oib.1
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2020 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=MJDvuss0ew9XP57WV+R2MtAoxs6maMI/+jesK17nv3w=;
 b=P9YB4pEdk/o066iGhevPVaa6FXcx4Xguwb72v5KIuJl8MInZ+bfHEwgCp4sztA1+ih
 xBKQc75jX+EV3Nv/5kqnGdNyOC/+AZu+MKps3xCBAjFJVxpYtH8HpNHnSYspd5ZZUPVN
 vGnUyEwek8oqX1SSKSmBs6yisax50g6SOTKWIB5BB9QR+95zYLkpOKAiPbqpjye6RCx6
 +MftVJFg39pZg67gROEJ73HXkGgW9JGULaZSOzsEYQP5uFvX+0oG6Gq5wMnpddkkrtiG
 zCYjLZLtOlgaD87o6q9k4v/KkJiJHVVluDZlJvUWTVnVUQ+0GFTc6IKfbEEuUdjTym7o
 OHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=MJDvuss0ew9XP57WV+R2MtAoxs6maMI/+jesK17nv3w=;
 b=KLqXqNrMeLYa/dzXIkXRR0orOpuv1noenaY4q/zl2iotez/jLFNcOFeo8spIC2Bd1Q
 fBgo4S5SZVB93vJP0pTVilzjaGGSxjFAVxKBCDzpgz1pCOfnDT74sEhTUMNb7FQwz1hA
 3x15T/QhoYOHsLRuwZwMVaWR2/1zw1IRTz82hwEOMnZS5pfjHpD1TXBv/6wdam3oN7Je
 sKBB8OhkIGm5n9b4EUgzAA5RaEZbztuNc+oKLM5bceOVFo+3RK7TTR5eRdOXtTWvggpx
 g3USWdepFET2bF0jTdnsQYlfYIjPYLuiaHeCTeMYIQhW2u2dW6DdMNPxJXkExVrSPWb/
 ajtQ==
X-Gm-Message-State: AOAM53233ehxJCu2aGEfEn7/gU4t+GWMK01LsjuGhlwGc6JdnxyRurc2
 defJX461mVQk2ul+YGJS9LOef8zAxv4QBoGMW+JpWA==
X-Google-Smtp-Source: ABdhPJz6alCU+SPmWtL87cIWCWsOCxFUTMwPNynbvOwObs8PtEpYK9/i/HvB2wcQdB/e+a/51W7rMW6XBWlPfxKr7PI=
X-Received: by 2002:a05:6808:3d8:: with SMTP id
 o24mr5258302oie.69.1594164916524; 
 Tue, 07 Jul 2020 16:35:16 -0700 (PDT)
MIME-Version: 1.0
From: Jason Ling <jasonling@google.com>
Date: Tue, 7 Jul 2020 16:34:40 -0700
Message-ID: <CAHBbfcXKcxdbDG3c1hE6nFOs9kxejzWEPDw2J1xYo5emoxcr9A@mail.gmail.com>
Subject: phosphor-pid-control: dbus tuning interface
To: Patrick Venture <venture@google.com>, james.feist@linux.intel.com
Content-Type: multipart/alternative; boundary="000000000000909e1805a9e271c7"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000909e1805a9e271c7
Content-Type: text/plain; charset="UTF-8"

Apologies if this has already been discussed but..
Would the community benefit from the addition of a dbus tuning interface
for phosphor-pid-control?

To get things going:

   - initial thoughts would be to have the details of each thermal/fan PID
   control pushed onto dbus with loop parameters being r/w.
      - I'm not sure about whether the output or input to the loops should
      be published as properties.
   - Have this capability compiled out or runtime disabled by default

Things I worry about:

   - If the phosphor-pid-loop updates the PID output/input/error to dbus on
   every evaluation cycle will it bring adversely affect dbus performance or
   bring a system to its knees? is it better to just implement the querying of
   pid loop updates as a dbus method?

--000000000000909e1805a9e271c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Apologies if this has already been discussed but..</d=
iv>Would the community benefit from the addition of a dbus tuning interface=
 for phosphor-pid-control?<div><br></div><div>To get things going:</div><di=
v><ul><li>initial thoughts would be to have the details of each thermal/fan=
 PID control pushed onto dbus with loop parameters being r/w.</li><ul><li>I=
&#39;m not sure about whether the output or input to the loops should be pu=
blished as properties.</li></ul><li>Have this capability compiled out or ru=
ntime disabled by default</li></ul><div>Things I worry about:</div><div><ul=
><li>If the phosphor-pid-loop updates the PID output/input/error to dbus on=
 every evaluation cycle will it bring adversely=C2=A0affect dbus performanc=
e or bring a system to its knees? is it better to just implement the queryi=
ng of pid loop updates as a dbus method?</li></ul></div><div><br></div></di=
v></div>

--000000000000909e1805a9e271c7--
