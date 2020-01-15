Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A086142219
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 04:43:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481HZ95pcqzDqTL
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 14:43:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a29;
 helo=mail-vk1-xa29.google.com; envelope-from=sdherts@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cm7ZFSwH; dkim-atps=neutral
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yZLW2G4XzDqFJ
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 04:38:37 +1100 (AEDT)
Received: by mail-vk1-xa29.google.com with SMTP id h13so4942874vkn.10
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 09:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Km9jfnKiZE2vyaPsCsc3v8Crc3pXdkQwMPzBUxrSeS8=;
 b=cm7ZFSwHsw6Nmaql0v5eMHhNL/Ksbu/Ioj17lqI6RgljuHnbxSisJ1ROige57Bfg4k
 2TfFjNLJhb+3/kF2q55sNehaskQQYuB5xLZW9Oaz0gdXxDdB2nXEQPVLFzXHa+l4CHaU
 CCWVC7DSOmdZtIGDNnWusyVt7txForV4JfHgs40/R9+BuyCIcIoT9KcnxYKb3KjLjoYY
 mR4DRhvD2a1vsZnwyHu1nU5UilONGFQ/myF6PrCVZqVFkG7TZGZJQYCIuD9idyOUd53U
 qiiBbVF2Mt3foNnyFOvTlVEngRX0ophl8WaZAfEzDyUMR91+/WAdxmAyaPWtDe3vBnz7
 MkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Km9jfnKiZE2vyaPsCsc3v8Crc3pXdkQwMPzBUxrSeS8=;
 b=hBj6i3i9m4HYMtFi3ufrn6F1PCrvnBNhZljJYCpL2E1cbnwqNdk0AVA7l7h653ThHC
 ez+8j5G8TzFJ0vH7WSxVEKqT5Jix4q7eQgxoO475RF4NZWRE9ivawtzLDxIsZfpbLimt
 76s55XZQjzdbwqrBykdoGiOU9toZcvBQrjRLLm+LCboz5wFInkhtTTF9h1PJcv4RXMMm
 tmwuSoKPQEPvCoAgyXrXnaZqJ6mSNyPtHGUdPmA7p7+1Zt42bE7e2ARt2R+PxBiDc7Ys
 ByvD/Pd2zKMvvqVL5K9chvi7A2mxkqzkJAGqtMRp57EpXtm6idUXON6k9oTV3Xvs4in3
 sIJA==
X-Gm-Message-State: APjAAAVboWPNpk8xomobeKDNz2SRimg3nuro5hw6Wsv7grssJKrVubh3
 F7EMGu0qdgpmc+AOowsvxvu/JR1j/1cJSFkadB8=
X-Google-Smtp-Source: APXvYqzVY+ueY4RKTQuXOiQF9TV1rTepOIvMDU0PV8fbNY86bHy6iSnXGBsvfXxtP0HJO5yf+xaQ6Qdb1YyfSRHsa3Y=
X-Received: by 2002:ac5:c1c7:: with SMTP id g7mr14933635vkk.97.1579109913572; 
 Wed, 15 Jan 2020 09:38:33 -0800 (PST)
MIME-Version: 1.0
From: Samuel Herts <sdherts@gmail.com>
Date: Wed, 15 Jan 2020 12:38:22 -0500
Message-ID: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
Subject: OpenBMC Starting Point
To: geissonator@yahoo.com
Content-Type: multipart/alternative; boundary="00000000000075b90d059c312db4"
X-Mailman-Approved-At: Mon, 20 Jan 2020 14:39:46 +1100
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000075b90d059c312db4
Content-Type: text/plain; charset="UTF-8"

Hello,
I am currently working on getting a working OpenBMC test environment up and
running. I am using VirtualBox and the github Development Environment
tutorial. I had a couple questions regarding how to make our own modules.
Would it be possible to upload files to the bmc on the virtual server?
And would I be able to make a script which can read text off of that file
inside the bmc chip?

I have a physical server which I am not using yet, would I be able to
install openbmc and the scripts and insert the file onto the actual bmc
chip, and eventually read from that file?

-- 
Sincerely,
Samuel Herts

--00000000000075b90d059c312db4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>I am currently working on getting a =
working OpenBMC test environment up and running. I am using VirtualBox and =
the github Development Environment tutorial. I had a couple questions regar=
ding how to make our own modules. Would it be possible to upload files to t=
he bmc on the virtual server?</div><div>And would I be able to make a scrip=
t which can read text off of that file inside the bmc chip?=C2=A0<br></div>=
<div><br></div><div>I have a physical server which I am not using yet, woul=
d I be able to install openbmc and the scripts and insert the file onto the=
 actual bmc chip, and eventually read from that file?</div><div><div><br></=
div>-- <br><div dir=3D"ltr" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr">Sincerely,=C2=A0<div>Samuel Herts</div></div></div></div></div>

--00000000000075b90d059c312db4--
