Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5EA5EEDE5
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 08:29:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdNkn1x54z3c1x
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 16:29:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Smds3S9X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Smds3S9X;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdNkP1gP9z2yZd
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 16:29:31 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id rk17so740132ejb.1
        for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 23:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9sMUB+ufmO/jB91L+Cnkm2YRBNvfPUGNsKA+nqPeMho=;
        b=Smds3S9XWiIBc98H2XCEGckTjhx/FBf1xzTVoxJqjvdxbov9Zg4ycsowcLPDcUScM0
         NI/E7gh0g0jf4rjXTY55tBUfle+7azTt6UETy1ZrthkrKwFskTdJ3T9+7uToDdoCgVJk
         y5gKkkzUZLrIyq/9U1SMchrSQDKaA0mcUEv2tvLLJcXX2/Wu+Q8zzpdnrNkXQBPVNo65
         8N0GInKtZctPo6ADCU4/Gqi+Oj6lEKRuxHEX/KjHivtk1qlA/erg3F7FRGCLljU/xgAf
         W6JetwSWMFg+i2NaTA9I6pyDgVcxF17uBcxFfdAVvuYVY+L4ZKYBSSUTtTqR3RbHhcZb
         t/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9sMUB+ufmO/jB91L+Cnkm2YRBNvfPUGNsKA+nqPeMho=;
        b=PvbUT7FIkDQ0EpY7HV9S1yAFSw9DY61WoRbYxAwSzUQ9wP1ewOXm5b/IpF68hvEJs4
         uYIEtcMsLvWKkSyz0Ma7Rmbs9ycga8b3C5oMk8Qw9V+4wZZTnzlKcpLrztMCy3WBmJcM
         HEec5tC3xKghMR5xdYy93B4E8jTzlHoqVrXBPBr6Igp8makjP03yM9+hHImfEUuIyi0D
         d7paBCbVRgD4Ql1BV0VjvL61oFkBN2rpaO2UCLqSR0V+lLYh10jIoAf+6x6q12Afd0yK
         dMl/A7mHr8aDcUDIOG/Jot6zmvxMxl/rNND7exMC0dAJ1Rq6JFwaQbh1m25ufM0ytW6U
         T8tg==
X-Gm-Message-State: ACrzQf2li/dZcL/CnhYrIT8CcdO26g0iRtB0qGeBAqUhIJ3iFCqwQPWu
	dAhDWTiRHLYH7qsdTGejjR7e61JddKJqDlSlAnG2RA==
X-Google-Smtp-Source: AMsMyM5ZtREGqxKZKOpbmXG+0pP6ay1c4N1+fNX5kP26dzgQ5hEt5obAeIIeMF0AAim5INRGtCyTdjPD/2tdO9yci7s=
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id
 bb5-20020a1709070a0500b0077bb5386476mr1430811ejc.324.1664432962669; Wed, 28
 Sep 2022 23:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220925220319.12572-1-zev@bewilderbeest.net>
In-Reply-To: <20220925220319.12572-1-zev@bewilderbeest.net>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Thu, 29 Sep 2022 08:29:19 +0200
Message-ID: <CALNFmy1tnrJWKwGjdGOjjqB9XDS2DhAPq1rcDPgMdY3xXNoXAw@mail.gmail.com>
Subject: Re: [PATCH 0/3] regulator: Add DT support for regulator-output connectors
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Naresh Solanki <naresh.solanki@9elements.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,
Thanks for picking this up.
I cannot answer the first question, but the second:
It's sufficient for us to just have one supply per userspace-consumer instance.

The optional property is fine and could be useful in the future.

Regards,
Patrick

On Mon, Sep 26, 2022 at 12:04 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> This series is another attempt at implementing support for
> userspace-controlled regulator-supplied power outputs.  This is an
> important feature for some kinds of BMC (baseboard management
> controller) systems where the BMC provides an operator with manual
> control of a set of DC power outputs.
>
> As in a broadly similar patchset that was recently almost merged [0],
> this takes the approach of providing support by extending the existing
> userspace-consumer regulator driver.  A couple questions about the
> userspace-consumer driver came up along the way, however.
>
> First, how (if at all) is it currently being used?  It appears the
> last in-tree use of it was removed a bit over two years ago in commit
> 9d3239147d6d ("ARM: pxa: remove Compulab pxa2xx boards").  Aside from
> just adding DT support I've made a couple small tweaks to the driver
> in patch 3 that I hope are compatible with any current usage, but
> without any extant examples to look at it's kind of hard to say.
>
> Second, how critical is its support for controlling multiple
> regulators?  (i.e. its use of regulator_bulk_data and friends instead
> of a single struct regulator.)  As far as I can see every in-tree use
> of it that's ever existed has used num_supplies = 1.  If it's not
> important to retain, patch 1 of this series could be supplanted by one
> that instead simplifies the driver slightly by removing that
> functionality.
>
> The DT binding added in patch 2 is very similar to one I posted in a
> previous patchset that had an R-B from Rob [1], but has had some minor
> rewording and gained one new (optional) property.
>
> Laxman, Naresh, Patrick -- please let me know if there are any aspects
> of this implementation that would be incompatible with your needs.
>
>
> Thanks,
> Zev
>
> [0] https://lore.kernel.org/all/20220707081826.953449-4-Naresh.Solanki@9elements.com/
> [1] https://lore.kernel.org/linux-kernel/20220505232557.10936-2-zev@bewilderbeest.net/
>
> Zev Weiss (3):
>   regulator: devres: Add devm_regulator_bulk_get_exclusive()
>   dt-bindings: regulator: Add regulator-output binding
>   regulator: userspace-consumer: Handle regulator-output DT nodes
>
>  .../bindings/regulator/regulator-output.yaml  | 47 +++++++++++++
>  drivers/regulator/core.c                      | 42 +++++++-----
>  drivers/regulator/devres.c                    | 66 ++++++++++++++-----
>  drivers/regulator/internal.h                  |  2 +
>  drivers/regulator/userspace-consumer.c        | 43 ++++++++++--
>  include/linux/regulator/consumer.h            |  2 +
>  include/linux/regulator/userspace-consumer.h  |  1 +
>  7 files changed, 162 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml
>
> --
> 2.37.3
>
