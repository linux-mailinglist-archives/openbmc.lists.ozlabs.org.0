Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105838BAB8
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 02:12:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmRr33Wytz3bvX
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 10:12:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qN+O3tvf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qN+O3tvf; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm7W95v3nz301X
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 21:56:37 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id d14so14480051ybe.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XtLuHF6z7UgNsxkYSCkrtjLaJueixWRiunK7AUVux9A=;
 b=qN+O3tvfeSsZLPGFWfKsDD0t5wX8hic7UDaqW1PTbFTiqWkCLKVuSEV20edtQIPjAN
 8ahdsffMecVwLQb3sOhht8+/1v+oz1Zu8ehQQzsaMEztz3EMLx4kWewmjns3nhkmuS7O
 NQTWiNgdD0u6FEpGf/rStUS76awzCsjKTGlh+T3YZa9xYU2dWZePF54jPlXiTMxtl4HX
 JVP+M78fgBC6X9Nr7Si86QsYWe3V8FZrsQC7c0KVsu5KxByI/VFo6klM+Jkgs6IZVgJL
 a20AQFnnlNo/LbVdAS2LvnQ59cfbF8WNhHgcHetXpQWZ19EH4hUqT78Ilaq3ruc3WVFG
 TTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XtLuHF6z7UgNsxkYSCkrtjLaJueixWRiunK7AUVux9A=;
 b=YKngnUuV5BEhFWHElXAaYkb/fQ0T51dHjWusLfmMqQvsMXrXoUbfDPghgfCk7gPf4d
 xNsL8u9a9RKb914DqZXtViq+yJpxx0exFv9BvlaXVGDcghPMHjCKgFFADgr4GWhD/aM4
 FYiM64TLAyuS1dX5b0azjmr2oLmgA8LVyJQjZdnAleiUVm0MAJTAaFcTknl7fW/VZ4nc
 aF/6d4qOWW/fsHv1rrLV93Dhe/3ihFIiHs6+OtxNBn8T/BjGaoRttFXcFkxtl6YzS0TK
 JGIA0ITJ+6RXoO1eif/CPOS667PL+xcQG9Au2HM3HzFkleLBkwt1yDBHatVHZKD2CzHd
 wHHA==
X-Gm-Message-State: AOAM530o/cAl24YhBkzMocwfyTAdthgw3KEuhA4Puc5+OEgLrVVOPhNx
 PJDmzXyHmGNgdwp2MO639TRIqDxmcinKFAcbC78=
X-Google-Smtp-Source: ABdhPJyBD0p/eM/csawKlA4Hsro6iMvr3JZ8tWIUdHs2En0vB/vTvHKG4rvyyV4uxcS/JoDMWwqONzeiIMIRTk4DXg4=
X-Received: by 2002:a25:b112:: with SMTP id g18mr6696595ybj.281.1621511795095; 
 Thu, 20 May 2021 04:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210520093949.511471-1-andrew@aj.id.au>
In-Reply-To: <20210520093949.511471-1-andrew@aj.id.au>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 20 May 2021 13:56:24 +0200
Message-ID: <CAKXUXMy0CziXXHJBzz8bJBj-wE0f6L1JSK2KuHwBzkbk_F+4iA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: checkpatch: Tweak BIT() macro include
To: Andrew Jeffery <andrew@aj.id.au>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 May 2021 10:10:39 +1000
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
Cc: Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 openbmc@lists.ozlabs.org, Jiri Slaby <jirislaby@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 11:40 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> While include/linux/bitops.h brings in the BIT() macro, it was moved to
> include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
> Move some macros from <linux/bitops.h> to a new <linux/bits.h> file").
>
> Since that commit BIT() has moved again into include/vdso/bits.h via
> commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
>
> I think the move to the vDSO header can be considered an implementation
> detail, so for now update the checkpatch documentation to recommend use
> of include/linux/bits.h.
>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Acked-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>


Acked-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Jonathan, can you please pick this patch into your doc-next tree? Thanks.

Lukas

> ---
>  Documentation/dev-tools/checkpatch.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index 51fed1bd72ec..59fcc9f627ea 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -472,7 +472,7 @@ Macros, Attributes and Symbols
>
>    **BIT_MACRO**
>      Defines like: 1 << <digit> could be BIT(digit).
> -    The BIT() macro is defined in include/linux/bitops.h::
> +    The BIT() macro is defined via include/linux/bits.h::
>
>        #define BIT(nr)         (1UL << (nr))
>
> --
> 2.30.2
>
