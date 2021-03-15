Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E01D33C97A
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 23:42:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzrz509LYz309x
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 09:42:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pkx1fE7X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=dz4list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pkx1fE7X; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzrys2MXPz2yx4
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 09:42:28 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso383805wmi.0
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 15:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIvKSy1uJotrNjS9ZZWFMe/DaLqAli7e6g6zMPeG4hA=;
 b=pkx1fE7X4wELL0vbARr0mkXe1N36VYkJ9m8TZLbnaYWvjRlp20hyUHsExjjm8nsabh
 00/GVbLdTdFEieUmLFmRRsut7VjfCvgsoWZpc5kF89i3ds65rGSSrxb1g1kyCSXROJen
 oH2zoGOyx7pGIBUhocbIS7JREtO5i70ZIyn0fqSMV5t5me2EXFwquWDPATKZn+zeg3tb
 Ookk/Kfn96roA+zE+2nU5PX0+gMhYiv4jdEawSy6dif+cXkTLPXYefFBLhCkhRQza6+p
 gn2csCGpCwVc7iO2b1+GaWU+Wby8eSQ5oWO0wtJj4lVV8l+12O2RWa5113Du5FUPeJED
 5Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIvKSy1uJotrNjS9ZZWFMe/DaLqAli7e6g6zMPeG4hA=;
 b=gEyF+Haf5+31gAvDICN9++puhhNsfSoWZQFFRiLSC8DjUmSFgnXDrDiz/RCciV2d3m
 94XPnP5c2Fuk6FkUGEzUnyhALoPkjtkJA2JesT1eKdWN5q8uk4r31jwVSMr/JP1R3iTJ
 bOyI3iT+005xYRzj5Nkjqkn/WO8fie6hFlleUgyumAseVdpIrjrbAgZLaJLeKbfMUque
 l8uR6UgComuNkbZqBk5QXar/SXVOzYsZEFS0Py7b9H8smgBPlADILumXzOrL+vbSYbQq
 dxh5mGydMf+m3idEZ/DXf4Gq3HKpjYk4AuXybTaqq999nWJSTWgTypsjp1D9joz/UmvF
 GhxQ==
X-Gm-Message-State: AOAM532jWWqytXRnxxp0hT9az/tIJQ+BM0fVOyrwQ7zffk4xTbj+ARr3
 JiHg9A6X8ExeJIQEeSExR9IhEmEmUWKJxzSCy5U=
X-Google-Smtp-Source: ABdhPJy3nXmUtlfQ+PAMRouqquIVDdZi53jeqNIdy2JScQLLC5kxNuSQIs1qgupWV5SZLRKAv0d1um6Hu9ChMqlBA9U=
X-Received: by 2002:a05:600c:2cd8:: with SMTP id
 l24mr1736968wmc.88.1615848138237; 
 Mon, 15 Mar 2021 15:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.866.1615827526.26598.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.866.1615827526.26598.openbmc@lists.ozlabs.org>
From: Dan Zhang <dz4list@gmail.com>
Date: Mon, 15 Mar 2021 15:42:07 -0700
Message-ID: <CAJxKyLc5AMqAUS8CmyJVH0-EYVo3S=CR+vY21p==PEXGhZtOuw@mail.gmail.com>
Subject: Re: [PATCH 3/4] u-boot: Use a different Key for SPL signing
To: openembedded-core@lists.openembedded.org
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
Cc: andrew@aj.id.au, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Klaus,

Can we make the patch not only support sign u-boot fitimage with
different key, but also allow sign later?
Similar to kernel-fitimage.bbclass::fitimage_assemble(), step 1~6
create a "sign-able"  fit-image and step 7 do the sign.

Can we add a new control variable i.e. DO_UBOOT_SIGN which control
whether we sign the image during build time.

It is desired to be able to "just sign" the "sign-able" image with
"any key" later, instead of need rebuilding the whole image.
i.e. Create a signing service, which can accessing to the official
production key, to sign the image. We don't want to have this signing
service setup complex building environment and rebuild the image.

BRs
Dan Zhang

