Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F97B020D
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 12:41:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lA6R8AC0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwY7k424Mz3cC3
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 20:41:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lA6R8AC0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwY701N1mz2xdV
	for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 20:40:58 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso12189746276.3
        for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695811255; x=1696416055; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6nYXLxAB1G3fPQuWQuND+i8jMgLXF7y81yFurBOx7Q4=;
        b=lA6R8AC0WtdX2wudonb/SOpzk9Lj3BOY+mnZbKXaB5BO4blPvma+oxo4Nrwy28qUoO
         2+aNytlYFWj9fKFQzfVty2BsFqiP92/M1wVdoEKllFaQIzGplVAop9AqY1XlQP24IYUR
         8KgSxIvCJRU5Osmy5SSIuEYDKkMJch1QzfdVAb9pb9pWCcStmbBelid5/AO2enpQdViz
         oHi6FJwb1bQrr9tG88+BQaDh9A3twBtmGEtP9b+HfS660t/nOPLWaLx9ORvvvt7bKLPy
         h1NMVkyI1ThBOK8JR0YYq1fm3SOeszc431kVmX5q7uHlSh6aWNE/gvhRkOJ+O6QJNYrv
         YH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811255; x=1696416055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nYXLxAB1G3fPQuWQuND+i8jMgLXF7y81yFurBOx7Q4=;
        b=A/Zenxujjm5du7gqWkFqXVhd/m7seGnkhGQReGZYcqrXD9eZJXV4vxpe/g6ZRU4RqE
         KJI2NgVBgpsloqPgr6HnoC7n4I+ZGeUZzbMx/jEztKPakjra/8s029jJPSYNbv8gjlNg
         E3Xp975xoKMpUvst5WwYIjWcMk1tM1lqzSyGVR04qwwrYDn/Wey6NKR+vqFowj7d/C9i
         zBW3FrJjLXHfZFvKtkchBsIxA8geuSq8zRkROhp80nlAM00gAahzMqbClbVaGOdzvgFO
         n2c3/L6HeYPQEvpCsLcHlWRgT8LCmnyB6NMssIeBRuyb431pijk0vtR4BiTTt55GoPC0
         Vq3A==
X-Gm-Message-State: AOJu0Yzidzk6oQnUIPXXsZPdZ+59z+w0jwFqOb2fI/FKQ2Fmi49+g+hR
	XbNk5M6g0nuJcsfs+uWfZzDnVbawzunFtrxNxYPadA==
X-Google-Smtp-Source: AGHT+IGmun0NZIJ3+bBsQ7jBRBeKX3tnz5U8pzUprEmhy+ptbeVeqez+29jxHbg6q2orBUPijpNbYnhB12LG7S+EtJs=
X-Received: by 2002:a25:ac1e:0:b0:d81:6344:540b with SMTP id
 w30-20020a25ac1e000000b00d816344540bmr1617296ybi.45.1695811254940; Wed, 27
 Sep 2023 03:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230925030647.40283-1-andrew@codeconstruct.com.au>
 <CAPDyKFrFxYxSTa=z2VnCk4m_d-wEgd17wBokzyNCCRLtSUnFKw@mail.gmail.com> <7a7d5a7f19fc793f157508fec7fbc09ca8c4cc4b.camel@codeconstruct.com.au>
In-Reply-To: <7a7d5a7f19fc793f157508fec7fbc09ca8c4cc4b.camel@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Sep 2023 12:40:18 +0200
Message-ID: <CAPDyKFquBkoA2NN7MLwkOeAsykUfp9q3RrbdnAFNNkErEiseMg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 27 Sept 2023 at 01:22, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2023-09-26 at 17:03 +0200, Ulf Hansson wrote:
> > On Mon, 25 Sept 2023 at 05:07, Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > I've changed employers, have company email that deals with patch-based
> > > workflows without too much of a headache, and am trying to steer some
> > > content out of my personal mail.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> >
> > I guess it doesn't really matter what tree this gets funneled through,
> > so I decided to pick this up via my mmc tree.
> >
> > So, applied for next, thanks!
>
> Ah, thanks for being so prompt! However, Joel has sent a PR to Arnd
> with the patch:
>
> https://lore.kernel.org/all/CACPK8Xc+D=YBc2Dhk-6-gOuvKN0xGgZYNop6oJVa=VNgaEYOHw@mail.gmail.com/
>
> I thought I'd left a note under the fold asking Joel to do that so
> people knew how it would get into the tree, but that clearly isn't the
> case. Sorry about that, I must have rolled the patch off again after I
> put the note into the original.

Np, I have dropped the patch from my tree now.

[...]

Kind regards
Uffe
