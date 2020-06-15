Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E31FA168
	for <lists+openbmc@lfdr.de>; Mon, 15 Jun 2020 22:26:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m2sn40SRzDqc9
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 06:26:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=vasantpatil2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QQIzfBMB; dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m2s11XYQzDqc9
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 06:25:38 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id t8so183168ilm.7
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jun 2020 13:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Qqbtj57er5KQ/PD6dOtFLrKpOzg/H0+Vjx/l24HMHtc=;
 b=QQIzfBMB2lDHkZmuJRcoAWwZrvvJJ3tzr7p1Fb4Pag+tFv6E7PsTpvx6IqPNFHnrrv
 Y2GBwBa+wnm9FmQcoHJJ4nnfR9JM3nPy20kaBDpz6a3i5nDZd7ipSCZl8pjgCMSIu2rP
 lJSe2wZWwBdD6w3fKc5PEuhAN35o/9W2Btn8N3gP7gRZSrZDY19f9MpMA/2VXEKAeLca
 ywZn5AZgxCYv9plfAzQScLnr8YRsc2rTRGaFtvL9DzXilgXkPiX5IEkoS1hejcF2P8xR
 oIBGPJvIio+kxGQIAgJDKUjIkIXMyGCCUisNXWmpXyH88AgOwZxnMWZTfXjuDWKIyMPh
 KfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Qqbtj57er5KQ/PD6dOtFLrKpOzg/H0+Vjx/l24HMHtc=;
 b=POJgeUVH84Y9HXcrUTWA9c4UxoKaBrAxL8U/0B8/B/deLBv4osc3wrEs5wOTnPb4aq
 comzyB+QNw3ivt9ibWTjq8WiKyuEhGjGZTQLN72gqqZVhJ1EggKqgWTRXKRzGUFa7KeJ
 +mAJhLFYeHZ+RIvDh7xpqqGwYNbZu/lUSey1jNAHxsW1/G0mJLECQI6OF3Ey/juspZ6C
 F4aof9Q6aIMyRzKn2q5adjJ/eux4TfrcrWfgL9lWXtHzMr7ISziv83CiKrcBoqsGpNa5
 B/uQ4Je2q7hy562MRHwZr69VK/J7CNetQpD2KshC8zDYaae+AYIUfVoGMReW2B2lWL+V
 7V4Q==
X-Gm-Message-State: AOAM531iUz3uEnnMYU74dGdKCaMpLpRjeL17QJPOQcN2+ZOF5EmeYQ2l
 0zlK3d6h8r0Z7qqweUYej55q8uKuHgXrMh3TFOF5I7mx
X-Google-Smtp-Source: ABdhPJzrEAs1gcMoUMzsv4oymzBvHHvN3LDgzyR5HtLDXZ7cm9ovXnNRAGukGBQ+tAj+hy14uSo/G9ZGhZtcSHYAxqU=
X-Received: by 2002:a92:b00f:: with SMTP id x15mr26286199ilh.27.1592252733938; 
 Mon, 15 Jun 2020 13:25:33 -0700 (PDT)
MIME-Version: 1.0
From: vasant patil <vasantpatil2@gmail.com>
Date: Mon, 15 Jun 2020 16:25:23 -0400
Message-ID: <CAERBOQ+x3aUmFu+pZUPjn4DOJ_iXKWpgG1Cq-Mza7F5hCS47mw@mail.gmail.com>
Subject: Redfish Support
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009961b505a8253a2c"
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

--0000000000009961b505a8253a2c
Content-Type: text/plain; charset="UTF-8"

Hi Team,



I am Vasant from NVIDIA corporation. We are exploring adopting OpenBMC for
our products.  Thanks Andrew J, Deepak K , Patrick Williams, Ben Wei and
Sai for your guidance so far.  We have below questions.



Is below two functions supported via redfish

   1. System Boot order change
   2. Changing SBIOS(UEFI) control & configuration parameters .



*General Question: *

   - Are users allowed to attend the working group (like PMCI) meeting who
   have not yet signed the CCLA?



Regards,

Vasant

--0000000000009961b505a8253a2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;fo=
nt-size:11pt;font-family:Calibri,sans-serif">Hi Team,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">I am Vasant from NVIDIA corporation. We are exp=
loring
adopting OpenBMC for our products.=C2=A0 Thanks Andrew J, Deepak K , Patric=
k
Williams, Ben Wei and Sai for your guidance so far.=C2=A0 We have below que=
stions.=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Is below two functions supported via redfish</p=
>

<ol style=3D"margin-top:0in;margin-bottom:0in" start=3D"1" type=3D"1">
 <li class=3D"gmail-MsoListParagraph" style=3D"margin:0in 0in 0.0001pt;font=
-size:11pt;font-family:Calibri,sans-serif">System Boot order change
     </li>
 <li class=3D"gmail-MsoListParagraph" style=3D"margin:0in 0in 0.0001pt;font=
-size:11pt;font-family:Calibri,sans-serif">Changing SBIOS(UEFI) control &am=
p; configuration parameters .</li>
</ol>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif"><u>General Question: </u></p>

<ul style=3D"margin-top:0in;margin-bottom:0in" type=3D"disc">
 <li class=3D"gmail-MsoListParagraph" style=3D"margin:0in 0in 0.0001pt;font=
-size:11pt;font-family:Calibri,sans-serif">Are users allowed to
     attend the working group (like PMCI) meeting who have not yet signed t=
he
     CCLA?</li>
</ul>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Regards,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Vasant=C2=A0</p></div>

--0000000000009961b505a8253a2c--
