Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEE933C878
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 22:32:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzqPg6lClz304V
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 08:32:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sXyKvUXN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=dz4list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sXyKvUXN; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzqPS09Qvz2y8D
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 08:31:54 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id p19so17216wmq.1
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 14:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rJepfIdUB/WL2IvyCG36WHAeT4qWzqRIzm1vdJ3UsxM=;
 b=sXyKvUXNKdw60oxPSVd8aYKSgs1jcBqFUdJ5t96FDrNM2CdQ1ds4VVuVmEiQGkvFsF
 vCsxwWAt/ZMJAnWRZWSOUby0F+qLLhahB/A++VT7yNrT3rqRzT5mpGSX23VgitLtqgI8
 VhWRNUVsAR4PHdX6ZwGsJOKXybRuxC7ewLN/e6rueXSv4B/iWLG+ThId9CzPDTw7esSh
 LCsFlSqSlrq4DoQU6koeA6qVLntZCqBLfqZFadE1v0jg4+QpMUdIVbftI08aR3q01ply
 dwEdib7M643DyhX5PLnl8LKmDORjDYPGX+mZ3KdK1AqncUN1blboG54lb0cN28J+uSms
 ox3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rJepfIdUB/WL2IvyCG36WHAeT4qWzqRIzm1vdJ3UsxM=;
 b=P6URs9dSGVI3abQhJeoOWqYyhJVqRv60rrequfQEVnlGFQAwN878wa538Kv1NZBOIC
 TgbtpYgyBaIkqk3q/tvOYPXdkLMOWfHHGGsY2AVHvxd9NADWJs3+i5BTNbYWWMBzBplz
 oNZk2Yzn13sDxego5/jOMHtHdvN9ZZO6la3U1g6vixX88rNMsALivJmphu1JCJCer0D0
 1IIDVomx3UWNoUcHh4WUOpy5Yxg0mTYGg7XRViNkFAYvHOsMOeUmETwWBFX+fNJ3Mts8
 1wN2JVjFI5ZfAoyb2k/eId6RwjYwVMsBOms9vjSTDyYU5hVfqHtoasY6D0vg4oaBNWHe
 GzRg==
X-Gm-Message-State: AOAM533az6kryg8gkRuTwpGXZcp8AJlzIKo/UJGxYIGX8EVMku8q7YHl
 ha7B0DUcLh6NqrpOUbfdXYlAUMcx+WtA6enNA1E=
X-Google-Smtp-Source: ABdhPJzREq+Mh6/fVgqKtzd1N4lyU/APULb+GCQF4mssjeuD4/yH3F1HBGxcxC9ll+PuleClddniG7hzSBiiBAUtZi4=
X-Received: by 2002:a05:600c:2cd8:: with SMTP id
 l24mr1546440wmc.88.1615843909483; 
 Mon, 15 Mar 2021 14:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAJxKyLed1p-WbcEOZjZ67r61QeEYZ7LBK8xSRDWNNr21pvaMbw@mail.gmail.com>
 <6e63a539-f021-28d3-f60d-a0c301ff599f@linux.vnet.ibm.com>
In-Reply-To: <6e63a539-f021-28d3-f60d-a0c301ff599f@linux.vnet.ibm.com>
From: Dan Zhang <dz4list@gmail.com>
Date: Mon, 15 Mar 2021 14:31:38 -0700
Message-ID: <CAJxKyLdnTRXoTXHM0w1Y7dPCdAf5H-gBWJvYe-Rh+KfJBQYvaQ@mail.gmail.com>
Subject: Re: [oe-core][RFC 0/3] u-boot: Support SPL Verified Boot
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kaus,
What's my suggestion essentially is add a configuration i.e.
DO_UBOOT_SIGN to allow users only create a "signable" fit-image, but
sign later.

in the code
+ uboot_fitimage_assemble() {
...
+       #
+       # Sign the U-boot FIT image and add public key to SPL dtb
+       #
        if [ "x${DO_UBOOT_SIGN}" = "x1" ] ; then
+       ${UBOOT_MKIMAGE_SIGN} \
+               ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+               -F -k "${UBOOT_SIGN_KEYDIR}" \
+               -K "${spl_dtb}" \
+               -r ${uboot_bin} \
+               ${UBOOT_MKIMAGE_SIGN_ARGS}
       fi
}




On Mon, Mar 15, 2021 at 9:47 AM Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
>
>
> On 3/7/2021 11:51 PM, Dan Zhang wrote:
> > Hi Klaus,
>
> Hi Dan - sorry, your reply went under my radar last week!
>
> > Thank you very much for providing this solution to build and sign
> > u-boot fit-image.
> >
> > I have one suggestion: decouple the U-Boot fit build and signing.
> >
> > UBOOT_FIT ==> Create the uboot fit-image (essentially all your
> > proposal did, except the latest sign step in uboot_fit_assemble())
> > SPL_SIGN_ENABLE ==> create the uboot fit-image, also sign it.
> >
> > This similar to kernel_fit means create the kernel fitimage, while
> > UBOOT_SIGN_ENABLE means sign it.
> >
> > This will allow the user to use a simple script to sign an unsigned
> > image with any key, w/o need to be able to tweak the recipe and
> > rebuild the image.
> > i.e. the manufacturing team, the testing team.
>
> Thanks for the suggestion, however, I'm a bit hesitant with this change,
> since for U-Boot the creation/support for the fitImage uImage needs
> to be set in the u-boot config, so unlike the kernel I don't think
> we could simply enable it on the machine.conf and expect it to work.
>
> I'm about to send the patches below as a proper submission to
> openembedded-devel, and I'll continue cross-posting to the openbmc
> list. However, please feel free to answer with you suggestions and
> copy the openembedded mailing-list as well.
>
> Thanks!
>
>   -Klaus
>
>
>
>
> --
> Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
