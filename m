Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5C4BEF46
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:22:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jbx4M1Kz2yJw
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:22:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YAe/FOh3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c;
 helo=mail-vs1-xe2c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YAe/FOh3; dkim-atps=neutral
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2FpG3Zpxz2yJR
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 19:29:25 +1100 (AEDT)
Received: by mail-vs1-xe2c.google.com with SMTP id g20so16680940vsb.9
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 00:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z7GbsHFki7BHmmijQLgu4jj0JzXWxy6jSKULjvaUMy8=;
 b=YAe/FOh3YSDtYtbR4PnOKeb4K5dDoW+FBsI8qeLiL3vGVsklbxiZNspPuYQ7qJDmrQ
 VMY/g5C96ioabxZxaqBJxV9ZwxOwHHk//+aLa4GlP1zEnq4ao/ojIBoqmpTINNqJyz63
 kxl1dPlUHvkcaxDaQt2g7NyFo/afKAAWQ4A7+h2WoU2SMyTTXhb9885eyU5v22W7+JiV
 6P32BHphxsl7ac4qJ2dXLKTu8EAnJc6K1qxfDr8MeAl2oPzF2Qi7i5PeZb39PbUuByTq
 PC8rPkA4b1xX+5G7RL4wxAxYfNB47mUHsNYZGvs4TNx2pdpEEHNHRcA4/8CbCHqTv6zq
 Lgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z7GbsHFki7BHmmijQLgu4jj0JzXWxy6jSKULjvaUMy8=;
 b=rgEo3JnpdkgTPSmMdUjnQhWyFcCEVDYDSmHXpY9WdbOBvljkuvcLrdtdMg/bThfZc/
 7vahSMLR8LNjh5EM8lxu0yDHbry14AA/XV3yK0sorx6FZI1x0wQb+sN981ne7MAAVEh4
 Vlq7B4juGhAE1VXy8uVUaQYT616I7VxOM6SFCGfg743Qi/aW3miG8gx3XT/Y9mpeU+qN
 u4tXQ9xpE5ZY4IrtIZIoVYdgTs5naIPQr7J9VIiOPoeAsmdFP/GgI+bg4MZJKqSjcmXH
 +JHWmx5BokDeixFo7/iWsznBspeLajPImoP7Uz7m2b2eH/g4EmA06SjLJlcFfG2Fc4l1
 m/ig==
X-Gm-Message-State: AOAM531RRZ9tyYXgN+wstZYKzm16DM0UFlX7O88WOvGESe/HRm67NzvM
 9rWBXwW44kSwPeZIA/J87uY3mQ25poRUwo1OwQ==
X-Google-Smtp-Source: ABdhPJxrwy07YYidAlOGzW8ZJV9eYQ1bjoVO5usicU/jUamQDPj0Kh2S1a/A8IpLOP9uhc2ftnW2l1cER8DZgG31qNU=
X-Received: by 2002:a67:b807:0:b0:31b:b306:a5c with SMTP id
 i7-20020a67b807000000b0031bb3060a5cmr7001993vsf.50.1645432162605; Mon, 21 Feb
 2022 00:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-5-warp5tw@gmail.com>
 <ae927203-794b-06c6-3bcc-d67f13ab841d@canonical.com>
In-Reply-To: <ae927203-794b-06c6-3bcc-d67f13ab841d@canonical.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 21 Feb 2022 16:29:10 +0800
Message-ID: <CACD3sJbn7EK71+3yjok8Qg3DRrRNgEVne0mNs8vRBiJu3mpxbQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] i2c: npcm: Update gcr property name
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Feb 2022 13:21:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof:

Thank you for your comments and please find my reply next to your comments.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B42=E6=9C=8820=E6=97=A5
=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=885:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 20/02/2022 04:53, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Use a generic name for NPCM system manager reigster.
>
> The subject is not accurate and you entirely skipped in commit msg the
> fact of an ABI break.
>
> You do not update a property name but you change the way of getting GCR
> regmap.
>

I'll change the subject since the patch is to change the way to getting GCR
regmap as you indicated.

About the ABI break, I responded in the discussion thread of
[PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts.

> Best regards,
> Krzysztof

Best regards,
Tyrone
