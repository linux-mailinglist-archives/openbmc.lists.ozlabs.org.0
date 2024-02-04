Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB798497C3
	for <lists+openbmc@lfdr.de>; Mon,  5 Feb 2024 11:28:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JA0tHU7N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT2dn62nCz2yQL
	for <lists+openbmc@lfdr.de>; Mon,  5 Feb 2024 21:28:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JA0tHU7N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=rand.sec96@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSQLB09J3z30YR
	for <openbmc@lists.ozlabs.org>; Sun,  4 Feb 2024 21:12:32 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d0a0873404so7686261fa.2
        for <openbmc@lists.ozlabs.org>; Sun, 04 Feb 2024 02:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707041548; x=1707646348; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/CKCu2QlvmjQTlqBjr4NIaSI1yb9z5CsCzyf40yI/Q=;
        b=JA0tHU7NlqmV18Jqe4k6eFtuJe9hx3U8Oq34buPykZpZuIabYkhR91f830vd8NYQBd
         J1n0/PatRdm1cHccm3eb48dWsgaT4Wl3VLZ1A+3T/hqR5lPdOMop8pi7odTblQxP8KmY
         dcaAzT2/g0DI7MUerJRbBRdgYFmKguR9UiNBa2gT908oZiftyonSd28gg/D91faTFybx
         OnkWx2kqJXMpryTXNyefdn+AjxioZYiY9sKiyBJ53l9aMMrcSdohnXGoahGTHGBRbgQr
         ikPTOtp4UlntYwqYLEdRGjGIkHnhia+rVjmLybkhWZYx7JTVbXlzkBZEuNYHjbmY+3rB
         u//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707041548; x=1707646348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/CKCu2QlvmjQTlqBjr4NIaSI1yb9z5CsCzyf40yI/Q=;
        b=UtpAmB43NoOyuvBmdMSqWm8v0b3xeTON5aSmUL+LhhkQR1GSN4tf9bjCv58+aazPjC
         M/eibdvWofZR79qa/AcSWQA5ObZ3mmVn4CdNArFc83XNimTud1wpDNy2et5GaEsI1JIm
         3uQaSFcgS0ViVGxmErvdLF/4MLz5MFS43ssiZTMca9Y5UVN2c5AUGjKCd1KfO4WokPol
         x+HIpCRvhczkHlQ+gOREgqHDvzgx8p98oFpfzr76vSwLC9ySQ553E1x5vB2WYjmBcnFg
         R4vn+4hI9L62Nnrwt+ESkjZyO+eyF5OZTl4dtEV9epGLeTN0bVSIaipUxECKS0vVRXb8
         C+gQ==
X-Gm-Message-State: AOJu0Yw4FATTI6Uk1R0bEO9CXBbXr6UNUcNrKNXW4Me6ZWRs3Kvxdksj
	gaJSne0II6N2ew1h4t8zxoa7dOOhp2xCtfyy6ohl5gChHXCQ+M6t/J2Huwv/UwyJQiTIhFwseEb
	21D06PZGgAhpPzjaxuXhZtcnCTnI=
X-Google-Smtp-Source: AGHT+IEiaNv3pmNejZuwag1ZJQAZwjJU2+NNpIjCJW39bWdB+TTTUdNstPCaEBu+C5P9BX5uHtZFhynbBgXzX5poWms=
X-Received: by 2002:a05:6512:3484:b0:511:49b9:74ff with SMTP id
 v4-20020a056512348400b0051149b974ffmr1117014lfr.48.1707041547885; Sun, 04 Feb
 2024 02:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20240109145121.8850-1-rand.sec96@gmail.com> <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
 <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru> <Zb6luAVHcnX2fXz3@shikoro>
 <f5f26a7d-973a-4232-b0cb-b0543fddefe0-pchelkin@ispras.ru>
In-Reply-To: <f5f26a7d-973a-4232-b0cb-b0543fddefe0-pchelkin@ispras.ru>
From: Rand Deeb <rand.sec96@gmail.com>
Date: Sun, 4 Feb 2024 13:12:17 +0300
Message-ID: <CAN8dotnOgU5cgi3y3f74=bJQt_G7qKpP9imB+REvT7AUeFbQ2Q@mail.gmail.com>
Subject: Re: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference
 in npcm_i2c_reg_slave
To: Fedor Pchelkin <pchelkin@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 05 Feb 2024 21:26:05 +1100
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
Cc: voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, deeb.rand@confident.ru, lvc-project@linuxtesting.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Feb 4, 2024 at 11:54=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru>=
 wrote:
>
> On 24/02/03 09:44PM, Wolfram Sang wrote:
> >
> > > If I'm not missing something, npcm_i2c_reg_slave() is called via a
> > > function pointer ->reg_slave here [1]. And seems `client` can't be NU=
LL
> > > there. Other drivers implementing ->reg_slave function don't check it=
s
> > > argument.
> >
> > Correct, we trust ourselves here.
> >
> > > Maybe we should just drop `if (!bus->slave)` check?
> >
> > Yes.
> >
>
> Okay, thanks for confirmation.
>
> Rand, would you like to prepare the patch, please?
>

Hi Fedor!,

Sure, In fact, there were two scenarios from the beginning, either
redundant condition or potential NULL pointer dereference.I relied on
the condition to determine the type of issue because I did not find
it logical to add a useless condition, but based on the Wolfram Sang
words "we trust ourselves here." then the scenario will change to
redundant condition, so i'll write a new patch and send it in new
thread.
