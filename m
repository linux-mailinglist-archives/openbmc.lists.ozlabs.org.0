Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A373DF643
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 22:15:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfR2h4M65z3byh
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 06:15:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=EH2bkXMF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EH2bkXMF; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfR2N4tFXz2yy3
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 06:15:38 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id 190so562282qkk.12
 for <openbmc@lists.ozlabs.org>; Tue, 03 Aug 2021 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lscGR/ix3ZpOLXm6rlF+7jlXY4eaJIODYP3hDjSnlto=;
 b=EH2bkXMFN2RJ0iFdzbMwyF+TWS6ozdNfD+xjUNjCdGSymht1kkFT/wvx8eVQI7kYP9
 M2xRwduqodmfhzREiV5EiBF8ZrVU2hI6dTEYPpesINwY4TS4/v+8r4EXPwnibjcvHF2w
 r664VYq1gzAfcNJDrofvasCOS0/KwKWe/A7Ht2NcBvUD6ZnvJGO4+12/0lRTw5R7361t
 qKWocAwgiyIhGNUWOeper7z3qc4UcGxcJuptRPkY5w3l+cRyHIGlDnCfNEvAQTLGty1O
 +m0yPCeeXtGAH5jBBmrUXeIthYLcKdYraFdiJmIiNaa5yG+f1eax/2geU8ET17AiitFk
 +fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lscGR/ix3ZpOLXm6rlF+7jlXY4eaJIODYP3hDjSnlto=;
 b=lgdANrAc1knPZylF46wjALq6wa5XM9YRHJ+PV0Sa9ZXWm4EG4ZUkssLRaHIenXn3v0
 QYh1en4DLqyfroxPgAp643DQKAqWmYwFkF25w5Srg0/4rRHBlriubbraJvx9USGkMP1m
 nUYPG8l0tSAv+lv6rz60cQ/wfai2kE0SU5dtjhdkbU/ezw7ZXfNPKVNKU052GXh4mhGZ
 FyB7jVRsyAybP7nehpt7Uq8RB0lTjyc7zGROfzuVUE7z9XNxEQjBJ41QhR0BLjnfePQu
 Bh2KS2UZjPm0d/FR2x7goF6vpql8s3lVaPCfjAyoJvkWnRIw1mHNnJkczBalzwkPlccQ
 4QdQ==
X-Gm-Message-State: AOAM533Cz9HTlPko10NpZQq+sYIyPlEOLsvv8OQXzPqwdtJF0hsUzIhi
 aUuLTQtzSHUPKuYeqWjP9shIynlzybSKnJxKTwsh4Q==
X-Google-Smtp-Source: ABdhPJwJRWTgrtmwl3X/LkeKAnP+SZ/THr4cvaG4CkQMW6VbJ/+Z3dVIX+cIdP1hg4i4Jdh0A+uM4xetJwtoDHG1f4w=
X-Received: by 2002:a37:8387:: with SMTP id f129mr22513960qkd.79.1628021734321; 
 Tue, 03 Aug 2021 13:15:34 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 3 Aug 2021 13:15:20 -0700
Message-ID: <CAO=notyh_UQ8WJktb7ffhkZyeP+btqHJ_JSR28coXqrq3XZAsg@mail.gmail.com>
Subject: Aspeed BMCs using KCS?
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="00000000000029add505c8ad590e"
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

--00000000000029add505c8ad590e
Content-Type: text/plain; charset="UTF-8"

Patrick et al;

As you may know, my team is working on enabling lots of stuff with Qemu and
we dont' have any platforms using KCS with aspeed.  However, we wanted to
enable this testing because we have other KCS configurations.  I wanted to
ask if you have an openbmc image that uses aspeed kcs?

Thanks,
Patrick

--00000000000029add505c8ad590e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patrick et al;<div><br></div><div>As you may know, my team=
 is working on enabling lots of stuff with Qemu and we dont&#39; have any p=
latforms using KCS with aspeed.=C2=A0 However, we wanted to enable this tes=
ting because we have other KCS configurations.=C2=A0 I wanted to ask if you=
 have an openbmc image that uses aspeed kcs?</div><div><div><br></div><div>=
Thanks,</div><div>Patrick</div></div></div>

--00000000000029add505c8ad590e--
