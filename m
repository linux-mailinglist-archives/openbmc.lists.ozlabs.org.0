Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36DE4D9122
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 01:17:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHYrk560pz30KV
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 11:17:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UkQj+FJP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UkQj+FJP; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHYrL4sZ4z2xTd
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 11:17:20 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id h126so34182621ybc.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 17:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1ArQOZVxzenABbqYZHdwfKyfyMVaevwYMywHZpJf/2c=;
 b=UkQj+FJPHmbwWu93FeD2QPZ0A4J6B+6JMEsDc0esiQoIJHNJtuG4RyGxU2+lfJM040
 p/4A0MliIJ3y3C8BGQd0Efhv3QUlD1jBG90dISCm9c6iV0oLoeE5NIGFA8ivdG71fjoj
 CxlBU2P/LyrsCZWFuITbHFk7WIYiPNTMuDns0C7TUqSvkyiK9s4oOguB/5AZgJZs+VjE
 igr4MruwLNtWN6+b0nb5FkqHbJ2fgXZ2Hh4RQ62LF8VjI4GkYqBEc0QImgoexZvgMdIt
 BswSgrRPFYvdX/f9a9F+ZVAjCcwzMYVdAYwlmEPCrP0CEsSz/Srk8t9yOuslom5Y664O
 m0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1ArQOZVxzenABbqYZHdwfKyfyMVaevwYMywHZpJf/2c=;
 b=f60PAYzx1EcLWszjzfL1wyji9rfa7FqmYmp2TznOSsYpGNSySzfNGkRvSa09gA4L6+
 g2kYOzJ46JDuiLDdUixEG9dZGhdr4PSKQ3QIRjcBcBccPv8JdGfX05j+ZVz1S/qUnmQW
 Y2Wzz3BMA8SgEQUDLBCzaO9gpET4phookw1ubDD478ZL75TL6sl/nMr/8svtC9Iq6Wpm
 h4hWV/Xf6rTc6ST7b6+zlINSxjwL2c4MqYkXkqso7qEqyA+39IMHjkxFtnnc9dvPZ2zO
 x7o1L+Kcpfhm1MS+F2mwVFwVfjbsVQ/5PdBU6V9ae93DSKCaz0h1pl5IkUxxtVc/C8eN
 tm4w==
X-Gm-Message-State: AOAM5329CN7nOIMtvwuN5I5zYahaPoGyTDHc/UcOeXQYtDCSLOppI463
 jNDtsNcH6vynkdCwevmnJxU23eLmoi9hvecOFNMHMA==
X-Google-Smtp-Source: ABdhPJz+8PCSwlfdQdIRRiqji2nDXgp0V81YBZrYP89nUdOUaEu7WIwbyG1lPyLfbQKvd4oNQlgu3RKgTq1/HgIJ0hc=
X-Received: by 2002:a25:e710:0:b0:633:67d3:7264 with SMTP id
 e16-20020a25e710000000b0063367d37264mr3428789ybh.291.1647303436407; Mon, 14
 Mar 2022 17:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 01:17:05 +0100
Message-ID: <CACRpkdahSbWv4q7hoBAm_4+oKPEui9zX5-4m6wvPWfonWpbZUA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 12:57 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

>   dt-bindings: pinctrl: Add Nuvoton WPCM450
>   pinctrl: nuvoton: Add driver for WPCM450

I applied these two to the pinctrl tree. Sorry for taking forever
to figure out that I needed to do this :/

Yours,
Linus Walleij
