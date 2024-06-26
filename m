Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CC0917D5B
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 12:11:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZwIFgDA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8HXN1G35z3cWW
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 20:11:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZwIFgDA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8HWq6KQDz30VM
	for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 20:10:29 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52cdb9526e2so392500e87.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396627; x=1720001427; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CODmxJ7WAi/9W5Zp49KBekEucUyPOe+eyV9ajXeTHL4=;
        b=dZwIFgDAk6OrKTzWyIAPmquaHdykmMZS/FEQAl49JR/QGy1OxMc0hm63bzSB5q0eLA
         idek97eNuYJXmqXOf3jTQQ24Bo4Crlz521I5uqgIukDU+cBvnVWHgTy7wqy9SHh2xYge
         Lycmv5tTFMko3w32/BpU+sdcHSVYDFwfYkCMlo+oa40GUTJEi4O7JRVMMwPj3tySLdZ6
         xUwI1B1rhAlzHFl/NDpcSb1PCAWFkYT767wKZIeaMH9DIK7ob0ZNeoUv1R0sufz21FOw
         DJqyWcUbMAvsqWrsuJ6vxUkr0NkLLeYH1Jg4QfAEeLRElBR/mFFLQ0rj83r36IxZ6Q4s
         +YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396627; x=1720001427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CODmxJ7WAi/9W5Zp49KBekEucUyPOe+eyV9ajXeTHL4=;
        b=lGYHPMgJZkm+VorhcdOMfsvsrlc1zw27/RemuAE6k0Pz/pCTp9pfR1JulKeTh71Cx1
         G0poNwDjcsxQzFJ6kYtr1AKnKiMJSN8YhvC4tJ0cdr2cimi8YwtGxLVV7RWubuQ7T7Cf
         hNGhYJSXUXPpFXKu3sOyrseO+opsEadpMf6waAlsdpYsn05Z/TJOSR/x269jkt0uCC8z
         KThH+IffXLURlQhK7+PL1FaeDDvmVjHeKIR831lZqI5Yxj+0vB5nnM8Bxz0q2rzdSJMj
         bZmoViR0WFum1VY8TQeChVhAp0R7vreaQY+2vQ2NdsmKkPeUzK0AU7PzqTddFnXeWt3x
         aBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvp0awrgBMx/bISJYm0FAl0OgtDFVqkOaf+TogzqweZTVZqGbrVL6PhOQuOiThgsxroEOFRbG6ZLU8ooRWWPtIrdYggzkzpMI=
X-Gm-Message-State: AOJu0YzjKkgz/aoLLX/6jJX5hdwrZePWH6vHTfU6+c9CcXXnyvppebP5
	4Yac3F+pzZSABSAyYH0WzmKi/+rvH7mwxlMtMSmaGIjOt3EC0Hkn0gXiMCvq0wKC0486xnxB+bQ
	IZyF0FQnSXsnYMiIBgxL+BHfEVnXvTvl0VzgZMn+yS/GGe5ID
X-Google-Smtp-Source: AGHT+IF3lbTV0RYBiE7R5YSmwxSMLcsLF95dsDrDNlAyhnScJgGvl/+e2exCY3OLJZIBn9r5xOXG/EzI6V9+H38zQ2A=
X-Received: by 2002:a19:f618:0:b0:52c:dba9:55ff with SMTP id
 2adb3069b0e04-52cdf15b006mr3296922e87.25.1719396626376; Wed, 26 Jun 2024
 03:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
In-Reply-To: <20240621093142.698529-1-potin.lai.pt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:10:15 +0200
Message-ID: <CACRpkdZ4+pJTSu+GZ=BSfY6G-3Pj=81275AMEewAvoDFpACYMw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] add ast2600 NCSI pin groups
To: Potin Lai <potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org, Cosmo Chou <cosmo.chou@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 11:33=E2=80=AFAM Potin Lai <potin.lai.pt@gmail.com>=
 wrote:

> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.

This v4 patch set applied!

Yours,
Linus Walleij
