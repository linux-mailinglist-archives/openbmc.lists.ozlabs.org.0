Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB887942F3
	for <lists+openbmc@lfdr.de>; Wed,  6 Sep 2023 20:18:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fHsyfgWq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgrGk0LRxz3bNm
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 04:18:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fHsyfgWq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=sushilkdubey@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgrG52f5bz2xdp
	for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2023 04:18:03 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-500b66f8b27so94560e87.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2023 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694024279; x=1694629079; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0d0FkVBbs9fxdLztJ2h7Yfy/UDgez0TysxU3Jtv8u+Q=;
        b=fHsyfgWqR2ECd7v+/zHGSH4fvAciTxyP1xfd8JCThWEAc6H+8kuIBVveu5iN5jX+XN
         9OkU9LsBZ9EV4Uic23JS6XjDdRyy5TRFzznDMILT7Ty9NFR46Pmg8w3Ofb93PMKu97tA
         iwWkD+W23nRhq6MHi0uWrsMxJsGR+HKgv2t2EiqpoQ3hnjfeQ2zMJvmJQBTRwJ8Ubi+N
         WBVnzcqnlkX4B6Jh+V9fzhWgr5v9OPGT8daF7mvL3yTHEw/umDCGPbVVZR+K/3p4S5ef
         0i0uXdbjUdulc8bJ7u+5m4bR5meNN6BZnz/nXUyrVt0x397kPm6Fo8e9/N+MeYaH4Azf
         umfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694024279; x=1694629079;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0d0FkVBbs9fxdLztJ2h7Yfy/UDgez0TysxU3Jtv8u+Q=;
        b=FcKyvsOCPPgDUdCFC+myRrhoL0PVcK1SZHKdRGhLzwRvOUCJkEh1/9k/7V4prEeJ+r
         h2+AeP9UMIyJ7raCTqHGy/iSLU2dmJU4wFfyE4zWA78sy97sh/1Lor7hkidN6aqPGb03
         nE+9iWPMehJFlY9Lk6RuMdpFcxa0gKpsvSrFmi2emtG8AMMWWAp0uyp7gShjB1mMBxXc
         7VRn6QCCwO0ytpQLgWsUjwlX/LuP4hH1bWrrjpgTMU3kJaAcJX/tFEGJygmc4yzJMqvN
         ZEom4+kj1Rzw2vcnvlNJta8YvLN8yKtwTT76ueEgVsniys9OtIQucLWhRdt58UKnrnZL
         jQyQ==
X-Gm-Message-State: AOJu0YyTAAd6/yxbP36PuCQsf07Qd1dCRNQQaILZpVXvln8G1LWAg/J6
	3yp1ywa48sdtwkfq6tw2kqTZt216YTcF103noR/GBaaRxqzXMg==
X-Google-Smtp-Source: AGHT+IHoApjYaBGDeYqpEZT4OhjLYzAWdigild+HOq/qkxKf0DthMIHHgifazWL8qI6framBF1IxcJ9IfwyUHDvwA4Q=
X-Received: by 2002:a05:6512:706:b0:500:9b7d:ee3c with SMTP id
 b6-20020a056512070600b005009b7dee3cmr2914825lfs.7.1694024278673; Wed, 06 Sep
 2023 11:17:58 -0700 (PDT)
MIME-Version: 1.0
From: Sushil Dubey <sushilkdubey@gmail.com>
Date: Wed, 6 Sep 2023 23:47:47 +0530
Message-ID: <CAMyVXekf3n2f5nB+dF+5Kv6Pr715utC_KiGgA=upP6S+PdWYQg@mail.gmail.com>
Subject: USBNet issue on AST2600 :Linux upstream sync from 5.15 5to 6.1.15
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000005f0ee90604b4c357"
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

--0000000000005f0ee90604b4c357
Content-Type: text/plain; charset="UTF-8"

While doing upsteam sync of linux kernel, I am hitting an issue with USBNet
link up.Though USB0 interface created, ping not successful with link
partner(Host Controller)

On the same setup, with 5.15 kernel, USBNet is all functional however with
6.15 with latest ASPEED UDC driver and G_ether, USBnet is not functional
and I found that

6.1.15 gadget driver selects platform-1e6a0000.usb-vhub which should be
platform-1e6a2000.udc.

Please let me know if any of you have encountered this issue with
6.1.15(v6.1.15).


Regards

Sushil Kumar Dubey

--0000000000005f0ee90604b4c357
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0in;font-size:11pt;font-family:Calibri,=
sans-serif">While doing
upsteam sync of linux kernel, I am hitting an issue with USBNet link up.Tho=
ugh USB0 interface created, ping not successful with link partner(Host Cont=
roller)</p><p style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-s=
erif"><span style=3D"font-size:11pt">On the same
setup, with 5.15 kernel, USBNet is all functional however with 6.15 with la=
test ASPEED UDC driver and G_ether, USBnet is not functional and I found th=
at=C2=A0=C2=A0</span><br></p><p class=3D"MsoNormal" style=3D"margin:0in;fon=
t-size:11pt;font-family:Calibri,sans-serif">6.1.15 gadget driver selects <s=
pan style=3D"background:yellow">platform-1e6a0000.usb-vhub</span>=C2=A0<spa=
n style=3D"font-size:11pt">which should be </span><span style=3D"font-size:=
11pt;background:yellow">platform-1e6a2000.udc</span><span style=3D"font-siz=
e:11pt">.=C2=A0=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0in;=
font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:11p=
t">Please let me know if any of you have encountered this issue with 6.1.15=
(v6.1.15).=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin:0in;font-=
size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-size:11pt"><b=
r></span></p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font=
-family:Calibri,sans-serif"><span style=3D"font-size:11pt">Regards</span></=
p><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Cal=
ibri,sans-serif"><span style=3D"font-size:11pt">Sushil Kumar Dubey</span></=
p></div>

--0000000000005f0ee90604b4c357--
