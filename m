Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADAA1FFD5E
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 23:27:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nw4K2Q5MzDrNJ
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 07:26:57 +1000 (AEST)
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
 header.s=20161025 header.b=NXrQ/hYR; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nw3L5VD7zDrL9
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 07:25:59 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id c194so6478086oig.5
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jigcoaKwx/asEYd4v7+oa5xxKyGUvvVPmmDGuf7Cudk=;
 b=NXrQ/hYRxA7DE5RzfJWWSpsqfxC74mOVVb/zp2id8wpOT7BSjQFtYk9/KeqG7ioa+Y
 WDx7YTJtxSTfek+1cE217XI+INQdMgM6n6cPfGy/khtPbdgTrkUjefpOJ4zYNT0YVti6
 +cnaoAYuzEP/9dreVkC0WSuxQ/BWUUvsev8U9F2HTUBzyQK6mevRIFWsfbOg9TP4dXrP
 IfzpWAfyW5YzJMvq2nW0ZalZ2P9dd5101c+of6NcGpUo0zdKTAqEouoJ/NQCii5Px6i/
 q7ZLcaG0GD8k9EQTxTINH5MN1DeNg2alxWCfGsw0ISbwnsGJ74cDLwJ5pToyFz7FIo54
 5UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jigcoaKwx/asEYd4v7+oa5xxKyGUvvVPmmDGuf7Cudk=;
 b=e1iGG8JZ17DrN0LLcWI3k1udzM5sWU5LYx+f1KptfC8prJtxHdBGkovjfqCq0C6ham
 8WJjRinfFVm9PrwGcYM9iffzrYKLn+z4OIx3BxlI8MyB/RhxRwUr4oksSWHkDqgRHLni
 1Lp9EJfydlaEaFt6ghks1twa/Iqg+S0jFwgopvMZp6IgxjJiChatLiPiQyh5byI5If8k
 dWlsra0z1hEuvt1vOzoydY+o7l+u3yp+iyCZ1gVoIcemB3UPQFwgSr5ilwb+cwZncqli
 d4sXfx40lsxylW/O/YpJzadFUHukALsZ4vquEJHnziBpwmhYE1/0q/pbz78xXGj67jl4
 VZIA==
X-Gm-Message-State: AOAM5323gd/CrjWIrAmpYwY1pb74hV7mLuepKYCPmmqMq7vSVNdCBaJp
 +xC3rAOTpIs0gS5MtxKAdhsEnALeeefKmSKBLBdDpBLN1aE=
X-Google-Smtp-Source: ABdhPJw0+bWW5m9hjc/RUi9OakmC235rvXV9HSpmcrdXfrHpMVF7LnBEtdzUFyphln2vZxoi82X42WE5DqwlRvgsg5U=
X-Received: by 2002:a54:4897:: with SMTP id r23mr727512oic.103.1592515555733; 
 Thu, 18 Jun 2020 14:25:55 -0700 (PDT)
MIME-Version: 1.0
From: Alex Qiu <xqiu@google.com>
Date: Thu, 18 Jun 2020 14:25:45 -0700
Message-ID: <CAA_a9xLB2PjJ7hYTrksY41LFhOk+Kuu-Hs4YCDTeJX4THZ1KQQ@mail.gmail.com>
Subject: Feedback on Current OpenBMC and Proposing Some Improvements
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000fff66405a8626baf"
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

--000000000000fff66405a8626baf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi OpenBMC community,

It has been a while since Google has adopted the dynamic software stack of
OpenBMC, namely using entity-manager for FRU discovery, dbus-sensors for
sensor reading, and intel-ipmi-oem for IPMI command handling. We discovered
issues and limitations with this dynamic software stack along the way, so
I=E2=80=99m proposing some ideas on how OpenBMC may improve, which may lead=
 to
detailed designs about it. Let me call it "Improvements" in this email per
say. I think the highlight of these ideas are: 1) having a robust framework
to handle hardware topology, and 2) having accommodations for code to
intervene on varieties of BMC tasks.


I'll split the content of this topic into two additional emails for easier
digestion: 1) Difficulties and Issue Examples; 2) "Improvements" Ideas. The
main discussion may still stay in this thread.


Since this is a big architectural change compared to the existing dynamic
software stack, I would like to hear feedback or review on the conceptual
ideas before we turn these ideas into more concrete designs or prototypes.
On the other hand, there is a high probability that I didn=E2=80=99t expres=
s my
idea well enough to understand, and there may be a language barrier to get
over. I=E2=80=99ll try to see if I can use some code to make a tiny prototy=
pe to
illustrate the ideas better at some point. Thank you!


- Alex Qiu

--000000000000fff66405a8626baf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-17443d56-7fff-26a3-29=
2e-564725539854"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Hi OpenBM=
C community,</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"=
>It has been a while since Google has adopted the dynamic software stack of=
 OpenBMC, namely using entity-manager for FRU discovery, dbus-sensors for s=
ensor reading, and intel-ipmi-oem for IPMI command handling. We discovered =
issues and limitations with this dynamic software stack along the way, so I=
=E2=80=99m proposing some ideas on how OpenBMC may improve, which may lead =
to detailed designs about it. Let me call it &quot;Improvements&quot; in th=
is email per say. I think the highlight of these ideas are: 1) having a rob=
ust framework to handle hardware topology, and 2) having accommodations for=
 code to intervene on varieties of BMC tasks.</span></p><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap"><br></span></p><p style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
-wrap">I&#39;ll split the content of this topic into two additional emails =
for easier digestion: 1) Difficulties and Issue Examples; 2) &quot;Improvem=
ents&quot; Ideas. The main discussion may still stay in this thread.</span>=
</p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span st=
yle=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap"><br></span></p><p style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap"><span id=3D"gmail-docs-internal-guid-7fd06023-7fff-c2d3-8=
375-7d31c58ce52b"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline">Since this is a big architectural change compared to the existin=
g dynamic software stack, I would like to hear feedback or review on the co=
nceptual ideas before we turn these ideas into more concrete designs or pro=
totypes. On the other hand, there is a high probability that I didn=E2=80=
=99t express my idea well enough to understand, and there may be a language=
 barrier to get over. I=E2=80=99ll try to see if I can use some code to mak=
e a tiny prototype to illustrate the ideas better at some point. Thank you!=
</span></span>
</span></p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap"><span><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline"><br></span></span></span></p=
></span><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></div></div>

--000000000000fff66405a8626baf--
