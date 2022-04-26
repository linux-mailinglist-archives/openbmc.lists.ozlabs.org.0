Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D8C50F51F
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 10:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Knb802NWXz2yZv
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 18:46:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nt1HXhud;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nt1HXhud; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Knb7c31CPz2xDY
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 18:45:46 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id 1so2669128qvs.8
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s8JC263FgFy3jyxA285+ySjFZq/wFTiKMNVDc/5kVhk=;
 b=nt1HXhudCOieSH/ymuSaNTnhqUd/Yn/oVUEEYb3qthVUMbdwFvIw1v0rc1C1Tp+WPw
 UJWxenWHUbFlqtiaar8qbKkHXa6imluukeApPMlTrfLlhVpvNewvoHvuIml4/HByW/yT
 SbUZp/GU+AxFM2GbY9mOu3wrneuQnRKWo1rNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s8JC263FgFy3jyxA285+ySjFZq/wFTiKMNVDc/5kVhk=;
 b=FS5AQ18zolsmUR3Ac0zmcKBLO4H/vZd8FRIYEi8F+3HUZ164+DJDJyZqG6upIDSUM8
 /C7TY9ypDQJvS1e84IKLfXAdc/Ox62m0PDWA6n8krjNxlfmuak9noAYiH/D9wy9/UdPm
 qGpUR7x5mYVBcPWawZbw9HucM8QgrDAiHfLPh/3zq0ru3aLuB0CyPtahMDJuTM//56A6
 F9HOUGl3fGHx79402kGZrZbNnAc2d4ts1VnT7GT7R1VTl3SRDGhoIbsvB1H9VsDHp4iL
 yfg5HUQPW8PaF7eG58Mqgwnxy/HtD3J+t6RiDKKnKZt8nEY0esqIk1Uk7aEDiXolUxq9
 ashA==
X-Gm-Message-State: AOAM530595Nwsa1N340UbY9kmq8BGERXRVbkZJEKrl6zGXyvEH7ZAnIq
 SJgTCzQUrg+SZJVakVbx+4tCnh0YkeHtAVkMUxTVwOMmTDwYzA==
X-Google-Smtp-Source: ABdhPJy/a7R5QcfkDGNvXevfex9gGYiGDw8Vgm3NWqkPXA+VHo8PUgOW+SRHNkzWV1ncHmUfOz8hiw4ynmpzy6AWqSo=
X-Received: by 2002:ad4:53c5:0:b0:42d:7bb4:a8e8 with SMTP id
 k5-20020ad453c5000000b0042d7bb4a8e8mr15201215qvv.8.1650962743952; Tue, 26 Apr
 2022 01:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220426071848.11619-1-zev@bewilderbeest.net>
 <YmetYjSKFs+WWwYz@hatter.bewilderbeest.net>
In-Reply-To: <YmetYjSKFs+WWwYz@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Apr 2022 08:45:32 +0000
Message-ID: <CACPK8Xf2a2tC-u_9CjLVoh9iJmUdOKveLfjy1UNKQbqYPr0Zhw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hwmon: (nct6775) Convert to regmap, add i2c support
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
Cc: linux-hwmon@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, webmaster@kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Rob Herring <robh+dt@kernel.org>, Renze Nicolai <renze@rnplus.nl>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 26 Apr 2022 at 08:29, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> [Adding korg webmaster re: list infrastructure]
>
> On Tue, Apr 26, 2022 at 12:18:42AM PDT, Zev Weiss wrote:
> >Hello,
> >
> >This is v3 of my effort to add i2c support to the nct6775 hwmon
> >driver.
> >
> >Changes since v2 [0]:
> > ...
> > - Renamed drivers and Kconfig symbols to keep existing platform
> >   driver as "nct6775" (SENSORS_NCT6775) and the core module as
> >   "nct6775-core" (SENSORS_NCT6775_CORE) [Guenter]
>
> Unfortunately while this was a simple enough change to make (a few 'git
> mv' commands and a handful of actual text changes), it ballooned the
> size of the diff for patch 5 to the point that vger bounced it for
> exceeding the 100K message-size limit.  As far as I can tell it looks
> like it went through elsewhere, but does leave a bit of a gap in the
> public list archives -- please let me know if there's anything I should
> try in terms of re-sending it.  (The only combination of 'git
> format-patch' flags I've been able to find that gets it back down to
> approximately its previous size is '-B -D', which isn't so useful for
> actually applying.)

FWIW, I moderated it through to the openbmc list, which is on lore:

 https://lore.kernel.org/openbmc/YmetYjSKFs+WWwYz@hatter.bewilderbeest.net/

So the series can be fetched with eg. b4.

Aside from the mega-diff in patch 5 the changes look good to me (If
you can think of a way that makes patch 5 easier to review then let me
know).

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> I'm not sure how critical a limit that 100K is, or if it's something we
> might consider raising a bit?
>
>
> Thanks,
> Zev
>
