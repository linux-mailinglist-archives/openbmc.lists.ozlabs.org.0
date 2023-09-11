Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DAA79A862
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 15:54:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WxXfHcB6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkp9Z51fYz3c5C
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 23:54:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WxXfHcB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkp901GDtz2yt6
	for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 23:53:54 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d7e6d9665bcso3970008276.1
        for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694440431; x=1695045231; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLvWZ52i+dyCSAmh4Y03SqBKrmy28LwkDvJNO6anitE=;
        b=WxXfHcB6sTF+oZtlAg7X33HVawJ0nxbsT5JsXfzsIZgXV3fMDm1d07i87soLDYjs63
         BQnxQ34K4cTexS2KxWAo1Rr9D2Qm3xRbF5avXvNsx8kglbgktyjMIW6npO7amVapkqkv
         IHa8a525JPoyo666GIzJdjSgJCidYa7LHlnh3wwHUUghH+vOXoQ/jHJefob6KFu9HLYw
         XxUfl/Mrbi3ZAf/zXM8ChiwXQ1yIls6J5IbIlek6zUat0NdjUYvuUjxIKjEucRmo7Efd
         4VVmJ6JrpEO224OjQfUTiob6lO/e6x7lyAL/egWPBQkVrF7LhqzlmPi5tkHLkvPEh8wO
         r0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694440431; x=1695045231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLvWZ52i+dyCSAmh4Y03SqBKrmy28LwkDvJNO6anitE=;
        b=ZIqoviXeqPhjCCWUsaVl8DgnhD46hQ0ZsorKwaT3/pvTAoG+wOX/AGSfpsVYTU4fL0
         i8ip3IbV99WDMNdAkf7nvB0w3hjFWW7WomUtTfCtoNiEHc/ZLTaFkxCm5bS6x2PMOx6d
         UoJqJ9jHuMgRuy+LCfBv5c2l/QcyKGlTx0MeOmkdnPdSK7v0coDQkPCnqgzaRe6SB/7d
         WjvtWZVXxD8QhYbRzGxFo0w96Jyw4Pq4XkRaABM+GA0axzExwj/DC9F3kS48c5QIthJE
         bLnYgSPd/U7qoiFOzMzCtuFqEsw3KPk2j5LjwjbPLnxXNYcwa8wFHPRgkfXS2KU+9cOA
         bZCg==
X-Gm-Message-State: AOJu0YwqJf/xT69HAcBwzh9MmfeuJbpGStOVEhema2atJgWcN4dzZdi9
	nKbMbUlWGcMeZo8NkP2Z05KcG0pqLkZ6M9iCZuSvpA==
X-Google-Smtp-Source: AGHT+IHp45MYsPkvvvVaXHQ4k98NIkrWPaOBthFZdZy9COqTKpRoYFrEK1u6n2IGbrTU5QDj2PG6u+wrSp/eBuXoh44=
X-Received: by 2002:a25:502:0:b0:d12:ab1:d88a with SMTP id 2-20020a250502000000b00d120ab1d88amr9001432ybf.40.1694440431348;
 Mon, 11 Sep 2023 06:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230828140849.21724-1-tmaimon77@gmail.com>
In-Reply-To: <20230828140849.21724-1-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 15:53:40 +0200
Message-ID: <CACRpkdY0C7S_VjZ8CKxj9MOv401jUPesvwKwHyCfHM+p8jRSOg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] pinctrl: nuvoton: add pinmux and GPIO driver for NPCM8XX
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 28, 2023 at 4:08=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:

> This patch set adds pinmux and GPIO controller for the Arbel NPCM8XX
> Baseboard Management Controller (BMC).

Patches applied. I can send some more nitpicky comments about
patch 2/2 but they are not serious enough to warrant a resend of the
patches, it is better to touch it up in-tree, if at all.

Good work with this driver, and also good patience since you
iterated 7 versions and polished everything up so it's really nice
and shiny now!

Yours,
Linus Walleij
