Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BAE10947E
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 20:54:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MHmK0vlfzDqbl
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 06:54:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-yw1-xc33.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nzqt4kzk"; 
 dkim-atps=neutral
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MHjZ38QKzDqc1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 06:51:46 +1100 (AEDT)
Received: by mail-yw1-xc33.google.com with SMTP id 4so5479486ywx.4
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 11:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WHeiiWV0CmX95ho5mFw7nrf+An7Bna43caw8n8/ycoM=;
 b=Nzqt4kzkSb1o2Nj5yH2Wa/cySz34iQUZrRPd3M8Ytoqpyaz/buuGa0WoBOiwJGx1Iz
 r1TAnqQ4jaJVSIQLEWr9Y8on8ZgQ2okv8cZrj2juPeramDzfkS1w3VfyZ9LIiSFiP0RJ
 LVo2koVds6csPzP7QXrQRoVSERqGoteRijcSvYzdRS6ArmqC9OiR4mXfOS+dFEHry2Ap
 RRvDwo3rUqTnRmkcKVI1x1hWZ7ZzWymyC1YaAwyn79Hyf+BnIO8PHYFRtjUxDBLR0GKg
 Q8lj7X5IQOhJPCHOrWPQ28vW9TSBpJFEsWTNsypVN7kwp0tWcKlxMiprkeUwADzXHkut
 f7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WHeiiWV0CmX95ho5mFw7nrf+An7Bna43caw8n8/ycoM=;
 b=kA6Fd20NmnBZIl2BqgCv22ce3g87ZZUzGP3IATDSRug3shaZ3/LhrWY3X6jloUzTwa
 0qB6JU4FzeW4T7tuHFtkisqb6Wwbke10wVKqwaXqfIvo9j4o1+oYMdpL//9zUiTW7Bf4
 UnLZtIP9j8MmcfTokYRq9yAV+7hzJ0F6A4j3tCTcVk0zy2QRJ/36t3c7qvOHRm66A834
 68WXECFnOEW5POHvrU7MAo/sNTAOZHACP9qIWLRFJalQBwEBTc7HsoVLQ9qeKuFmOuJl
 eo4fORyO+qe1dqK9ngVAr7cQpelKNAddMxTyMLMbcBKdp2/wm7Z9WibsIEVNbQYbsltQ
 UVDw==
X-Gm-Message-State: APjAAAVVZbx7VAgm9I8yR+aLfQRJhfF9m/1QgQ/7I2XIx1ACqiWHI4Ea
 TUIbv50eqg14KNOtx4g5EbgdQrhKOhk6vztIESs=
X-Google-Smtp-Source: APXvYqxxWJd7/DCCYGVgqZGJHw0ZEVBlyWbQktVvVLU2v6qCAISvInzRKupZsVHk5sR/eQRoThwx4F4PlAwTAoNlShI=
X-Received: by 2002:a81:6589:: with SMTP id
 z131mr21618803ywb.299.1574711501788; 
 Mon, 25 Nov 2019 11:51:41 -0800 (PST)
MIME-Version: 1.0
References: <FD0BD680739BFC41807C96BD23118BB1319422@ORSMSX113.amr.corp.intel.com>
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB1319422@ORSMSX113.amr.corp.intel.com>
From: Jandra A <jandraara@gmail.com>
Date: Mon, 25 Nov 2019 13:51:30 -0600
Message-ID: <CAMTupoRPpGS1cUi7mj2KEWnAvcec7RRNieYLDgGA=s3rwvH=tw@mail.gmail.com>
Subject: Re: GUI: New navigation
To: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
Content-Type: multipart/alternative; boundary="000000000000b0193e059831171b"
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

--000000000000b0193e059831171b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
>  As a follow up to requests in the GUI Design work group, I=E2=80=99ve ma=
de
> changes to the original commit that:
>
>
>    - Makes the buttons, focus states & colors consistent with
>    accessibility guidelines
>    - Uses the Teal50 color to show the active page (this is one of the
>    few colors from existing palette that meets accessibility reqts and wo=
rks
>    aesthetically)
>    - Makes the hover over background (rectangle box/on screenshot this is
>    shown on =E2=80=9CAccess=E2=80=9D) the same color as the nav. backgrou=
nd, just a bit
>    lighter
>    - Uses existing color palette and background color
>    - Implements better alignment & spacing
>
> Thank you Kathy, I think Teal50 works much better in terms of contrast
against the dark background color.

--000000000000b0193e059831171b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><div clas=
s=3D"gmail-m_925525924372700472WordSection1"><p class=3D"MsoNormal">=C2=A0A=
s a follow up to requests in the GUI Design work group, I=E2=80=99ve made c=
hanges to the original commit that:</p><p class=3D"MsoNormal"><u></u></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"gmail-m_925525924372700472MsoListParagraph" style=3D"margin-le=
ft:0in">Makes the buttons, focus states &amp; colors consistent with access=
ibility guidelines<u></u><u></u></li><li class=3D"gmail-m_92552592437270047=
2MsoListParagraph" style=3D"margin-left:0in">Uses the Teal50 color to show =
the active page (this is one of the few colors from existing palette that m=
eets accessibility reqts and works aesthetically)<u></u><u></u></li><li cla=
ss=3D"gmail-m_925525924372700472MsoListParagraph" style=3D"margin-left:0in"=
>Makes the hover over background (rectangle box/on screenshot this is shown=
 on =E2=80=9CAccess=E2=80=9D) the same color as the nav. background, just a=
 bit lighter
<u></u><u></u></li><li class=3D"gmail-m_925525924372700472MsoListParagraph"=
 style=3D"margin-left:0in">Uses existing color palette and background color=
<u></u><u></u></li><li class=3D"gmail-m_925525924372700472MsoListParagraph"=
 style=3D"margin-left:0in">Implements better alignment &amp; spacing<u></u>=
<u></u></li></ul>
<p class=3D"MsoNormal"><u></u></p></div></div></blockquote><div>Thank you K=
athy, I think Teal50 works much better in terms of contrast against the dar=
k background color.=C2=A0=C2=A0</div><div><br></div></div></div></div></div=
></div></div></div></div>

--000000000000b0193e059831171b--
