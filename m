Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5E4E1F2E
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 03:56:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMK592XxCz3bTJ
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 13:56:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.174;
 helo=mail-qt1-f174.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKcng0kdzz2ybK
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 19:37:10 +1100 (AEDT)
Received: by mail-qt1-f174.google.com with SMTP id 11so6335460qtt.9
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 01:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaaWAx7vW0Ep0uWBl4c9esdINjzMdVYjy0G5NfgIiGQ=;
 b=EnPTQ11ESLPYa/aT7svqaOMiKQOGY9Pb2tq55tgEaYV9P8doLejh/ry4d3eXjLidHr
 PI17T9rvFbqyeZs/BpfWdZIkM6TY00sq877cCJDPp1ro3wFCELCCt6hM+5uWcjvOYw3W
 aZ5VzQQg+M/PA/fCaZ2ClswnGDiAAkwTlWU2uF4z1+zMMpHK6NtU43jR2jK0yh4l1qCO
 zuHdRoL8iSMqn/G106K37i9CL4XiqYDvzwCS9fwtIRIo2n2HdDB3rkO7P8YXGyvrzxc8
 PAEJilHdGIMC7W58TkCheiv2uuLVReXc1JCavEfGV62CogG/neEScNOhxG1DFzS5JoXK
 9qTQ==
X-Gm-Message-State: AOAM531v6zvOGriTk8Hblgw2EkmN+2JriFRu9Y07hYSSLLWZbeSeDmDw
 D95uOPJiSqxyz50JatrR1WHzs+32jaKvvk0E
X-Google-Smtp-Source: ABdhPJxrP1HxmcoGdChl3NET2vz4zFTuCCm2Pc+0KmMrheYQcPV0vJB4jEBEHwf8tFopReHhnONFsQ==
X-Received: by 2002:a05:622a:1489:b0:2e1:d5f8:48a6 with SMTP id
 t9-20020a05622a148900b002e1d5f848a6mr6654434qtx.231.1647592626817; 
 Fri, 18 Mar 2022 01:37:06 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 l13-20020a37a20d000000b0067d17b656acsm3665844qke.78.2022.03.18.01.37.06
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 01:37:06 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id t11so14646634ybi.6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 01:37:05 -0700 (PDT)
X-Received: by 2002:a25:4fc4:0:b0:633:25c8:7d9 with SMTP id
 d187-20020a254fc4000000b0063325c807d9mr9310864ybb.506.1647592615316; Fri, 18
 Mar 2022 01:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-15-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220317115705.450427-15-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Mar 2022 09:36:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-oDgiUNhW1hX6n6z3hQhVY7v6WQa9PjnF3wnEC7NTHg@mail.gmail.com>
Message-ID: <CAMuHMdV-oDgiUNhW1hX6n6z3hQhVY7v6WQa9PjnF3wnEC7NTHg@mail.gmail.com>
Subject: Re: [PATCH 16/18] dt-bindings: irqchip: renesas: include generic
 schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 21 Mar 2022 13:55:41 +1100
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
Cc: Nishanth Menon <nm@ti.com>, Bert Vermeulen <bert@biot.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Daniel Palmer <daniel@thingy.jp>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Suman Anna <s-anna@ti.com>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Paul Burton <paulburton@kernel.org>,
 Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 John Crispin <john@phrozen.org>, Birger Koblitz <mail@birger-koblitz.de>,
 linux-oxnas@groups.io,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Santosh Shilimkar <ssantosh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 12:58 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
