Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0CE8418FD
	for <lists+openbmc@lfdr.de>; Tue, 30 Jan 2024 03:19:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bJ0uj1pP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TP84j0pcNz2ygY
	for <lists+openbmc@lfdr.de>; Tue, 30 Jan 2024 13:19:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bJ0uj1pP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=wak@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TP8485f1Lz30MD
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 13:19:03 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a3122b70439so458049366b.3
        for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2024 18:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706581138; x=1707185938; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CBsHSCO25cJ5UViYZJiniKWdaOY7gtJNLsah0ETn+k=;
        b=bJ0uj1pP1IczRiro5BKGV00laREH1cuWb3UxKa/MrTCCBxUSej27XRziMxqVCZAnaU
         ZNWSdUobV4QpvmACfn32ntja1ykihcj98Nf+UHbPyZMxcTOlBni3qcfiZCqKzPCYvrns
         5CyEomwNzoUD+qmJYK4N9djYR5AC8UoK5KXEtBpuoegHzDyx2hstHLz5pkMOUnupeyjQ
         cpzzJd4RWcw7Wl4kBI6S78Y4+Q+f/u23LUGx/ypDbjUka0hdaSVCDfIj5yyrgeRknGLN
         r7em17/l+pbmjJn4Uk92fmF/aif/E/zYiAyMiYRvQWUH/Tk7GP0H9ZVuuejYVJ0G1R0c
         mdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706581138; x=1707185938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CBsHSCO25cJ5UViYZJiniKWdaOY7gtJNLsah0ETn+k=;
        b=hEwWnlVasZXnbXSxjLvGvCbZpu5gl0bdmLHuya7O8/sQB1q0/2BHDv6uYDzCaZKa4t
         l5KySH47WMGD1LvLqBlRXKqzMBvI4AWHkK8WHdDqmoRu4ISoabNfocuuUb3blIBqrnhu
         9nqugnXf272xT5LBvuk2EvxHAKu5jBqbmPasd5bX0ZuAEpunOuA7C1x1bOW/NJ4oQUm+
         CcZaNzV4vrr1rAheCsnoWeZ+VfKME8byhIYgfSCdCaBRgJjrgyG8vO2KJrI/+3UTD0sU
         s+6/Mp2qRtxiGz6FxCUgeAvrP6a0iH9vMlmtNbjeteHV0+LsSBpjfLzBDbw5F3DaN3bB
         kajw==
X-Gm-Message-State: AOJu0Yw3lNCsNQ21TNrsKWQ9LxPn4QkcSrUm6B4ceAhS1/bsh8qGaf56
	SYVBCmoF+07dZ1/1ftylTiAIuLyHsI7p1SxiNF8qyVXZWQjEPC/TiSfTiy7eZnU7OpD28C0YKZ7
	YDECbrglugG2MCsRVvvOdM+O9bu8S/Ufl7ClSWzqMXCoFuZETzv8k
X-Google-Smtp-Source: AGHT+IG0pAs4UZ7hQ7OmrzteniMXUc7BOqx/mEuL9rnCDZsuE9QUUzibouXq/LkGvPeQaFVhJQ1JaUNPfnKRD3HCsXw=
X-Received: by 2002:a17:906:33d1:b0:a35:ed62:c4fd with SMTP id
 w17-20020a17090633d100b00a35ed62c4fdmr2285239eja.0.1706581138073; Mon, 29 Jan
 2024 18:18:58 -0800 (PST)
MIME-Version: 1.0
References: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
From: William Kennington <wak@google.com>
Date: Mon, 29 Jan 2024 18:18:46 -0800
Message-ID: <CAPnigK=eDxwbHKyvd11imnWAvXKMTSKtZh5V81h4kevjCj9Jhg@mail.gmail.com>
Subject: Re: TOF elections for 2024H1
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 15, 2024 at 12:46=E2=80=AFPM Patrick Williams <patrick@stwcx.xy=
z> wrote:
>
> Hello everyone,
>
> It is that time again for TOF elections[1].  The current election roll-ca=
ll
> is available at:
>     https://github.com/openbmc/tof-election/blob/main/2024H1/rollcall.jso=
n
>
> For this half, we have 4 seats up for election.  Currently those are
> held by Andrew J., Jason, Patrick, and William.
>

I self nominate myself to continue serving on the ToF

> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
>
> Disagreements with the roll-call (ie. your body of contributions are not
> reflected in our current score system) may be petitions for inclusion
> at https://github.com/openbmc/technical-oversight-forum/issues
>
> 1. https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.=
md
>
> --
> Patrick Williams
