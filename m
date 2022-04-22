Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104B50B845
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 15:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlFQh2Rn3z3bbS
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 23:20:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlFQR3XS3z2xnP
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 23:20:31 +1000 (AEST)
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGyl3-1ndC7E27oB-00E5JZ for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022
 15:20:27 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5354015wml.5
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 06:20:27 -0700 (PDT)
X-Gm-Message-State: AOAM531nWhh2zbf7dyQXtgwq2LIAWHSV/fk9T/LVS3V7Vk5w4UagOPKE
 et6R6d4bjghCGzouIR8WgsYVKYxlze/oQSL/dUU=
X-Google-Smtp-Source: ABdhPJzf/DWY7IjQmD9EMZpdSip3IO7TepL3hX4HNfMH3eMN5Wr1vB5Co+iKQNZfzMg9VSbLcZ66wrZAMeetcjbrF3c=
X-Received: by 2002:a05:600c:4ed4:b0:392:90a5:b7e6 with SMTP id
 g20-20020a05600c4ed400b0039290a5b7e6mr13716628wmq.33.1650633627153; Fri, 22
 Apr 2022 06:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-2-nick.hawkins@hpe.com>
In-Reply-To: <20220421192132.109954-2-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Apr 2022 15:20:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0E4=8Drn_x19MkauNL_WC4vEL6wqkDqrafbT-n8cZpDA@mail.gmail.com>
Message-ID: <CAK8P3a0E4=8Drn_x19MkauNL_WC4vEL6wqkDqrafbT-n8cZpDA@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] archh: arm: mach-hpe: Introduce the HPE GXP
 architecture
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bypOUT2wkwn++f6YwjHV3JxgINLX4hRK4bF26T4uHuZsLFNSsLk
 E37AkHJoyQjQhBqWKKKwDKjvLI8edQbNOszsKUtLJvSkdybEg3Myqq5j2xqlxD3T1IOc7Q2
 52EzZJGYErtPq7ZD6Avrw7U8jYTsn638PBrFJ4afIPlHKNYykHmjZBW04M47sXtu/CgBdXy
 LksThd2bt1VoYQlV5Ar4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MfN4N6I79kI=:9OZBe2nX1fgopDNENgHgsf
 Dha+WYUWzz2FAq3iNCJTCRenTCub+jctH+qaA9OmFkorrBYwAoRPdcqxJJfSe7u9OjS8R51vy
 ykVFaV9ca7tNFps1IGuPlkQ0mCpqISyiWCn3/AWv+SxuClfnu1c5wcr1/Iz/XUMxemP8FdtJX
 EYWet52JYZ+R8RXp0jgg+Ogkphv/nqn5rd+HwUEabAeWitOVOQ/krcv3ZIVIcp81VLGmXxDvf
 fi4PT6PWpHsH5hKKwvyFuDptu+pNBoMdy8suGYQ7bCLRatPDIgF1/+8z1+dTmkHSseWWhOMc5
 HjcT9HhOncAHy3hgms/EPXGPUR3phR0nGoazkHFgl84q11SZdXtDHaIA7XJ69a3wCleXf/TAJ
 ROho5OvrGfR5Lgl2ZnNtX0CGXIaCCltbt8RfGYFNDqb3oSs48htnkVPyvyrY8fPMNG/GtkB3G
 87j4IdBsy51UYWpDb6DgCNU839HbUuN5PCokzjHI89Im4nve4AzjAX8MDEeM+apA8W1KXEOuD
 kfuhAO7XL5tqD670D+GbCti/IPQFNR4iQ3Kwpk7iofL9C0M+EfAGqtJzdUIWgsGPG08NLcupi
 lHpdmfOeakb7PxODBgkBgqviHvSmpELkP/1ZYcPUJxqv7dV8wg7XO6H4GtTD5EciC5hF1GlQj
 zyLUBZ7SeyAGT/KUBiWJCtZAz3oY2qTBQsYT2jzLLXp6DrGFI1qxVBcwr9J9xcxC34oQXrsPu
 Wu2fsG3jkAd5UDrYeS/XxfzIIxK0A3Y3WrPlbHPqBzhuoMTQ0KjAvpNDYggP26lhPzwXxo24l
 cAYQ268vxsLmXhM8fkFfdkBF7IZerGj4Up8tR1NBbQl1h5vQC0=
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
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 9:21 PM <nick.hawkins@hpe.com> wrote:
> +
> +DT_MACHINE_START(GXP_DT, "HPE GXP")
> +       .dt_compat      = gxp_board_dt_compat,
> +       .l2c_aux_val = 0,
> +       .l2c_aux_mask = 0,
> +MACHINE_END

Ther l2c initialization looks wrong here, where  you are saying here is
that all the bits of the aux register must be set to zero.

I also see that you don't have a device node for the cache controller, so
this is probably not actually used, but in general there should be one with
the correct properties.

        Arnd
