Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A67259B98
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 19:04:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgtjL2ZtGzDqQq
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 03:04:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=pparth@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vhsMUWBE; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgtgV0yrhzDqL8
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 03:03:16 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a26so2728991ejc.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=g2/CbzCsp+F40gsDqea5VRy9BwYKjDE0ckHph8f0iSs=;
 b=vhsMUWBEh+/6VgRNixNS1XisTU59NlSAkBOnVZxZOtcI5XhkX6B2PZC2hNFtGNVP15
 cYZOHfTxBU+Uq7aT3HgwH3LQ/kpyXP+HnyCuNpCn1Wp9K4M9eVE11jJ374i/wl9hjyTF
 KbDU7XErKmqc/h3IwJCJi14Mc5rG+9TEF5NW0EFRXnDs3FeN/duQUbmYnxYqNZeBK3dk
 nCXMZB1MSrNms/s9EeF81tgBAT7HWcw/izD6PdOkeCP0D2GV3G0xorF5IbY1ShFz3XHD
 kW8iGaVvHa/ar1rvKWX0q8gLGV/4GU67GtiXTNOheThg4fCvBzaSHfuwEc7THw4foxml
 UGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=g2/CbzCsp+F40gsDqea5VRy9BwYKjDE0ckHph8f0iSs=;
 b=TkoLMIWjFPSlzFmiLwTohrlrxV0WlERyJsaD6L1HDsXaAZxXYASaXLr2mUERtJVbd9
 yK74IXNBuZvTPPoIn+aQtm4jk7yGM2/2dxBWKZlHf1IJm6ZNd07rcWMMEJfCiv9UwZih
 /+FfrHy/xiwqNRPJNbk+LlHpUDY49ZJNNh1rqAlMY3E5YfOlj8UYEi9qCfC37sM8iQZj
 FN2+lNg+0M1+CCSKQ5NgHFbvYpGuDfFy5RPeVlLDXpjLUWMYmw7als9WmVFkbDREwsus
 jI5wrqTXVZpHpFMpLWG0NQgrdmIxmsux5gPVtRI1AkHzolHWHIiTyNeyzYvQp8hbAyD5
 BZAQ==
X-Gm-Message-State: AOAM532TUJnk+Q/ZAWxTvZzcWUjiajotRqIdL4wzq/5kVU3/bOTrff9X
 vUOgjl505GUIrRBXHEuchVsnmOoCLAEJYueLuuzWexaUVTR1APy2
X-Google-Smtp-Source: ABdhPJyCQVSlbt6WTyCu0omq5dSFJ+qsn8qUc7BjsGaTA9nezB5mmviPnAk2A/G07MxluqrXpQQfeKyJ+uVQxb/AnUU=
X-Received: by 2002:a17:907:270f:: with SMTP id
 w15mr2503832ejk.141.1598979791194; 
 Tue, 01 Sep 2020 10:03:11 -0700 (PDT)
MIME-Version: 1.0
From: Parth Shukla <timevortex@google.com>
Date: Tue, 1 Sep 2020 19:02:35 +0200
Message-ID: <CAC1Cx+tv22v5ZfjD-UndFC6VL9z1zDSBoV3ZcSYzBiKvnbGa3A@mail.gmail.com>
Subject: Security Working Group Meeting - Wed 2 September
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000758e1505ae437e46"
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

--000000000000758e1505ae437e46
Content-Type: text/plain; charset="UTF-8"

This is a reminder of the OpenBMC Security Working Group meeting scheduled
for this Wednesday September 2 at 10:00am PDT.

We'll discuss the following items on the agenda, and anything else that
comes up:

   1. Common Remote API for TLS certificate management?
      1. Certificate management = installation, rotation, revocation
   2. Email: stable branches and security fixes -
   https://lists.ozlabs.org/pipermail/openbmc/2020-August/022762.html

Access, agenda, and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group

Regards,
Parth

--000000000000758e1505ae437e46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is a reminder of the OpenBMC Security Working Gr=
oup meeting scheduled for this Wednesday September 2 at 10:00am PDT.<br><di=
v><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">We&#39;ll di=
scuss the following items on the agenda, and anything else that comes up:</=
div></div></div></div><div><ol><li>Common Remote API for TLS certificate ma=
nagement?</li><ol><li>Certificate management =3D installation, rotation, re=
vocation</li></ol><li>Email: stable branches and security fixes - <a href=
=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-August/022762.html">htt=
ps://lists.ozlabs.org/pipermail/openbmc/2020-August/022762.html</a>=C2=A0</=
li></ol></div><div>Access, agenda, and notes are in the wiki:<br><a href=3D=
"https://github.com/openbmc/openbmc/wiki/Security-working-group" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/Security=
-working-group</a><br></div><br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Re=
gards,<div>Parth</div></div></div></div></div>

--000000000000758e1505ae437e46--
