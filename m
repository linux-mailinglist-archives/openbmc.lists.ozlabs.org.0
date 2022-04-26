Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A96B510C0F
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 00:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnxMF6hwXz301s
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 08:27:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnxLz4Pv5z2xZB
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 08:26:50 +1000 (AEST)
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MAORp-1nZHIM3WeJ-00BrPp for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022
 00:26:46 +0200
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2f7c424c66cso193297b3.1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 15:26:45 -0700 (PDT)
X-Gm-Message-State: AOAM530u9yQ58SeryFDCuxv1DSbfPxwSMuQ4HL0htrYb0oNs6+zAfVM0
 Mva0NOX4q/QMCAutCOPetSMj8RUWqtxdEWvxnuQ=
X-Google-Smtp-Source: ABdhPJyC0LoJVNwBAD4ynQWDeVjHEA5B8GtrMZ9XSvaUD6FA2vbbZNGwJPehjny6QhUEkNHAItWM3zedUmoHsTkgLY8=
X-Received: by 2002:a81:2305:0:b0:2f7:dadb:2162 with SMTP id
 j5-20020a812305000000b002f7dadb2162mr13216162ywj.42.1651012004174; Tue, 26
 Apr 2022 15:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-5-nick.hawkins@hpe.com>
 <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
 <CACRpkdbJ1N7VOgoBzGS+cOaErFcYiOVDeWRmhPyHA7=9W0CGhA@mail.gmail.com>
 <CAK8P3a2ie8kFYstCYr6FO6+yFw7VxyJjWYyy9b+rUHu_u0YXPg@mail.gmail.com>
 <YmhmXl5IWHmKzAyG@robh.at.kernel.org>
 <CAK8P3a3+TGSJgJ2-mgj+NjT3k8uuUpesLErwqZ2M_dkNqbMXXQ@mail.gmail.com>
 <CAL_JsqKqB+Fas1NOmAq+ocG8KY6ugOiZ_o6e9=5unzf5-ku5Ag@mail.gmail.com>
In-Reply-To: <CAL_JsqKqB+Fas1NOmAq+ocG8KY6ugOiZ_o6e9=5unzf5-ku5Ag@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 Apr 2022 00:26:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a15eWvt9hWx66iR-qtxYOrYHNJhpvnfqh=j+nLOfOSE8Q@mail.gmail.com>
Message-ID: <CAK8P3a15eWvt9hWx66iR-qtxYOrYHNJhpvnfqh=j+nLOfOSE8Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] clocksource/drivers: Add HPE GXP timer
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fSRPrtDs3Wb2QfADopXJyxG2ACiw+6goijChC1iGIVVLtnTnN41
 1aPmdFigAjnTgO79iZ+/zZsK1MreI7yLu0QQwybAyffBeSBcuhT6o0IrKDBdSgwJD664aBq
 VbchMbIlRhiSHkpHOh8r3wP5OLa26xg+CJ+Ubjm1tBWwQ0cpNCk3AfLIN4oEi5Q07m3Ei8k
 Nf145nIOjGkG6KMu914tA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zpyC4sSWBCI=:r13aOOLiYOaNb0Eo3pwc8K
 pu4RmJf3RKHRA7frQg8F3UhvAnrDRznLXFV28w9T7Fnw7JGKfcqyu2PyHrnnwsR97QTuT/YFm
 reaQi7PxCSBSpKcxHfZfaE7LsJaRGPnUQEt9Nm89VvJqf/9XSCWV0SUoxo2eL5/fITEQCOaEw
 EvypwWFx0rYcJQpQ/ZXlMhjIWzqX8NEM9ZgFaH0LYE/dsC8m03JvCqURF9wGcwIfmEjJqs0N6
 Kbl8TsMna3t4odlDELv0sCKsoiY3vzg+gqKBIiNFjrhIkpG+nAjz5cBx8Hlv0kr4DEjd5muNU
 JY21aWCbWe0YapLY8/NEdzbwgXPagz3LGgRxnFIFa/9fQkT0Ll7Yc/cDDCvtP2rCG4Izh47Zl
 9DH1jQNiWW0zk7P4dTeGvki+p/RpMQcCAk+XHDtHB2IIQZ7oCgUrzACuZKQ4Ds/0PiexcYb9B
 S3FeEKVGLsURf3m1DpP5CAtvBxH5QtHV14vnGbV4CxYz0ExHyFd94VNSTZEvHnZXcuuXvTeOD
 igwII7aT52q1HjN743K3AW9SnLqyxhn8YjS3v1r+8XrT3/OxO9L4ijHtA97vB/mDopj62IpU1
 c5PP2PbCTDvnMI3m7jpZZ1lJdItoIWZt+yJ9C7CkDmfQZk8NlMXoCTsXNAHaKLzmq0/pb2XuL
 BbI4S2o3fowsz34wtAWis4c+mrO7v6M/H2DTv82W+YIM18HnZ+PV+ogvDDggNQuAME/MmUvtB
 JA5eZ5Ow0j+9Qn1mf5nVoESoVzyspcM5mmxf932UpKPD0SPidqGhHi6PpKb53LQYxUF+EcthK
 Th0ZRDIHEWTSntHrQsSOnjkYtR+oh3Nrszr0gWYajOBgAZH3kc=
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

On Wed, Apr 27, 2022 at 12:04 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 26, 2022 at 4:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Apr 26, 2022 at 11:38 PM Rob Herring <robh@kernel.org> wrote:
> > > On Tue, Apr 26, 2022 at 08:00:20AM +0200, Arnd Bergmann wrote:
> > > > On Mon, Apr 25, 2022 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > > > There are multiple ways of doing this that we already discussed
> > > > in the thread. The easiest is probably to have a child node without
> > > > custom registers in the DT and then use the DT helpers to
> > > > populate the linux devices with the correct data.
> > >
> > > I think that's what the wdt binding is doing, but I don't like that.
> > > Maybe it's not a child node, I can't tell.
> > >
> > > Bindings should not be decided on the *current* driver split on one
> > > particular OS. This looks like 1 block, so 1 node.
> >
> > Fair enough.
> >
> > > If that doesn't work well or easy for Linux, then we should fix Linux.
> >
> > Doing a simple platform_device_create_pdata() should work fine here,
> > the only problem that might exist is if the wdt driver needs access to
> > DT properties, as we can't have both devices refer to the same of_node
> > pointer,
>
> Why not? There's even a struct device flag for that.

Ah, I forgot about ->of_node_reused, that should work then if
it needs access to properties.

        Arnd
