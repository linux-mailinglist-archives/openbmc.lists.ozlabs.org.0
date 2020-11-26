Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6F2C52C2
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 12:17:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChZwy4Wp8zDr6l
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 22:17:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=priyankapillai1206@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aMpbZWwi; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChZv410JNzDr5d
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 22:15:58 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id g15so1319467ybq.6
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 03:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=WnU+ZzBPjY0UcJ46+/D77H51muxs52GeTDKj16FgZ1E=;
 b=aMpbZWwi4RwHE+ahH+2iF5w6TT8iTXCizbnITGgAUsHihscgZX6wdGAiH5W2Sj1DJt
 WiKtFoDieRh63P+0bjSmWsmgQhJpmfBbsJXZuFo8xtSMa5AlvAyoltUef0SsaXfetMqR
 dYFgprcdewuZ+82EhJLhVok6ksWoUPam8tZjQAFRhN2+ie8dX/bXWZMRD7S+10nHfbUv
 IfBFKUgPRALURGSWJhpP0XbRp0yNYhDhX5BsXTxW0kPed3HNqyzeOnuFwMiOJaEAC5o/
 kwnJ0ppBtR/C1dmqsqYfU8yJsZaN7dORNoEjWwV65/8Ir5Trgy6k0kG48qDnSWAXLZXl
 44NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=WnU+ZzBPjY0UcJ46+/D77H51muxs52GeTDKj16FgZ1E=;
 b=smB+DwlW2nJpB+EiyTBzQyis8b6uGcioH3VA8uMJ3DgQPN6pWyJiXr2eRJHXTugCTX
 jnG0cWvkOQ50CUvJea9TFx8sYgoP6ccG/XUUhNfgN2kz/g1wxE85gFprGSyWNAmg1NaJ
 jzhYVXv8l6+Yz/3KKYIflBiOGCG2TsKv5DE9AoFqiqGNO44gPydCc1aes1x9LhOUEJdX
 OUEQ0iDr8+hbMw9lQjXKAlH03DexBtNiEnGpml0aonRuEGl+XKT1F9eCv+aLnA/eKiF9
 O5BdxW0szm/2W5fwbMsaaSAlMSIh5CzfRleF91mK7CcKXOz+vo/ZCw2TDR+EMkn3BtmS
 stPQ==
X-Gm-Message-State: AOAM533NpuZGIA8qBj6EATgaxyWrR7vQ0lr/lori+Ieoe6dkSEoPDOcL
 wQKQBZSn+x1j8RQ4ZHDViCeIf7xiMx1vMludfbEEDNQINqk=
X-Google-Smtp-Source: ABdhPJw+0c3lMYadgneMd+TUVwxOOAj860a5KBNFwovVxIE2cHRIkaQLxoNV9RQQFxKT8WPQWvf9yqPz1X04PRjE+fA=
X-Received: by 2002:a25:dc0f:: with SMTP id y15mr4091317ybe.494.1606389354703; 
 Thu, 26 Nov 2020 03:15:54 -0800 (PST)
MIME-Version: 1.0
References: <CAJCnuYnAaLx_T4-1xtym3Wuc2bkyrTDsK-NcPHLY2keBOxMaeg@mail.gmail.com>
In-Reply-To: <CAJCnuYnAaLx_T4-1xtym3Wuc2bkyrTDsK-NcPHLY2keBOxMaeg@mail.gmail.com>
From: Priyanka Pillai <priyankapillai1206@gmail.com>
Date: Thu, 26 Nov 2020 16:45:42 +0530
Message-ID: <CAJCnuY=1xz3X2sHerQvoganUd0BG_Hnt2Knvw6svikSwFS3hsQ@mail.gmail.com>
Subject: Re: Requesting feedback on in-progress GUI designs - Factory Reset
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000dbad3405b500aa32"
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

--000000000000dbad3405b500aa32
Content-Type: text/plain; charset="UTF-8"

Hello,

Here is the *correct link* for Factory Reset story
https://github.com/openbmc/webui-vue/issues/45
Requesting feedback.

Thanks in advance!

Warm regards,
*Priyanka Pillai*
User Experience Designer
IBM iX : Interactive Experience

On Wed, Nov 25, 2020 at 10:02 PM Priyanka Pillai <
priyankapillai1206@gmail.com> wrote:

> Hello,
>
> Requesting feedback on the current iteration of new Factory Reset screens
> in the WebUI:
> https://github.com/openbmc/webui-vue/issues/45
>
> <https://github.com/openbmc/webui-vue/issues/44>
> Thanks in advance!
>
> Warm regards,
> *Priyanka Pillai*
> User Experience Designer
> IBM iX : Interactive Experience
>

--000000000000dbad3405b500aa32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Here=
 is the <b>correct link</b> for Factory Reset story <a href=3D"https://gith=
ub.com/openbmc/webui-vue/issues/45" target=3D"_blank">https://github.com/op=
enbmc/webui-vue/issues/45</a></div><div>Requesting feedback.<br><br></div><=
div><div>Thanks in advance!<br><br><font size=3D"2" face=3D"Georgia">Warm r=
egards,</font><br>
<b><font size=3D"3" face=3D"Georgia">Priyanka Pillai</font></b><br>
<font size=3D"1" face=3D"Arial" color=3D"#696969">User Experience Designer<=
br>
IBM iX : Interactive Experience</font><br></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020=
 at 10:02 PM Priyanka Pillai &lt;<a href=3D"mailto:priyankapillai1206@gmail=
.com">priyankapillai1206@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello,</div><div><b=
r></div><div>Requesting feedback on the current iteration of new Factory Re=
set screens in the WebUI:</div><div><a href=3D"https://github.com/openbmc/w=
ebui-vue/issues/44" target=3D"_blank">https://github.com/openbmc/webui-vue/=
issues/45<br><br></a><div>Thanks in advance!<br><br><font size=3D"2" face=
=3D"Georgia">Warm regards,</font><br>
<b><font size=3D"3" face=3D"Georgia">Priyanka Pillai</font></b><br>
<font size=3D"1" face=3D"Arial" color=3D"#696969">User Experience Designer<=
br>
IBM iX : Interactive Experience</font></div></div></div>
</blockquote></div></div>

--000000000000dbad3405b500aa32--
