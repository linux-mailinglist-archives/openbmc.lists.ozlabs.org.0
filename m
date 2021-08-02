Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9E3DD37F
	for <lists+openbmc@lfdr.de>; Mon,  2 Aug 2021 12:01:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdYSN6Tw7z30Gt
	for <lists+openbmc@lfdr.de>; Mon,  2 Aug 2021 20:01:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NO9tWP2h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=wh800805@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NO9tWP2h; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdYS430K3z3029
 for <openbmc@lists.ozlabs.org>; Mon,  2 Aug 2021 20:01:22 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so23894715pji.5
 for <openbmc@lists.ozlabs.org>; Mon, 02 Aug 2021 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=1OZpt53+54Tn4gsXIfuZaNjTU9h9DlwcChFHG6YgfEA=;
 b=NO9tWP2hTJMT1HII+uG/6odvNHplupbeNjZNArRApWPHsBlCOEaVRLErl23WSsPSv0
 wZdAqbD/2MJlrkIT+BTwfNDZ43SjRoLxrwb9nGbArk9BJRwwnkXwx2JdkemTIuOTIFwS
 nMnvYfuNMt2taQx4qguZkjLzloMU1C4v2wJ7lhNcG/dXxXohom8WXfzFNvWGtcP40dNJ
 Elm7LHtp+ZW3nf8BUSvm72Y7Ge+VB9HIWpqxksuLblPpw5qNsSWvlbSoa7yVhExoEFD8
 gfskFd9VTHP0knodS4J390lUKoM8glHjsH6wW9DqDjQtLKD6DOS+OeDVGhGHla1Q+yMw
 e7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=1OZpt53+54Tn4gsXIfuZaNjTU9h9DlwcChFHG6YgfEA=;
 b=PV0iHRwCSgPJ6zxw2MoRJ7bYe7aqegqsF/jmtuXpZQd+3HDdvY5YUM6XQZKxYUZm9y
 a2JztTQNM7rMMyqXYHcGwQEl89zkgMUTbL10g053wkmMaEqvXgg0s4s/89QpKblNcmzZ
 zCvKHYpQT2nTFW265g4skzII3z1GEkB2/sdyXc8+T5tNEnA5gxjaRcHcymAFOjP4MMhv
 51iLJ5EY+vw1pKTxLMpJNuaqbROzqi71jkmb/IaHcQZOe2tx6+HIX4jvg1kYY9NsdY1V
 r1wyfkAoycOAGMQYcl7QyThBLxpXDWi4u9d4UjfZUqwY5bOZTjk2c5y0tER2jBCcPQqE
 uJfw==
X-Gm-Message-State: AOAM5326dYdqanu6mPNeKVjx9sZQm9kEgT6GIU90cGeIPht2cWIvLf0o
 fgKdAnSf+2BWN3wGmb+IFPFdh5wLq92d
X-Google-Smtp-Source: ABdhPJytGoxC5TzZgMspxXriAHBiSjde1F62EWH2YBJViXG24MDan2nvWjNU7aO+DCjFCo35D5zKaQ==
X-Received: by 2002:a63:ef45:: with SMTP id c5mr338458pgk.78.1627898479445;
 Mon, 02 Aug 2021 03:01:19 -0700 (PDT)
Received: from smtpclient.apple (220-128-110-82.HINET-IP.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id b15sm12673888pgj.60.2021.08.02.03.01.18
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Aug 2021 03:01:19 -0700 (PDT)
From: =?utf-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Module develop issue
Date: Mon, 2 Aug 2021 18:01:17 +0800
References: <E8EC142E-B62A-432D-AAAA-661528534DAC@gmail.com>
To: openbmc@lists.ozlabs.org
In-Reply-To: <E8EC142E-B62A-432D-AAAA-661528534DAC@gmail.com>
Message-Id: <C552EA2E-A750-4E7C-A3ED-8C1B05B7228C@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Hi teams

Today, I try to install SDK, I can build and run "hello world=E2=80=9D, =
but I still can=E2=80=99t build the hello-mod module.
Please give me some suggestions. Many thanks!

BR
Paul

> =E5=90=B3=E7=A7=89=E6=98=8C <wh800805@gmail.com> =E6=96=BC =
2021=E5=B9=B47=E6=9C=8830=E6=97=A5 =E4=B8=8B=E5=8D=886:40 =E5=AF=AB=E9=81=93=
=EF=BC=9A
>=20
> Hi teams
>=20
> I try to develop own module. I try copy =
poky/meta-skeleton/recipes-kernel/hello-mod to my machine.
> I run the command =E2=80=9Cbitbake hello-mod=E2=80=9D, but it is =
failed.
>=20
> The error message is =E2=80=9Cneeded by Module.symvers=E2=80=9D , =
=E2=80=9Ckernel-source/Makefile:1665: recipe for target 'modules' =
failed=E2=80=9D.
>=20
> Please give me some suggestions!.
>=20
> BR
> Paul

