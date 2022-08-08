Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF17558C443
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 09:41:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1SnL4nsBz30DP
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 17:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JqTFHcQR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JqTFHcQR;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1Smv3YrWz2xGn
	for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2022 17:41:01 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id x19so3180247lfq.7
        for <openbmc@lists.ozlabs.org>; Mon, 08 Aug 2022 00:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FjsHMZLmb/GlaNd8HwMmgPgxm5PKMOsuOi0WmrXGSlA=;
        b=JqTFHcQRg/bGHymFtU2WjDYJSsnpJgc/Lp7I7n/hQQeWcePrxqiIQR5cNxhPg2h1ut
         htB15WfjEEwuKWc7sdDDXmbzTmofeYlFPANeBKqdk1VHR9uCXwElMoM0JklCoaI3qWMN
         gQhsmb9JzoLTr87eW3W3c6OVDvF9zO3haq79hyuHy/VE9xQ8Y6yVf9y42YItsUMDAqQ9
         166ZC3NW5xtzZ3OFRejKhc26XmPizgB+upAILwR/A0sP4+vySjIucPwLU2tVdCjE4tLu
         DvpMnJl3Rc2MaeO665FBi39ofY2m5oUeJHsqE795Bb0l+ezONdj9U0TuWpJkC8vVUpO3
         nj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FjsHMZLmb/GlaNd8HwMmgPgxm5PKMOsuOi0WmrXGSlA=;
        b=XDxSznMFGK3xWyRX3T2GXLjlKZtf0NgZ1RKlTonxaLjdGtu+rMb0+6MkXqb+kTb8fk
         LKx2FdKaBVfM3mIVcb0Jc0P5r/C7FuxyK3WQNLgsa1MBCBE5AzQKpnvPswdXGytA8nbK
         MG4jOyFs1EduKqwRB06PfwF6FdeMa60FlMODE2RBu/29GWYVIDv1nJOiavm3er+Fo3RN
         2cWrpuszDRpfUa1cqav4Y1jHN99UhCHugGBfsTqqKkiXl78m6RgZfWVBER0Eva1qeFfx
         WrIBxWV4cxrpBlbI3KBDLr9ZcpW0NBBuXp20MEaPT2w0IhIHaUiu/1EIpuk/zP+yP+li
         9U1w==
X-Gm-Message-State: ACgBeo3vFhSgWT+lf4j1F6jntz7ZdkhUzQAQ015yJHIPgbIwaJ41wsdC
	woVFXMc+DZC630odotho5hCtw5OziQPk1/zD/LY=
X-Google-Smtp-Source: AA6agR40Oh1NkhpUPn/DplmuJHV4cYNWsZv3q3H5l9lDrB6jd+rIc9i/qlub2Q8awNxbIRVZPkwwKYyjZAZB/NCm7Rw=
X-Received: by 2002:ac2:5f77:0:b0:48b:3886:5d55 with SMTP id
 c23-20020ac25f77000000b0048b38865d55mr5402059lfc.668.1659944454775; Mon, 08
 Aug 2022 00:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220804181800.235368-1-tmaimon77@gmail.com> <10e93907-49ef-a3e6-e0b4-0b3e5f236f44@linaro.org>
 <CAP6Zq1ju4=PSiCuDaCi2NQTniaXBwmv5Qn6LoLayGmiayDCvYg@mail.gmail.com> <83bbcb33-1f6e-47cc-54bc-e0a5444c3609@linaro.org>
In-Reply-To: <83bbcb33-1f6e-47cc-54bc-e0a5444c3609@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 8 Aug 2022 10:40:43 +0300
Message-ID: <CAP6Zq1ggN_ep7nVLVc3d7D9Jnu2aaBTKmZnvO38-+m7gSvpMDw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: ipmi: add fallback to npcm845 compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, minyard@acm.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your reply.


On Mon, 8 Aug 2022 at 09:26, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/08/2022 09:51, Tomer Maimon wrote:
> > Hi Krzysztof,
> >
> > Thanks for your review.
> >
> > On Fri, 5 Aug 2022 at 09:36, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 04/08/2022 20:18, Tomer Maimon wrote:
> >>> Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> >>> string becuase NPCM845 and NPCM750 BMCs are using identical KCS modules.
> >>>
> >>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >>
> >> Your previous commit adding that compatible was simply wrong and not
> >> matching the driver and it is not the first time. I think all Nuvoton
> >> patches need much more careful review :(
> > Will do and sorry about all the mess...
> >>
> >> You forgot the fixes tag:
> >>
> >> Fixes: 84261749e58a ("dt-bindings: ipmi: Add npcm845 compatible")
> > Will add the tag next version.
>
> You received a bit different review from Corey, so to be clear:
> 1. Your approach is correct, assuming the devices are really compatible.
> 2. Add a fixes tag and send a v3, to get my ack.
Will do.
>
> Best regards,
> Krzysztof

Best regards,

Tomer