> From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> To: openembedded-core@lists.openembedded.org
> Cc: joel@jms.id.au, andrew@aj.id.au, openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> Bcc:
> Date: Mon, 15 Mar 2021 13:58:05 -0300
> Subject: [PATCH 3/4] u-boot: Use a different Key for SPL signing
> Duplicate the variables governing u-boot signing so that we can have a
> different set of keys/parameters signing the SPL.
>
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>  meta/classes/uboot-config.bbclass |  2 ++
>  meta/classes/uboot-sign.bbclass   | 55 ++++++++++++++++++++++++-------
>  2 files changed, 46 insertions(+), 11 deletions(-)
>
> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
> index 31487c1418..3bba02828b 100644
> --- a/meta/classes/uboot-config.bbclass
> +++ b/meta/classes/uboot-config.bbclass
> @@ -61,6 +61,7 @@ UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
>
>  # Options for the device tree compiler passed to mkimage '-D' feature:
>  UBOOT_MKIMAGE_DTCOPTS ??= ""
> +SPL_MKIMAGE_DTCOPTS ??= ""
>
>  # mkimage command
>  UBOOT_MKIMAGE ?= "uboot-mkimage"
> @@ -68,6 +69,7 @@ UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
>
>  # Arguments passed to mkimage for signing
>  UBOOT_MKIMAGE_SIGN_ARGS ?= ""
> +SPL_MKIMAGE_SIGN_ARGS ?= ""
>
>  python () {
>      ubootmachine = d.getVar("UBOOT_MACHINE")
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> index 86380f2234..2ec93e0b8e 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -59,27 +59,34 @@ SPL_NODTB_IMAGE ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${
>  SPL_NODTB_BINARY ?= "u-boot-spl-nodtb.bin"
>  SPL_NODTB_SYMLINK ?= "${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[0]}-nodtb-${MACHINE}${@os.path.splitext(d.getVar("SPL_BINARYNAME"))[1]}"
>
DO_UBOOT_SIGN ?= "1"
> -# fitImage Hash Algo
> +# Kernel / U-Boot fitImage Hash Algo
>  FIT_HASH_ALG ?= "sha256"
> +UBOOT_FIT_HASH_ALG ?= "sha256"
>
> -# fitImage Signature Algo
> +# Kernel / U-Boot fitImage Signature Algo
>  FIT_SIGN_ALG ?= "rsa2048"
> +UBOOT_FIT_SIGN_ALG ?= "rsa2048"
>
> -# Generate keys for signing fitImage
> +# Generate keys for signing Kernel / U-Boot fitImage
>  FIT_GENERATE_KEYS ?= "0"
> +UBOOT_FIT_GENERATE_KEYS ?= "0"
>
> -# Size of private key in number of bits
> +# Size of private keys in number of bits
>  FIT_SIGN_NUMBITS ?= "2048"
> +UBOOT_FIT_SIGN_NUMBITS ?= "2048"
>
>  # args to openssl genrsa (Default is just the public exponent)
>  FIT_KEY_GENRSA_ARGS ?= "-F4"
> +UBOOT_FIT_KEY_GENRSA_ARGS ?= "-F4"
>
>  # args to openssl req (Default is -batch for non interactive mode and
>  # -new for new certificate)
>  FIT_KEY_REQ_ARGS ?= "-batch -new"
> +UBOOT_FIT_KEY_REQ_ARGS ?= "-batch -new"
>
>  # Standard format for public key certificate
>  FIT_KEY_SIGN_PKCS ?= "-x509"
> +UBOOT_FIT_KEY_SIGN_PKCS ?= "-x509"
>
>  # Functions on this bbclass can apply to either U-boot or Kernel,
>  # depending on the scenario
> @@ -280,6 +287,32 @@ do_generate_rsa_keys() {
>                                 -out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
>                 fi
>         fi
> +
> +       if [ "${SPL_SIGN_ENABLE}" = "0" ] && [ "${UBOOT_FIT_GENERATE_KEYS}" = "1" ]; then
> +               bbwarn "UBOOT_FIT_GENERATE_KEYS is set to 1 eventhough SPL_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
> +       fi
> +
> +       if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${UBOOT_FIT_GENERATE_KEYS}" = "1" ]; then
> +
> +               # Generate keys only if they don't already exist
> +               if [ ! -f "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key ] || \
> +                       [ ! -f "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".crt ]; then
> +
> +                       # make directory if it does not already exist
> +                       mkdir -p "${SPL_SIGN_KEYDIR}"
> +
> +                       echo "Generating RSA private key for signing U-Boot fitImage"
> +                       openssl genrsa ${UBOOT_FIT_KEY_GENRSA_ARGS} -out \
> +                               "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key \
> +                               "${UBOOT_FIT_SIGN_NUMBITS}"
> +
> +                       echo "Generating certificate for signing U-Boot fitImage"
> +                       openssl req ${FIT_KEY_REQ_ARGS} "${UBOOT_FIT_KEY_SIGN_PKCS}" \
> +                               -key "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key \
> +                               -out "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".crt
> +               fi
> +       fi
> +
>  }
>
>  addtask generate_rsa_keys before do_uboot_assemble_fitimage after do_compile
> @@ -292,9 +325,9 @@ uboot_fitimage_assemble() {
>         uboot_dtb="${3}"
>         uboot_bin="${4}"
>         spl_dtb="${5}"
> -       uboot_csum="${FIT_HASH_ALG}"
> -       uboot_sign_algo="${FIT_SIGN_ALG}"
> -       uboot_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> +       uboot_csum="${UBOOT_FIT_HASH_ALG}"
> +       uboot_sign_algo="${UBOOT_FIT_SIGN_ALG}"
> +       uboot_sign_keyname="${SPL_SIGN_KEYNAME}"
>
>         rm -f ${uboot_its} ${uboot_bin}
>
> @@ -349,7 +382,7 @@ EOF
>         # Assemble the U-boot FIT image
>         #
>         ${UBOOT_MKIMAGE} \
> -               ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> +               ${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
>                 -f ${uboot_its} \
>                 ${uboot_bin}
>
> @@ -357,11 +390,11 @@ EOF
>         # Sign the U-boot FIT image and add public key to SPL dtb
>         #
if [ "x${DO_UBOOT_SIGN}" = "x1" ] ; then
>         ${UBOOT_MKIMAGE_SIGN} \
> -               ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> -               -F -k "${UBOOT_SIGN_KEYDIR}" \
> +               ${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
> +               -F -k "${SPL_SIGN_KEYDIR}" \
>                 -K "${spl_dtb}" \
>                 -r ${uboot_bin} \
> -               ${UBOOT_MKIMAGE_SIGN_ARGS}
> +               ${SPL_MKIMAGE_SIGN_ARGS}
>
fi
>  }
>
> --
> 2.25.1
>
>
