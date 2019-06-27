Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E3B581CC
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 13:43:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZJ2102CGzDqjV
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 21:43:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::144; helo=mail-lf1-x144.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="HiozRSV9"; 
 dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZHfC1J3szDqfy
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 21:26:26 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id y198so1330950lfa.1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yf/4QsQz71xnsufXmplIhM5PQjWjtA8iRNvCLywUsCI=;
 b=HiozRSV9jjoEd8lgVneXDXnUBP1+IEYIg+jfVj3yu3YE2rDCh0mQf6PCltXafOZuRQ
 wgzquUBxyhWo7PDBS9m/LWFwnCANPBpvCZrQYE2oHj20GZq/2E9ThKk3E8NPw81Lz1IR
 6wqLETMA8WyJzKNmXnDzqbNY6sUIuKzxUMVE+GnlYNfor+m9ZCB+VLKecag/t5wKJ6Jd
 T9zmH0RwA2Aq86TTmuzE2Qjhpw0IXYMX8T1nY+VIb685SluVHK84SiGlfHixp33uk0NX
 kmZSALvd+oLO52Ab1ZdDT5vg1sdlJ8tHsJXVo/3VFxdWskcobVYms8f/hqACvEI3a+uf
 LmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yf/4QsQz71xnsufXmplIhM5PQjWjtA8iRNvCLywUsCI=;
 b=cCmOtXJ0O1MFfAqPczfIKp8uKLhQ8OZWcJM5cisia24C3PRZcPvGBySAZo0csejR90
 zoxuo41kA+25U+sPPNFosxEEbJM05d+1lhO/aY/wn1tsWFmbLFUqS911IM70d2QDRD83
 YVJTRwlL/QOo5ILxULXIkp2vcH591NVvvymSbtz8MZAAgMaAvFEOho69FHn0HbDvcqE/
 qcHmJG191b1GOgjHMCpV08G4Y4uNaTGLhCKmlLaXOWXJFZuGsvfdF1SKvN35P5WJzlvn
 O3NMncpuKTS+VvQhU/2e5lPx5yHuH8SYahOQfUkfb0aGUJl2LfrrYS3HVCpwzjIWT7U7
 vapQ==
X-Gm-Message-State: APjAAAWeF/g+mrojgKC8EEwSPvZyI+vw+sIepcTENWD48IUla96g4F9c
 3uaNbI5BOKH/s3/956xdPyP00A/bHIk8de52AV9wqQ==
X-Google-Smtp-Source: APXvYqzeLT9m0qZPhFXMQe7bGeM0G0YNhFKZNBdroL1getpvV13XvxWgav2h1PfavnIunwZFc7NAtBe9miLt5qxA34s=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr1687908lfg.152.1561634781537; 
 Thu, 27 Jun 2019 04:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-2-andrew@aj.id.au>
 <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
In-Reply-To: <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Jun 2019 12:26:10 +0100
Message-ID: <CACRpkdZtTy-HHu2O4aOaqV5ZdxcYYPFRuxK2jjnw+_O1xcF1rg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: aspeed: Split bindings document
 in two
To: Joel Stanley <joel@jms.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2019 at 4:32 AM Joel Stanley <joel@jms.id.au> wrote:

> I think we can use this as an opportunity to drop the unused g4-scu
> compatible from the bindings. Similarly for the g5.
>
> Acked-by: Joel Stanley <joel@jms.id.au>

I assume I should wait for a new version of the patches that does
this?

Yours,
Linus Walleij
