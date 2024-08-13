Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A762C950E51
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 23:05:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WRtcKScs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk3ng5BPWz2yWr
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 07:05:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WRtcKScs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=osk@google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk3n866gGz2xJ8
	for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2024 07:05:15 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7a0b2924e52so3015168a12.2
        for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723583114; x=1724187914; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/b57vWnCpbD6G3UHIhujjJi2QngLRrAr+11t/JRvlo=;
        b=WRtcKScsfm+/6ql3WRqDi4eQ76LMbtuYEK5DrplF/vNP0i8NfF4DiIesw0lQJNjjUj
         FwjTJJzR7CZORRwq5lPbEu5y8FgUwwVtVqwJtOHV5MkFDXihsyQCHRJrBXC9is+hLH3L
         /LLNbonBFxr409+W09Q4R9era7uWU2lYKdhMy2NrE6pv3TwZCuJmnwO7anYEg0CkQfdT
         b5FojDGkodSq0C8rSabu+EQdFK/QiGxJuvhVyMPoDNKzqdAF7Jjm4bmdF7MB/tPnkOsP
         IlbEugdxbDpl6isbGdqhAGyJaOPHlQ8R4Zna51t9qQR/qSAMUyC8btxpKmIhu0GrnCxN
         Xk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723583114; x=1724187914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/b57vWnCpbD6G3UHIhujjJi2QngLRrAr+11t/JRvlo=;
        b=wX7FCbegi0UQT7No8PIt7znbeDZgw5dLJLLTxhOomfg5tpzpnmXWX6aCJgnfU17An1
         yQ1YTWxGSncY/SF6WfvMTekEJQbTesE9sSUvzj+E8Lg8k1oWeB1YSxZXoIG40HEvRaTq
         DFUTCx0MWjf26uzpKPKwh6ymST9pbRy6YebGB4E+ID1Rc4MVXb5lVMsRE4GZqnYZlGyC
         JcbOrPKNMUOD4iVSEW59ceV972/NYpYmBGIXjCSs3Q30hAKK88Ed2sCKo32LyG1I02KG
         MB0lYuwzU6DyDiN/nAotAk87dLPEuusgGMefP8kec7XdFoHATJ7/o4mmpTZD+2rf3UYK
         iifQ==
X-Gm-Message-State: AOJu0YxAz6GkYtDF6t6TuZMMiPgNpFKyk/H97Cjof6y++gkbgA1GUJak
	WFi4NBh7jnmmvvShdRseBWROVSmKRa+gKytLWHYMTH/deymamQ9LGJ/Ib1vj+gn2/oYXpsRkVNK
	dJV9ihe4/TunpT4VuGnKYHV6VpjKPhZ8tRIYGABTqt/nMahZPSRAA8Co=
X-Google-Smtp-Source: AGHT+IELRFiONuRuvqLLyIZApnWR32dlvAHQ0cKoBDDK4U4DaPUrMaB/ZjuKsPUpAUVJYEhcc7C7gauVyRzbX3+jcFc=
X-Received: by 2002:a17:90b:8c1:b0:2d3:96fd:e73d with SMTP id
 98e67ed59e1d1-2d3aab2ef4bmr857660a91.28.1723583113451; Tue, 13 Aug 2024
 14:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcTjdrJ2mDFnAtTGA_SgFvYE5=1Dm5B9VcPKDtR8kUDhtQ@mail.gmail.com>
In-Reply-To: <CABoTLcTjdrJ2mDFnAtTGA_SgFvYE5=1Dm5B9VcPKDtR8kUDhtQ@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 13 Aug 2024 17:04:57 -0400
Message-ID: <CABoTLcSVfDYGn2TW_PGiNZP1jqRMobDxp3dkE-cXT1Y4yGA_JA@mail.gmail.com>
Subject: Re: Reading SOL non-volatile bitrate broken for VUART
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jonathan.doman@intel.com
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
Cc: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I sent https://gerrit.openbmc.org/c/openbmc/phosphor-host-ipmid/+/73658
for review - in case this change is acceptable.

Oskar.

On Tue, Aug 13, 2024 at 4:56=E2=80=AFPM Oskar Senft <osk@google.com> wrote:
>
> Hi everyone
>
> After syncing phosphor-host-ipmid to
> a48bf7766f7e2f9cbe1c74f3ee681f7a2ea66969
> (https://github.com/openbmc/phosphor-host-ipmid/commit/a48bf7766f7e2f9cbe=
1c74f3ee681f7a2ea66969)
> I found that `ipmitool sol info 1` no longer works. I tracked it down
> to obmc-consoler-server not exposing interface
> xyz.openbmc_project.Console.UART for VUART type ports.
>
> I believe obmc-consoler-server's behavior is correct, since there's no
> baud rate for VUART ports to configure.
>
> I worked around by having getSolConfParams return
> `response(ccParamNotSupported)` rather than
> `ipmi::responseUnspecifiedError()` in the case where
> `ipmi::getDbusProperty` fails for the Baud property.
>
> diff --git a/transporthandler.cpp b/transporthandler.cpp
> index f89f8f3..a7b565a 100644
> --- a/transporthandler.cpp
> +++ b/transporthandler.cpp
> @@ -1682,7 +1682,7 @@ RspType<message::Payload>
> getSolConfParams(Context::ptr ctx,
>                      "/xyz/openbmc_project/console/default",
>                      "xyz.openbmc_project.Console.UART", "Baud", baudRate=
))
>              {
> -                return ipmi::responseUnspecifiedError();
> +                return response(ccParamNotSupported);
>              }
>              switch (baudRate)
>              {
>
> With that change the behavior reverts to what it was prior to the commit.
>
> Thoughts?
>
> Thanks
> Oskar.
