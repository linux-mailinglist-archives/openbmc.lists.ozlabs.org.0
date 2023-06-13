Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21AA72D829
	for <lists+openbmc@lfdr.de>; Tue, 13 Jun 2023 05:37:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ak216gkr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgDl640mwz30PS
	for <lists+openbmc@lfdr.de>; Tue, 13 Jun 2023 13:37:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ak216gkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=raviteja28031990@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgDkW36Xyz307y
	for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2023 13:36:49 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-392116ae103so2982674b6e.0
        for <openbmc@lists.ozlabs.org>; Mon, 12 Jun 2023 20:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686627406; x=1689219406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E7v74uXYNBWouY+uFNi8ap0Mm0dM4OjKKOaR/CW0R6E=;
        b=Ak216gkr0Z81piYMT4bGQPLYFCWsbOWp5l+U+P/0kC9lBs8K0Y95KhGWVEDQ+VAx4W
         c5nMRWzVH1t2mT4cM+StmyMtqLaey3oaGsQ4MMW7w6ktN4J/kK65wKS4qTwmHlm456u1
         qrm9XLXjC9eR0ZgVeStrRuyzS6G3gpBjq/Cz8fUUSmlQffwfqG3fuqvwI/16gNffvJyH
         8trWVw+ZD8koSAIAX+kO8lnx3waPaOmiP/IdPVfk9j+87Orhu8V42Mu3DfM/ZQ4SpZ72
         l8Sr+eYKfNsyI0tICW7KqVFzeFN4WKVI1XJnKcsrtjbaksyxkY6wa+C/ub+Zu3QKoPij
         VXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686627406; x=1689219406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7v74uXYNBWouY+uFNi8ap0Mm0dM4OjKKOaR/CW0R6E=;
        b=A5pg00hJI+CF4AwbFY/p+4kVR60D21z736litJ2PKuVWrbttu/jrSypdszG2rYtpGo
         SsRkyp30tt5VTAShOQafwqpToItB8HjpmQrMVjND18u/f45b/3m8nOXU6T60auOlQ/ZE
         HKNj/qrsNP+ByiGVXdmENPqc+4m4r3kqLWT4g6OOG3ktLNB8bIV3QJKDRQAoePHHTaxo
         lEuUbZZIpZlDyU9X6pf0arWGUv92zeQw7PgW8UaZBB7g1+tfofV2CCK0fa5DS2ZDerSq
         AA4oZly0o3g2rFRHDROqWX5LSuBD88i62qdDn/v6lAXXyhR1cE75ZN4/fdJWpI/MDSDz
         BiwA==
X-Gm-Message-State: AC+VfDxrzUGvxvCW60QDdaCLml+C3KNRNjXfZAq96u3Q2gmBnl9ki+3I
	ryAiURy43BtsYNBpf8Z0ugkvkVlm+sk7RN6fgdI=
X-Google-Smtp-Source: ACHHUZ7KfaIS0Wh9YfRkgLBi3zs61fuDEiC8BA6t54CW3iFU4x5lfOHSLwQCNu8Nw7lCKxhhbJ2Oi30d2f6muyOTa4w=
X-Received: by 2002:a05:6808:1926:b0:39a:9cef:9dd3 with SMTP id
 bf38-20020a056808192600b0039a9cef9dd3mr7749493oib.27.1686627406101; Mon, 12
 Jun 2023 20:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
 <2d93fd2f-bde5-22f2-373a-63398963e94f@linux.intel.com> <CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com>
 <7230376b-c7f4-b931-faff-27a4da1b38a9@gmail.com> <CAM4DKZ=-pHzz-OuOyszYmrHMWog5uNpB-S4mQtQaVrY2iJ5=BQ@mail.gmail.com>
 <ZIEpSaXg4IkZ7MZk@heinlein.vulture-banana.ts.net> <5b277b0b61ab54060749975ec12aa2422d4427cb.camel@gmail.com>
In-Reply-To: <5b277b0b61ab54060749975ec12aa2422d4427cb.camel@gmail.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Tue, 13 Jun 2023 09:06:34 +0530
Message-ID: <CAM4DKZ=ZhaNVZhs9cbY4G_MUVo-5Usr1FjMWjMLvEWxhCVNivw@mail.gmail.com>
Subject: Re: OpenBMC Network Route Management: Metric and Static Route config support
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000068c1f005fdfa8b37"
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

