Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB01BE5B3
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 19:57:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C5n53dbSzDr9N
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 03:56:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RVCyUchn; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C5jn2Sx4zDrBf
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 03:54:02 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 188so2431024lfa.10
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 10:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HUqlAVduUV1Sh3Z9fn0VO1tnUCgSCHeGRBIrGxxPCK8=;
 b=RVCyUchnzLf+5vJK102jwZ3SjiIUQwaO77pGO97b4cHUbJqtU2D7P2By7OV01pSNCM
 +IYa8MbFAoLLod01c1vdEyVue/HGloushqKTpDWlJkcou6pKqo6rr4h7dnh+Ku7ycerk
 RFaaEURDw+83ZvOYiNliVlJsE4VKepW59rntDGELHozUo4t3IEbGvTaSe8uB8/VzJjW3
 JppGL0R8OMyGLcsNpKPrSzYwV02wTmlKLGxlyJT6OwrLK25l0TyZ9RK1nTFKu+TaNS3l
 3nslQYDtUzTcF3zzbhZQJmQZDhaAXdASEVSSBqKNoULeUtC17L/B88VbBIQIz8GwRw6V
 TGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HUqlAVduUV1Sh3Z9fn0VO1tnUCgSCHeGRBIrGxxPCK8=;
 b=geExLAXw5TEb3OVTadMP9jMe5EZzxBqcf0DqKwzOAAy+ztohp5r/C7RQj0XksbZel0
 fr1D1cc2TTruTFNe7D6eqCng+0Q5lM5P/PQtCTFMp7HfmznOzeZZ38uS4aptoFiMJfby
 xfDDFIfocoIQ9p5REr9Sf5mQhLZE3XNqwdOQPK8vaeMsVb9taHFrRElQdXYflEo1D4Bh
 yYKRDJpy1dCiSReOFp8Yvpe5ojZQQyAhWoghQKYJftkIBWIbZncbTNid6SPA9/7H0pPr
 KDiRK8PaWKRNIUSDJhBS+BLweDwn7mib6TuQjB1jn8VGA4+pdxMaTiwsrjC+p+D0LbKC
 wmJQ==
X-Gm-Message-State: AGi0PuaGgGVtLJGddw/TR8gsqBtTfqRX4SO+bYQLH2Q8bjkWTFTjiPyX
 KbVRp8aueLZkwB2bzM2mIJfcoKFnPZFYheCtN3JRLw==
X-Google-Smtp-Source: APiQypK82UEk7YgAmzB6j8WkeB84wrKtJtYYIskd30+A1gBsohCxh4zzpvNE67EzxJDiX4nEgdCsTv5kPjuorXTtkCc=
X-Received: by 2002:a05:6512:318a:: with SMTP id
 i10mr23577379lfe.96.1588182837464; 
 Wed, 29 Apr 2020 10:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <38BD6912-026E-4145-9489-1E839CE5877A@fuzziesquirrel.com>
In-Reply-To: <38BD6912-026E-4145-9489-1E839CE5877A@fuzziesquirrel.com>
From: Richard Hanley <rhanley@google.com>
Date: Wed, 29 Apr 2020 10:53:45 -0700
Message-ID: <CAH1kD+Zf+Vx6ytOC8LPWNeGwo92284Nu87KhmGiAGkmoTyAs4A@mail.gmail.com>
Subject: Re: modeling and reporting io fabrics from BMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000de041505a471a14a"
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

--000000000000de041505a471a14a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't really have any experience with any prior art here, but I am
expecting that we'll be looking into managing fabrics in a BMC with Redfish
soon. If I learn anything else I'll let you know.

On Tue, Apr 28, 2020 at 11:03 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> Does anyone have it on their radar to implement the
> fabric/switch/endpoint/port Redfish schemas?  I=E2=80=99d also be interes=
ted in
> hearing about any existing non-redfish designs that do something similar.
>
> For example - does anyone provide an interface to the inventory of
> something like a SAS enclosure?
>
> thanks!
>
> -brad
>

--000000000000de041505a471a14a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t really have any experience with any prior art =
here, but I am expecting that we&#39;ll be looking into managing fabrics in=
 a BMC with Redfish soon. If I learn anything else I&#39;ll let you know.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Apr 28, 2020 at 11:03 AM Brad Bishop &lt;<a href=3D"mailto:bradleyb@f=
uzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Does anyone have it on their =
radar to implement the=C2=A0 <br>
fabric/switch/endpoint/port Redfish schemas?=C2=A0 I=E2=80=99d also be inte=
rested in=C2=A0 <br>
hearing about any existing non-redfish designs that do something similar.=
=C2=A0 =C2=A0<br>
For example - does anyone provide an interface to the inventory of=C2=A0 <b=
r>
something like a SAS enclosure?<br>
<br>
thanks!<br>
<br>
-brad<br>
</blockquote></div>

--000000000000de041505a471a14a--
