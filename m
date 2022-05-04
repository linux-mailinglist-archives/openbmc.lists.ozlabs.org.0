Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C1351B07C
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 23:25:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktqcm1fK1z3bp8
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 07:25:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZUiMw8FZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZUiMw8FZ; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtqcL1Qfkz3bbn
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 07:25:21 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id r11so4576794ybg.6
 for <openbmc@lists.ozlabs.org>; Wed, 04 May 2022 14:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3d2fYGVCQPH3oUWunAB6fdSYnujJZ2I8+XkzxVQ4R8=;
 b=ZUiMw8FZnaeQCj4tHgZ+yh927ALKIjlzaflimJl0MTREy3wMDwFDlUqyiKh+Q0oQmI
 SulmOktwG9BAk7EUbjJV74hALMN8j/QFaOpkyOxpr+KkK2hAX0GJ6t0wnfUO2F/ZG58w
 WaxiEaxuEOvx82Ufe2v9mdjNMxQC78ish/ZyII2Ls5x881GTkMySDBdhxdL6oQy/aWoG
 unoZII6R+E4YAj9G19q9N8ia7HohjBVASfVrHPO/W0JJQaPBVUCNuuejVmS4TCTXy2vq
 fILs3pAeMXJYYbJfkUpD5n/b25B5ffXdA8ulNVYS2I+61x0aJNVMoGewhaYqbgLLKfOa
 G2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3d2fYGVCQPH3oUWunAB6fdSYnujJZ2I8+XkzxVQ4R8=;
 b=c5kh5lOjudLEGTaS4cpN0IT5sp7uBH5mmwUuLDnTsfRYiBcnZVtts4yGgbbpo1mCuT
 aZteqVeuj791fTl+2GVkORVucU71Fy0AdAXnMmw2tOoCyJ8U1TJIhyVyrRaTHh/DQn78
 Ogl4U1sA70N5bzIGYwDbg+ax3rV5IvUVs4TQJxu0+41aQfhX8xfvD1MbMNhSD4j/zJa/
 avp1FRv6nIeJRDcAeRG89WPv+1BIDJ+OISEQUIObQqxgUG5MIoPjkX6ntFNNktVrkwFA
 8SMQNKwlVyA2EP3bn67tYEap8B+Ofb6O+PDLUbIzHH275pgDDPp43XvopnfZ4fFw0Jmc
 UPFw==
X-Gm-Message-State: AOAM531rPtnciFr4IPbuwxyIhx3ViFnXeIFNhG0GdfXKARZWqA9pW21j
 iHllOFrkFQiipeHhl7TPpHbPz/w+UkuCaArewnAn6Q==
X-Google-Smtp-Source: ABdhPJzqvODOYmcQ9TZYyXXRfyQPmMMljGJNRG/LrEqbFLH0+9/ixLSThQOOvYy9Zui0cZ7P+TuQBezYxz3hocfbs3M=
X-Received: by 2002:a25:2905:0:b0:649:7a2b:ca72 with SMTP id
 p5-20020a252905000000b006497a2bca72mr13176917ybp.492.1651699516824; Wed, 04
 May 2022 14:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220422192139.2592632-1-robh@kernel.org>
In-Reply-To: <20220422192139.2592632-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 May 2022 23:25:05 +0200
Message-ID: <CACRpkdZcVwvBHrDy-wxPURhJ4OWRMA9TQ1e2vmcXnhEG2HaMDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Drop referenced nodes in
 examples
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 9:21 PM Rob Herring <robh@kernel.org> wrote:

> The additional nodes in the example referenced from the pinctrl node
> 'aspeed,external-nodes' properties are either incorrect (aspeed,ast2500-lpc)
> or not documented with a schema (aspeed,ast2500-gfx). There's no need to
> show these nodes as part of the pinctrl example, so just remove them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied. Concerns about lost examples can be solved
with incremental patches on top adding more schema.

Yours,
Linus Walleij
