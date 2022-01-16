Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3494648FA03
	for <lists+openbmc@lfdr.de>; Sun, 16 Jan 2022 01:39:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jbx4F1Tblz30Dg
	for <lists+openbmc@lfdr.de>; Sun, 16 Jan 2022 11:39:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S/WGipPO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S/WGipPO; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jbx3s6zxZz2xrj
 for <openbmc@lists.ozlabs.org>; Sun, 16 Jan 2022 11:38:47 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id r138so18063217oie.3
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 16:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xq1STW/9GWXWNpMTgrEANORa+fFhQI5P1Xh1Ux8Ap7E=;
 b=S/WGipPOi+aDaNKPU2W8GTv/m3kK9LmuVfzsLaYXeLm0+2aUx9j3qiGyVfnNb86HO3
 uAu0/PqIedCkjPsAzuAB0DDPRocf48Qd+VQTKcHpEiopVFbzn/oep4vkXBhjpTncDTJ1
 NoySbok2W+5d3+E+3fxBMoYkxu7mXLgkEyyNTRZpCeXhvk89K9Ztsg4k0GUyM2r//Kzo
 LuvjlYorZ///4oXPV2ZQZLIt/pHCuKmkW/+jrE/j6V3Y7GOCDJc83dJDAepj1kqKVPjg
 psuJTy94gVNyOqb6HeCRzEgRpuRhokAs4WxDs1kuWyH7Ck0J1fQck9SoDFxoW9K/4VPB
 +xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xq1STW/9GWXWNpMTgrEANORa+fFhQI5P1Xh1Ux8Ap7E=;
 b=dAu0YXSYTthm8xXqvb11kU+QvBuOrBc07rHTilPu4B91lS+fDgFnb15id9B0/iLMxN
 R6Afx1k8x42lwnUHzlAWkWAMvJh36yO44hLQjjmMNJISf1T83GxpYjpgrTKR68tRYGkw
 6KsyvNrZHE0x6MdjoP8xvQKrFJhtVrC7Lrk9N6jpJWyzkFvEwibeGITmid3TM8ujOVlf
 ZwA5lZit/Ot1G0lpvDPp0rGYT84aYt3+6w6DxdisyaocO5wr05bnlMHSYWemhG1qfhGL
 EkAgxmKPRWLmTR9Bc2Ngq8Ft0u+CxtdegPAQIsMdmdycaVSHpie88aSB18v/8VYPg3VP
 G5ag==
X-Gm-Message-State: AOAM530fubyTwA9nI5bO2uh9NrqI794qCXrT9tOcqS/DcuKIGz1NWKs2
 oNheWUco62LGiFx3Qms5rbICAXjKSHRRHCHzv/SVLQ==
X-Google-Smtp-Source: ABdhPJz42hl7ypfOI7dDD092Ja9BAFGUUKC1+kMjBppzuKHX4HH94KrnMiQemb4kuGpj7lBiKnd/mFuhjgCZnQx/J0w=
X-Received: by 2002:a05:6808:2097:: with SMTP id
 s23mr8315616oiw.132.1642293523401; 
 Sat, 15 Jan 2022 16:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jan 2022 01:38:32 +0100
Message-ID: <CACRpkdY+Jdn_Yr4BpuXssTn=6wjDPm9mMgz3yrjVGw8=UzKbzQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jan 9, 2022 at 6:34 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> This is version 4 of the WPCM450 pinctrl/GPIO driver patchset,
> with some small, (hopefully) final improvements and cleanups
> (see patches 4 and 5).

It looks good to me, but I'd like some confirmation that Andy
is happy with it.

> I'm targetting 5.18, it's now too close to the 5.17 merge window anyway.

Could you rebase it on v5.17-rc and resend it once that comes out?
It would help me a lot to have a known good baseline.

Thanks!
Linus Walleij
