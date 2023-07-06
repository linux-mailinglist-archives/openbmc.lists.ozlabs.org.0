Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8374ABA0
	for <lists+openbmc@lfdr.de>; Fri,  7 Jul 2023 09:14:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Cblr+zvn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy4Q31JMhz3c2t
	for <lists+openbmc@lfdr.de>; Fri,  7 Jul 2023 17:14:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Cblr+zvn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com; envelope-from=zinger.ad@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxWFH6MWWz3bsX
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jul 2023 19:19:31 +1000 (AEST)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-444f9c0b2a4so138523137.1
        for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2023 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688635167; x=1691227167;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B6K+mF3mg4Az1ocZP+usT0tR4xja9bN2QcK9C3nFMSo=;
        b=Cblr+zvnL58+KuTHWXUZzRwMrCWf7xijh9hRegak5UB2jLg8B32y9VrlmicrXP1gKD
         +09pz2tmA8XYTCc6+MGeaMER+mGag3rIcSxQaFi2mBWk4FsSsMwAJG1wHcihoJ9B0rIO
         QjTd2zhKaJv6O9sh97/AkIxaRki6L9Bp0C8oHt1t0rUHFGNlTdYAyk8qe1QQVqhRpgob
         VPtQtkGC1e8ozDxOPsxt2tOdO1oVJv/cbvv5po0N3QqRj3zBzN5IMJBoOO2oQszxbFl0
         PKNjgO8QIvGBpd4RWwtPHbFFQ54Ze1hu37ip4014tGDIyvzLC3/A8Y5oQhuksx6X+tYL
         Ky6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688635167; x=1691227167;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6K+mF3mg4Az1ocZP+usT0tR4xja9bN2QcK9C3nFMSo=;
        b=cAh7jMPtbXNXa+GzgzB6Z93I0DWkPGroDWfu7nOmz//Jv0bo3abx6OGMAq4I5d8msZ
         IhJg3YTXvkRrMjyx5yJOteeHus+Y8KMTAGez62mFGo9K2ZUfy79t0MuJ/cCFcaFISaF+
         revNUt1O6ZbqKjqh1DPEnbrpyzNdS/Q46PeI+tmXRdi12otL/4g1upyPMpzBO3ghLHXz
         dZEKidFNBzaaeicxDpERrW4Mp5b+cb7o7xwBbfR0E8L/MiJRrGmbCD+34pqx7c9nqvjU
         BoifhPArTEv2487PmKxzXpbCe07xbhCWJqs+qjr1Ukxrn8mZ19VC232b4PzbybiXFNBg
         ry0w==
X-Gm-Message-State: ABy/qLaQJ1OfoJhzUE41WjVlHyzJQ8t6fLsucs0M/FJIS9+I88h0Zxjv
	8p+uJOwIyOq0te2XhCTdpcQl703A0Cor5htz/S8onFIP3bQ=
X-Google-Smtp-Source: APBJJlH266lY/Tn5AmyLpFr1RUCJ95/LwLYNHccOlNDh5YWqtiGmRqDpzXQ6vbzBylY3BvN7SKYXgxaNakVf+thAkT4=
X-Received: by 2002:a05:6102:11ef:b0:443:77d4:e360 with SMTP id
 e15-20020a05610211ef00b0044377d4e360mr605230vsg.25.1688635167250; Thu, 06 Jul
 2023 02:19:27 -0700 (PDT)
MIME-Version: 1.0
From: Adrien Zinger <zinger.ad@gmail.com>
Date: Thu, 6 Jul 2023 11:19:15 +0200
Message-ID: <CAFhrGTy3_0AsLC24LY9rsMmB6MOvOayG=jT2gRZwceLes0Ogwg@mail.gmail.com>
Subject: Configuring aspeed to use P2A Bridge
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004c9e2605ffce03b6"
X-Mailman-Approved-At: Fri, 07 Jul 2023 17:13:34 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004c9e2605ffce03b6
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm working with an ast2500 and I'm unsure about the required configuration
to expose it as a graphic card.  I hope you can help me.

Basically, I changed the device tree to enable the p2a and gfx. I have used
two memory regions in the reserved-memory section for them (I don't know if
there are any specific regions to choose). Do you know if some specific
modifications here are mandatory ?

I also heard about a possible configuration to open some windows and show
up the ast2500 as a graphic card. I'm actively looking for which register
to modify, do you have any advice ?

Thank you in advance for your help. Sorry if I'm using the wrong mailing
list.

--0000000000004c9e2605ffce03b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;font-size:small;color:#000000">Hello,</div><div class=3D=
"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;font-size:s=
mall;color:#000000"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif;font-size:small;color:#000000">I&#39;m work=
ing with an ast2500 and I&#39;m unsure about the required configuration to =
expose it as a graphic card.=C2=A0 I hope you can help me.<br></div><div cl=
ass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;font-=
size:small;color:#000000"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,helvetica,sans-serif;font-size:small;color:#000000">Basica=
lly, I changed the device tree to enable the p2a and gfx. I have used two m=
emory regions in the reserved-memory section for them (I don&#39;t know if =
there are any specific regions to choose). Do you know if some specific mod=
ifications here are mandatory ?<br></div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif;font-size:small;color:#000000"><=
br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,=
sans-serif;font-size:small;color:#000000">I also heard about a possible con=
figuration to open some windows and show up the ast2500 as a graphic card. =
I&#39;m actively looking for which register to modify, do you have any advi=
ce ?</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica=
,sans-serif;font-size:small;color:#000000"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,helvetica,sans-serif;font-size:small;colo=
r:#000000">Thank you in advance for your help. Sorry if I&#39;m using the w=
rong mailing list.</div></div>

--0000000000004c9e2605ffce03b6--
