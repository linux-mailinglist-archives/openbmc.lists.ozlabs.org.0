Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19D88FAF3
	for <lists+openbmc@lfdr.de>; Thu, 28 Mar 2024 10:17:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ktr5Y/qp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4ycB39Myz3vZp
	for <lists+openbmc@lfdr.de>; Thu, 28 Mar 2024 20:17:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ktr5Y/qp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4ybX3KP0z2xcs
	for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2024 20:16:56 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dd045349d42so650806276.2
        for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2024 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617413; x=1712222213; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W275z/IWuD11PMCB9o4TcgDN428EIWjLe3KPPkx6rzE=;
        b=Ktr5Y/qpC37PAlvMkg2R64NvBzAkTJbsctFIa5vh2Eb5veThcWcAAdSwcJzTUTs8D8
         PrxuMPvuFeRakHiZfMRvN8SPd6ut8OZaJfM2eKCPFm1WhjzqJ8XxiFD+fJY+V1x+sPk0
         LpOELS0136y0fObD6j1fMUhy84OFdG3B1bSclZoLRQI704ZXv3Ae6rbdwMtK/cLVMM8L
         5JaNh+ebFeIu6k4ODGrt4eFC8lES86PeoL4vpBZn0kk9VfB12zbex0VCuGZn0aHKcyhc
         vTDCDq47PpA2I6QlGi6ROetSyCCzBMrCUD+DPfZDfgXTlLRRc21NDtzfr0FRvHMGZ3et
         pM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617413; x=1712222213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W275z/IWuD11PMCB9o4TcgDN428EIWjLe3KPPkx6rzE=;
        b=Q7HSJM6eEc/maXwGo2dk05dkwgcY3bl/xBFMOUmZGO7x+F6VScqRSEc9WeM/ED8edZ
         kyDsJnz2Zn23DNToponcgyiBtQiTX8Ctt1Njr2YdJWZOMLLDyfVoeqkpU9Leid9+g3VQ
         PWEhYsmpR9dYmUrKggA7DpZuqLC7pPdXY1SfKwG8Fo4J189sBw25LoU47GS5QJxTMzcY
         Pfk17pdoi8w6jYh/ifvWikatcU8ZJW+bY6WyWEgqVyz7aI+DMFon1hvsmzDEfwfuaH/n
         oUBrkDhPpuQkRsOh9k/A5TEQRAaklmlkTxlI228OvRxKtaJxrpD0xisz2YD9F0nuaipw
         tyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7CEK+KrckB3odCc0TkZYXig4HF3QRyjpOQIYB1jtX2xjZWmVfujVCYN8bk6ilkq3UZwOLDPAG/ZSNCxB2Ma7mx0qIuUEUUiM=
X-Gm-Message-State: AOJu0YxlRCBlj/dJ+jh8TD/CqXXQ15Feu2EPZOrClcJwriuupCqs7mlA
	KJpf5+KnMjEd9ksw230xPscQZCOoqsQpRHRnCB44QBspC1HQ0KTsid8cP/1ngeOLsg+WCc2E90h
	iuAa+xlg2S5pAmJpBTvIFy9+3E7DWtP+R1BcdGw==
X-Google-Smtp-Source: AGHT+IHRkTf8inGn2mE27T4DDRAM0a3h+ktBujX/BRlohTZAhDo+tStkRZRLPI58v2EqcZVGGY+9kbz/nNjf253kWd0=
X-Received: by 2002:a25:6906:0:b0:dd0:c2a:26f9 with SMTP id
 e6-20020a256906000000b00dd00c2a26f9mr2067038ybc.27.1711617413679; Thu, 28 Mar
 2024 02:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240313024210.31452-1-Delphine_CC_Chiu@wiwynn.com> <TYZPR04MB58539A1D94340F330CAF3CF9D62A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB58539A1D94340F330CAF3CF9D62A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:16:42 +0100
Message-ID: <CACRpkdZuSdkTXBF+4P1gMD4p4DsOJYivgrquuXas-R_UKg=JmQ@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: pinctrl-aspeed-g6: correct the offset of SCU630
To: "Delphine_CC_Chiu/WYHQ/Wiwynn" <Delphine_CC_Chiu@wiwynn.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 13, 2024 at 7:57=E2=80=AFAM Delphine_CC_Chiu/WYHQ/Wiwynn
<Delphine_CC_Chiu@wiwynn.com> wrote:

> Please don't review this patch since ASPEED also provided the patch to
> fix this issue.

I added your Reported-by tag to Billy's patch since you obviously found the
same issue.

Yours,
Linus Walleij
