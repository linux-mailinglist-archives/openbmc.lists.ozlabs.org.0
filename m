Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7C56A3BE
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 15:34:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldy7V6sB9z3c2H
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 23:34:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.75; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldy794qB7z3c1m
	for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2022 23:34:12 +1000 (AEST)
Received: from mail-yb1-f170.google.com ([209.85.219.170]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MNLVU-1nxr2j2QSw-00OrJL; Thu, 07 Jul 2022 15:34:07 +0200
Received: by mail-yb1-f170.google.com with SMTP id f73so1707578yba.10;
        Thu, 07 Jul 2022 06:34:06 -0700 (PDT)
X-Gm-Message-State: AJIora97oLtu+BhODQUmSXQJllIWPh7xtVBLGxdT9z1jK0RmeDUpkhff
	Hmpw/wcwQF3ChFtYJYtg9johJrQ2Zs6DrOeS2cA=
X-Google-Smtp-Source: AGRyM1uVpCRoROO6rAh+vA5ak8N4SGshcVRH0JW9GvyB4UqceUAu6tZ1eCC16Bwe+GMTjR8QSqM1egSeZk3ZR5FMhlQ=
X-Received: by 2002:a25:7c41:0:b0:66d:766a:4815 with SMTP id
 x62-20020a257c41000000b0066d766a4815mr46624953ybc.480.1657200845543; Thu, 07
 Jul 2022 06:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
In-Reply-To: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Jul 2022 15:33:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
Message-ID: <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
Subject: Re: [PATCH v3] The Yosemite V3.5 is a facebook multi-node server
 platform that host four OCP server. The BMC in the Yosemite V3.5 platform
 based on AST2600 SoC.
To: Logananth Sundararaj <logananth13.hcl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:v3XaDAoBenKL3EZ585ieMupm1QG6Ixd5rPluq2JIsrgCul1vblt
 rn0AGjKhGz6G5vWie3MPmDTUmtB/0fFyyqQvBnPBHLQu3pd9QaZP+O2zEhAWotbDiouRuIm
 16DQBdW0GnX/t4PyXgaC47fyO8mUWe6Kqfe9jjG5wPW1lbcZkKj1W6ZY9NAdn127FO/jqB4
 vvxdrXNwxFip6+bMmkm2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xctUiYQWMeI=:8f583qyle3cpXhCeaqsezm
 Tw0zc7h5a0IJDlMqmi409/7LfzL6RdAv1fn3OA1T04kCShKujgX6vIfdglhcwyXgKJSv5hH/+
 4lwCb8iqT4VGcMBIe9/vv2XiJ/iYA9/xGd+mWgBNEfB85Euir6g6e+WbI/4huhleEljfm5uyK
 XhS92CL8NZDyhxdZhFzOMPXK3Zl5m0gX0X+5RhkqvUIhhhfWXkShKhsU+p29cIX+DX553leHZ
 bOgUvoVdhorcLzFq1cyxiHARgCt9fnqFU6MYB5rqK6I3Gsnrt1YjSQti7vYDCNr7R7NFJ5FzR
 +33tlswA+yi5dzFFp7nNVLxEKNLWZssgD2h7NUUhidx4fM823S4mlRirKhGL/Qk9spG4/50rZ
 QEGHJJFBTIIJpgPfwJggS57Xdlf3nbkcs8VxiarOhtMss4qf64gPpnJfvXFzv3VLPnuHFgSku
 xh1rV+muR45/ZRveViB3dzLsHpD6b3seT5YBjrjq6TNNkzkzZYmqCNLeRbiFD0pfsujy7q+R+
 j+/LeKeABYTf0jJWuRPJTQMUEafv18iDLaI9qlGWmo+kuSMBTkUHmBuxwrnILEqumlXbNo/d8
 xi7eXhUFMwdKF+8YtPhwfCOmuzXWHUClkxy7JWcF6+HNNzsf5lBEhhJLdWgOvZZ/ZTYsbrh40
 Z4AMJfJszofmjfgshB95o7oOMnzOA8kHVtL/ZiwkzeCsXj1U1jCrvs89P5FUpK6pT6WVtoTD9
 uZTG4MD4V46YFOUHeORga6uulHzTvaO/LBI/pnlMxnbOtRcRUD6yQV9Ei2uuUrZ0mSqAsgfYv
 kQuBrl9TVYj3Y3G0cPwup9z0UzyuV0yi+qUOWAPtacg2rPTor7J17dM+f/iKHcdwaQWFDr1AY
 IvVLdu6OniiEO8C2byuq5z7eJllvgaeG8PZXS7SHA=
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
Cc: DTML <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, naveen.mosess@hcl.com, thangavel.k@hcl.com, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Olof Johansson <olof@lixom.net>, garnermic@gmail.com, velumanit@hcl.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 7, 2022 at 3:20 PM Logananth Sundararaj
<logananth13.hcl@gmail.com> wrote:
>
> This patch adds linux device tree entry related to
> Yosemite V3.5 specific devices connected to BMC SoC.
>
> Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>


Something went wrong with the patch description, it looks like you dropped
the subject and sent the first paragraph as the subject instead.

> +/ {
> +       model = "Facebook fby35";
> +       compatible = "facebook,fby35", "aspeed,ast2600";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };

Why not start at serial0 here?

> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
> +       };

The bootargs should really come from the boot loader.

Why do you need the vmalloc=384M? That seems excessive.

> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x80000000>;
> +       };

The memory location and size is usually also set by the boot loader

        Arnd
