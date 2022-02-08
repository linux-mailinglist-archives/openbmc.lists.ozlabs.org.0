Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D16A14AD156
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 07:04:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtCC93tVcz30Qq
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 17:04:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=j0cTA1Uy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=j0cTA1Uy; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtCBm1dyzz30Ds
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 17:04:14 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id d3so7599566qvb.5
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 22:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWQ1BZ7bw+zVzFJkhx0Q/ujI/Fj1ONr2nv+/pdxlucI=;
 b=j0cTA1UyNIdveiN2qMcoKT1gjG5tbeLmmda1GDzfGb28UDUqEIbwzckC0cALDPGXwa
 wZ8e4N9u85EVGeubPmGehoOUHlzvZL8IDpbA2swK9twcJXM4ReZsndhiXgwnXw/jPfxK
 d1u/RYFzNsmDgwlAWXOsJ2ww6JgaUCh06T0R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWQ1BZ7bw+zVzFJkhx0Q/ujI/Fj1ONr2nv+/pdxlucI=;
 b=LtsFOAcrsUg8fhHySEdmN+yg+tLCUj6pwj7L270EFuMXqH7XXv6anyhJC3BeEBlswJ
 tppw13M5wHjNmpvdMUeUZd0ZO6o9rrk6NGohW6/iged9OEc/D+CYITICJRTR7+sU0Rwr
 Adm7n46MK0EeYWzPae4mIKPXuyO4rnZv3EdKFcD+56ZsZilI2bGkaH3Y0TW7aCUSdElo
 /sbZf2QNsN9smuwtZ0tcWZS9fMygVNS2KBuHcM26sylY/V7tQe1hKBQri167/ccMTzzK
 xWFhvPvQSsx2fO1fx5EquNIMvmjfrl4rCjOORSYkdupziHRJyN7W8RJ7uHp4g5fH64DH
 T4Xw==
X-Gm-Message-State: AOAM5324YmbSmpKU8h1hAW7JErmB2iRuc7RnKPMwsgDwAj/u/QZt+EPr
 DTbQo9orFkhnZ1kScQWbfdo4SQl0B8geTb2iUk4=
X-Google-Smtp-Source: ABdhPJw+ynuscCml0gRuNZwZt1H9yrickhxffg26IPN0JscyClNoM9Q6F4qsn0lTmMfu18KD4tlG5zKpNZx0HIyF/lI=
X-Received: by 2002:ad4:5ca5:: with SMTP id q5mr2052212qvh.107.1644300250536; 
 Mon, 07 Feb 2022 22:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20220131012538.73021-1-andrew@aj.id.au>
 <20220131012538.73021-3-andrew@aj.id.au>
In-Reply-To: <20220131012538.73021-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Feb 2022 06:03:57 +0000
Message-ID: <CACPK8XcY=afrQ9bE2A3q1tC8Hhxmx3oVM7k_C_fVoYGbLJ4OUg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/6] image: Control FIT
 uImage signature verification at runtime
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 31 Jan 2022 at 01:26, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Some platform designs include support for disabling secure-boot via a
> jumper on the board. Sometimes this control can be separate from the
> mechanism enabling the root-of-trust for the platform. Add support for
> this latter scenario by allowing boards to implement
> board_fit_image_require_verfied(), which is then invoked in the usual
> FIT verification paths.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Kconfig            |  9 +++++++++
>  common/image-fit.c | 17 +++++++++++++++--
>  include/image.h    |  9 +++++++++
>  3 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/Kconfig b/Kconfig
> index c3dfa8de47c8..11f796035ae4 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -322,6 +322,15 @@ config FIT_SIGNATURE
>           format support in this case, enable it using
>           CONFIG_IMAGE_FORMAT_LEGACY.
>
> +if FIT_SIGNATURE
> +config FIT_RUNTIME_SIGNATURE
> +       bool "Control verification of FIT uImages at runtime"

Can you follow the pattern of the other FIT_ options by making this
depends on FIT_SIGNATURE?

