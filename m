Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD31A074D
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 08:31:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xHbp44XYzDqsx
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 16:31:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=tajudheenk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WsOrUTPT; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xHZd3fRwzDqmY
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 16:29:55 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id c15so2423842wro.11
 for <openbmc@lists.ozlabs.org>; Mon, 06 Apr 2020 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0aaT9LgtYusTqAvPdoRQED0fcJU/pTg2h/7FLAX1KKY=;
 b=WsOrUTPTgoqzHr9XqLuF8HZDCzAqbOoI/6eF3x3SEaC2ktMVs0rt1ELdc0dsPuSJbF
 AJR/2nW51g8o2t5xghCNPHOnU9zv6Ew5OYEhn+QskBGNn5kKTp7venmee4qn2JQocS3h
 nlttPwlEALSQoa2GzV9ZefljZxaIdx7qwYCtfTMrd6d/mXkDoczE8jxHx7ilbb6Mg8ko
 g96mwDbmX/DasXxWGP2yEQYMBqX3pEl72LIzi+l764zRA4lNzNh+aolc2wTBNQAy6Oqt
 9WDR4e0MD6w8CcaHzVPzsqNbp1N8vy3baqW0/dsv3Fq69T6/boMLOBX7VQNfba8rCJCs
 sXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0aaT9LgtYusTqAvPdoRQED0fcJU/pTg2h/7FLAX1KKY=;
 b=dIRiyBw2BA6xLIFlGcS3XIaeHK+i4W9akMcWA4r+nyLLZ82ohvVMYfnHNw8sItfoay
 RFYSF79EmtS+e+eVRlRPk6rpsLZmyw6tsGiuT5DKELl0gI+Xz2I5QhivZmj9B43ufe+F
 zV9BI0HcXRWS10lHHXVAQTn+1BkDbkCfXkhECg+uotCfUn+N1tm9eIKd8X/Nz4uwkUYO
 49p5M/54CMEGd7q4jtWeZJUSFnE9dUC47VxQF1nomXjOawcyE1lSpYca13FFgydp9b5V
 vNNPb7kLV360TtqKSgiZRSN4J9ngLauzNZ41FIvvdUIGXBjb0m3T+zkh5SgschusihRy
 A/xg==
X-Gm-Message-State: AGi0PubSIpXhDIslgS7DG7KHqYgmckpWJ6tv4bVSqSfmDZ5dXx4HbIzs
 s2Cy977vxGR1f44UqlDA/acTQ/s7EsgPpAS6Ai+huxav
X-Google-Smtp-Source: APiQypIpWG4BC4rrSxz3JkQ68vYj0AjEe3DocIWZB23ejlPrPYqkERU0hFmE37L6uogeoIhiiUIiJM2NwuhIHflQLzU=
X-Received: by 2002:a5d:6a10:: with SMTP id m16mr957537wru.371.1586240989553; 
 Mon, 06 Apr 2020 23:29:49 -0700 (PDT)
MIME-Version: 1.0
From: Thaj <tajudheenk@gmail.com>
Date: Tue, 7 Apr 2020 11:59:38 +0530
Message-ID: <CAH2KKeZH=AGvqmUkGEv94wuW85fSHnv=bOHsN7zy5cxjX-X0iQ@mail.gmail.com>
Subject: Sending hot keys in obmc-ikvm
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b5e73f05a2ad826b"
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

--000000000000b5e73f05a2ad826b
Content-Type: text/plain; charset="UTF-8"

Hi Jae,

Is there a way to send hot keys (like CTRL+ATL+DEL) in obmc-ikvm?
Some hot keys are very much necessary to work. Like CTRL+ATL+DEL is
required to login in Windows Server.
Right now the hotkeys are redirected to host OS and not to KVM.

Regards,
Thaj

--000000000000b5e73f05a2ad826b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jae,<div><br></div><div>Is there a way to send hot keys=
=C2=A0(like CTRL+ATL+DEL) in obmc-ikvm?</div><div>Some hot keys are very mu=
ch necessary to work. Like CTRL+ATL+DEL is required to login in Windows=C2=
=A0Server.</div><div>Right now the hotkeys are redirected to host OS and no=
t to KVM.</div><div><br></div><div>Regards,</div><div>Thaj=C2=A0=C2=A0</div=
></div>

--000000000000b5e73f05a2ad826b--
