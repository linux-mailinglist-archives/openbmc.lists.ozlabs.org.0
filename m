Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 746EB1FFD7B
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 23:41:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nwNx24KkzDrHj
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 07:41:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=bTqST2pd; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nwN20SwyzDrBH
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 07:40:33 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id j189so6482798oih.10
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 14:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2F2wXxZHY0Xfc1WnpWjCqdPYoJJopAaPnYRcw3WmKbU=;
 b=bTqST2pdX78YpxQF8HbQBIeIfreneWb/EZ/2aMY/WMky2YcZP88cRfMHnxejBLflFm
 YJ8AX9GzqYiaKGXKLqRZWaltR0j1JqZxB1N02dUIFtwAgQ2PuAOyC6AbtwqGCw7WW9+G
 Qj6Em8yVbA7ObB5YQu3bg/SOsZAWTQi0aggpKTOWYeMlMevvMwsXzZqN+2Dy6RLu70u/
 i5rSRDSpgYTc47V3IuLHcbgMcGx6SLNGnTveqe08nxXRqrFs1k9zVDj4S/ihPzK52cPk
 QX6GfHReH7LAksGxfPvd6ypY8APiwExu51+CEFehglsKSixhFp7LGB9UyMHecCH7B7WK
 GLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2F2wXxZHY0Xfc1WnpWjCqdPYoJJopAaPnYRcw3WmKbU=;
 b=Wk3Jp/Dhp53k29zFbd+YPu1FD9XpICIIfRS6RQ7fGjw4rnRtO/80ORQXjs/3s8g2Hz
 thFW9gW8IC8JxVoEm7BXEVMC4OSPKdBVea+p4Q4HJ9BmfTjX6JZs2MV8+a2ymdBWEx+m
 XqPHsIDPL2SiYHv6gvXg/KluRS1uHGuQvWvfKgJvZRJX5PE25dEwp4ytNK7ioyfi5ces
 lMMtPOTGVSSGauqBGXXKeLHS/lPIfo1m/E3CqfhiF9RnmTC1ioRcvQdE+pGN/cOChqOr
 uwY4RpVl7scvU0uGN3zfVUZ+/svnBOFrZ/Ua4mZdXl5ic/B2RnlD+w6UZndJSE3BHK5p
 KYLw==
X-Gm-Message-State: AOAM531kCNmWxTwsWvvk6o+AEOdvupVP1aAcR8i5ns23wXH8jfHe49VG
 Ih2TcCs18ln9GNQWnVGQ3OTL+AYyAWFwtagN0TkSA+PyhJtpDg==
X-Google-Smtp-Source: ABdhPJyyxvYpOIRXWau/5d9pHumVgVDpyGZdEjuYKBWrnwmpUuHX5LtPrdYllqjY3Vt015Mcu1tTFR9KOI2Y5nuqL80=
X-Received: by 2002:a54:4897:: with SMTP id r23mr776826oic.103.1592516431025; 
 Thu, 18 Jun 2020 14:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLB2PjJ7hYTrksY41LFhOk+Kuu-Hs4YCDTeJX4THZ1KQQ@mail.gmail.com>
In-Reply-To: <CAA_a9xLB2PjJ7hYTrksY41LFhOk+Kuu-Hs4YCDTeJX4THZ1KQQ@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Thu, 18 Jun 2020 14:40:20 -0700
Message-ID: <CAA_a9xKDS=342c+s3QUv8oECkjzqxxCZgHBigT2_CxdCQa5CuQ@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002bde1d05a862a02d"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Ofer Yehielli <ofery@google.com>, Josh Lehan <krellan@google.com>,
 gBMC Discussions <gbmc-discuss@google.com>,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002bde1d05a862a02d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just sent out the additional email threads. You can also find them in these
links:

Feedback on Current OpenBMC and Proposing Some Improvements ----
Difficulties and Issue Examples:
https://lists.ozlabs.org/pipermail/openbmc/2020-June/022065.html

Feedback on Current OpenBMC and Proposing Some Improvements ----
"Improvements" Ideas:
https://lists.ozlabs.org/pipermail/openbmc/2020-June/022067.html

Thank you!

- Alex Qiu


On Thu, Jun 18, 2020 at 2:25 PM Alex Qiu <xqiu@google.com> wrote:

