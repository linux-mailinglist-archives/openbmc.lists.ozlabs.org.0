Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF816B35D
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 22:55:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RG8p59G5zDqGF
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 08:55:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=xiangliu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hZRvgce9; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RG816xNyzDqCY
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 08:55:07 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id a2so10097857qko.12
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 13:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2wxquDNLudok7XCrT6Gs4QqQxsthKQ1XPBcAiYyUNHY=;
 b=hZRvgce9mO31f3Hwy5KlSAYaAvYXJNzbrKdmKGUWKNQVIiiQ16zMdJ5u1AHD0ea6lV
 p/cHkO6u4YhZg5WdV7ToNk3gQFOY/PZOsCUHD5ok6YKDo09JxscMhcz6OBUvS+ZZxwj2
 St4cJg/7ljPZIJPyyEY6IKvNo3HLXIkpduWKntt32Cdfrlf5KOTh1KZ8WZf9Zzos+wIR
 fxzO8rtb/sS0uQVZJfyQsa3urexuTVcmjuSCSdAoSH9vZkj7Xqz8NiFBXTOIyz7bSgoN
 IcNh+dcq5BPRs0K+00/ZInZrcLsIbgpyTgEhHlIzUnXE3lRYY42VI8UUGvLjT4lABzrY
 oYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2wxquDNLudok7XCrT6Gs4QqQxsthKQ1XPBcAiYyUNHY=;
 b=PKZP0mxCvCE5FgKfkcnSm1BR/fsq5WYUycD7tifKhUB36RP4zHfpKRTJiMAsZIukLo
 MAqBqhuKIQ0ubY8kcMBsVdr9MEgEqAtyy7hz1+5Wp6J5Y/L4NAOh0TkMu1SwTurOnyvJ
 VkozGzs6D0eJhqGNeN0P9L5lwCFD2IN7Pb62hPBi+u4l3xZbdbwo0Dg4yIZe5gYMIGM7
 6PekgU+MIqeRTdl/U8SkuBMT10I26cGmirIEPIf0Kl4xQok2KMhxjBCMPuDUoWC5a24s
 zjyZHXgi0fW2p/Dpz3pVFw0hI67PVb68rrwNRO4yk93amQUz3GaSLNWSaEw+rPRyxtbe
 2xLg==
X-Gm-Message-State: APjAAAXOfU5HO9cuym6MkY7QCsH3HOapisFTCv+NbHHPC2xY8PQg2YKU
 5XBu83y7j/M7XdT9hRBYE94R0PhmUPJrW3cWdI6+u/J5quU=
X-Google-Smtp-Source: APXvYqySt9Yc/mqybUaEF1d+nmDFMhGzEXWAnPM//Hr8b1L3Dw5v/Nf5t01GEkrZz5FaVzmSxFle7RRnfgXCGnxFTJA=
X-Received: by 2002:ae9:e410:: with SMTP id q16mr36482819qkc.399.1582581303138; 
 Mon, 24 Feb 2020 13:55:03 -0800 (PST)
MIME-Version: 1.0
From: Xiang Liu <xiangliu@google.com>
Date: Mon, 24 Feb 2020 13:54:27 -0800
Message-ID: <CAH57Xkz0BDp9NY7QdB0i329t=YS7Vk4TQccv8bg6DSXknYVsUg@mail.gmail.com>
Subject: Possibility to move microsemi switchtec-user support from
 meta-facebook to a shared meta-layer
To: openbmc@lists.ozlabs.org, amithash@gmail.com
Content-Type: multipart/alternative; boundary="000000000000673761059f596c3e"
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

--000000000000673761059f596c3e
Content-Type: text/plain; charset="UTF-8"

Hi Amithash and other openbmc contributors,

It seems the Microsemi switchtec-user tool has been integrated to
meta-facebook, the recipe is currently located at:
https://github.com/facebook/openbmc/blob/eaf4d364e55f96a5b37331049db1a718d8667e5a/meta-facebook/meta-fbep/recipes-fbep/plat-libs/switchtec-user_2.2-rc1.bb

I am wondering if this recipe could be moved to a shared meta-layer, like
meta-phosphor or an upstream layer? As our team at Google will also need
this tool.

Thanks,
Xiang

--000000000000673761059f596c3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Amithash and other openbmc contributors,<br><br>It seem=
s the Microsemi switchtec-user tool has been integrated to meta-facebook, t=
he recipe is currently located at:<div><a href=3D"https://github.com/facebo=
ok/openbmc/blob/eaf4d364e55f96a5b37331049db1a718d8667e5a/meta-facebook/meta=
-fbep/recipes-fbep/plat-libs/switchtec-user_2.2-rc1.bb">https://github.com/=
facebook/openbmc/blob/eaf4d364e55f96a5b37331049db1a718d8667e5a/meta-faceboo=
k/meta-fbep/recipes-fbep/plat-libs/switchtec-user_2.2-rc1.bb</a><br></div><=
div><br></div><div>I am wondering if this recipe could be moved to=C2=A0<sp=
an style=3D"color:rgb(38,50,56);font-family:Roboto,sans-serif;font-size:13p=
x">a shared meta-layer, like meta-phosphor or an upstream layer? As our tea=
m at Google will also need this tool.</span></div><div><span style=3D"color=
:rgb(38,50,56);font-family:Roboto,sans-serif;font-size:13px"><br></span></d=
iv><div><span style=3D"color:rgb(38,50,56);font-family:Roboto,sans-serif;fo=
nt-size:13px">Thanks,</span></div><div><span style=3D"color:rgb(38,50,56);f=
ont-family:Roboto,sans-serif;font-size:13px">Xiang</span></div></div>

--000000000000673761059f596c3e--
