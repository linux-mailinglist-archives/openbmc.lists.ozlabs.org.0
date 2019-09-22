Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEB9BABB9
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:48:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46c00n3jyMzDqV9
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 06:48:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UbaS/qhj"; 
 dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46c00D0L9BzDqMT
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 06:48:09 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id z67so13229740qkb.12
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 13:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCX49GIdE0EguWYCmLaeITZwy9NYyCS40lKVawU6nTY=;
 b=UbaS/qhjSOGyrBAsePkGpmg9KzWqWGGN/VW45PPAbWjBSmXzj2K3OLDTHreCWQeR1o
 f8PXNP9TO24+6p/SVOFuV5Aszl5tdGIu61ehfWXk9YsJygOP4RXkC17ihcg41pux8E05
 9pTK1lq4bonOvae9JSSWE7pjRPU5htSmQg8pXa4txQge34nexnh7gBR1aXnK5GfXkWNd
 B742rJOSpln+g3Zc2Va8rMFNZoM50+nhiBlAPogvScasiHu395QV5K+X3FLb02OnO1Vz
 RjHz3dqOVN2oiPbExX9WcUDVgx7sluo53ZmvbPkQPCSDYEP02HvX5/cquu67fYe0lmHb
 sGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCX49GIdE0EguWYCmLaeITZwy9NYyCS40lKVawU6nTY=;
 b=uYJ/rk0SfejO8czXP9UBcyTRg50vcg8ORC5npcqxdEPFZlhGx9Ki9ZgR5IwRjgKo8G
 wVcL7ZkQ6ciIPRdOqM+D47bu/4yZCBDoXshsk8Cm2OCeylqmjGG8lK7Tns8GRrE+pwTx
 TARzYD4mp+QgEoPQepzqPWjEyMnwi47nPW1e5IAUPv3KXKeECVNxbundEUAbn1udCMMp
 p3Dn3fYZfoCUH1Ee2PMRrOEaJufZd4kSHAkBTqg3NjRXnb1KUGiz09nl4XtRr5C2FVmd
 kgm+OoNIaFtAKGXCodA/Kd+XcbFHMntlLE1gLQVxcal+6Ngz7oMPzkApAHJPh5/6g01/
 +NTg==
X-Gm-Message-State: APjAAAVoU7u6JD1+hwxkSqL0ICX6xgoO2eFZXcZzeSNkvSby4WwJHroo
 DpHd0nwGaD+L9GRkteN4iRxhkBJzPXy5ldKeKqIq1A==
X-Google-Smtp-Source: APXvYqyTgGddb3UFe+bYW5MMJshM8v2gaT1/eFXRCr+I/90vAERwFpLEx+GyXXoShHa23CoZTpLQTZBFFl9iWlOuhzc=
X-Received: by 2002:a37:a409:: with SMTP id n9mr13882666qke.485.1569185285199; 
 Sun, 22 Sep 2019 13:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_EE059DB8386C7CA8A9276439F847CB8B4D0A@qq.com>
In-Reply-To: <tencent_EE059DB8386C7CA8A9276439F847CB8B4D0A@qq.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Sun, 22 Sep 2019 13:47:53 -0700
Message-ID: <CAJoAoZ=eq0zthCz_7CphnP5tg=8c_b=HmbS62Dm6L5V54bxSKA@mail.gmail.com>
Subject: Re: about openbmc IRC
To: =?UTF-8?B?5Y2X6YeO44Og44Or44K344Ko44Op44K0?= <1181052146@qq.com>
Content-Type: multipart/alternative; boundary="000000000000834f1205932a6ba3"
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

--000000000000834f1205932a6ba3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

You need to register your nick with Freenode's NickServ.

https://freenode.net/kb/answer/registration

On Sun, Sep 22, 2019, 3:14 AM =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=
=E3=82=A8=E3=83=A9=E3=82=B4 <1181052146@qq.com> wrote:

> Dear:
>
> i have registe on Riot: #openbmc:matrix.org
> <https://riot.im/app/#/room/%23openbmc:matrix.org>
> and i want to join openbmc, but eveny i join, i was kick off by
> @appservice-irc:matrix.org
> with the error:
> You were kicked from openbmc by @appservice-irc:matrix.org
>
> Reason: IRC error on #openbmc: err_needreggednick
>
> i have register in Riot: #openbmc:matrix.org
> <https://riot.im/app/#/room/%23openbmc:matrix.org> as nick name
> zhuanyeshiti.
> how can i join openbmc?
>
> Best Regards!
>
>

--000000000000834f1205932a6ba3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">You need=
 to register your nick with Freenode&#39;s NickServ.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><a href=3D"https://freenode.net/kb/answer/regi=
stration">https://freenode.net/kb/answer/registration</a></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep =
22, 2019, 3:14 AM =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=
=83=A9=E3=82=B4 &lt;<a href=3D"mailto:1181052146@qq.com">1181052146@qq.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Dear:</div><div=
><br></div><div>i have registe on=C2=A0<span style=3D"color:rgb(36,41,46);f=
ont-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,=
Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&=
quot;Segoe UI Symbol&quot;;font-size:16px">Riot:</span><span style=3D"color=
:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&=
quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:16px">=C2=A0</span><a =
href=3D"https://riot.im/app/#/room/%23openbmc:matrix.org" rel=3D"nofollow n=
oreferrer" style=3D"font-family:-apple-system,BlinkMacSystemFont,&quot;Sego=
e UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;S=
egoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:16px;background-c=
olor:initial;box-sizing:border-box;color:rgb(3,102,214);text-decoration-lin=
e:none" target=3D"_blank">#openbmc:matrix.org</a></div><div>and i want to j=
oin openbmc, but eveny i join, i was kick off by=C2=A0<span style=3D"backgr=
ound-color:rgb(242,245,248);color:rgb(46,47,50);font-family:Nunito,Twemoji,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Noto Color E=
moji&quot;,Arial,Helvetica,sans-serif;font-size:18px">@appservice-irc:<a hr=
ef=3D"http://matrix.org" target=3D"_blank" rel=3D"noreferrer">matrix.org</a=
></span></div><div>with the error:</div><div><h3 style=3D"font-size:18px;ma=
rgin:4px;color:rgb(46,47,50);font-family:Nunito,Twemoji,&quot;Apple Color E=
moji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Noto Color Emoji&quot;,Arial,He=
lvetica,sans-serif;background-color:rgb(242,245,248)">You were kicked from =
openbmc by @appservice-irc:<a href=3D"http://matrix.org" target=3D"_blank" =
rel=3D"noreferrer">matrix.org</a></h3><p style=3D"margin:4px;color:rgb(46,4=
7,50);font-family:Nunito,Twemoji,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,&quot;Noto Color Emoji&quot;,Arial,Helvetica,sans-serif;font=
-size:15px;background-color:rgb(242,245,248)">Reason: IRC error on #openbmc=
: err_needreggednick</p></div><div><br></div><div>i have register in=C2=A0<=
span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemF=
ont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji=
&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:16p=
x">Riot:=C2=A0</span><a href=3D"https://riot.im/app/#/room/%23openbmc:matri=
x.org" rel=3D"nofollow noreferrer" style=3D"box-sizing:border-box;color:rgb=
(3,102,214);text-decoration-line:none;font-family:-apple-system,BlinkMacSys=
temFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color E=
moji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size=
:16px" target=3D"_blank">#openbmc:matrix.org</a>=C2=A0as nick name zhuanyes=
hiti.</div><div>how can i join openbmc?</div><div><br></div><div>Best Regar=
ds!</div><div><br></div></blockquote></div>

--000000000000834f1205932a6ba3--