--00000000000068c1f005fdfa8b37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick/Ivan


Yes the DMFT PR is private and is intended only for DMTF members.

I have captured DMTF mockup schema in the above mail as an example.

Intent of this mail is to get feedback and use-cases of static route
feature on BMC.


would like to hear community interest on allowing static
route configuration by user explicitly.

On Fri, Jun 9, 2023 at 12:07=E2=80=AFPM Ivan Mikhaylov <fr0st61te@gmail.com=
> wrote:

> On Wed, 2023-06-07 at 20:05 -0500, Patrick Williams wrote:
> > On Mon, Jun 05, 2023 at 07:49:06PM +0530, raviteja bailapudi wrote:
> >
> > > Gentle reminder for the feedback on Static route feature
> > >
> > > Here is DMTF redfish PR to enable redfish static route
> > > configuration
> > > https://github.com/DMTF/Redfish/pull/5464
> >
> > How are we suppose to review a private PR?
> >
>
> I'd glad to look at this PR too, at least there is multiple proposals
> in gerrit about that theme:
>
> https://gerrit.openbmc.org/c/openbmc/phosphor-networkd/+/63619
> https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61641
> https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/60448
>
> Is it possible to put it in redfish forum/mail list/gerrit?
>
> Thanks.
>

--00000000000068c1f005fdfa8b37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px;font-stretch:normal;font-size:13px;=
line-height:normal;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:=
none;font-kerning:auto;font-variant-alternates:normal;font-variant-ligature=
s:normal;font-variant-numeric:normal;font-variant-east-asian:normal;font-fe=
ature-settings:normal">Hi Patrick/Ivan</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Yes the DMFT PR is private and is intended only for DMTF members.</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">I have captured DMTF mockup schema in the above mail as an example.</=
p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Intent of this mail is to get feedback and use-cases of static route =
feature on BMC.</p><p style=3D"margin:0px;font-stretch:normal;font-size:13p=
x;line-height:normal;font-family:&quot;Helvetica Neue&quot;;font-size-adjus=
t:none;font-kerning:auto;font-variant-alternates:normal;font-variant-ligatu=
res:normal;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
feature-settings:normal"><br></p><p style=3D"margin:0px;font-stretch:normal=
;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;f=
ont-size-adjust:none;font-kerning:auto;font-variant-alternates:normal;font-=
variant-ligatures:normal;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-feature-settings:normal">would like to hear community interes=
t on allowing static route=C2=A0configuration by user explicitly.</p></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Jun 9, 2023 at 12:07=E2=80=AFPM Ivan Mikhaylov &lt;<a href=3D"mailto:fr0s=
t61te@gmail.com" target=3D"_blank">fr0st61te@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex">On Wed, 2023-06-07 at 20:05 -0500, Patrick Williams wr=
ote:<br>
&gt; On Mon, Jun 05, 2023 at 07:49:06PM +0530, raviteja bailapudi wrote:<br=
>
&gt; <br>
&gt; &gt; Gentle reminder for the feedback on Static route feature<br>
&gt; &gt; <br>
&gt; &gt; Here is DMTF redfish PR to enable redfish static route<br>
&gt; &gt; configuration<br>
&gt; &gt; <a href=3D"https://github.com/DMTF/Redfish/pull/5464" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/DMTF/Redfish/pull/5464</a><br>
&gt; <br>
&gt; How are we suppose to review a private PR?<br>
&gt; <br>
<br>
I&#39;d glad to look at this PR too, at least there is multiple proposals<b=
r>
in gerrit about that theme:<br>
<br>
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-networkd/+/63619" =
rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/p=
hosphor-networkd/+/63619</a><br>
<a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61641" rel=3D"nore=
ferrer" target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/616=
41</a><br>
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/=
60448" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/c/op=
enbmc/phosphor-dbus-interfaces/+/60448</a><br>
<br>
Is it possible to put it in redfish forum/mail list/gerrit?<br>
<br>
Thanks.<br>
</blockquote></div>

--00000000000068c1f005fdfa8b37--
