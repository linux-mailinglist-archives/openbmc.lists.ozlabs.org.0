Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFA3110382
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 18:32:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S8Dr43tWzDqRg
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 04:32:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f31E1XoZ"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S8D735n2zDqJT
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 04:31:35 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id a11so1835037ybc.9
 for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2019 09:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6WNgIPl7VHvT6DFPd6ofFZ/duXssMWpsV9XaGLngso=;
 b=f31E1XoZ3/mP+Z2i5/mu2qA2ESENZLhnuXVl20K71zBD3245q0LhkgfZOr7r3c/aZe
 W7rjGzahx61i05OgHThoSWD1SheQa64LpNUVpOLMtC6Tqrnc619ZEYCF2h8Na6/1ezsh
 3SKSeGYEMEKfnQG59ar5zwlM4YOp7KgNHqKdHvmYGmz9eNCOA9E0VEP1j+ASGgo7Up5U
 Gyh7S2Fp7f67rUc3kYV1iH+rHyntts1Fj6NDJ19BNBb/mYN4ZKYAIRkRbSIZW9tAbWeu
 P+QxwjzGhd0a3kpt+4PVMobk5Vwh0oRBZgdDWjT+K1pQcTBsJbHZTRNEN8ye6zDt4HIU
 ZoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6WNgIPl7VHvT6DFPd6ofFZ/duXssMWpsV9XaGLngso=;
 b=P2ItpzqT46VHwXZR+9KjyLnPgQAKxUKIYqF495OKLWjGroVIvauMOoszCq4/r+vLtD
 02c8inADBXixSCtpR/pBgN9VqPDrSw70l4W1FkbzXi9oHIvKQAFzqynygfogBBdukJ1F
 PnlVQNxwyjxHjJ3F/hyoM1m8J4ZRj0GD/ch0um12eWJPe6W7MQPrJj/R77L+YB0RMMS5
 l5slntfti64zpQrr2yK6ArsPKSHHRUwzmAvXimAqLtZLegHhUrHCONwcDUGRRwj2AtW4
 Varui0MgMlyLNAEZPzw4q7gPxaPy4yMWSg+cpmrPdQJl0QGGW58BRgxbwyC6Q0D1OPb9
 1+wQ==
X-Gm-Message-State: APjAAAVl9va3igf1HmdcEmeRKrum3mjxnETwer3zBSVKwsXSARTw3TwX
 4xrmYuqT7eMa79/R1Z//fclcQAHSqIBP50PGWrk=
X-Google-Smtp-Source: APXvYqzUaf4CkBWC5tHHLEuzxgpzSLw45TZ/FixGbhc+QOXrAOuHyVSLLpSTJdYoxnOvxFmvCrBJ1ynmC1wfcPPykdY=
X-Received: by 2002:a25:aa10:: with SMTP id s16mr2597040ybi.6.1575394291155;
 Tue, 03 Dec 2019 09:31:31 -0800 (PST)
MIME-Version: 1.0
References: <FD0BD680739BFC41807C96BD23118BB131A1BE@ORSMSX113.amr.corp.intel.com>
 <OF518FB33F.0A608011-ON002584BF.0046C766-002584BF.005B81EB@notes.na.collabserv.com>
 <FD0BD680739BFC41807C96BD23118BB131A69B@ORSMSX113.amr.corp.intel.com>
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB131A69B@ORSMSX113.amr.corp.intel.com>
From: Jandra A <jandraara@gmail.com>
Date: Tue, 3 Dec 2019 11:31:19 -0600
Message-ID: <CAMTupoTyA=OH2eAC_oARxXAdmKOMEL0C6x2XrDKFzXoSPGaXAA@mail.gmail.com>
Subject: Re: GUI Component Library
To: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
Content-Type: multipart/alternative; boundary="0000000000001b05d00598d01198"
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

--0000000000001b05d00598d01198
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> My proposal is that we work towards a vision with concepts for the overal=
l
> site prior to getting into the details, as a method for consensus buildin=
g.
> Our work will be the best if we agree on a look that encompasses a shared
> vision for the entire UI, not just individual elements.
>
> If we can agree on the big picture, creating a style guide or choosing a
> design library will be much easier as we=E2=80=99ll have consensus reflec=
ting that
> shared vision.
>

Can you specify the big picture items we want to agree on? I think at a
high level, we all want a modern and polished UI. The realities of how that
is implemented and brought to life is were the conversation breaks into
subjective opinions and where we've had difficulties before.

Like Derick, I suggest taking the existing style guide as a starting point,
since that is what is currently implemented and what has tested positively
with numerous customers. After reviewing it, we can start by discussing
overarching design principles that are implemented (such as color,
typography, icons, and corner type) and apply those to all components. This
way, we ensure that the UI is updated across the board to maintain
cohesiveness and reflects a single design language. If needed, individual
components can be revisited once we have agreed on the big principles.


Regards,
Jandra Aranguren

--0000000000001b05d00598d01198
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_-8112396240008=
348344WordSection1"><p class=3D"gmail-m_-8112396240008348344MsoPlainText">M=
y proposal is that we work towards a vision with concepts for the overall s=
ite prior to getting into the details, as a method for consensus building. =
Our work will be the best if we agree on a look that encompasses a shared v=
ision for
 the entire UI, not just individual elements.</p>
<p class=3D"gmail-m_-8112396240008348344MsoPlainText">If we can agree on th=
e big picture, creating a style guide or choosing a design library will be =
much easier as we=E2=80=99ll have consensus reflecting that shared vision.<=
/p></div></div></blockquote><div><br></div><div>Can you specify the big pic=
ture items we want to agree on? I think at a high level, we all want a mode=
rn and polished UI. The realities of how that is implemented and brought to=
 life is were the conversation breaks into subjective opinions and where we=
&#39;ve had difficulties before.</div><div><br></div><div>Like Derick, I su=
ggest taking the existing style guide as a starting point, since that is wh=
at is currently implemented and what has tested positively with numerous cu=
stomers. After reviewing it, we can start by discussing overarching design =
principles that are implemented (such as color, typography, icons, and corn=
er type) and apply those to all components. This way, we ensure that the UI=
 is updated across the board to maintain cohesiveness and reflects a single=
 design language. If needed, individual components can be revisited once we=
 have agreed on the big principles.=C2=A0</div><div><br></div><div><br></di=
v><div>Regards,</div><div>Jandra Aranguren</div></div></div>

--0000000000001b05d00598d01198--
