Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA661C9D98
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 23:43:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J6R910HmzDqrN
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 07:43:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=linyuny@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=D3SOI2HP; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J6KS0P07zDqwg
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 07:38:45 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id k12so8162524wmj.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 May 2020 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=n62B4wngNlWphjduJzuLLNyFKYoC98mKPAPZqK6Krng=;
 b=D3SOI2HP2Ry97on1cGWyW/619rLqe7j7DyPO5hyuemqD8kSDThmNaoZAV1F0JORqsB
 8h3udPIIUw5yrkTXG9aKKHko+WDbYFlbO3CsuAGfw855acuCynsN+f6WL4OlDomK3ZrT
 pahdcivyBr0MtkQJ1UUzvt9de7vDGdbduRTyGb7bpjCymWElY5VxyQ64Nlq50ArXNrVH
 009NKEZLqKzaR4blize3WzGFb1DDuoDldJlS1JEcFFfh8qQCDbB0Dehxs2vX6O+sC39x
 95f+M61E0sBIKYBjxkruBSO8BuVj+loutB7bu/dhuO6lCgqAn2bvJeBiVRTLT6Fh8flj
 YjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n62B4wngNlWphjduJzuLLNyFKYoC98mKPAPZqK6Krng=;
 b=bEIBEvuyz01OKsM+tB0D4afNxSoojO4CHEnq4ghByFrHkf/acvxNOnkkaDWX6b8xUm
 aaLF/M3wpjtl1pVBSfFNoRpXovRIvgx3oMAz+dgdOX7BWRaI6gGp9BesLhnAyjyVgJPS
 nsB2GVlZ8SDWS4xfOSrh3y+SYpZVvq6/zKGHoSKpKpDQmP/yxWkqja5+gMF4uZ+Ivw9z
 6HOOEQaPPk3Rbuu4vKQHdCP7X9LmG736Jx+BVI7BrlP6gYPrs3VvTiw9iWtreGMPxQO5
 2M1kI1ilZ1qMlIHsA41GF+M6VmEOjBrdkD+3bXeyEOSGQvV4/Y9ArXJVwfZPE3Kd5oU1
 ZFfg==
X-Gm-Message-State: AGi0Puacm5fYTV1IAvLMYkP4Lt7uK6fTwlAt7Od4RAzv5p9xaj7RNdDw
 yL5+YIdKPJWc+g9j/mFD+z2TnHcG9v621nK2Ho6P0I/LF/k=
X-Google-Smtp-Source: APiQypLTMFWI0rotOPZKNLOlCnslznKLqj+EmBr1HFOdOWy97zStaegOcxoqi9oiaJMfpt3RxK99A6dgIZED7y0dDvc=
X-Received: by 2002:a05:600c:2110:: with SMTP id
 u16mr10916592wml.171.1588887516390; 
 Thu, 07 May 2020 14:38:36 -0700 (PDT)
MIME-Version: 1.0
From: Yunyun Lin <linyuny@google.com>
Date: Thu, 7 May 2020 14:38:25 -0700
Message-ID: <CANqsbzYv_ABquUFOGCsKay5aqKAzV0XpeF=D5nDSh=xzg82wUQ@mail.gmail.com>
Subject: New tagging for latest ipmitool
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000001467a05a515b4f3"
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

--00000000000001467a05a515b4f3
Content-Type: text/plain; charset="UTF-8"

Hi All,

The current ipmitool tag(v1.8.18) looks very old. If we can create new
v1.8.19 for the latest version of ipmitool (on master branch)?

As I feel hard to find the maintainer's (Alexander Amelkin) email. So I
post it on the mailing list.

Regards,
Yunyun

--00000000000001467a05a515b4f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>The current ipmitool tag(v1.8.1=
8) looks very old. If we can=C2=A0create new v1.8.19 for the latest=C2=A0ve=
rsion of ipmitool (on master branch)?</div><div><br></div><div>As I feel ha=
rd to find the maintainer&#39;s (<span style=3D"background-color:rgb(248,24=
9,250);color:rgb(32,33,36);font-family:Roboto,sans-serif;font-size:14px;whi=
te-space:pre-wrap">Alexander Amelkin) email. So I post it on the mailing li=
st.</span></div><div><span style=3D"background-color:rgb(248,249,250);color=
:rgb(32,33,36);font-family:Roboto,sans-serif;font-size:14px;white-space:pre=
-wrap"><br></span></div><div><span style=3D"background-color:rgb(248,249,25=
0);color:rgb(32,33,36);font-family:Roboto,sans-serif;font-size:14px;white-s=
pace:pre-wrap">Regards,</span></div><div><span style=3D"background-color:rg=
b(248,249,250);color:rgb(32,33,36);font-family:Roboto,sans-serif;font-size:=
14px;white-space:pre-wrap">Yunyun</span></div></div>

--00000000000001467a05a515b4f3--
