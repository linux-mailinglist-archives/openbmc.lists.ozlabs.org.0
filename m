Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6215605697
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 07:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtFnt52zRz3dqj
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 16:02:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b2w6Xjp/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b2w6Xjp/;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtFnK11jJz3bnY
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 16:01:40 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id fw14so18752291pjb.3
        for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 22:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDx6C1RwOGcWe6gorh1wzsTqUacIiWk+d9Eo7LTr6PY=;
        b=b2w6Xjp/HvqZZQ4w+NdjRcHSpIAOWrhpqDigkiiYtk/O/EceOIEXBTtZIo+13CVTV6
         uSyaIAjSK1ar52664ArQG4fNqq1YIz4Jdd5U0zZTMRb2f2ZX8YEI9boyTxq2wsp7IgKb
         URNestGrXn2ydgBKkb5OlGf5xHCxarWyqNlCp5K8lOUXyafoUjKdkM/TbCH0Imtb26gm
         OzVbVQuRX0dVyiLwJXTyHm7Q9mobpjws6J6D2eY8zCZtWLMycwawMDtFWm/hz+/5GEF8
         BjILE6F2a6GhGZy7JoX+aFbND5NvTgR4YPoXjzW99iN1wFsly2b43kZUFW88QzWOArbf
         5YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDx6C1RwOGcWe6gorh1wzsTqUacIiWk+d9Eo7LTr6PY=;
        b=qtjd2/Xcr4g/4ca55ubYTf99RMTqpF+Nerij06nmFlMUEqiqlvG15Q1A325DucYh7z
         8rK7qZIBhzpQcq5ZtEGjHw4HdcIHWIm9b0W8RLaowwYOLZduiJYrHvgqXkHGzAZ5URJK
         mRt1hs9VWDhx3OAwAoH0ynsBpDa5r89Aatf3c3h7wHahlzClWqX+SR36mwQcJEhzvC8d
         nkvGcwGbhaFwot4hihPdiPy1PFfuCPxBn+RwVxmlb5S6oWpOWai+9lDyN1bYnRxaaFCC
         rB2EK7tuR2yy2psRHCUaFoIBpzkSApcAQr695sWSyyMPbBHAulHK9H4v1boxhmK2EYsx
         5X3Q==
X-Gm-Message-State: ACrzQf1kkrux1i9m2YvoLORJqnxVokgzONTDf/n5EnPK1NxSEyfu//Bs
	f6QRk3DMYiXv4Wbg7ZyeMZNiqkKT8LrfSMlnkSU=
X-Google-Smtp-Source: AMsMyM6Pdu/LpZ6QyclHZOEJ5KnguI8zeHIA+j3fbO2lXwtAsR0TzBm6yIDZ816/aGcapAbqLefyu3cpDBlsArmlV6w=
X-Received: by 2002:a17:90b:1e4b:b0:20d:8cf0:1a3c with SMTP id
 pi11-20020a17090b1e4b00b0020d8cf01a3cmr14190822pjb.172.1666242096894; Wed, 19
 Oct 2022 22:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <DM4PR84MB180655396433F817B6361197E5289@DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM>
 <Y07jaeJ9/WjPUrEs@heinlein.stwcx.org.github.beta.tailscale.net>
 <Y07lMANd/vVL9ph6@heinlein.stwcx.org.github.beta.tailscale.net> <acf64248-8ba1-56fb-66a6-9c07d6d9112d@hpe.com>
In-Reply-To: <acf64248-8ba1-56fb-66a6-9c07d6d9112d@hpe.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Thu, 20 Oct 2022 13:01:25 +0800
Message-ID: <CAO9PYRKLNFg+0zQMGrbNcX3nQPGfPPrmUJ_hmW3N2kukPK9N4g@mail.gmail.com>
Subject: Re: Are there plans to merge up to Honister 3.4.4?
To: "Miller, Troy" <troy.miller@hpe.com>
Content-Type: multipart/alternative; boundary="0000000000004b976005eb7038b1"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004b976005eb7038b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All:
    Do we have schedule to pull Landale 4.1 branch?

Miller, Troy <troy.miller@hpe.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8819=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E5=87=8C=E6=99=A83:06=E5=AF=AB=E9=81=93=EF=BC=9A

> On 10/18/2022 12:41 PM, Patrick Williams wrote:
> > On Tue, Oct 18, 2022 at 12:33:29PM -0500, Patrick Williams wrote:
> >> On Tue, Oct 18, 2022 at 04:04:16PM +0000, Miller, Troy wrote:
> >>> The Yocto repo is showing 3.4.4:
> >>>
> https://git.yoctoproject.org/poky/tree/meta-poky/conf/distro/poky.conf?h=
=3Dhonister#n3
> >>>
> >>> OpenBMC is still at 3.4.3:
> >>>
> https://github.com/openbmc/openbmc/blob/honister/poky/meta-poky/conf/dist=
ro/poky.conf#L3
> >>
> >> There aren't many people who seem to work off our past release branche=
s,
> >> so we don't always keep them promptly up to date.  Since honister was
> >> EOL, I assumed nobody was using it and hadn't checked on updates in
> >> while.  I can do a subtree pull for honister.
> >
> >     https://gerrit.openbmc.org/c/openbmc/openbmc/+/58003 subtree
> updates [NEW]
> >
>
> Thank you for the pull for the Honister branch.
>
> I agree that moving to Kirkstone would be ideal, but not in the cards
> right now.
>

--0000000000004b976005eb7038b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All:<div>=C2=A0 =C2=A0 Do we have schedule to pull Land=
ale 4.1 branch?=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Miller, Troy &lt;<a href=3D"mailto:troy.miller@h=
pe.com">troy.miller@hpe.com</a>&gt; =E6=96=BC 2022=E5=B9=B410=E6=9C=8819=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E5=87=8C=E6=99=A83:06=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/18/2022 1=
2:41 PM, Patrick Williams wrote:<br>
&gt; On Tue, Oct 18, 2022 at 12:33:29PM -0500, Patrick Williams wrote:<br>
&gt;&gt; On Tue, Oct 18, 2022 at 04:04:16PM +0000, Miller, Troy wrote:<br>
&gt;&gt;&gt; The Yocto repo is showing 3.4.4:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://git.yoctoproject.org/po=
ky/tree/meta-poky/conf/distro/poky.conf?h=3Dhonister#n3" rel=3D"noreferrer"=
 target=3D"_blank">https://git.yoctoproject.org/poky/tree/meta-poky/conf/di=
stro/poky.conf?h=3Dhonister#n3</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; OpenBMC is still at 3.4.3:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/open=
bmc/blob/honister/poky/meta-poky/conf/distro/poky.conf#L3" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/openbmc/openbmc/blob/honister/poky/=
meta-poky/conf/distro/poky.conf#L3</a><br>
&gt;&gt;<br>
&gt;&gt; There aren&#39;t many people who seem to work off our past release=
 branches,<br>
&gt;&gt; so we don&#39;t always keep them promptly up to date.=C2=A0 Since =
honister was<br>
&gt;&gt; EOL, I assumed nobody was using it and hadn&#39;t checked on updat=
es in<br>
&gt;&gt; while.=C2=A0 I can do a subtree pull for honister.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gerrit.openbmc.org/c/openbmc/ope=
nbmc/+/58003" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.o=
rg/c/openbmc/openbmc/+/58003</a> subtree updates [NEW]<br>
&gt; <br>
<br>
Thank you for the pull for the Honister branch.<br>
<br>
I agree that moving to Kirkstone would be ideal, but not in the cards <br>
right now.<br>
</blockquote></div>

--0000000000004b976005eb7038b1--
