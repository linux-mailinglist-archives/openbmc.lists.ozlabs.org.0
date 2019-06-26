Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA39563CE
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 09:55:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Yb1N2kNPzDqV8
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:55:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="m4n+hEZB"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Yb0n1z87zDqSV
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 17:55:04 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id z15so868550lfh.13
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxdb5wlFiHBkF0SzBr5FCoS6f7qiRJDmJ1nDITQi0Dw=;
 b=m4n+hEZBjSl7z0DhNNkX163BSsqoZWM4Vv+1gORRGXGEyJ7mgvy8Zc8GCjHlf4UKZz
 SzMf+PwcnfQVBQlF5KWvIDwyzUIxJ7y8dF0ZlSMbLEux5PVwVzK4/wbX9p4C8vgQ/cLs
 OUbHAOtvtatcVcy7T1n4ClVtN3VfJxaFeTz9bcmjm4NswEVlKTTEOdLN3B2cSJv7ML0f
 dvtb1Yp4GYrbdmAvQMxiXVkk1qnZ3vPnuwsJuJsMmiLyQuiZlld8WbxJpyxD51HVUsuJ
 2K7Yy6aTQwOkloLhCUNTijNxeAkHbkDQA7u5SUW/B8m94CyiFyIogZRFeit4jthgmS/Y
 vi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxdb5wlFiHBkF0SzBr5FCoS6f7qiRJDmJ1nDITQi0Dw=;
 b=f4KCzxGF4dZTz6sQBh0XACHhhSwi9df3TEUePliBY4lGUOMC+kkZf/XWACms+DrD74
 FFEItbatznYZ6nJiepZygb3tVgA5/jOSLEridlLPFlA8S3fmS3TZ6EEqtJh8MfeEfEkK
 alM5QSed/YDAvSw0g4qbCCwQdQp1ZTwIa1B6Qn9QsNX9PGtyPLf1JgkvnQEQAiUnkYAU
 dBCjCY7a5aWPPHKOckLU+d5I+N2Sbz6Vd1kNKAjHz71411dpo3UnY0VPIrkmLr3jRNex
 oQpan0kYmqGGfFQGj/HC20dGktbUiDN5EXKM4x6WmWcitQTxLpkkiiowSI4EvhXSuzXF
 UOgg==
X-Gm-Message-State: APjAAAUytxUDTUn9uB6ZPH8D0ahklAPYHa7ILaQvsdRXJyNHH4w3wNSt
 ca47XK/F92TptTzEUDXGa0yFj2H5EnAqX7xW7i8Gig==
X-Google-Smtp-Source: APXvYqzo+qALg1dJHN8BZKGNryj1b2QPxrO2/Ylr70oC8XJ11Le0Cn/eflBCqD0MzHpKgDWXJ6rrs+q++1xhp5JnKPs=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr1916988lfm.61.1561535701468;
 Wed, 26 Jun 2019 00:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au>
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2019 09:54:50 +0200
Message-ID: <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Preparation for AST2600
To: Andrew Jeffery <andrew@aj.id.au>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2019 at 9:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The ASPEED AST2600 is in the pipeline, and we have enough information to start
> preparing to upstream support for it. This series lays some ground work;
> splitting the bindings and dicing the implementation up a little further to
> facilitate differences between the 2600 and previous SoC generations.

All looks good to me, but Rob should have a glance at the DT bindings
and YAML syntax before I proceed to apply them.

Yours,
Linus Walleij
