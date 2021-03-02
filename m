Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 103DC32A779
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 18:13:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqkH50PZRz3cTF
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 04:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RJDbqMac;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=dz4list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RJDbqMac; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqkGs68Syz2y07
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 04:13:08 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id f4so21439399ybk.11
 for <openbmc@lists.ozlabs.org>; Tue, 02 Mar 2021 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LHnexUE5YOWn93A/B2Eq5cM7ZGb/uxNjnHzYu91lT18=;
 b=RJDbqMacH9lmFjqe3QwYg+JwlIeiYLkANYa6Btf9GMweggfOZOSnSxdITF3Fxnwle5
 iyjKrQ8h3Bctj338p5C5ux2JUJnnGvqy9MBr+jHZaYC8sbIlZOaOCr7WRW4sSWc/ozen
 HADtytlpZrVIOP/4UGhCF0pBNlK/Iakwfad20w7JtxWRX71/gTQzsscyFp/Z7musMDg8
 k7cg4cxizngmkFaQXrR1HezLG7LsiFq5ZrEOZvtCQjsg74rzi7E+zAAFrILw4SUTT0EQ
 OMMjL4r4dPaWAAZRQNJLHiiBv7htkW3OBtwpnqv7pnPBKAuo3KJQV0ziNHDg0lw22CVC
 b+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LHnexUE5YOWn93A/B2Eq5cM7ZGb/uxNjnHzYu91lT18=;
 b=SUzAGkO0WfqGGmrFtt+Xy0ViDQ5+V9J6csW5X2PgbPaGw/fYF22xbl2dZdcA4/qkcK
 pPHoeQyIMlry63xwkGLgGDL2o8fXJJyCDMyWHyxFcLBwKMTVA1g0rDJd3OVxyw/qFPbL
 LYreAenP6O0dSmS9Odw67JRiBSQBxLkJ2XTkCF3ShYbh9qRd9dT6u8CKWUdO1rLwxTqJ
 ikDGj+a9XeZVc82stvpit6B5fnlBWDpc9yaHCVYaCF6U8y+dgJqp+oxCROjjdDnevmT6
 7gLBGGPm9JAXn47MN5f0gGCTi1Bgd8ZdlZFX5sTdb93jr1366ziCk0OEYRjolzBKK+dN
 9Tnw==
X-Gm-Message-State: AOAM5307chn9bE3GhIaUDFT94KIj+70W2Y+sKzjRu32reDryUA7gatLn
 7eNrq9LtsSkUvEeIvQF/Of3grnM67PA/SAutlxq1/yFMSiQ=
X-Google-Smtp-Source: ABdhPJxifchaM6Yj16J9XQFNxBwT4b6PHbrvUVCjQx2I+BW9onH66IboXdntbGYvaA+SXoJK7a50LT6zrRoUtllm8Qk=
X-Received: by 2002:a25:86d1:: with SMTP id y17mr30208050ybm.370.1614705184773; 
 Tue, 02 Mar 2021 09:13:04 -0800 (PST)
MIME-Version: 1.0
References: <mailman.1404.1614626722.7079.openbmc@lists.ozlabs.org>
 <CAJxKyLcnj=Op-+LLfjCQmX-MFCsk8duud1_Tk0RWjXAzUiKNAA@mail.gmail.com>
 <8dc7f4a2-4298-5c46-bae2-02a195b4c7b1@linux.vnet.ibm.com>
In-Reply-To: <8dc7f4a2-4298-5c46-bae2-02a195b4c7b1@linux.vnet.ibm.com>
From: Dan Zhang <dz4list@gmail.com>
Date: Tue, 2 Mar 2021 09:12:53 -0800
Message-ID: <CAJxKyLdNWUTWJUdR_q_KeaAYtt_4c6XxEwzr8yQCWMZu-K-iOA@mail.gmail.com>
Subject: Re: (Aspeed2600) Booting with a SPL loading U-boot fitImage
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000f4981605bc90d8e2"
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

--000000000000f4981605bc90d8e2
Content-Type: text/plain; charset="UTF-8"

FB/Verified-boot uses u-boot proper fit-image to reuse the fit sign and
verification code to load and verify u-boot and subordinate keys.
the booting and verify process is:
SPL :
 1. verify subordinate-keys within the u-boot proper fitimage.
 2. use the verified subordinate-keys to verify the u-boot and load it.
U-boot proper:
  1. use subordinate-keys verify os ( kernel, rootfs and fdt).

Refer to code below for how to create the u-boot proper fit-image.
https://github.com/facebook/openbmc/blob/helium/meta-aspeed/classes/kernel_fitimage.bbclass

Refer to code below for SPL verify and load u-boot proper fit. This is
quite a hack, not using the SPL image loading framework.
https://github.com/facebook/openbmc-uboot/blob/2fcac0176e5542a47e06e15d5052e6fb78c7432e/board/aspeed/ast-g5/ast-g5-spl.c#L483

BRs
Dan

On Tue, Mar 2, 2021 at 5:21 AM Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
wrote:

