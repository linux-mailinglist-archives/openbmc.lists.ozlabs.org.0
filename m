Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36C510B90
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 23:56:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnwgW3RK2z3bmP
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 07:56:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnwgB4GHTz3bXw
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 07:55:48 +1000 (AEST)
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MHXSD-1nfKQg1Qqv-00DbsO for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022
 23:55:43 +0200
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2f7d19cac0bso90528807b3.13
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 14:55:42 -0700 (PDT)
X-Gm-Message-State: AOAM530gjRvClZkKT6dhpZQMpDIrtuHq/ZtUbB1oA3KMZQ67OjzepQ34
 39GfVXwckzNiutfUhCqvL4ThKbnUr/PEqqpUiNM=
X-Google-Smtp-Source: ABdhPJzeumDGKLqJzcKg47ARK8lAlqpYUoFrKMyKmxeuoEH8hFAe5PMV5ifJ7oJAZSTkd0LFQvHtD1zrKZjB2727L1E=
X-Received: by 2002:a0d:d101:0:b0:2eb:4bd7:bcc1 with SMTP id
 t1-20020a0dd101000000b002eb4bd7bcc1mr24608932ywd.495.1651010141538; Tue, 26
 Apr 2022 14:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-5-nick.hawkins@hpe.com>
 <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
 <CACRpkdbJ1N7VOgoBzGS+cOaErFcYiOVDeWRmhPyHA7=9W0CGhA@mail.gmail.com>
 <CAK8P3a2ie8kFYstCYr6FO6+yFw7VxyJjWYyy9b+rUHu_u0YXPg@mail.gmail.com>
 <YmhmXl5IWHmKzAyG@robh.at.kernel.org>
In-Reply-To: <YmhmXl5IWHmKzAyG@robh.at.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 Apr 2022 23:55:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3+TGSJgJ2-mgj+NjT3k8uuUpesLErwqZ2M_dkNqbMXXQ@mail.gmail.com>
Message-ID: <CAK8P3a3+TGSJgJ2-mgj+NjT3k8uuUpesLErwqZ2M_dkNqbMXXQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] clocksource/drivers: Add HPE GXP timer
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UOdzjRVV1r6/Sff06DqmDdQQyPNZIzcDW/L9TXZKPNkwnPXZY6r
 0fGqze3iD7Gk7VcLgJrr4iHcpn0Fl97WCBAxXmwvHpgj2JZZZvXz4rQin2EB/PGE37dd1RD
 RL/bpCHCsIUgPY1W6EN5pw+OgVulnpdxVJwR5AYxNXXiZ9oATquZEzlcl5B8Qsx4ak6rquO
 tA8sFYUIWwLVzbLqkLqcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rEI8ZTVsrak=:hsb6Do/E2O+wAW4wDk2s8r
 It368f4pjvvUr2VsPFZlCS5cD8KYg6gPzhc+03f6kSoDg4xXz1sf0sADETiaeSwJR4md0R0TE
 3rhIOrgtMkp6UqifjJxYrEK/0HvaOj5+XqR2//pLVo2twjKCKDLj69WmVA2Vs7ZrjT3ABiAOd
 I/3BnJ9RJWv+Wcn1bo87iUuNlauQB758XsdRVB86SHiPzsnLr1ZDnJK5vIHs7q/e8GOGE9k/T
 GI/5ALnyIO0HpDYOI9PzSq4JyOD02UPcoAGivK2nC4t6hi5wLRc6elFItABQAsIdNgs3sKuVs
 1LmrgXHlGetM6BLHrhZtX5JYEWGATCMjFDvpoVSI6Oi+wVxe9fkRuvRH5V8JCb1A66a6/o5mb
 WvWX5o8KMxE+CxC5LBActHv3hOTwy4XTZE93LRtI87736ZK9g5sLt4v3xveTHaiESVha6YmXs
 xYlaxQRyZSTQrR6i2XVfZDHgr1vVnCioPBhbJCmBhucYIkwtxQ97BYhprwrmOlilDpcq/bkro
 M5bNmmkweoEcTSmPPV/3lTp3Z0Z5jN2W1KAMueYjGBgH8An/uRFh+4cQmTWVB70x9TpRu7qP9
 JqiusqLDt4SVZHE8rkcjVimsB/cYDbFmwLMVKEyHVX/tv2SELn53qQ5+WLeFBPlq1YpuYgH+T
 BhNpFZTjQKPtiTfZk2KQaeTfX0ThxPSVAb5HMKumDC2Mn+SwHHxNzjX8WTsUGnUnhXI3ybpt/
 g+r6d69Wp66xVDkHeec33bjHy1V7eYmt2T9eodJkP2ghtM7WU1Sh++Ef0/LZLBLSHzxXl5N2Q
 SnMW3YVo8z/4jluVBRwRs/B5S/BwhrWlCl/xCyc37ttlimyzOU=
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
Cc: Arnd Bergmann <arnd@arndb.de>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Verdun,
 Jean-Marie" <verdun@hpe.com>, Joel Stanley <joel@jms.id.au>, "Hawkins,
 Nick" <nick.hawkins@hpe.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 26, 2022 at 11:38 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, Apr 26, 2022 at 08:00:20AM +0200, Arnd Bergmann wrote:
> > On Mon, Apr 25, 2022 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > There are multiple ways of doing this that we already discussed
> > in the thread. The easiest is probably to have a child node without
> > custom registers in the DT and then use the DT helpers to
> > populate the linux devices with the correct data.
>
> I think that's what the wdt binding is doing, but I don't like that.
> Maybe it's not a child node, I can't tell.
>
> Bindings should not be decided on the *current* driver split on one
> particular OS. This looks like 1 block, so 1 node.

Fair enough.

> If that doesn't work well or easy for Linux, then we should fix Linux.

Doing a simple platform_device_create_pdata() should work fine here,
the only problem that might exist is if the wdt driver needs access to
DT properties, as we can't have both devices refer to the same of_node
pointer, which would cause them to be picked up by the timer driver
again.

      Arnd
