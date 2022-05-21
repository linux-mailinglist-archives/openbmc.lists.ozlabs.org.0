Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D16545308D2
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65bt5JB5z3bl0
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:34:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q3TeCmuc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929;
 helo=mail-ua1-x929.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Q3TeCmuc; dkim-atps=neutral
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L53XC1X68z3bbv
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 22:57:15 +1000 (AEST)
Received: by mail-ua1-x929.google.com with SMTP id n24so3790683uap.13
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v7lrzZz0TqmDNB8iA94k1xpruUt+qA1fWDXV+uIRpKk=;
 b=Q3TeCmucO50s7J5M6a3xN+W+q61y8GAmoRzuhg6QJKfZL4uou5QBw6ij591vK2UqVA
 B6XgyomQFok7CXOXdu2PYPd89cHEbxeHJlb5iAGj1tDA5zzBmUDKmWD0AiVFu563fFLi
 ujv+a7etD0ShVX6rAPn2umQymv7TrkQGxcSONuZL1Y1aUG2sE196l5LdJyfWp9/rDBU9
 55Cmvmgsf/a8IslNkLCHcesXNmMDRkGE4uaGf2gwKYiGLzJb37ejRriZa+A2UCBoqLhU
 FJD+GWiHRFtgZvqiuCdVOllb5avu0Q7l3XTndvHVnBhmtqb8LfIEMBCB51aGLKrGVK98
 r9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v7lrzZz0TqmDNB8iA94k1xpruUt+qA1fWDXV+uIRpKk=;
 b=WGa1sYw7+tfs1yLEffWUkzCgeeY5xD1ZZtwrgxDSR75T+4sruy0OkGmvezHmqZD4wn
 aoEVbZmazd3jqAubXqxO2XeWEVffIaBDysmKf8PbqTVrsl2Fqzwnx9rxPs11ANF/zIx6
 pz1jVEgr5gVG7PD1OmgBmavd1PsaZS4TssQvlohUy/znv3n9SucW/Lve7KWjQiCmvMpq
 NfwE0y5smCVFea3gaoje0ojoKqnMR3Na4NfKGRBOaYEuQJgFTxFoCrREAsmZSpOp4CaX
 AEpWkNWmRp+YglpLYnJDOMRmdftsBcCXh0RJC/W5wRTQ3yHdZJPMTVc0TqixoXoes6TW
 aXMw==
X-Gm-Message-State: AOAM530QE+giW0/Hs40ohbS5SKX8mmEqaderXlwbit6YsxjTFDFTNwRW
 7WfCvGCixFxopEITqvm65Et0DNd+D/hhOcTy5w==
X-Google-Smtp-Source: ABdhPJwi1fjgS3MbDK+Zsx3uIqu1nMkDhsIcuffkfADCaBMWQnKsuU8847NRfSHjq0/iuOs8KnhQFNBcov83tKIqFl8=
X-Received: by 2002:ab0:66c1:0:b0:35f:c5a8:8a2e with SMTP id
 d1-20020ab066c1000000b0035fc5a88a2emr5047687uaq.98.1653137831733; Sat, 21 May
 2022 05:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-6-warp5tw@gmail.com>
 <Yoh+KYtRzzbdsB9M@shikoro>
In-Reply-To: <Yoh+KYtRzzbdsB9M@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 20:57:00 +0800
Message-ID: <CACD3sJYE9AEFrQ7MgXN3=P9W66cw4tDwNc5xch3vn9TJjL7bfg@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] i2c: npcm: Add tx complete counter
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, rafal@milecki.pl, 
 sven@svenpeter.dev, jsd@semihalf.com, lukas.bulwahn@gmail.com, arnd@arndb.de, 
 olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, 
 kfting@nuvoton.com, openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
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
Cc: jie.deng@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your help and review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:37PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > tx_complete counter is used to indicate successful transaction
> > count.
> > Similar counters for failed tx were previously added.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>
> I dropped the Fixes tag, doesn't look like a bugfix to me.
>

Best Regards,
Tyrone
