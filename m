Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C955308CD
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:31:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65Y73qKcz308m
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:31:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K6lwCJy8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e29;
 helo=mail-vs1-xe29.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=K6lwCJy8; dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L52xw2VDtz3bXS
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 22:30:59 +1000 (AEST)
Received: by mail-vs1-xe29.google.com with SMTP id a127so10689512vsa.3
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 05:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=PLiUGsx86B2IgJe8KKAVS/qHitUeMZlk8GB1xxBGZXM=;
 b=K6lwCJy8pSzS5W0RmZDgVBc9ap8q6yLL+ZvdnP3IHErkTb2N+R1Co3xlAJguLh7WoQ
 S/T2DTU/OJ/Lpa69I/5ehApXAbjZKTwk4Y/3s1JRI2gImpuSTvXK2q/NrBpKfLeE4Yse
 JZ2O8RnIjJLPg7s2Ox0aQxdublM9mfNhkpuoXd2IfYHCRX1SX1Qw/kFv7vVg4GmHqAje
 YDosDgnPDRAmRrhe9ZS4jNTyg7sWS8EeWoYxxbdfcBQuw5onL0xSzDjTbpt6+r+NfVji
 rHKScJrEXiTx6gopnvCOrH3WIWknJSm2BwzlLWcKpoHetN3zArXODEx+qAt7xuiH+tWL
 7dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=PLiUGsx86B2IgJe8KKAVS/qHitUeMZlk8GB1xxBGZXM=;
 b=VZ0AO2xd14AY+0sxkabCDP0Tqd2Kc5zz3efJJiTi3vtLGZmk4SlQLuelBWQzrRBnF8
 g0Mpr3ZH8PpV9W7sWPWdYpLuZg6vLNpK20KfAnpGtXYYxFHQRo1pra1u0S8ZNvR7Xsbo
 lLt0k1wjE5jaBGGxgZxlVXYa3ivVx8uEYz5zfV9w/WxtneOy7TgAo3zBRSfQN5Ys3W62
 u0m4M1aWG9OtGgNwB5uaECWdDNtpc6H+Ph/9CfbOjqMbRFtMTfGDYinZIRqh6z4qvqA0
 gh2ppEZr4VBMbJViyWlGU2KPqsMQydlDwkmEQs87zCpHqn4JW2HlYDgUWmjTHYged2QR
 X5mA==
X-Gm-Message-State: AOAM531HoxSZJAgVVx/gIvjpRlRuMeRgYOZHTTZXdvPLWuHfiDst6y6d
 btNM3ajH0q6m+rMsj4iR8Z9J5G4/ZgdedcOMeA==
X-Google-Smtp-Source: ABdhPJzgU6FZ4AbE/027a0BTPCNgs0tj4cM53LwYNT4x6xuAyl667ifMD7gq1uwVW49viywaTzGAZkwJH7o7fPxouVc=
X-Received: by 2002:a67:d88c:0:b0:337:9a25:36c3 with SMTP id
 f12-20020a67d88c000000b003379a2536c3mr795937vsj.84.1653136254639; Sat, 21 May
 2022 05:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-2-warp5tw@gmail.com>
 <YoiAqhZBILoxFLih@shikoro>
In-Reply-To: <YoiAqhZBILoxFLih@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 20:30:42 +0800
Message-ID: <CACD3sJYnS3VV8yykmbsg+CjARrywJk2zYz9NkBnC7bT=5kAwuw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: i2c: npcm: support NPCM845
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, rafal@milecki.pl, 
 sven@svenpeter.dev, jsd@semihalf.com, jie.deng@intel.com, 
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net, 
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 May 2022 15:30:44 +1000
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

Hi Wolfram:

Thank you for your help.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:33PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Needs to wait until comments to patches 8+9 are addressed.
>

Best Regards,
Tyrone
