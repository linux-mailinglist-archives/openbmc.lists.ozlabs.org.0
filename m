Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A71AF62F
	for <lists+openbmc@lfdr.de>; Sun, 19 Apr 2020 03:46:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494Xk52DyXzDrGt
	for <lists+openbmc@lfdr.de>; Sun, 19 Apr 2020 11:46:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=GNQs9I/D; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494XjG1X33zDqSD
 for <openbmc@lists.ozlabs.org>; Sun, 19 Apr 2020 11:45:51 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id f8so5015035lfe.12
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 18:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AOBbEuRYmwsL92OQffWZZkGRz2v0nVvk8e7EJ66RnLw=;
 b=GNQs9I/DNmKhwecnrtplyVAm5IwUOJJol2PWRktanK/NvCrFppKeYIO2Dwvfrbhrub
 r2hxrmsQGHpec2g6g4LUrgFnsQLpijXYtHXOlXvjNb8wYKc2HgeuLYb5V0uxMR+BBgj0
 cOa7wutOHkBVfkfNT3mCZunsoGEj4ZnPQBmyi0cnYf3oGc6AMnXuvjNyiFEHSgoxCqlW
 ThiMbwLoEO1UXis4TSD6iyHsK7+4CmA1/VIykdF+Ksk2HR0LxVjMsyZ1mwfTE7qSNyu1
 lfaExEqx642UEmE7zVYhy/Wd1LlBITOVdJQfcSG4inFCb7tjlfQNInrQcNl0PAQFZGre
 zT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AOBbEuRYmwsL92OQffWZZkGRz2v0nVvk8e7EJ66RnLw=;
 b=qXkgzmGBDXeEjOmpBkd/xRWC4eDF3bKADQKjP4vZYqp7w8jUeYH0t6RixD3Hsie2hc
 uNTnoeCExzxqLhMZ3ZhIWfTleNkDPR97gjHqGZgGYW4FAKCE5OxGz6LmFgr0uCfoMtAR
 NaJ0zDOEtgdl6sEIsgehX3W8woqArkBkF/kcZ46dJbf+jNa+qyjFr4tCbRp0tjlUeYHJ
 fk3xVJntcgtym0i5hXATyrip9IUu8oPC9ExVEQF/6697ZU0aAVeOCH+GTl6GO6QuawgC
 PEnwJ1G/rJ6UjSCzO7l54Oyujnxe+VF7W/SIA7w/EifCPhL+kRLCJ9LE8mRzFIAYsWEE
 XO7g==
X-Gm-Message-State: AGi0PuamLJtCNoTIT6RZLOBLAl3YItKPzfbq3AzmIhzgcVV2DxhIa50N
 SzRuj5BPWiVqADw9YqL8Y2ZhrxhQldN08c+ExZBwr8k86pA=
X-Google-Smtp-Source: APiQypK7bx4Dp5D6IvzQtpvvlvb8t73M0S8hC20BdND9kmpQhDt/M7HhiBaaZVEDynK8GYp8/pkBfO4laNnm70ygSd8=
X-Received: by 2002:a05:6512:1046:: with SMTP id
 c6mr6302056lfb.115.1587260745413; 
 Sat, 18 Apr 2020 18:45:45 -0700 (PDT)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Sat, 18 Apr 2020 21:45:29 -0400
Message-ID: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
Subject: Access Intel ME IPMB from BMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e5ef8b05a39af0ce"
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

--000000000000e5ef8b05a39af0ce
Content-Type: text/plain; charset="UTF-8"

Hi everyone

I'm trying to find out how I can access the Intel ME via IPMB from the BMC
(OpenBMC).

From what I gathered, Intel ME's IPMB is on the PCH's SMLink0. I know this
is connected to one of the SMBus modules on my AST2500. But what I can't
find out is how I actually send commands there? I'm sure I'm missing a
document that makes this obvious.

Or is it as simple as dropping IPMI packets onto the bus?

Is this by any chance already implemented in OpenBMC?

Thanks for any hints!

Oskar

--000000000000e5ef8b05a39af0ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone<div></div><div><br></div><div>I&#39;m trying t=
o find out how I can access the Intel ME via IPMB from the BMC (OpenBMC).</=
div><div><br></div><div>From what I gathered, Intel ME&#39;s IPMB is on the=
 PCH&#39;s SMLink0. I know this is connected to one of the SMBus modules on=
 my AST2500. But what I can&#39;t find out is how I actually send commands =
there? I&#39;m sure I&#39;m missing a document that makes this obvious.</di=
v><div><br></div><div>Or is it as simple as=C2=A0dropping IPMI packets onto=
 the bus?</div><div><br></div><div>Is this by any chance already implemente=
d in OpenBMC?</div><div><br></div><div>Thanks for any hints!</div><div><br>=
</div><div>Oskar</div></div>

--000000000000e5ef8b05a39af0ce--
