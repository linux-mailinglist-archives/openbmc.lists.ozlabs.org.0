Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B53994761C
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 09:34:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cRTTR8xk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wcp9S3n17z3cXZ
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 17:34:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cRTTR8xk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wcp8w75J9z2yhZ
	for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2024 17:34:06 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52f01613acbso6440500e87.1
        for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2024 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722843238; x=1723448038; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWXSGtBUuIsu9gfT7t1iecOSYsEkGOOPqiqXne1odrw=;
        b=cRTTR8xkNZ6zb34RkTCtgrkkUsAAKl3nxJQBH26Dv6LN5qU9g6Dz6og4Qy3JoKV6ly
         s7pRgdSKRYEUKzwUZ8cMehOQZJCNemX6cgfnNgSqtiAduG+j495DnmO62avNyKeSXiil
         H+5FiqZ929Eou7g5TmbzZyQ4uk2QdOJSaKXN9ebjsbTBa3Vb2MH+ZIExCm9N0hMUW7o2
         HxvRsc+sBsb/S5ZHoGEX30EZLWs3Y76AzR6iVDxVLjW4O5Wp3hbxiy4kF/lNm6OHtThi
         lDZcuZkqrXvWW50Ib5zX5EXNs+V0SKtS+3xVWY1M5bRAf6c3Uqn45g+U9O1DByE5V9eD
         2vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722843238; x=1723448038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWXSGtBUuIsu9gfT7t1iecOSYsEkGOOPqiqXne1odrw=;
        b=oc2NLboQ/qTztYKC4ecsjsVD1JLinIYe6A+x6M5Plr/MOzl1rPO4w/qmmZrCGbiAFW
         RQs5heFMRrYs5fhQ4/6JO0GA6PwTtuCHdCNczRrxK6cLpfsgnLIoAeax07NRGeh1UdM5
         ZvcDdZhQrBaLX/gK3ijf4wJxsBS8F6ctNt3IuOuHQkHAxEgfEMecXx5bb2OhKgLOnFxp
         ZXndVJuz0ZBObsSBwIcyY+A5mtZc+Jbq8ouoGfLbmC+gmYNgDLodi2XdtivTtB/BrgWA
         QDf0miR68X7zTFXy+mUSyQjYc7jdnIxUPAXSvZcJhM7A6KIoYn18j5H53UOo4pJd+xmB
         b7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCX38U3TfDP4Cr3Zqffp+n2i7sX5K6Rywn9ZwnekTVvtWdxd7WuzKejnHglit5RTze/NN3HrSoquehavC+94+8ZAeetqQwEGXOo=
X-Gm-Message-State: AOJu0YzTcDuGke+tE8Xo2M+OulatqLHP72mIrwnIKfQvPWXEouRYRw+b
	KMCRFyMwFxPD4RTG4qVI2287mtnhHiM99lpemOrsIXImo1YIXF/MrD6DI8F5ggd8vhwJewy8sWL
	kNlFG93igHoUBFxIRCJ/eNXXFBuWynHGLT58+Ug==
X-Google-Smtp-Source: AGHT+IEdbpiAw4D3jz5wmtP8HUpVreiNVjQLGM1ndm3P5ErzjoCL6e/1KFGffHd3JxxaAbWeOXHrUGQNbY5Y3T1OgE0=
X-Received: by 2002:a05:6512:3502:b0:52f:c281:72de with SMTP id
 2adb3069b0e04-530bb2bcec4mr3199166e87.15.1722843237853; Mon, 05 Aug 2024
 00:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240716194008.3502068-1-tmaimon77@gmail.com> <20240716194008.3502068-2-tmaimon77@gmail.com>
In-Reply-To: <20240716194008.3502068-2-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:33:46 +0200
Message-ID: <CACRpkdYKjbMNE_SUh+0rRY+m8XfYLN+VseixuspUgD+YMaNMCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: npcm8xx: remove non-existent
 groups and functions
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
Cc: robh@kernel.org, conor+dt@kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2024 at 9:40=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:

> Remove non-existent smb4den and lpcclk groups and functions from Nuvoton
> NPCM8XX Pin controller binding documentation.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

All 7 patches applied.

Yours,
Linus Walleij
