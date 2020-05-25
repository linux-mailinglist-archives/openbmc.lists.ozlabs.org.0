Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2EB1E0E6F
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 14:28:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VxGd1MXTzDqM1
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 22:28:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=cmd.nu
 (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=blue@cmd.nu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=cmd.nu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cmd.nu header.i=@cmd.nu header.a=rsa-sha256
 header.s=google header.b=bQSlanC4; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VxFR6sZrzDqCZ
 for <openbmc@lists.ozlabs.org>; Mon, 25 May 2020 22:27:52 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id h21so20302514ejq.5
 for <openbmc@lists.ozlabs.org>; Mon, 25 May 2020 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=mjdbvvySUHbQFjg4rVuDBzO1Q7Wj+9RkSraJbddOxBQ=;
 b=bQSlanC4YDyQ3liOJYRZp6LDpJu4AWsRTwRToVlXpAO8nKLO69PY95a+ax/SAo+6Ju
 TNWWftgJyHSKyhDv7O8j7vgOJ2YCaHaU49GM0HLGxVM8VDYvY+8Iyxqt25L9mdm1sjFo
 B6x+deF/b8f0pkwxdc/aYQSAsC51kGiWRfZS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mjdbvvySUHbQFjg4rVuDBzO1Q7Wj+9RkSraJbddOxBQ=;
 b=U9LNxB/snUDgmn/ZS3SiCD/EQKBL/RC679mH/d9ZrBSTHuSv8RMLll+/mo4fbfKMGv
 1QBhQYOUL1JGqozu9FWsYSjpc3UlLDDiFQN5Tp5f1MdyVMS45vbqd1PptE6+bQmpAyLP
 rzX3JakDrnIOD6USzIHZrabApjFaMS71ifKTQxVoNGJJHqapBsvAasYSie71kuEgy5qV
 sh84MnTJC2LWe7RICH1sTCv1Xynn7/snP4J8DAdVwQLfElQNmBZIsaCB5B9fzHFjMeg1
 YiYbyBkIVAo0iB1tFvDkHLbsZqONWCvO0u9CVVaQ/J3nEFETRF7Ds6Izsq4jF28FszKf
 Yx4Q==
X-Gm-Message-State: AOAM531jTLpcsd3NJZbv8vSQDmmMKTXyjyhj2FItrd1HuIe1TBpDRp5H
 Wnk6Ox7hMppfqXMZWEnRJh0Gl4pL4uV7tIBYrgB8+v32tQ7nGQ==
X-Google-Smtp-Source: ABdhPJzzvVQtTtHa1X+tUBkU0C5zm/twI0pxd/E/h8vjsM4bEFKoDMPFnQIDs4oXmcL6n1dWowTw7UILfRJr8K8N7q0=
X-Received: by 2002:a17:906:7c4e:: with SMTP id
 g14mr19128585ejp.353.1590409667237; 
 Mon, 25 May 2020 05:27:47 -0700 (PDT)
MIME-Version: 1.0
From: Christian Svensson <christian@cmd.nu>
Date: Mon, 25 May 2020 14:27:36 +0200
Message-ID: <CADiuDARPjYVhhx6bQ68ETnXG0X7j6L7s7tnoW8ipCddU=oR2Zg@mail.gmail.com>
Subject: Pre-seeding properties into images
To: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000436af805a6781b80"
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

--000000000000436af805a6781b80
Content-Type: text/plain; charset="UTF-8"

Hi,

I've been contemplating the case of an immutable OpenBMC flash, one where
the whole image is stored on a, from OpenBMCs perspective at least,
read-only flash. One could think of doing this from either a security or
reliability perspective.
One thing that I would like to do for these cases is to inject things like
the hostname of the BMC, as well as the TLS certificates to be used.
A wanted property is that the build signature of OpenBMC shouldn't need to
be refreshed, and adding these extra files should be relatively easy.

Simple example to communicate what I'm thinking:
Something like (cat openbmc.img; server-aa01.tar) > openbmc-aa01.img. This
would then be flashed onto the server using normal means.
OpenBMC would then use this tar archive as an overlay of /.
The tar archive could optionally be signed as well, to prevent somebody
from overwriting /bin/bash or something like that.

Has something like this been discussed before? Thoughts on the general idea?

--000000000000436af805a6781b80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;ve been contemplating the cas=
e of an immutable OpenBMC flash, one where the whole image is stored on a, =
from OpenBMCs perspective at least, read-only flash. One could think of doi=
ng this from either a security or reliability perspective.</div><div>One th=
ing that I would like to do for these cases is to inject things like the ho=
stname of the BMC, as well as the TLS certificates to=C2=A0be used.</div><d=
iv>A wanted property is that the build signature of OpenBMC shouldn&#39;t n=
eed to be refreshed, and adding these extra files should be relatively=C2=
=A0easy.</div><div><br></div><div>Simple example to communicate what=C2=A0I=
&#39;m thinking:</div><div>Something like (cat openbmc.img; server-aa01.tar=
) &gt; openbmc-aa01.img. This would then be flashed onto the server using n=
ormal means.</div><div>OpenBMC would then use this tar archive as an overla=
y of /.</div><div>The tar archive could optionally be signed as well, to pr=
event somebody from overwriting /bin/bash or something like that.</div><div=
><br></div><div>Has something like this been discussed before? Thoughts on =
the general idea?</div></div>

--000000000000436af805a6781b80--
