Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858A67B5A17
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 20:32:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZykUW/gy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzqLR2VWSz3vXq
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 05:32:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZykUW/gy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzqKs4G8mz3c50
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 05:31:45 +1100 (AEDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-57b9231e91dso27275eaf.2
        for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2023 11:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696271502; x=1696876302; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKjHs7tNvXYJ3E6TMRogj11ZeQDv6+I8lDqqMDt8DKk=;
        b=ZykUW/gyt2P3tnTKVgf1mwzgCkBVGsN8Ks3YSEYg3xVHQvPVgZ/VmPUwvRLO4YCWl1
         4VjlbEwdhBp3fHCC5SbXihdJVqTCPblimZM8fwrcVUGESBS4sBNYkYLqYkkBqlDjM9/T
         vxDAUTBGiZ8RkboK4grmI/pLMGbwCYfA2i1iJHSKr/oRQ4y4VSPTU9CIOl5Hd22xeJxK
         IBqTRkOGz/hFDogokPjlkLgI70QSLYO9mphrR2lNmel9CaSWdbDwtcv+hVc7W4ZGoqWU
         pvEj6ThDNpRQQIdv8ks0dDzHrz6JSxOP0gLmYK2uc7H+9AdmRFrd4l0lXUeefuuPNTuh
         W9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696271502; x=1696876302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKjHs7tNvXYJ3E6TMRogj11ZeQDv6+I8lDqqMDt8DKk=;
        b=wqXgFwdMGm5xWl7Vr8fHE7ooFlWY0PN9fvfsvc+kxNtuV52TX1M29ScA/9L+836z+K
         XchiEPbj5miAsQuLmcs2lrPbcc4m3022VHYjUEjwukq+02lJXhZGrAdrZ0+1iXNqbl4g
         UJcwks6W5ehMb7IF0paACo6DjSS/PfY+9yA04OGi14hHe/PEDTYXJ5clz41rCfORojKP
         CZNw/wHyr9Q8zJAnA6gfEphoUp8WEsJ3dyggCCJjSZg6/80nDz+biWr7ZRWLaDwtdZHi
         PAS2mOwLdudu/fKfuVNdHF6EBAAjhZW7MKMTLNRgZdjRH6y2PmfuQ6tnouxs7H09lAes
         RsEA==
X-Gm-Message-State: AOJu0Ywk8w6ltKiO2S/TWrn8W+xHE3ji3XX2ve79h0Cu+Hr5Gz7aGbp4
	0hiMxLhRfpDhTxY3GaOLtQl36EafvsQCpHDf1mI=
X-Google-Smtp-Source: AGHT+IFqSa/RifbLkRi+5SY1jP5NREDCl6ac0ljNJ8cNo5HNK2jj/w6Q2763mLH7m8OXtFSKFFJYqmZgMSSvJyfU/0s=
X-Received: by 2002:a05:6820:295:b0:57b:e345:43ad with SMTP id
 q21-20020a056820029500b0057be34543admr11373706ood.4.1696271502251; Mon, 02
 Oct 2023 11:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231002175052.112406-1-tmaimon77@gmail.com> <20231002175052.112406-3-tmaimon77@gmail.com>
 <CAHp75Vd701sE-pkTWYi=PsOpVoBa-fbOm91P3bGLruCn5U1KXA@mail.gmail.com> <CAP6Zq1jM3=D5PBp1z7=K6LRNJaZe3rEPutXm_xxo7p2Z60sWmQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1jM3=D5PBp1z7=K6LRNJaZe3rEPutXm_xxo7p2Z60sWmQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Oct 2023 21:31:06 +0300
Message-ID: <CAHp75VczCMaA0Kd7Lhr6PXG_kJJ5iFqe3WdX+v7xJMjdi0KdgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 2, 2023 at 9:29=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> w=
rote:
> On Mon, 2 Oct 2023 at 21:22, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
> > On Mon, Oct 2, 2023 at 8:51=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.co=
m> wrote:

...

> > + mod_devicetable.h
> why?

of_device_id is defined there.

--=20
With Best Regards,
Andy Shevchenko
