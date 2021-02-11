Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C4318FA9
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 17:16:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc1w96blszDwpQ
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 03:16:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=S+PhE58V; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc1vD35M0zDwlp
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 03:15:34 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id u8so6196130ior.13
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 08:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=KXV1+3CdwabgX6BOo6FI778/hmWSO+tE3Hoi29pCu0E=;
 b=S+PhE58V5O0tNKSvBrTZ/qn96pWMWSJ4Rky2IFgYImOMEiqHjIUbSj5MfCLPa7b0zV
 q//ICQ2Dg5jrsB/dBiwz04dAPCs+ff9crAdNI7mg/buZg8wfpP2X0yurV4v4lv41N3RF
 /w0LoQ+LcSJwHF3HthE1s1szKT/3JhFhdfII4M9W9BFrAeG7NwThPyP7dNvzE0ujdP4x
 B3lNCoW+C6QzWzt2852lsuDzwVLh0rgXVX/JZcxsCqWEgVfrByWuvVo8NcPWR9x5SuWc
 mEKuiraAgy6i02uy7pa+0ZkE1RzNMhq74tMYm8uPQd42L9x54dVpDzLsd0SCqDxPW9gq
 FoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=KXV1+3CdwabgX6BOo6FI778/hmWSO+tE3Hoi29pCu0E=;
 b=h4VkLBH4s7Owvn9wbLFYm0PU1n2m7c5U6gvpM7QNWMssba0KK7OuG6nW7RaCM+beDk
 XmWfJc/DwdewSR9wQGHqH88oWbTSu+2aTB/GPsfPRxQ+UwnI3LWFuEqRr98eeUHPR5Tp
 1ODr0sr8eet1ZAAjEncmxQlTQ0fG3vN/bwWroGayI08pKGluFpUb3+8JLXohkrXrpLsE
 dEuhFCG4gHT0l6obJZnhXCiTGB+v1GjLWGlF2lCFUc73VsEI79qoz3555BGoNCCQLZSt
 Z26xkhzU5lPF3e5FP7OZcrmdAB+ZTF8DIUOquUsQJe8D3kcIBWb/OI7a8rIkbM9LbRoP
 SoHg==
X-Gm-Message-State: AOAM532nzySj7mjuepNTP9Gc5xyFHZBOfVEBq2Z1ol9qP3bWnnrvqbrD
 /KF5Q7gA48KdEBqDU/8QDKDdK7nidY18FF+POWs36JxDBYg=
X-Google-Smtp-Source: ABdhPJyyfiJ59mJLEun0pziKVBTyMbIvn8FNe4EA2k5mRSmPFd6S2y6UA7pNWIizLveUuSh9BiH2CoSmozXSdHdsEaU=
X-Received: by 2002:a6b:f311:: with SMTP id m17mr5873495ioh.55.1613060130256; 
 Thu, 11 Feb 2021 08:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20210211083454.37117-1-gmouse@google.com>
In-Reply-To: <20210211083454.37117-1-gmouse@google.com>
From: Anton Kachalov <gmouse@google.com>
Date: Thu, 11 Feb 2021 17:15:17 +0100
Message-ID: <CADVsX8-A+zc3jfwhXjOfEd3xsBQ9hvPSvAiNw62gbcf2dVozpQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout This change satisfy
 OpenBMC requirements for flash layout.
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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

Hi, Joel.

This is the correct patch.

On Thu, 11 Feb 2021 at 09:34, <gmouse@google.com> wrote:
>
> From: "Anton D. Kachalov" <gmouse@google.com>
>
> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index bd1eb6ee380f..741c1fee8552 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -182,8 +182,8 @@ bbuboot2@80000 {
>                                 reg = <0x0080000 0x80000>;
>                                 read-only;
>                                 };
> -                       envparam@100000 {
> -                               label = "env-param";
> +                       ubootenv@100000 {
> +                               label = "u-boot-env";
>                                 reg = <0x0100000 0x40000>;
>                                 read-only;
>                                 };
> @@ -195,25 +195,13 @@ kernel@200000 {
>                                 label = "kernel";
>                                 reg = <0x0200000 0x400000>;
>                                 };
> -                       rootfs@600000 {
> -                               label = "rootfs";
> -                               reg = <0x0600000 0x700000>;
> +                       rofs@780000 {
> +                               label = "rofs";
> +                               reg = <0x0780000 0x1680000>;
>                                 };
> -                       spare1@D00000 {
> -                               label = "spare1";
> -                               reg = <0x0D00000 0x200000>;
> -                               };
> -                       spare2@0F00000 {
> -                               label = "spare2";
> -                               reg = <0x0F00000 0x200000>;
> -                               };
> -                       spare3@1100000 {
> -                               label = "spare3";
> -                               reg = <0x1100000 0x200000>;
> -                               };
> -                       spare4@1300000 {
> -                               label = "spare4";
> -                               reg = <0x1300000 0x0>;
> +                       rwfs@1e00000 {
> +                               label = "rwfs";
> +                               reg = <0x1e00000 0x200000>;
>                         };
>                 };
>         };
> --
> 2.30.0.478.g8a0d178c01-goog
>
