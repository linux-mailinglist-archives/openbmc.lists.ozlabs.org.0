Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BB554547
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 12:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfhV4wGzz3bqt
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 20:27:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HSqzpI56;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HSqzpI56;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfh51gtHz2ypR;
	Wed, 22 Jun 2022 20:27:00 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id z19so6392432edb.11;
        Wed, 22 Jun 2022 03:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=37rSlhRpHHWymSWDtV1LKUaah1wVrGYKsjIbHejy7lI=;
        b=HSqzpI56Wd/maCsUqAm6GW+vL3gDlxXpbeI5QmlV2sj6irWKRsz51o7VAbYl1Wpn7u
         9Qvs50rqTlPfin6a86lUOvc2lOY1nAAwv0y+4iOmYDOd0x5QutPpPYamxVm6TgPELYmi
         gzCgiliyXbrOuvFzQa4gIqPdvnpa8kEENRl1NiSetyJHJ7s5F81a4xyM1HKRhbhxAyJf
         VniU9LZPctrAhCMMfajUERbfulXQabhYVLoue398el8ZQgWqWiiGg560nHtTFI4rtuvQ
         zAIy5xLcytDz1ZutL5bs3KTPb5FK91rPHo6D2lBA0kgj5CEwk59d7KwiaVNiW2o2eyy2
         r6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=37rSlhRpHHWymSWDtV1LKUaah1wVrGYKsjIbHejy7lI=;
        b=HQ+W8YB5Gz9RnWwqbH+3tBUgephAhZohgXSAFngPg2lVrhEQp2PXUVf3Cg5BuL5cEK
         Kkgub3qDxoljGoNP/WrF80ToJ19BqBDOKsJXIg/9mZ8dtTTYQUVWBDAcevgWnzfjMbSF
         Nv60g0WjCLS//OPwrAjfvnYjw9q0XpeWMTp+2yYCmEabw6DJrcRDq3BlOWccBQQTKzUt
         8yjsGF5lo3ZBboMMxbrYGYxwbVGIQziRuRewqXiC5fu5USeb7S9s+Ss3YsMhim1+F0xd
         01g2NBXhA3DeTQypVVxkYd3bLw3L87lPLZJH7gW6ChNbNadtKNtt6RdnkViN7u2X9+VZ
         Xvvg==
X-Gm-Message-State: AJIora+4qkAseX6B3FYGK1ejCAATaPI85wglAP9iN2R2yqsh5MJE1gWW
	BJhcZStbQA2JO2gffsPzSDCIXgLMD9aBRFQn51c=
X-Google-Smtp-Source: AGRyM1v4azWWigiOn++l1Dtbx1fdOaa+R6QIGQ/aTOrCshjNUsBD3TDZWJE10f1vEBfdq0j3iu2c+b/URbfaYfSI9+k=
X-Received: by 2002:a05:6402:f8d:b0:435:6df2:68a with SMTP id
 eh13-20020a0564020f8d00b004356df2068amr3330060edb.209.1655893616422; Wed, 22
 Jun 2022 03:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220622094233.3681843-1-clg@kaod.org> <20220622094233.3681843-2-clg@kaod.org>
In-Reply-To: <20220622094233.3681843-2-clg@kaod.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jun 2022 12:26:19 +0200
Message-ID: <CAHp75VdBO1yPVH6NCEj8ZSYF2-6q0soE=8qNGrh7G=t7adRBZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] spi: aspeed: Add pr_debug in aspeed_spi_dirmap_create()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Pratyush Yadav <p.yadav@ti.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 22, 2022 at 11:46 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> It helps to analyze the default setting of the control register.

Replace "It" with a slightly more descriptive "what is it?".

Also make the subject aligned with the contents of the patch.

--=20
With Best Regards,
Andy Shevchenko
