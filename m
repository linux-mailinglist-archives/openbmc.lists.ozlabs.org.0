Return-Path: <openbmc+bounces-745-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7484BE24A5
	for <lists+openbmc@lfdr.de>; Thu, 16 Oct 2025 11:07:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnMXd1Jt2z3bW7;
	Thu, 16 Oct 2025 20:07:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760605633;
	cv=none; b=VlzOaE8UlDu0HTUEns7MOaMKkpwtdMGbNLH77MERvtTNHQ+OWI/LDf5hwmkwuKJEfwezNRFHkTadn+XK0iNO6YcHufp74lgkVnCd5277t4ZLTh89Jbw7mAxUB/wkbiCNhcGL9TiX2Y4Zy598GWhNYZPoFxZLvg2aj2HuvJLRk1iqNxGHFuZa4UeELvg/pxkVxh3KA71YXkC2c27OSAt1zamkP1WfWDgXdN9Ld6wMKfJp2hDRPA0BibdNxw12Qrp170U0hIdvrI9yVGswJNFuDaUJLdcMAlWV7li0z+SUx6wRCClZNND0HQvJ9Ab8Fq6fm3f4QmyX2/cXYqslvstE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760605633; c=relaxed/relaxed;
	bh=guwRIMi0wiANNJuAD6tIEMgIhoRZw5vVBX6qb9J5PBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YINjDrlnHYRzGK6H8FXBG8FXGtUu0FOW2ws/Undmh6hdJUaklA0SK2Y1O2Er82NQnZK8J/3RVv7Q38mnH78byAW2t1rlgDFaYLeRMzUGflQpVXC073nMOQi3o/og1rKrV5AoN96Y5yalM2I9/A5Z4KdAhePejXQ0Dsf9+YnKrwDsgxGb1p41vMUVkhfvrUzqGQaYHfaNfzHBvIwGOShtDeZvUVbFEXdESmZ4NHZfAXek65wUtY+ZuIptZ49VS3qqSaa2rhS7dJ0qJCjnoi9uEOIVU+Ns6E5A+ZDfbRbArLSbV6iGHe6EcynyvUHdeqfw5i/i9r766RRGrm/o2f++qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PkPqAx79; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PkPqAx79;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb136.google.com (mail-yx1-xb136.google.com [IPv6:2607:f8b0:4864:20::b136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnMXb52hvz2yqq
	for <openbmc@lists.ozlabs.org>; Thu, 16 Oct 2025 20:07:10 +1100 (AEDT)
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-633be3be1e6so746961d50.1
        for <openbmc@lists.ozlabs.org>; Thu, 16 Oct 2025 02:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760605628; x=1761210428; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=guwRIMi0wiANNJuAD6tIEMgIhoRZw5vVBX6qb9J5PBk=;
        b=PkPqAx7981kd4sROBoppkc2q8qxpzPz9GiuBVGhJimqCR3KslA2pYQn7Qm+yptVmJ+
         YdDub/uRZlSrnbCqu76U43unVgoJtBP4wEMyNpx26ic3c9NSyJ3NN9O/BbU+S/++tnYp
         eWXveLZjP+HL+Z5oVUFTC+v3xusHTVQ8XwCS+JdyMyANXKtkmqYCidUkPcrpMeQ6PWw+
         WsQbkdUV7JmTcKMMMgIQw/3WhzcAOiiuRAXJUFmkDkARB/U5/0AA01Xx5RL/EN8DZzNe
         i/C5ym6CnXBRdBMlBf+8vJOXmmXNitzweZOWEUmDXDo/FO5VdljtzIAmzck7nNmAFArg
         eHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605628; x=1761210428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guwRIMi0wiANNJuAD6tIEMgIhoRZw5vVBX6qb9J5PBk=;
        b=Ku7l+wQE6G6IqFguphY9dUA63SqR4Y5y8ASJtF6PBBge56yV7oA+Zivl1HjyAMvYBL
         r9SFErQkGCN8mFynuVvc9eWm1AV4/x0q0DPjYKpSIFJyHk22OLvSnre8FUAnZ0KvKoQL
         DgM57FPe82LGoBNy8QvyvVhfPEoaQ+jCIWpFFL/t+czkc51nXnDFNfx7nXT+KjM1PEEP
         sB+y+AcFyBVFFeCo639aHTkKQQTb0WH0KJaLeBHGB++AkX7p6UDblDDe8ihN1ribKxXV
         SuFGshCnVYZ0dlCksVWz43h1NNlg60lp/WnhRspgP7GI8YpiH208PNeuLznLbJwdabG6
         a/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUtBggkTNOpu/nrO5tZt6bkUs/V4h5oWQsY7VOoZnS+mQUi1eDh9r/naV9FCFvnGaEzQm8QtLM7@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkPG3CbpznmM2DPhuZ5ROb4frUxMLyyY4eHySqcYc2Y86lUR1e
	OFfOeWq8mMLKpNuA7ZyK1B5dlyJwxXuY3b03UfwP5fs1mNX0Ry0A8KlJJaEPnhkxZeQuNTQtoGy
	24mCs8510oMpDpQiqwQoXsq2E+TXhrUY=
X-Gm-Gg: ASbGnctoiDOPUuZpWTtmBRg8y6rxpjiNqoZZRbr+hcgsAFACUraYnPQcIyWdXvQ8CCH
	qOu9mzLPBPLgr6kK4GlWIIbLXinD3cxU9gex7ZCPMiJ8A9URLqqBAmEATzEhNDpIbRpwcA8Wjr0
	vNRzBcTSups1vfoXpw+xq6APYB6zld1hileHLPo6JrT2FlSEh5DlMve2UJL5Ip1f+K0J+kGWHdI
	2Q4Uc75VZaOdIH5UCBsBiSQLelAbPOHyabA9zv20j4ijXbfV1lDW6xefXHsng==
X-Google-Smtp-Source: AGHT+IHVbO3++jsGwWmg/F2c4ksP+FLckoJYfOSeFWsAVaD7OsNLADoUPFrIAhLYYE/gNFYYmMmLiTqCkuWEcxtPEn0=
X-Received: by 2002:a05:690e:4012:b0:62f:ce58:62ed with SMTP id
 956f58d0204a3-63e08fd5985mr2306140d50.18.1760605627783; Thu, 16 Oct 2025
 02:07:07 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250925200625.573902-1-tmaimon77@gmail.com> <175890301752.880349.2331946518360447485.robh@kernel.org>
 <CAP6Zq1jmmhqYu3C7KHFK2tz9zjW352Bbw4cXeOYSjNSTELrp5Q@mail.gmail.com> <045c7bcd3a852e626f11e5b78c07939feac0e298.camel@codeconstruct.com.au>
In-Reply-To: <045c7bcd3a852e626f11e5b78c07939feac0e298.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 16 Oct 2025 12:06:56 +0300
X-Gm-Features: AS18NWD2PDfZcVJRgxIyX7bEOze1mHnCXeX6pVqo7IZ1SuA6mem-A5kplcE6yyY
Message-ID: <CAP6Zq1h6u0t8D4sDifGjVw6M_cTKxurxiPiO8yxFW5HtJBRvPA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, venture@google.com, yuenn@google.com, 
	openbmc@lists.ozlabs.org, benjaminfair@google.com, joel@jms.id.au, 
	krzk+dt@kernel.org, tali.perry1@gmail.com, conor+dt@kernel.org, 
	avifishman70@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sure, thanks Andrew

On Wed, 1 Oct 2025 at 05:35, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2025-09-29 at 12:15 +0300, Tomer Maimon wrote:
> > Hi Rob,
> >
> > Thanks for your comments
> >
> > Most of the warnings occur because the compatible strings are located
> > in .txt device tree binding rather than in the .yaml file.
> >
> > The only change that needs to be done is in ti,tmp100 that
> >
> > Could you approve the patches, avoiding NPCM845 compatible warnings?
> > Meanwhile, I will work on converting the txt to yaml
>
> I think it's best we get the conversion done, and then subsequently
> apply the apply this series. See:
>
> https://docs.kernel.org/process/maintainer-soc.html#validating-devicetree-files
>
> and
>
> https://docs.kernel.org/process/maintainer-soc-clean-dts.html#strict-dts-dt-schema-and-dtc-compliance
>
> Andrew

