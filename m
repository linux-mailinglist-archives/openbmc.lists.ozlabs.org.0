Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077C378C50
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 14:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff0s62CnCz3036
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 22:35:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=p21p5GYM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p21p5GYM; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff0rr1CL3z2xv8
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 22:35:37 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id h4so23158248lfv.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pqQBts0ODhA92hm3MB8OjzptbtGC+ihrqRtbHG7sVXw=;
 b=p21p5GYMrcSjHSGmiskc8Q3alQtgTWaHIOtRClPQ8u0x05D6NiCK4xu/ajtEro8mNn
 PdxPhx9sV464RdvJYGUpSLGrVUxxsGJR+HKIlEFrI/zYl29AF2uf0O/D9uvXKVXoyZ94
 ex9ePliUHc7CkPWbm7ASw0htwBO5OMLP3nfDJ9jkUCtKV7ZmK/KvesKWwAR5GD0xq6MI
 YpDEVVv3QRIcUlrB5T9osuYgmpHpYJBwusQZFRO4DdPQ2Qq4PQP5me6/KstWgidNUah5
 9BnQB0zFlzfS6akQeIPAv4/whU+FH1ic0mXg1KqUcr5RjbkOFNa7HZe75lx0VdnogPjq
 5i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pqQBts0ODhA92hm3MB8OjzptbtGC+ihrqRtbHG7sVXw=;
 b=GItbFwaUN6VXiuyAqgD5GnJOV0h3D/fza89qtT5j74mrzsjCr1Ot4/urGkZB149uMq
 Mp/UPdG/Ca6ARrA0lZWDuzH2Nk/DhINv8cySju8On7wYUtjz9I+fsajSKZR5/ODuVvdx
 +xP6xSYB2LqE/PjspWurNirFnvXEa9fZBkWSoUa/5MeQsd/+FgdAogdjLQlptUG0hsxG
 37/LrMtf0rD1YaLT/O326pkSE6RINq860AwGT+WpYtHhTcGxEP2lU6kzf6P2NX/FPMYu
 36+WFSF69jrO8KhqtV8fNqYHEO/y4v+sSTh1OZjExuEZZgl7SBeTPw7+uMzbHzlXoanu
 VD9w==
X-Gm-Message-State: AOAM533RvDhS0I3lN8NmJb5Nb9JCr6bBu5EA6Qb0heErqlfAph+tl4bx
 gTDBMcJSLRBg6z3Yr2OlwJte/ZqoSGlKm90GEg==
X-Google-Smtp-Source: ABdhPJwS/kyCvvJoneMwFlct9z1xQJQwExi8EAR6IhiIrla67b7o8XgStqu9hm9rlL1d8vFgpk5gTks6Lky4wu6wnrQ=
X-Received: by 2002:a05:6512:3d8f:: with SMTP id
 k15mr17351613lfv.227.1620650133533; 
 Mon, 10 May 2021 05:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210508113342.94457-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210508113342.94457-1-j.neuschaefer@gmx.net>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 10 May 2021 15:35:22 +0300
Message-ID: <CAKKbWA4dJgjeKjY1MeLdpE0VV=ugKr7yMiC_5yn-9VXWtU3z6A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Nuvoton NPCM: Add myself as reviewer
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, May 8, 2021 at 2:35 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Nuvoton NPCM7xx SoCs share a lot of the hardware design with Nuvoton
> WPCM450. I'm adding myself as a reviewer, so I don't miss patches that
> affect both NPCM7xx and WPCM450.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 661770e8e6fc1..78f9df2b6cd20 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2184,6 +2184,7 @@ M:        Tali Perry <tali.perry1@gmail.com>
>  R:     Patrick Venture <venture@google.com>
>  R:     Nancy Yuen <yuenn@google.com>
>  R:     Benjamin Fair <benjaminfair@google.com>
> +R:     Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
>  F:     Documentation/devicetree/bindings/*/*/*npcm*
> --
> 2.30.2
>


--=20
Regards,
Avi
