Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB66572444
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 21:01:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj98R6TNYz3c2M
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 05:01:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WHaNH81r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WHaNH81r;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj9832LxLz3050
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 05:01:06 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id r9so10953189ljp.9
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YajTne79qkcjtVNppCGMfwoyWypygHPJ6o7/koAj4R0=;
        b=WHaNH81reQpTLCfV9shfYBJd9NSACSK/fJMRPZzhWbsv15qMzKk4Mg0DZTVni09tFH
         eNL0jvuoSORfarMIJtqBzrPW/Lv29ACEJeg+nry/XZjoMO9aEl8EO13QoKh34EuNqY/A
         Zou7XRAF47CWchIbx9eNp/0sVow0hNqcalKquPUUpV7WS7omBWTp2u3AIY4I5pkWB/W2
         wuk9WO1H0MJt35tTWCy+CUgD2Pd+8fTsdPCyaYC37hNIJ6Opwbkqb452LdyPvgi03eqE
         XKI+djKcjR9F2t4m8GSZpKOc5dFOM7RpRpvxlVC74IlTUK8kr8292wainCNthOXMGFl6
         zveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YajTne79qkcjtVNppCGMfwoyWypygHPJ6o7/koAj4R0=;
        b=GeSDh3Cr2fLO4Vmd/Q6wbsZdqPUOJS5958+Tz2ZgErxWxWnXHEZGNClY2K0MRaOZ8m
         HnmMfCXovhTZndfVQC6kkTKeDoZT9BOAYj5S/AIEs41Isw/U0OkcVHHom3c+4NIgxLv6
         QRB/K79TS1LKThPg1tey+mSE/r98S4ch+C6C0DLq6Req5omuEJyr005d5ClB7dmQfadG
         veSY1eTs86ycF9adgyvcPyaE4BB/uWsv48QdOmb72I6sSq4rbS6SUCd8Z1drlLFIx0KN
         SEwRSJt8f0iFseK1EtdmyUPzrRh/sInOOVz3sRr0tD0tac4ROJyLCB9BRhnTBEExRedc
         vlbw==
X-Gm-Message-State: AJIora+AKCSDKo0LGrtnQExWUFLFr9e4oNXXHfZCqBnvTnbiZaO0Dj5e
	IpFnBzHHnv83rcSRnjOxJIODuxuhnVVBwKGxzgZx4OP/fEY=
X-Google-Smtp-Source: AGRyM1tHza+A3cEbT8OpM1tSUgnxEFejVA0wRfgyst4sUZKuOXuX1ZhsJ/z+j64fEKW9nPVUUcUQbSPve11bdKLiej4=
X-Received: by 2002:a2e:9d86:0:b0:25d:5297:a75c with SMTP id
 c6-20020a2e9d86000000b0025d5297a75cmr13561873ljj.506.1657652462135; Tue, 12
 Jul 2022 12:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220710102110.39748-1-tmaimon77@gmail.com> <20220710102110.39748-3-tmaimon77@gmail.com>
 <CAHp75VdaT8WjoHYgmUY+mKVaUivLGGeaRJAkwfRjHspPAmw_XQ@mail.gmail.com>
 <CAP6Zq1iQL2R67dbdQiXW_JUWrGne9xp-9yQ97vQOb4RveQE7Yw@mail.gmail.com> <CAHp75VfYbFYcp6eKQsSJ9-0Wz-9=UaM8ERWyOkcXfWvinZHB7w@mail.gmail.com>
In-Reply-To: <CAHp75VfYbFYcp6eKQsSJ9-0Wz-9=UaM8ERWyOkcXfWvinZHB7w@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 12 Jul 2022 22:00:50 +0300
Message-ID: <CAP6Zq1hZfA=DpnsOzvtbSLOuOHv7V_XYr27GeAuuqw2bPdxETw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy,

Thanks for your clarifications, they will be addressed in the next version.

Best regards,

Tomer