>
>
> On 3/2/2021 4:54 AM, Dan Zhang wrote:
>
> > I think within A FIT image, the u-boot binary is not located at your
> entry point 0x81000000,
> > it is behind the fit header, somewhere. This means the entry_point and
> load_addr is not the same as spl_boot.c defined.
> > spl_image->entry_point= CONFIG_ASPEED_UBOOT_DRAM_BASE;
> > spl_image->load_addr= CONFIG_ASPEED_UBOOT_DRAM_BASE;
> > Also, the u-boot code itself before relocation is position aware (
> SYS_TEXT_BASE must be set to 0x81000000, as your second try works). This
> means the entry_point shall be the same as SYS_TEXT_BASE.
>
> I think it's not that simple. See my answer (to myself) in this same
> thread with new information.
>
> > In fb/OpenBMC, verified boot implementation, use mkimage option:
> >    -p => place external data at a static position,
> > thus we specify the somewhere to a static offset , then you can set the
> entry_point = load_addr + offset.
>
> Verified boot should work if you are having u-boot proper validating the
> Linux Kernel fitimage, but I don't see how the Aspeed 2600 SPL would be
> able to load and verify the u-boot proper fitimage - the code simply isn't
> there..
>
> It seems to me that the SPL_LOAD_FIT code should handle recognizing the
> fitimage, moving it's 'loadables' images into memory and setting the entry
> point accordingly.
>
>   -Klaus
>

--000000000000f4981605bc90d8e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FB/Verified-boot uses u-boot proper fit-image to reus=
e the fit sign and verification code to load and verify u-boot and subordin=
ate keys.</div><div>the booting and verify process is:</div><div>SPL : <br>=
</div><div>=C2=A01. verify  subordinate-keys within the u-boot proper fitim=
age. <br></div><div>=C2=A02. use the verified subordinate-keys to verify th=
e u-boot and load it.<br></div><div>U-boot proper: <br></div><div>=C2=A0 1.=
 use subordinate-keys verify os ( kernel, rootfs and fdt).</div><div><br></=
div><div>Refer to code below for how to create the u-boot proper fit-image.=
<br></div><div dir=3D"ltr"><a href=3D"https://github.com/facebook/openbmc/b=
lob/helium/meta-aspeed/classes/kernel_fitimage.bbclass">https://github.com/=
facebook/openbmc/blob/helium/meta-aspeed/classes/kernel_fitimage.bbclass</a=
></div><div><br></div><div>Refer to code below for SPL verify and load u-bo=
ot proper fit. This is quite a hack, not using the SPL image loading framew=
ork.<br></div><div><a href=3D"https://github.com/facebook/openbmc-uboot/blo=
b/2fcac0176e5542a47e06e15d5052e6fb78c7432e/board/aspeed/ast-g5/ast-g5-spl.c=
#L483">https://github.com/facebook/openbmc-uboot/blob/2fcac0176e5542a47e06e=
15d5052e6fb78c7432e/board/aspeed/ast-g5/ast-g5-spl.c#L483</a></div><div><br=
></div><div>BRs</div><div>Dan <br></div><div><br></div><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 5:21 AM=
 Klaus Heinrich Kiwi &lt;<a href=3D"mailto:klaus@linux.vnet.ibm.com">klaus@=
linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
<br>
On 3/2/2021 4:54 AM, Dan Zhang wrote:<br>
<br>
&gt; I think within A FIT image, the u-boot binary is not located at your e=
ntry point 0x81000000,<br>
&gt; it is behind the fit header, somewhere. This means the entry_point and=
 load_addr is not the same as spl_boot.c defined.<br>
&gt; spl_image-&gt;entry_point=3D CONFIG_ASPEED_UBOOT_DRAM_BASE;<br>
&gt; spl_image-&gt;load_addr=3D CONFIG_ASPEED_UBOOT_DRAM_BASE;<br>
&gt; Also, the u-boot code itself before relocation is position aware ( SYS=
_TEXT_BASE must be set to 0x81000000, as your second try works). This means=
 the entry_point shall be the same as SYS_TEXT_BASE.<br>
<br>
I think it&#39;s not that simple. See my answer (to myself) in this same th=
read with new information.<br>
<br>
&gt; In fb/OpenBMC, verified boot implementation, use mkimage option:<br>
&gt;=C2=A0 =C2=A0 -p =3D&gt; place external data at a static position,<br>
&gt; thus we specify the somewhere to a static offset , then you can set th=
e entry_point =3D load_addr + offset.<br>
<br>
Verified boot should work if you are having u-boot proper validating the Li=
nux Kernel fitimage, but I don&#39;t see how the Aspeed 2600 SPL would be a=
ble to load and verify the u-boot proper fitimage - the code simply isn&#39=
;t there..<br>
<br>
It seems to me that the SPL_LOAD_FIT code should handle recognizing the fit=
image, moving it&#39;s &#39;loadables&#39; images into memory and setting t=
he entry point accordingly.<br>
<br>
=C2=A0 -Klaus<br>
</blockquote></div></div>

--000000000000f4981605bc90d8e2--
