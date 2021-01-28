Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6A306AE6
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 03:05:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3hm5rLPzDqM3
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 13:05:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TWbV+j2d; dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR2l0178czDqMt
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 12:22:17 +1100 (AEDT)
Received: by mail-il1-x136.google.com with SMTP id g7so2657962iln.2
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 17:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahwLOtNKIwCvU9OXsKmKqzdukNB50FinSaPUWLSgfLc=;
 b=TWbV+j2dPSf7ly6+a2QsCYlTPMUvavAbIaGj3OE0KWg3Rgp6h6U38e03xsvAIuO6mr
 pXqXZsJQdWkR1k+H8BN40a97IVPoEEbD0pk/38D6OUJvvBVl6GZTT8l45L18IrDRPSEM
 T3IK9urSJqURxQMTAXd/3xAFjdtEqRj4gSNl6sBIRX+yDozMb1TW4jFQ92EWaETMy+/M
 AhUdayXE+65QcYEKmhgKZ1/PJI4lGzwCj92yWGbmB4/TpGnxU2V+ToNUpnsh9kFCXXrx
 AsiqpBNmNZBjfw8uJ/sE4CARKW090/0MLSUCaB5W6ymOduBmNjwCLe6iF38CY4DFrouv
 GPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahwLOtNKIwCvU9OXsKmKqzdukNB50FinSaPUWLSgfLc=;
 b=r0+Y/ClUs4KbXukS5D8fsXy+pfSJbf9QbtVn9rBkTen4/RZE4fX2glc5lZOp3bo9I+
 2JVsWQxhnZXdIo09ov2xqE9WIVV3vVjKs3Ew+hTJsKx4QJLUFLxJXGFMO1bYWXTIldjR
 C9CQx3EJ+EMLg70dRywJPd3cvg2dQoktuwhhkAq5Bd0i5sPab2+OgvekNHWrE6b0Vhme
 vl1yopiagGdqnatd0bV0AtCxkaViZ6s90XLJIZldZcuiZLum9T6bnp4Vm68NbVWcBPyX
 xRItpGi/ol8fNn0mjLO2zPqPuTbc6SPnYM2ekblIGlFJqDJEI4Y61oN93dS00bbbYuvN
 IqrQ==
X-Gm-Message-State: AOAM533ipKuamwbpjd13m83CKf/4GpAvWuNssI5pX2lU8aXgs85PrIfJ
 8DGBXGN/oyDWBIgu17/CzU3j2bS5iOhFUov+VFJxSSDELbY=
X-Google-Smtp-Source: ABdhPJy6iWPQyh9u/SuABVSrVojVF7vIx7EZyW5s97oxKQHgvwlsMika46dGNyHAayZ6fKuXFxOCzXKrRBUK4oHvC4s=
X-Received: by 2002:a92:130e:: with SMTP id 14mr11048085ilt.58.1611796933657; 
 Wed, 27 Jan 2021 17:22:13 -0800 (PST)
MIME-Version: 1.0
References: <CADfYTpENhwh+o9fYhNbtDP7RZFP=C5A5gi100TZuO5NpXdK1Uw@mail.gmail.com>
 <20210128010650.pvafu52hayv5rfvw@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210128010650.pvafu52hayv5rfvw@thinkpad.fuzziesquirrel.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 27 Jan 2021 17:21:36 -0800
Message-ID: <CADfYTpH=kbSS_+4eTOLpiT4yrJxsZP5e0AJo8nWctT1Y-sKw0g@mail.gmail.com>
Subject: Re: request repo meta-tyan
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000aeb41f05b9ebb709"
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

--000000000000aeb41f05b9ebb709
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that's the plan.  We're still cleaning up the meta layer but it will
be done within the next few weeks.

On Wed, Jan 27, 2021 at 5:06 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Fri, Jan 22, 2021 at 04:02:02PM -0800, Nancy Yuen wrote:
> >We are bringing up some Tyan machines using OpenBMC request the creation
> of
> >a meta-tyan repo.
>
> Hi Nancy
>
> With the owners plugin fully deployed and operational you should be able
> to submit a new meta-tyan to openbmc/openbmc.  Let us know if there are
> any problems there.
>
> thx - brad
>


--=20

Nancy Yuen

=E2=80=A2

Google Platforms

=E2=80=A2

yuenn@google.com

=E2=80=A2

Google LLC

--000000000000aeb41f05b9ebb709
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, that&#39;s the plan.=C2=A0 We&#39;re still cleaning u=
p the meta layer but it will be done within the next few weeks.</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan =
27, 2021 at 5:06 PM Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirr=
el.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Fri, Jan 22, 2021 at 04:02:02PM -0800=
, Nancy Yuen wrote:<br>
&gt;We are bringing up some Tyan machines using OpenBMC request the creatio=
n of<br>
&gt;a meta-tyan repo.<br>
<br>
Hi Nancy<br>
<br>
With the owners plugin fully deployed and operational you should be able <b=
r>
to submit a new meta-tyan to openbmc/openbmc.=C2=A0 Let us know if there ar=
e <br>
any problems there.<br>
<br>
thx - brad<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><span><div dir=3D"ltr" style=3D=
"margin-left:0pt" align=3D"left"><span><div dir=3D"ltr" align=3D"left"><tab=
le style=3D"border:none;border-collapse:collapse"><colgroup><col width=3D"7=
6"><col width=3D"7"><col width=3D"111"><col width=3D"7"><col width=3D"122">=
<col width=3D"7"><col width=3D"71"></colgroup><tbody><tr style=3D"height:15=
pt"><td style=3D"border-top:1.5pt solid rgb(213,15,37);vertical-align:middl=
e;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:cent=
er;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fam=
ily:Roboto,sans-serif;color:rgb(102,102,102);background-color:transparent;f=
ont-weight:700;vertical-align:baseline;white-space:pre-wrap">Nancy Yuen</sp=
an></p></td><td style=3D"border-top:1.5pt solid rgb(102,102,102);vertical-a=
lign:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-=
align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial;color:rgb(255,0,0);background-color:transparent;font-we=
ight:700;vertical-align:baseline;white-space:pre-wrap">=E2=80=A2</span></p>=
</td><td style=3D"border-top:1.5pt solid rgb(51,105,232);vertical-align:mid=
dle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:ce=
nter;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-f=
amily:Roboto,sans-serif;color:rgb(102,102,102);background-color:transparent=
;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Google Platf=
orms=C2=A0</span></p></td><td style=3D"border-top:1.5pt solid rgb(102,102,1=
02);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;color:rgb(61,133,198);background-color:tr=
ansparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">=E2=
=80=A2</span></p></td><td style=3D"border-top:1.5pt solid rgb(0,153,57);ver=
tical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.3=
8;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-s=
ize:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-co=
lor:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wra=
p"><a href=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn@google.com</=
a></span></p></td><td style=3D"border-top:1.5pt solid rgb(102,102,102);vert=
ical-align:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38=
;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-si=
ze:11pt;font-family:Arial;color:rgb(0,153,57);background-color:transparent;=
font-weight:700;vertical-align:baseline;white-space:pre-wrap">=E2=80=A2</sp=
an></p></td><td style=3D"border-top:1.5pt solid rgb(238,178,17);vertical-al=
ign:middle;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.38;text-a=
lign:center;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt=
;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-color:tran=
sparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Googl=
e LLC</span></p></td></tr></tbody></table></div></span></div></span></div><=
/div>

--000000000000aeb41f05b9ebb709--
