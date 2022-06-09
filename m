Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EC9544CC8
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 14:58:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJkgH5fdFz3bsK
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 22:58:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ay9wSBt6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=warp5tw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ay9wSBt6;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJkft268jz3bmJ
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 22:58:28 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-31336535373so89212307b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=iD6McwKwIghg6BHWgeKWaQ5MVkxCurltdSVwKmXM4W0=;
        b=Ay9wSBt6/1FosjTchjqFRaOXNnxcSgSjhy148/OJkjEi2ezSAJkxy8QBigj35N26KT
         YrXCPaCXqBdW01cEHCjRZOd3ZrsaVhd9JjOJqXs+3WHog5ILCEewhryknksUqAeLFMzn
         IGkTdf9foXozaSN0SdrREZd7DLlHGJhC18AFA0nAGhoyZYzASZMHRYOYOmlub34uCcLm
         qYC7xtX+1SCbhNxTr1NeBDqzT5Is4bzgznpa+KDkJsoG2B8YIgk4etJMkRuazEgV5gYB
         O8dPFe9/geqE1+3gSInrglUhfwRBjuGNqqakfdZjebuczOFbzlt71nnkCASlYW028yRL
         Tcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=iD6McwKwIghg6BHWgeKWaQ5MVkxCurltdSVwKmXM4W0=;
        b=cwfEFB/WvMABCnhsWCDc2kdo1qTMQLBeBa+th7KeyXv4dXABJj2kygM0lYYALIAoRj
         gWnAg+N/VL8429zMMbohIuwHNSy7TZdK/zsQUqq7+LAklkrxEHftvSPDFMiOX/iHGz5t
         ywxGC4JshwSdwKIPwIs8JPq2Hiks2rR0CeH/mX+VmwbLG+CFKuIXW2aSKectINBKdhc+
         mEjXAtMs2Ex+OtvblePLegKxSJoG54BznP95YYURKjgtS2piAC29MeLKSzkPXC6llguB
         y4EDTzSMYgnAglmoNnmgWuZNXGGjiBH6bLYPDXuCKlW4i1i/oBZWu4l1fLCD8EcS2Lla
         M6lw==
X-Gm-Message-State: AOAM532KGdj/HnFmzsa83D5dds8HOI+o59vY8q22yf+f0C3wQXc8oWSd
	vRVDc1VbADtJLsoi2ojAY96L35TlkEAL9v2GRg==
X-Google-Smtp-Source: ABdhPJzHr6p91v8bPwlBk8HOqVwk0g7+lCi/t9+Eyex87Yig6dRIrzVd8Xgn/Htk12Bx8Z1hnf1cz8sjT5E846Mh+ic=
X-Received: by 2002:a05:690c:58c:b0:30c:1fe9:af8 with SMTP id
 bo12-20020a05690c058c00b0030c1fe90af8mr44909325ywb.403.1654779503515; Thu, 09
 Jun 2022 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-2-warp5tw@gmail.com>
 <YqEAY2jUQC8itp6h@kunai>
In-Reply-To: <YqEAY2jUQC8itp6h@kunai>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 9 Jun 2022 20:58:12 +0800
Message-ID: <CACD3sJag7h6Xq1Dcy_hZ3XQy2EhKK6DkqADt0__c9X6RqLuy-g@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: i2c: npcm: support NPCM845
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
	jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, jsd@semihalf.com, 
	sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, 
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your review and comments.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:37AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