> Hi OpenBMC community,
>
> It has been a while since Google has adopted the dynamic software stack o=
f
> OpenBMC, namely using entity-manager for FRU discovery, dbus-sensors for
> sensor reading, and intel-ipmi-oem for IPMI command handling. We discover=
ed
> issues and limitations with this dynamic software stack along the way, so
> I=E2=80=99m proposing some ideas on how OpenBMC may improve, which may le=
ad to
> detailed designs about it. Let me call it "Improvements" in this email pe=
r
> say. I think the highlight of these ideas are: 1) having a robust framewo=
rk
> to handle hardware topology, and 2) having accommodations for code to
> intervene on varieties of BMC tasks.
>
>
> I'll split the content of this topic into two additional emails for easie=
r
> digestion: 1) Difficulties and Issue Examples; 2) "Improvements" Ideas. T=
he
> main discussion may still stay in this thread.
>
>
> Since this is a big architectural change compared to the existing dynamic
> software stack, I would like to hear feedback or review on the conceptual
> ideas before we turn these ideas into more concrete designs or prototypes=
.
> On the other hand, there is a high probability that I didn=E2=80=99t expr=
ess my
> idea well enough to understand, and there may be a language barrier to ge=
t
> over. I=E2=80=99ll try to see if I can use some code to make a tiny proto=
type to
> illustrate the ideas better at some point. Thank you!
>
>
> - Alex Qiu
>

--0000000000002bde1d05a862a02d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just sent out the additional email threads. You can a=
lso find them in these links:</div><div><br></div><div>Feedback on Current =
OpenBMC and Proposing Some Improvements ---- Difficulties and Issue Example=
s:<br></div><div><a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020=
-June/022065.html">https://lists.ozlabs.org/pipermail/openbmc/2020-June/022=
065.html</a></div><div><br></div><div>Feedback on Current OpenBMC and Propo=
sing Some Improvements ---- &quot;Improvements&quot; Ideas:<br><a href=3D"h=
ttps://lists.ozlabs.org/pipermail/openbmc/2020-June/022067.html">https://li=
sts.ozlabs.org/pipermail/openbmc/2020-June/022067.html</a><br></div><div><b=
r></div><div>Thank you!</div><br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">- =
Alex Qiu</div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jun 18, 2020 at 2:25 PM Alex Qiu &lt;=
<a href=3D"mailto:xqiu@google.com">xqiu@google.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><span id=
=3D"gmail-m_1007628602065475378gmail-docs-internal-guid-17443d56-7fff-26a3-=
292e-564725539854"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Hi Open=
BMC community,</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">It has been a while since Google has adopted the dynamic software stack =
of OpenBMC, namely using entity-manager for FRU discovery, dbus-sensors for=
 sensor reading, and intel-ipmi-oem for IPMI command handling. We discovere=
d issues and limitations with this dynamic software stack along the way, so=
 I=E2=80=99m proposing some ideas on how OpenBMC may improve, which may lea=
d to detailed designs about it. Let me call it &quot;Improvements&quot; in =
this email per say. I think the highlight of these ideas are: 1) having a r=
obust framework to handle hardware topology, and 2) having accommodations f=
or code to intervene on varieties of BMC tasks.</span></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap"><br></span></p><p style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">I&#39;ll split the content of this topic into two additional email=
s for easier digestion: 1) Difficulties and Issue Examples; 2) &quot;Improv=
ements&quot; Ideas. The main discussion may still stay in this thread.</spa=
n></p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap"><br></span></p><p style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap"><span id=3D"gmail-m_1007628602065475378gmail-docs-inter=
nal-guid-7fd06023-7fff-c2d3-8375-7d31c58ce52b"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline">Since this is a big architectural c=
hange compared to the existing dynamic software stack, I would like to hear=
 feedback or review on the conceptual ideas before we turn these ideas into=
 more concrete designs or prototypes. On the other hand, there is a high pr=
obability that I didn=E2=80=99t express my idea well enough to understand, =
and there may be a language barrier to get over. I=E2=80=99ll try to see if=
 I can use some code to make a tiny prototype to illustrate the ideas bette=
r at some point. Thank you!</span></span>
</span></p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap"><span><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline"><br></span></span></span></p=
></span><div><div dir=3D"ltr"><div dir=3D"ltr">- Alex Qiu</div></div></div>=
</div>
</blockquote></div>

--0000000000002bde1d05a862a02d--
