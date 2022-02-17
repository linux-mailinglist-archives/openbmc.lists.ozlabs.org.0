Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD304B96E8
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 04:48:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzgmC17Y7z3bcC
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 14:48:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FIuIBtO2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FIuIBtO2; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzglq6RNzz2yph
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 14:48:22 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id fh9so5994694qvb.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H4t/z5q/DCxTA4K9uuWW1V71TJzoDUm/3wISD/kEsek=;
 b=FIuIBtO24eK0XXi+qx0ePOurxodMr8JaZSPktF+Y7nx7sornDAIM9NnpnGD7yb1QRJ
 O5mD5MB5M895nEuWkDT4+jZz8tKX5iv12spMEqyuKbh1a834TLQjsjFwIzFCrcWw2ald
 IbOTMoUSkvHm2MEsRLPiZLnLj0ctumA/geYQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H4t/z5q/DCxTA4K9uuWW1V71TJzoDUm/3wISD/kEsek=;
 b=6Ijke1Sz4xc+JE/sae7QEPlM6mKjIaOduTFgRNN2Lf8AP4F1h50sW6g+SuTVOnjPAe
 oy7cuPyvl+6LawrkwXb5jIXAerE/wj8S9/Csp41OcgvLpg8r8PIIW2cFXPs+YeNEYxbh
 y5EaRdrL4pO0JgJywe14rvjH3ju00MpQy5CsWy3LwXJwqDQ/KWiowZuXeXDC3ybutrQj
 d3bFxm6yHxH/3jX2m1NKYziBNAAG3id9jkBICeESp3h5paynHnmtH1ptCWFoTjKsiLwF
 ZzFvgqRp0mW+IKaVN+NKyC4T32xzdyMrm1MivYKQK3xVbgpMTP9ytmbusuOxrHB1fa+i
 z11A==
X-Gm-Message-State: AOAM532XLxeLcW1VgFhNUL+c4UUq9eV/pjYPs6rGWojvQhD9bIG0FT0A
 krgh7OpdX0MN5awDDAa/ffK56kjr+gK4ZIpEjPw=
X-Google-Smtp-Source: ABdhPJwZuZ3rhnFHctxDUmZ0Kum89oPpvjavV8/KYCsMrKKzpQNY8mZ2kk2o138IwaZ8PPekyUD14m/7IOqI7oO5WBw=
X-Received: by 2002:ad4:4b63:0:b0:42d:a3cf:1b55 with SMTP id
 m3-20020ad44b63000000b0042da3cf1b55mr630680qvx.130.1645069699843; Wed, 16 Feb
 2022 19:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20220216132636.41177-1-george.hung@quantatw.com>
 <CACPK8Xc2fA4poGX55fCWu+Yr=1U8R8a=e9+vCiFvSRDcLfPnYg@mail.gmail.com>
 <HK0PR04MB2339346D67DF77531231CADC8F369@HK0PR04MB2339.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2339346D67DF77531231CADC8F369@HK0PR04MB2339.apcprd04.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Feb 2022 03:48:07 +0000
Message-ID: <CACPK8XdcJ6Ki09gKxm9Aft+zOnNyFe+oz3T-KvvOzn=u3MjKKA@mail.gmail.com>
Subject: Re: [PATCH dev-5.15 v2] ARM: dts: aspeed: Add device tree for Quanta
 S6Q BMC
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
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
Cc: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>,
 GeorgeHung <ghung.quanta@gmail.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Feb 2022 at 03:21, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> >> The Quanta S6Q is a server platform with AST2600 BMC SoC
> >>
> >> Signed-off-by: GeorgeHung <george.hung@quantatw.com>
> >
> >This looks good. Can we get a review from someone else working on this
> >project?
>
> Since S6Q is the Quanta internal project, I will ask other Quanta colleag=
ues (P.K. Lee and Alan Kuo) responsible for this project to help review thi=
s patch. Is it OK ?

Yes, a review from your colleagues is what we're after. Thank you!

Cheers,

Joel
