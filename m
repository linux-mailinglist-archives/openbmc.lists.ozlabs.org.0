Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D13305F7
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 03:52:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dv2tS4RyZz3cLZ
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 13:52:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vRzy0W3i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=dz4list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vRzy0W3i; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dv2tD3BLyz30LP
 for <openbmc@lists.ozlabs.org>; Mon,  8 Mar 2021 13:51:45 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id w11so9827216wrr.10
 for <openbmc@lists.ozlabs.org>; Sun, 07 Mar 2021 18:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5tBF6vkKwqewhOD+akMQkvVSMkRK7/ADG+UVz63SCKE=;
 b=vRzy0W3iZ5AlvCldYmXR/rrd3u49z50RXKb/LtiZ3h35SW1X3rSfbJI+u3eQZsmZqE
 vUtmTy3rlfYizbiQWRzgIogZ4Ph2zXSH0AYZj2Ici31WsrdTQIE713mx1WinCh2BMTpR
 wpuk5UNzYudtNNDKVtkdZhx1Oiy9+qBi7UE0woe6iPSDXOrB7vosUZmODGLoCQONHAce
 rO65bf6wib+EtCyYJSRGS8cbXPDWrhlF8bSsbRGk2fXPdN32EyqG+tu8ycwsVcCcV1Fj
 Uov3gpGlQVLGpI976H3vy8HzZRnPGTNnmaOyE2r4zH3Tt0jbAmOZ6MY5SoGknwTapMRe
 ImQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5tBF6vkKwqewhOD+akMQkvVSMkRK7/ADG+UVz63SCKE=;
 b=buepMd8ZjHzZvbJlmG8H/NzwKo0nDoV8rZzuKBMQIIPQEQeEGouf49qtjEYlFlZxkR
 5wWZcG9o2GrCBEu4Z9zKZyWWsbR4IPsNiUQ8CAPn1hGAwUuaG++Tc3TY/cTjaAuEd8ue
 KwpCKjdBkpMv4sLW727ElZ9EFQ55QY7BNuSoKesnCRFnO+vepB3zxetinGMZwN0NE4c7
 0+awD0MvuFEMyo/2eInlLklJ31WGlRZ4UYAK7Nqbz8smdfFQy7vqy4Ybt9Lu3e7rrrJi
 v221i965ucTIKFnbwc8oUFL4HItFWfLtbIaixo71KIWOZrm5DDNvFxw5ivIfN6bBN/ZG
 +Q9w==
X-Gm-Message-State: AOAM530iOt101UtKE45YFcj1dYtK7xZWwIu0bPQTTQFJKEkad3Lel7kk
 Qek98Bp9UFHwPTGDz9SRVaw5PZZSYnDcPF5EntZfLYxJJo0=
X-Google-Smtp-Source: ABdhPJwPaR8xmBNZ49Tm8VhrSAj8o8Rm+DUVqcdHV+tjw5RCJEsrVoXnw260dytN4BTp7aIlZTiTP/auvWmx31FcMBU=
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr20491246wri.373.1615171897694; 
 Sun, 07 Mar 2021 18:51:37 -0800 (PST)
MIME-Version: 1.0
From: Dan Zhang <dz4list@gmail.com>
Date: Sun, 7 Mar 2021 18:51:26 -0800
Message-ID: <CAJxKyLed1p-WbcEOZjZ67r61QeEYZ7LBK8xSRDWNNr21pvaMbw@mail.gmail.com>
Subject: Re: [oe-core][RFC 0/3] u-boot: Support SPL Verified Boot
To: openbmc@lists.ozlabs.org
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

Hi Klaus,

Thank you very much for providing this solution to build and sign
u-boot fit-image.

I have one suggestion: decouple the U-Boot fit build and signing.

UBOOT_FIT ==> Create the uboot fit-image (essentially all your
proposal did, except the latest sign step in uboot_fit_assemble())
SPL_SIGN_ENABLE ==> create the uboot fit-image, also sign it.

This similar to kernel_fit means create the kernel fitimage, while
UBOOT_SIGN_ENABLE means sign it.

This will allow the user to use a simple script to sign an unsigned
image with any key, w/o need to be able to tweak the recipe and
rebuild the image.
i.e. the manufacturing team, the testing team.

BRs
Dan Zhang

> From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> To: openembedded-core@lists.openembedded.org
> Cc: joel@jms.id.au, andrew@aj.id.au, openbmc@lists.ozlabs.org
> Bcc:
> Date: Sat,  6 Mar 2021 08:28:19 -0300
> Subject: [oe-core][RFC 0/3] u-boot: Support SPL Verified Boot
> This patch series aims at extending U-Boot's verified boot support to
> also include SPL signing.
>
> The proposal is to some of the infrastructure (variables, functions)
> used to sign the Kernel FitImage to more common locations, and then
> essentially duplicate the method currently used to sign the Kernel
> fitImage to also sign the U-Boot fitImage.
>
> In the UBOOT_SIGN_ENABLE = "1" scenario, nothing really changes: The
> Kernel fitImage is created, then signed, and the pubkey is added to
> u-boot.dtb which is concatenated with the u-boot-nodtb.bin to create the
> u-boot final image.
>
> In case SPL_SIGN_ENABLE = "1", The U-Boot PN will take care of (re-)
> creating the U-Boot fitImage (using custom .its script) after compile,
> sign it, and contatenate the u-boot-spl.dtb (with the public key) with
> u-boot-spl-nodtb.bin to create the final U-Boot SPl on deploy.
>
> In case both UBOOT_SIGN_ENABLE and SPL_SIGN_ENABLE are set, the Kernel
> PN will take care of creating and signing the U-Boot fitImage (becase we
> need to also sign the FDT image containing the Kernel pubkey), and take
> care of deploying it.
>
> I tested all three scenarios using OpenBMC upstream, and although there
> might be some areas of improvement (like deploying the new binaries and
> symlinks with more useful names), it appears to work well.
>
> One caveat is that when moving between the scenarios above, the user
> might need to remove the tmp/ directory, since there could be a
> collision for some of the files deployed into the images directory,
> since the configuration may determine which PN does that.
>
> Reviews, thoughts and comments are very very welcome,
>
> Thanks,
>
>  -Klaus
>
