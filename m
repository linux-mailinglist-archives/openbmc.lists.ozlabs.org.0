Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB38628BB80
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 17:02:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C923B055WzDqkS
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 02:02:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netdepot.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=mwynkoop@netdepot.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=netdepot.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netdepot.com header.i=@netdepot.com header.a=rsa-sha256
 header.s=google header.b=a8JaihR5; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C920y3Y3XzDqgs
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 02:00:30 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id m128so18984246oig.7
 for <openbmc@lists.ozlabs.org>; Mon, 12 Oct 2020 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netdepot.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j1wiXjj73FDRHkjaBHMgh7qrU8geDTxS8VjhgoT3b+Q=;
 b=a8JaihR5dsthLRnsyvw8SJmbinmzhT3LEA2sQAhtIIS7YXQXkYzAfjn3f8NOEfBszg
 2moRk23A5nRF3PjonQsEhod244MXU/0v5AEV0JQkmK85eftDgcf27+Y85iHRKCy5eSWZ
 kaQUxyMLeTdvcxJHybIyqR6gf5R7d1+SLDlMRjjFSOLiw3J7099264EAxcmM2WveGa0x
 CuTUuzQ/+CCvS2c9/lnd4TMSPX42O/bIu86f6TpNaDwGyo4xlcLHxIXOGDl2epNNSxn7
 9bIckiCxKBHJvagbGUCMBYWBKCv26Z3YR/Gp4Ws9lh62x88iYVxryzvtnfwVVHKNsaY5
 k84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j1wiXjj73FDRHkjaBHMgh7qrU8geDTxS8VjhgoT3b+Q=;
 b=U8dU0mzOkX5q+jzOcAegFZ+PB7b6Vv6ualvJ2P9IcOdsUj5cK+zOn1iUc3RvKfk/r1
 LT/akM2KoWhd4m9+6uVybI5dd/9ldIq0+p5IfBI3Zx3AacB9fatCehf7W88gOac5OLTy
 V/J65iKQaDgf3mZa2IDYU23XbRzQfpcPbmEXntPieSswcknKhEip5TqaiZPN6YvNkwU1
 abxjnwDX1UzeNFJuUpHUrFJSTYh5vPaVBdTjbLhOxb9uQ+XISIyAC+3zZvoUe4YGMlsD
 x+d+aflqn/uq3dz9AiN3LN6hDMgEeMp+TUid++Wo3BEgO4WKq6e/eSpFucPSW/fggedo
 oTRg==
X-Gm-Message-State: AOAM530wnZ/6279Bo0aDAQsDaji3VOiFOKPpWtSoGS7ZSP2IqyuNtm7S
 lRs/2etUDj638Liqjn1sAIti0/rlOPiSrUcB56xvUA==
X-Google-Smtp-Source: ABdhPJygTehPhQUzfWw5bd5oWCH0prIv30kQ2weBaAvxOVf+LTok54Ded8BnframHqk2mSlCc8rs/uUtyGVw41WWVpQ=
X-Received: by 2002:aca:4a05:: with SMTP id x5mr10918522oia.30.1602514825694; 
 Mon, 12 Oct 2020 08:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqc+eJk4P1HKZvx5JhNAcnRjnnHY2ZsquRXyrP74kVogtrkcQ@mail.gmail.com>
 <CADKL2t5R5yOfcMHsXHce4_0zMcBg7KY23ZVNwF=YXfSc96oQSQ@mail.gmail.com>
In-Reply-To: <CADKL2t5R5yOfcMHsXHce4_0zMcBg7KY23ZVNwF=YXfSc96oQSQ@mail.gmail.com>
From: Mac Wynkoop <mwynkoop@netdepot.com>
Date: Mon, 12 Oct 2020 10:00:14 -0500
Message-ID: <CAMqc+eJdzzRJcUNveKmGBsmEP56Q1GKzPqaSkDkiLHy1iviDzw@mail.gmail.com>
Subject: Re: Nuvoton WPCM450 Support
To: Benjamin Fair <benjaminfair@google.com>
Content-Type: multipart/alternative; boundary="000000000000eee1b305b17a8e7e"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000eee1b305b17a8e7e
Content-Type: text/plain; charset="UTF-8"

Well, that's unfortunate. Could anyone recommend a developer who might be
able to port it?

Thanks,
Mac Wynkoop, Senior Datacenter Engineer
*NetDepot.com:* Cloud Servers; Delivered
Houston | Atlanta | NYC | Colorado Springs

1-844-25-CLOUD Ext 806




On Fri, Oct 9, 2020 at 12:54 PM Benjamin Fair <benjaminfair@google.com>
wrote:

> On Fri, 9 Oct 2020 at 09:59, Mac Wynkoop <mwynkoop@netdepot.com> wrote:
> >
> > Hi Everyone,
> >
> > Does anyone know if the Nuvoton WPCM450 BMC would support being flashed
> to OpenBMC?
> >
> > Thanks,
> > Mac Wynkoop, Senior Datacenter Engineer
> > NetDepot.com: Cloud Servers; Delivered
> > Houston | Atlanta | NYC | Colorado Springs
> >
> > 1-844-25-CLOUD Ext 806
> >
> >
>
> Hi Mac,
>
> There's currently no support for that BMC in the kernel used by
> OpenBMC. It would likely be possible to port OpenBMC to this chip, but
> no one in the upstream community has attempted it as far as I'm aware.
>
> Benjamin
>

--000000000000eee1b305b17a8e7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well, that&#39;s unfortunate. Could anyone recommend a dev=
eloper who might be able to port it?<div><br></div><div>Thanks,<br clear=3D=
"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"margin:0=
px;padding:0px 0px 20px;width:1512px;font-family:Roboto,RobotoDraft,Helveti=
ca,Arial,sans-serif;font-size:medium"><div><div style=3D"font-size:12.8px;m=
argin:8px 0px 0px;padding:0px"><div><div dir=3D"ltr"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"=
ltr"><div dir=3D"ltr"><div>Mac Wynkoop, Senior Datacenter Engineer<br><b>Ne=
tDepot.com:</b>=C2=A0Cloud Servers; Delivered</div><div>Houston | Atlanta |=
 NYC | Colorado Springs</div><div><br>1-844-25-CLOUD Ext 806</div><div><br>=
</div><div><br></div></div></div></div></div></div></div></div></div><div><=
/div><div></div></div></div><div></div></div></div></div></div></div></div>=
</div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 9, 2020 at 12:54 PM Benjamin Fair &lt;<a href=
=3D"mailto:benjaminfair@google.com">benjaminfair@google.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 9 Oct 20=
20 at 09:59, Mac Wynkoop &lt;<a href=3D"mailto:mwynkoop@netdepot.com" targe=
t=3D"_blank">mwynkoop@netdepot.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Everyone,<br>
&gt;<br>
&gt; Does anyone know if the Nuvoton WPCM450 BMC would support being flashe=
d to OpenBMC?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Mac Wynkoop, Senior Datacenter Engineer<br>
&gt; NetDepot.com: Cloud Servers; Delivered<br>
&gt; Houston | Atlanta | NYC | Colorado Springs<br>
&gt;<br>
&gt; 1-844-25-CLOUD Ext 806<br>
&gt;<br>
&gt;<br>
<br>
Hi Mac,<br>
<br>
There&#39;s currently no support for that BMC in the kernel used by<br>
OpenBMC. It would likely be possible to port OpenBMC to this chip, but<br>
no one in the upstream community has attempted it as far as I&#39;m aware.<=
br>
<br>
Benjamin<br>
</blockquote></div>

--000000000000eee1b305b17a8e7e--
