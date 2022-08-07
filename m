Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E34C58BA29
	for <lists+openbmc@lfdr.de>; Sun,  7 Aug 2022 10:04:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0sLV2Z12z2y8Q
	for <lists+openbmc@lfdr.de>; Sun,  7 Aug 2022 18:04:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VElqQMAM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VElqQMAM;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0sL45rTjz2xG8
	for <openbmc@lists.ozlabs.org>; Sun,  7 Aug 2022 18:04:11 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id c17so8809280lfb.3
        for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2022 01:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wbqZPNw/u0ToigexI/dsHqI9t2TLFKvEVIsy4UYz3Ss=;
        b=VElqQMAMXX99FoV8nlqKtzEJcGD8mpU+7/rYkO+65ivGoQyQjaXngsiYjHQBoD2Sv/
         7elgVO6r2jhr6v4N457dHkz5GNx9UdCTnPBcpUqKF1vKbP3K7vnUaKeT5QHHlI3RtWDv
         tj1j82fLZj/gYpDdNVDFNhdjWdh74l04KVuGPf4+V+eDewuDCUigkvmSrIeY1jLcpoi4
         Wb3DEeu1BhgzD2T42LTUlddDzGXMyW1LNWTj4LlNtM3tqBMcm0HPGLqYEMDyNftvMLk8
         TLaBxIyWQIf7mVXsq+xucxwxkIezH79blD4mAJexaqSfoZ/DvwfFcUzNP+xaiF8EMIbz
         XLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wbqZPNw/u0ToigexI/dsHqI9t2TLFKvEVIsy4UYz3Ss=;
        b=IGm40ONGgIipLXtagbYiZ/032zVEWSRBlPLm/TIdhjaMtnO1NELmRacnTDXbhueVto
         QljFpzUjdCXmZM9Of3P1fDb4iMqOBzLsm2ObzFCkbmFaQVF8rZrJVQ7v0hPQScS94Psk
         rdu1qk6QOLLtRIxBo1ryOQ+yS2NT5w8/ClmGbKtN0c6xf8P/0i7I0Y1bUG2BfiWd3LgV
         lwB3IqMafiUss6md/wAzNHrDU3hLPUJ1VA22PKWyi9c4o8yVin+xas9B73oMCXgFOALY
         WhyfXPq6T6tZGjLnLs7QrSmQAMnL3jxBQbiaiIzbo5I3UL9LpXwnVNt/CNB7RsUzjEiS
         4HAQ==
X-Gm-Message-State: ACgBeo2RWjc7ELrMMjHsMedtYkFA8wW3fBqpxs2pONzFpP1AQ2aexIw+
	/sY89iyTYz9Ro9cn4B2eFxwteqJP+voCOVUWJV0=
X-Google-Smtp-Source: AA6agR6/Luobxrd0WQHX+M2Qy7TUyQeaPAkewCJqh7H//v0Br55Yb45xKGi5pP/UQUv04JEO08mkbT0IYoxDieGNVyw=
X-Received: by 2002:a05:6512:692:b0:48a:f5fb:188c with SMTP id
 t18-20020a056512069200b0048af5fb188cmr4991596lfe.111.1659859447556; Sun, 07
 Aug 2022 01:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220804181800.235368-1-tmaimon77@gmail.com> <20220805115827.GG3834@minyard.net>
In-Reply-To: <20220805115827.GG3834@minyard.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 7 Aug 2022 11:03:56 +0300
Message-ID: <CAP6Zq1gfvEpUF-TKhA8EdJqBtwaVvJR3qxtn=8Li4swHB6sDYQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: ipmi: add fallback to npcm845 compatible
To: minyard@acm.org
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Corey,

Thanks for your comment.

On Fri, 5 Aug 2022 at 14:58, Corey Minyard <minyard@acm.org> wrote:
>
> On Thu, Aug 04, 2022 at 09:18:00PM +0300, Tomer Maimon wrote:
> > Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> > string becuase NPCM845 and NPCM750 BMCs are using identical KCS modules.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > index cbc10a68ddef..4fda76e63396 100644
> > --- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > +++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > @@ -7,7 +7,7 @@ used to perform in-band IPMI communication with their host.
> >  Required properties:
> >  - compatible : should be one of
> >      "nuvoton,npcm750-kcs-bmc"
> > -    "nuvoton,npcm845-kcs-bmc"
> > +    "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"
>
> This is just wrong.  The compatible is supposed to identify the device,
> not the board the device is on.  I think compatible here should be
> "npcm7xx-kcs-bmc", and just use that everywhere.  It's fine if that is
> used on a board named npcm845.
The NPCM8XX is not a board, The Nuvoton NPCM8XX is a fourth-generation
BMC SoC device family.
>
> -corey
>
> >  - interrupts : interrupt generated by the controller
> >  - kcs_chan : The KCS channel number in the controller
> >
> > --
> > 2.33.0
> >

Best regards,

Tomer
