Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF131A3C25
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 23:55:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yw1c3C5JzDqbv
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 07:55:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ZFCTInuZ; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yw0l3M4ZzDqPQ
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 07:54:46 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id h25so129460lja.10
 for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2020 14:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eCmJ3eTAdkFRY6e4oBRuavZI8HkgPpVJKCnngEaQMrM=;
 b=ZFCTInuZkEXDUIG8J2Prk96heTkqv5y88KmR9o/u8Hhe7ILdIaM/iMUSm31Mk1Rxak
 ZglHujwlhhFu9S0nXDXML7G5GgJPiUahIHPRm16dvgl1wEEx3EvfpMOiO4OYGyg5cULt
 4sPXSqCnlIASINStMPo1aewt0O6qpfI/VY26Cg4YsG9YkTKEkR2LTJAe0wdpKUPOy6uu
 7D0ZbKv926gQUNx4qaLcpxvUcwZgJV+6A1uAScuE+vtKjbmofPHsusP+2m0Wv+qJ/brf
 852m4dsvabGqyduaPlvlLVCDM1t+iQZZdcHtyJEfuZFIdPkpMtxl2MltJAdw6h7EImgS
 a0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eCmJ3eTAdkFRY6e4oBRuavZI8HkgPpVJKCnngEaQMrM=;
 b=FUFVUFIRriMHSWeuvEPkgOC44hKNupI1fNvTPGs6D2DHQyBc6xhCCQukRBOi7rZLtE
 Z/RT/qEhGdH6NNhzkmk5URF8bcgaQ8nPDOvE1grjBjiEpz0lBfMYrRftSFT9DvzTSh1R
 TILPAeavcZMrHXoYzim1kCCefFD8Fd8F4OWpZfOqMqMfQro8ZG6+uvDDj5l8LlORYMbc
 x98Js100ZxHPYKXRbo3OkIPLM/G7MF3Ypsx+7TM9LiLnDKfKYklQZG/UX3Zh9ZVwbCR4
 ae4xB3oXNRnNOqkxOnuM4bZt6tM2m2Zf34gH36h3+1sSoIems9A6eOwBSLNqQk6JC3rb
 +TIA==
X-Gm-Message-State: AGi0PuYBjhnxBHtlXn/UWoRrpTHeaxUlV4RIw5w3wACxNuj7+nzJezBX
 u0u7P3aDKEYbXQ7eny08GrD4LQTYOpPUi7QA47/OXhi1
X-Google-Smtp-Source: APiQypJ6wDwj+CWrbVOFRUZINmlyIZ2XzcF7txJLgq0ORQNIg3v3E0h40Bda5l4VljIMjewuXa2h3JwLmGrWqK+Sdlc=
X-Received: by 2002:a2e:9798:: with SMTP id y24mr1126530lji.267.1586469277547; 
 Thu, 09 Apr 2020 14:54:37 -0700 (PDT)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Thu, 9 Apr 2020 14:54:26 -0700
Message-ID: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
Subject: Call for Gardening Tasks
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000bc98b905a2e2a9dd"
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

--000000000000bc98b905a2e2a9dd
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Last week I started a thread on Open BMC Gardening
<https://lists.ozlabs.org/pipermail/openbmc/2020-April/021100.html>, and I
wanted to kick off the process.

The basic idea here is to get a survey of various improvement tasks
throughout OpenBMC.  Some things might be small refactoring or changes that
can be done incrementally (i.e. weeding the garden). Other tasks might be
more research or structural (i.e. excavating the garden).

Just getting these in writing can be helpful for others to gauge what they
should focus on. It also helps leave breadcrumbs for any new developer
interested in the subject.

So here's how I see this working. Anyone who has some ideas can reply to
this thread with a short to medium description.  Try to avoid new features,
and instead look at ways we could improve the status quo. Think about
changes and tools that would make your day to day life better.

From there we can do a write up about what we know about the issue.  This
can function as an early stage design doc that gives a broad overview on
where the dev's head is at right now.

Finally, we can do a quarterly review to keep the garden refreshed.
Obviously, things can change between that time, but having a semi-regular
cadence will hopefully give us a better chance of keeping this up to date.

- Richard

--000000000000bc98b905a2e2a9dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>Last week I started a thre=
ad on <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-April/0211=
00.html">Open BMC Gardening</a>, and I wanted to kick off the process.</div=
><div><br></div><div>The basic idea here is to get a survey=C2=A0of various=
 improvement=C2=A0tasks throughout OpenBMC.=C2=A0 Some things might be smal=
l refactoring or changes that can be done incrementally (i.e. weeding the g=
arden). Other tasks might be more research or structural (i.e. excavating t=
he garden).</div><div><br></div><div>Just getting these in writing can be h=
elpful for others to gauge what they should focus on. It also helps leave b=
readcrumbs for any new developer interested in the subject.</div><div><br><=
/div><div>So here&#39;s how I see this working. Anyone who has some ideas c=
an reply to this thread with a short to medium description.=C2=A0 Try to av=
oid new features, and instead look at ways we could improve the status quo.=
 Think about changes and tools that would make your day to day life better.=
</div><div><br></div><div>From there we can do a write up about what we kno=
w about the issue.=C2=A0 This can function as an early stage design doc tha=
t gives a broad overview on where the dev&#39;s head is at right now.</div>=
<div><br></div><div>Finally, we can do a quarterly review to keep the garde=
n refreshed. Obviously, things can change between that time, but having a s=
emi-regular cadence will hopefully give us a better chance of keeping this =
up to date.</div><div><br></div><div>- Richard</div></div>

--000000000000bc98b905a2e2a9dd--
