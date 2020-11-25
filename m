Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B482C4543
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 17:33:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch6006z2hzDr24
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 03:33:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=priyankapillai1206@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N25N4T5B; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch5yv6Jx2zDqn5
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 03:32:36 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 10so284276ybx.9
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 08:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RtkeoUbqgQQbdArqxy48+pf/f5l3cRcTvY9c2dqDXl4=;
 b=N25N4T5BXfVlUDvKXGPW1FTX2tHrzDUnoH7KEL3u9ch9dIWM31JoMKsEAwIaqWm/43
 RXgxmbNL53OMs0W5LF/aMWbiwbjTN6KgsPQdFG/P2LIUmc+bO5nB5FrTjBvW2doFR5JG
 ngs7QSHctNsd2lvckTkQYpT9LJbgx83QGBv/USJbXLdI1eHSe73bQiY2RqkVx2vZQlKe
 c+dacx2lEvcQk71XnW6bV4L4rh2Ru4vooWJQpW4MGwcb07lNkv0nkeHYt6HUDTCkhKYD
 lEva8RjRpGmvOskukaW6whRb7fj1PxdgwHti6Y828MwNcJvZd9nY0GJ/VEGx7WEXHwRQ
 zlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RtkeoUbqgQQbdArqxy48+pf/f5l3cRcTvY9c2dqDXl4=;
 b=Nofm1gP1BpPX8RJ3MHhO1Y3aASyt4lFM+k/cLrDrQ/+vOpx7pqDKxnWvS1OoGLQSdf
 0UQCGJzkB700tfAJO4D4G+0yIWsa9DZ8LW2JPJWoQPcipqZfdGYmafmhB7Q8IVjXEZLU
 /4R9t6DyKIzJa89/m9wHT58pVHSi+2p6yH7cX0sNKTEMizoc4eItpfg6HZcq4ZN6mOOr
 gDHEF56ry5IFKwS2scbOHzDZBD5ekSsW8WvsnBj1SyDmcv9j6hDAZnpi9qbfQJD6jRMU
 HMDsQIJceSCZ1a76FHm5g/Dh9dRNgTz7mcGDotxqa39GmHpaNJADakN4F4aySWfLMI+k
 tlhA==
X-Gm-Message-State: AOAM532BNgZkDcjEDMiaX2TRRcbSq5FCqYxFAa9baqRxgU4LB+qQuLjP
 7XeqBOV3A6JvL8rJHfetzXl8O4YyaF0660gBHBXrJoMx49s=
X-Google-Smtp-Source: ABdhPJzU8SSM/hRaa5pjHNugB1kiewc3xfrZ14y5kkNx2Mej6PMxzu9KSN2vlTW3TT97Py6NNhvhzQ/3DTeF7i2pv5M=
X-Received: by 2002:a25:d416:: with SMTP id m22mr4980550ybf.318.1606321952352; 
 Wed, 25 Nov 2020 08:32:32 -0800 (PST)
MIME-Version: 1.0
From: Priyanka Pillai <priyankapillai1206@gmail.com>
Date: Wed, 25 Nov 2020 22:02:21 +0530
Message-ID: <CAJCnuYnAaLx_T4-1xtym3Wuc2bkyrTDsK-NcPHLY2keBOxMaeg@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs - Factory Reset
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000005d6bbd05b4f0f9a1"
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

--0000000000005d6bbd05b4f0f9a1
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration of new Factory Reset screens
in the WebUI:
https://github.com/openbmc/webui-vue/issues/45

<https://github.com/openbmc/webui-vue/issues/44>
Thanks in advance!

Warm regards,
*Priyanka Pillai*
User Experience Designer
IBM iX : Interactive Experience

--0000000000005d6bbd05b4f0f9a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requesting feedback o=
n the current iteration of new Factory Reset screens in the WebUI:</div><di=
v><a href=3D"https://github.com/openbmc/webui-vue/issues/44" target=3D"_bla=
nk">https://github.com/openbmc/webui-vue/issues/45<br><br></a><div>Thanks i=
n advance!<br><br><font size=3D"2" face=3D"Georgia">Warm regards,</font><br=
>
<b><font size=3D"3" face=3D"Georgia">Priyanka Pillai</font></b><br>
<font size=3D"1" face=3D"Arial" color=3D"#696969">User Experience Designer<=
br>
IBM iX : Interactive Experience</font></div></div></div>

--0000000000005d6bbd05b4f0f9a1--
