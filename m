Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77075A3196
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 23:57:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDtwp5kcDz3bcc
	for <lists+openbmc@lfdr.de>; Sat, 27 Aug 2022 07:57:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=moD9pQtx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=moD9pQtx;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDtwQ6XnSz305p
	for <openbmc@lists.ozlabs.org>; Sat, 27 Aug 2022 07:57:08 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id m1so3656556edb.7
        for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 14:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=7vSzq6vPLrHqcoL8kcBtL8IovIzvXBgbRpb5JcrKApM=;
        b=moD9pQtx2O8r/SMz3TXxlBEi6KM9LgOC/ExNEn/UpOh3/xg9gjjL/q5qvVceD+Pq+F
         PG3XnQ6yHlAjGW0PnFMz0HF1+mX47v57RzuS2BtND06yp1HfczNjdLBMQlwDzp+bRjsA
         TASLAwZIVTf2U/2FAdX44MlbxZDJ2wDOUBJHy7DuzqDVf36PCIpQDPUf54i6ccD02WF8
         RPwSSewXbllRYpN5H+yEiykQi5S4mSmVJBXQxxlXkWWzxkffmb8Y/PBAWQXmtS2e3prL
         Wlu5H/+Imia8y+VMjYkvyQOBWXC5+LZLxMkyQ3NGcQrNjdTvnFXlfmQNHG4vUu1iHB6n
         pBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=7vSzq6vPLrHqcoL8kcBtL8IovIzvXBgbRpb5JcrKApM=;
        b=vlqxhS+BRUhtD7sO6RbVpM9tfa67JL3fUqXec1svE7jQ8BpUh6I4FmCK36DEROl2GY
         nIeGiwruoKeD+oiNOzprlhRO+9OO0d5vhCokOi5+GnBmW1gxvgWQHe9AHpo/z9hdMjy7
         Kgt41biDuOUDJZ41yACIH609dxR86rss909kCsUySxTQvOEel2pP05i1b4/VenIp1z9A
         w8f0lnd63jTb8s5/iNetBBCcP+qpaYIpvWWarbbR1Jt0HS7YSnZTvZkvr8oNUrNcpKVY
         xIdulgiJ2rMy+n6Nm/BeCnkly7PdPjevC2bnIat4O+b1wS1+qib7h1g4UCvYVr8lte2N
         FJog==
X-Gm-Message-State: ACgBeo06C6a7aWY6wM9xanVJQXvlSxp6gvmOnjCSUd3mBrtEHj7peIzJ
	x7DzzZBS+NogNso7vAUBzA0T8pW4ziui22PigaNXkA==
X-Google-Smtp-Source: AA6agR7/sF+zC9EW31AKq/oYtanUhvn4sbw0O7Ai7ueTmh8pIaXiX3lkjMjogncYyYdmjrCur7/uosW9qLsMkiUy3A4=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr8196109edb.133.1661551022135; Fri, 26
 Aug 2022 14:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 23:56:50 +0200
Message-ID: <CACRpkdYpp_1JJQmuX27pECxN0cjzciCuETLPTrSYKqpX0FPABQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 18, 2022 at 12:18 PM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> When the driver want to disable the signal of the function, it doesn't
> need to query the state of the mux function's signal on a pin. The
> condition below will miss the disable of the signal:
> Ball | Default | P0 Signal | P0 Expression               | Other
> -----+---------+-----------+-----------------------------+----------
>  E21   GPIOG0    SD2CLK      SCU4B4[16]=1 & SCU450[1]=1    GPIOG0
> -----+---------+-----------+-----------------------------+----------
>  B22   GPIOG1    SD2CMD      SCU4B4[17]=1 & SCU450[1]=1    GPIOG1
> -----+---------+-----------+-----------------------------+----------
> Assume the register status like below:
> SCU4B4[16] == 1 & SCU4B4[17] == 1 & SCU450[1]==1
> After the driver set the Ball E21 to the GPIOG0:
> SCU4B4[16] == 0 & SCU4B4[17] == 1 & SCU450[1]==0
> When the driver want to set the Ball B22 to the GPIOG1, the condition of
> the SD2CMD will be false causing SCU4B4[17] not to be cleared.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

I can't see the verdict for this patch? Will there be a new
version, or are we in the middle of a discussion?
I'd really like Andrew's ACK on the result before merging.

Yours,
Linus Walleij