> +       help
> +         This option allows board support to disable verification of
> +         signatures at runtime, for example through the state of a GPIO.
> +endif # FIT_SIGNATURE
> +
> +
>  config FIT_SIGNATURE_MAX_SIZE
>         hex "Max size of signed FIT structures"
>         depends on FIT_SIGNATURE
> diff --git a/common/image-fit.c b/common/image-fit.c
> index 3c8667f93de2..eb1e66b02b68 100644
> --- a/common/image-fit.c
> +++ b/common/image-fit.c
> @@ -1199,6 +1199,14 @@ static int fit_image_check_hash(const void *fit, int noffset, const void *data,
>         return 0;
>  }
>
> +#ifndef __weak
> +#define __weak
> +#endif

Shouldn't we always get this from linux/compiler.h?

> +__weak int board_fit_image_require_verified(void)
> +{
> +       return 1;
> +}
> +
>  int fit_image_verify_with_data(const void *fit, int image_noffset,
>                                const void *data, size_t size)
>  {
> @@ -1209,6 +1217,7 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
>
>         /* Verify all required signatures */
>         if (IMAGE_ENABLE_VERIFY &&
> +           fit_image_require_verified() &&
>             fit_image_verify_required_sigs(fit, image_noffset, data, size,
>                                            gd_fdt_blob(), &verify_all)) {
>                 err_msg = "Unable to verify required signature";
> @@ -1230,7 +1239,9 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
>                                                  &err_msg))
>                                 goto error;
>                         puts("+ ");
> -               } else if (IMAGE_ENABLE_VERIFY && verify_all &&
> +               } else if (IMAGE_ENABLE_VERIFY &&
> +                               fit_image_require_verified() &&
> +                               verify_all &&

reading through this it's quite confusing.

We have IMAGE_ENABLE_VERIFY, a compile time constant that will be true
if CONFIG_FIT_SIGNATURE is enabled.

We're adding a function that will override this.

So we could have a function:

__weak bool fit_enable_verification(void)
{
   return IMAGE_ENABLE_VERIFY;
}

The downside of this would be if a board were to implement this but
not have FIT_SIGNATURE enabled then they could return true when they
shouldn't. You could go back to this:

static bool fit_enable_verification(void)
{
   return IMAGE_ENABLE_VERIFY && board_fit_image_require_verified();
}

And drop the ifdefs from image.h

>                                 !strncmp(name, FIT_SIG_NODENAME,
>                                         strlen(FIT_SIG_NODENAME))) {
>                         ret = fit_image_check_sig(fit, noffset, data,
> @@ -1849,7 +1860,9 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
>                 if (image_type == IH_TYPE_KERNEL)
>                         images->fit_uname_cfg = fit_base_uname_config;
>
> -               if (IMAGE_ENABLE_VERIFY && images->verify) {
> +               if (IMAGE_ENABLE_VERIFY &&
> +                               fit_image_require_verified() &&
> +                               images->verify) {
>                         puts("   Verifying Hash Integrity ... ");
>                         if (fit_config_verify(fit, cfg_noffset)) {
>                                 puts("Bad Data Hash\n");
> diff --git a/include/image.h b/include/image.h
> index 937c7eee8ffb..19ea743af08f 100644
> --- a/include/image.h
> +++ b/include/image.h
> @@ -1103,6 +1103,15 @@ int calculate_hash(const void *data, int data_len, const char *algo,
>  # define IMAGE_ENABLE_VERIFY   0
>  #endif
>
> +/*
> + * Further, allow run-time control of verification, e.g. via a jumper
> + */
> +#if defined(CONFIG_FIT_RUNTIME_SIGNATURE)
> +# define fit_image_require_verified()  board_fit_image_require_verified()
> +#else
> +# define fit_image_require_verified()  IMAGE_ENABLE_VERIFY
> +#endif
> +
>  #ifdef USE_HOSTCC
>  void *image_get_host_blob(void);
>  void image_set_host_blob(void *host_blob);
> --
> 2.32.0
>
