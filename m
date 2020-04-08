Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 120AC1A2A1D
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 22:14:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yFqd1xMczDqZF
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 06:14:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332;
 helo=mail-wm1-x332.google.com; envelope-from=tajudheenk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XIRD9zLM; dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yFpv6gWXzDqNJ
 for <openbmc@lists.ozlabs.org>; Thu,  9 Apr 2020 06:13:57 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id c195so864598wme.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2020 13:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=L/NELp6fNxL7oJnV30uqRjIoksFb9qqrhHNvFwX/3qo=;
 b=XIRD9zLMEaDdtzMwbvWM1DJTT3BvcEa7HZ7ufJzrvGVmLFmbmIqU+quW5YQGTSHoky
 +FoCxGURzwH/L9iWkAISaxrYBomUtRBtuiEOlKI7ibWKl5Kr0TnzVt3uHziNe8KTQqGC
 S7YWSmdORlz3R41YFhXQhuJeKfFzcEvOxHJt6K0MEjUigi3adCy0tU6NbM20hoH4MWVF
 GktQ1DfrlU2+CSNnxhnMv2EIbjmTQNeWNui6u3qhUoFDewMF+bDQzA5Lj3aTinow3+7s
 454ErZA4295ini5b1IfICLVZxtJVieJ7oyri3srxxcqkcMheBieC58bgAkoYilVuQCHx
 atAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L/NELp6fNxL7oJnV30uqRjIoksFb9qqrhHNvFwX/3qo=;
 b=tQDUJHOU/XHqxGK9DxUJFOzsrI5OX6e6/QkGjX0g0sXpkwTi5QVCquI5GA9Fks6r/x
 7JwQ1WzDschif/kelZvzEQd5apmqg9yr66s9cYXkO5xxWLbuYjOrMUof3cmN2/SwJ7dA
 rKXaMqWifC1m2cGel6BjgDWKoseRA2ly2e75mtNf0z9xP/bGSi6StHNFJHqSc1i5IvNd
 qw9FnBfOvDzuWy73KHEBF/Dkw+1iWC8kZrLDBRuvl11duRmHAwIgQszh+d/MJyWpaqIf
 j33+NBnY575rNL+u4vVW5cfoWNb6utS4Fyv1CZnDn4figHUP1crXTOXdIjFZHGWIXztC
 IdKw==
X-Gm-Message-State: AGi0Puax75tl3QjUBycHBZq0f9yymj+IJr37ChWH0yEKs8RlNNrpP+1o
 lG8Qhm9NUI0SQ6JcnN5h+Yor7atbbPj0tcypsAcZPVzU
X-Google-Smtp-Source: APiQypKrnzejHkjIR7QmIkjdVbj7zPycahW/d40yu7mROjWB5s5erPCA1XUU1MZaFn4Q2ZwUz1gbcmpO055sQaNk92s=
X-Received: by 2002:a05:600c:22ca:: with SMTP id
 10mr6110903wmg.19.1586376832925; 
 Wed, 08 Apr 2020 13:13:52 -0700 (PDT)
MIME-Version: 1.0
From: Thaj <tajudheenk@gmail.com>
Date: Thu, 9 Apr 2020 01:43:41 +0530
Message-ID: <CAH2KKeYNi=qbs-mf+3tBfCG-Z6fQmmh48EosSam0GMFuc7RD6w@mail.gmail.com>
Subject: Availability of OpenBMC Secure boot
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009b42eb05a2cd2389"
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

--0000000000009b42eb05a2cd2389
Content-Type: text/plain; charset="UTF-8"

Hi,

I see that OpenBMC Secure boot design(AST2600) is under review on gerrit.
Also it is listed as Work in Progress.

What is the expected time frame for the availability of this feature?

Regards,
Thaj

--0000000000009b42eb05a2cd2389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I see that OpenBMC Secure boot desi=
gn(AST2600) is under review on gerrit.=C2=A0</div><div>Also it is listed as=
 Work in Progress.</div><div><br></div><div>What is the expected time frame=
 for the=C2=A0availability of this feature?</div><div><br></div><div>Regard=
s,</div><div>Thaj</div></div>

--0000000000009b42eb05a2cd2389--
