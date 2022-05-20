Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A552E27E
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 04:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L49ht6tB6z3bff
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 12:31:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q69QJAXM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=q69QJAXM; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L49hW2rxmz2xKj
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 12:31:22 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id b32so8223362ljf.1
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 19:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4K3/H4TcsWiICjtjAzpXHxRhVd4rvAY9pu0lXYepp9Y=;
 b=q69QJAXMiVUP3LAmCEiU2tFX2Y/1D4c3xg9c/FaYVZEG7xZ5SrnVOxSJOzaEFIcHjg
 waOZGIkhjZU/wLDWMV3aocB77TOjyH+DQA0vPuggdBcAaGMdXEqp9X6skgHdUR10G8if
 dKjP0Dd1ZPhX3TdZJa2yc0bBkPf0bCwBaaPJWA9n9Y3iDBQ2eE5OK0JGWnYWSs5FY2fS
 9WkCXW7ZL7TPaiu/A8NwcSJyiydNV4bPEmBZE/Gujh/je4AYYarYFoIdk3egxphnFLPx
 cEl8Uefpx+AybA5x8NsUwXFGVulLDwNj8Kz9ytV5YCh3/yxkIijKDtCoAdDzwHtareV9
 D3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4K3/H4TcsWiICjtjAzpXHxRhVd4rvAY9pu0lXYepp9Y=;
 b=DqZkEilXQcPDWAPVm3a9lFwjAAyxuUEGZJ8ZqWNKYLb5eGM9lffaoIIH0+UWWRZVmx
 qHkqpMItuVU2ZclWmbsmO5kjdNsR5gpBTF7Uka8PHQ2AXR7vTIWmHOraTWn5woi9ZQMg
 y4xSs4lY1hnXm0DsJoCvxG1hrkcIZmLAGu6+Ykr5NksdNG+dB51lPokCtJgscCNcLldB
 unU7ygu+PkoSYasSEV8tMFLvSZC+RwKClVdkO28ma11WoApCuQhUdsGAQCXngsP1Z1LD
 bXiE6yKo3mphZj3Tsd9XcAQUgHAvVdph1bqUZEKyW9CubuqCVoOZhx6IO4wriHfCFH5f
 6+bw==
X-Gm-Message-State: AOAM533PWRQUqOs2yUFQgEcTQ7hnOsmPXxxPZhoU78+XTnnnkJi2GeM/
 lEyzOux6uLXP+R35Jx3WPCdlpVL3uTnmRatskOQ=
X-Google-Smtp-Source: ABdhPJzbJc3lipjGIY3YARcqBDA6+gKxe5BWxGiB9P7PGYHZu5lU7udIPhLjNFQfn6JA8kKxMeJhForJVBoaRyqDu1A=
X-Received: by 2002:a2e:a602:0:b0:253:d7e2:4d8a with SMTP id
 v2-20020a2ea602000000b00253d7e24d8amr2661606ljp.284.1653013876956; Thu, 19
 May 2022 19:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-2-ctcchien@nuvoton.com>
 <YoUwe6Tj4Uh6ukc8@zn.tnic>
 <CAHpyw9fjThEP4NuU08aNJ_raHpq9-j9KgBb8YuZ_shXTjhm3JA@mail.gmail.com>
 <YoYPGWreQuF9QZzc@zn.tnic>
In-Reply-To: <YoYPGWreQuF9QZzc@zn.tnic>
From: Medad Young <medadyoung@gmail.com>
Date: Fri, 20 May 2022 10:31:05 +0800
Message-ID: <CAHpyw9es-n+bW9SsGBmmr3ghBFk8Q8E6ZTbE42BpU-6p8LfHtw@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] ARM: dts: nuvoton: Add memory controller node
To: Borislav Petkov <bp@alien8.de>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Borislav,

Borislav Petkov <bp@alien8.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=8819=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:34=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, May 19, 2022 at 08:55:53AM +0800, Medad Young wrote:
> > OK, I got it.
>
> Are you sure you did get it?
>

for the second warning, I did upadate my .git/config according to your advi=
se.
but I thought I met orthe problem, I will try to fix it

for the first warning, did I really need to fix it?

> $ ./scripts/checkpatch.pl /tmp/medad-v10-1-3.patch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #29:
> new file mode 100644
>
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Medad CChien=
 <medadyoung@gmail.com>' !=3D 'Signed-off-by: Medad CChien <ctcchien@nuvoto=
n.com>'
>
> total: 0 errors, 2 warnings, 62 lines checked
>
> Before sending, you should really run checkpatch on your patches.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

thanks
B.R.
Medad
