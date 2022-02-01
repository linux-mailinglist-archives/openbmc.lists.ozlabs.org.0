Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 684DB4A58F0
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 10:05:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnzYQ0ZDrz2yK6
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 20:05:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir;
 Tue, 01 Feb 2022 20:05:26 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnzY271DPz2yK2
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 20:05:26 +1100 (AEDT)
Received: from mail-oi1-f172.google.com ([209.85.167.172]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTiHd-1mnV8j3YOj-00U0Oq for <openbmc@lists.ozlabs.org>; Tue, 01 Feb 2022
 10:00:13 +0100
Received: by mail-oi1-f172.google.com with SMTP id y23so31881769oia.13
 for <openbmc@lists.ozlabs.org>; Tue, 01 Feb 2022 01:00:11 -0800 (PST)
X-Gm-Message-State: AOAM533S+xmFAeJtMQvyyOgV5yABu8UdJ1b+f7+LIwHc8RStWFPHL1Hh
 2OmlAQDb09vI4DDMHuuuVKalv3la18GqEhCO4Io=
X-Google-Smtp-Source: ABdhPJygwdTfon0x9DJPFhnTfex7k/EUaoKkqy5L3rZOJOm/m+wWWs8/4gr7zInf5+PzxIzYSEjApE7e8LkPzvovZ1Y=
X-Received: by 2002:a05:6808:1a26:: with SMTP id
 bk38mr537794oib.291.1643706010707; 
 Tue, 01 Feb 2022 01:00:10 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com>
 <20220125194609.32314-1-nick.hawkins@hpe.com>
 <CAK8P3a0ccoH_sNE9eWxQnWHEWNBPFL6k4k6mku=cHs_fRfnL-w@mail.gmail.com>
 <CA8148A1-578E-4621-9714-45AB391C353A@hpe.com>
 <2f4dd91a-e4ad-2559-f65e-914561de4047@canonical.com>
 <015EB9CD-ADB9-4C12-BD3F-78268E849884@hpe.com>
In-Reply-To: <015EB9CD-ADB9-4C12-BD3F-78268E849884@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Feb 2022 09:59:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3AUdQ94yu5An0-MhOuY2bOsr=zFWhtqVHk6E_+hBUCZQ@mail.gmail.com>
Message-ID: <CAK8P3a3AUdQ94yu5An0-MhOuY2bOsr=zFWhtqVHk6E_+hBUCZQ@mail.gmail.com>
Subject: Re: [PATCH] Adding architectural support for HPE's GXP BMC. This is
 the first of a series of patches to support HPE's BMC with Linux Kernel.
To: "Verdun, Jean-Marie" <verdun@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1pRiiSPEvrYZlN86hBIGcK4pllfwo66mm6izHSplZjD2xVlxMdz
 bMdTisIAZcpTshQWKQMBEsD3H3QPRrwyyHN5LO1LVkJEhweqUAKR2MH01fvMe+XLosAh3Rk
 sYg3pUUXtp+Y/NFRMnnMgONLNgvO6pjoFS1Lnto75sSFYJf+4YDZCufxcUqGRiu9Vz/sH3v
 f4C8EHnBnPqJlRajpx02w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uOZm6mMDRSY=:vJzEBvwWJ0fsYRR4bMj3By
 fgr+3kEBXw48HmsmJloQoMtHoea+Ic7mauZxiLLY0qb+2Jyg+CyXGSw5sbw//2/Msx/MZ+sHO
 AIBHDW65A60JfUDBNXQkBbxn1n59dHkWbyaqEJL/X/TrSCW1OQW6pBEHjV7XtiGnJ8vbAA34i
 g1u5EhorFoqiXzTVvkBgFqggwnH96fkvcdty7PsPjdWIrzVjMwKeTAqJO8AMCO2HJ81iK65uF
 gmEclh46UQ4F6N0mtcWyf90dtW7/qPQQ8B0Df6ConkBE5l4CR4ePY0/kzhlvOQIQ9XpRNLbL5
 b0f695bHTkYoaJbFeZNG+5GXN7i8xbGvYSUc5wj5/62oGYQQqcQJsafx1Ko4r6aYSwHzTNZU7
 C6wwXdAoDC6ypkPnU0DxPfA4zqjGAHpl8d9TG4RedoDeQQG6E2sVWVNW1g8gi686ntbivJSLN
 iSxnxNdBredzWJrrWU0ZKdmC4GYADerM0tVDntCZdEShHT2boZdtZ07jIkKJr8FxfQ0I4vzWE
 xjuRBZNAdOMD/y7zPXWD87ZcQdC8ogwmEYWT0dEgvNk6W/aVs79Y40nBpcrwaOnGk/QqwmHVu
 LdCH8+TMnevQOsnf80SCXO5Rj1A2IQqam5oT6prTzLKs2ZGSWR2k5zzg09dAxlWVtc0tHUv9L
 48WRl2Q1Z4XObOg+JiZgW4q7lo298g6F0ZuowvLKIg4IafgKc8c4iJJKjTdyMVIxNe4Dp9aOS
 5nE4VcBaawzs5dPGeinQgFFoGJxd2EuD3dKSATIoF6e7dmmfAM3ghbhbZ2yKvJF7hcVp3LMWj
 HCoTVa4+JmfMem56YPDjjOXkM/Aj4June4rniKBrKgZSd6lSsc=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Ard Biesheuvel <ardb@kernel.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 Hao Fang <fanghao11@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, "Hawkins, Nick" <nick.hawkins@hpe.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 7:52 PM Verdun, Jean-Marie <verdun@hpe.com> wrote:
>
> - GXP is the name of the SoC. It has multiple implementations, which are =
currently compatibles. I don't think for the moment that we need to disting=
uished them. We might have a GXP v2 coming up but not before a certain amou=
nt of time which is far enough.
> - This SoC is used to implement BMC features of HPE servers (all ProLiant=
, many Apollo, and Superdome machines)

Is there any more specific name of the chip that can be used to identify th=
e
exact generation after a new one comes out? The normal way we handle
compatible strings for devices is to start with a specific model number of
the chip that integrates it, and then have later chips refer to the device =
by
its new name, with the old one as a fallback. This makes drivers work out o=
f
the box when the device is unchanged, but gives you a way to distinguish th=
em
if a difference gets noticed after both revisions are already used.

As with some of points that Krzysztof and others made previously, the goal
here is to avoid binding incompatibilities in the future: anything that wor=
ks
in an upstream kernel should keep working in later versions, ideally
allowing any combination of old and new dtb blobs in the bootloader
with old or new kernel versions.

> It does support many features including:
> - ARMv7 architecture, and it is based on a Cortex A9 core
> - Use an AXI bus to which
>         - a memory controller is attached, as well as multiple SPI interf=
aces to connect boot flash, and ROM flash, a 10/100/1000 Mac engine which s=
upports SGMII (2 ports) and RMII
>         - Multiple I2C engines to drive connectivity with a host infrastr=
ucture
>         - A video engine which support VGA and DP, as well as an hardware=
 video encder
>         - Multiple PCIe ports
>                 - A PECI interface, and LPC eSPI
>         - Multiple UART for debug purpose, and Virtual UART for host conn=
ectivity
>         - A GPIO engine

Thanks for the description. This seems quite normal then, similar to the
aspeed and npcm BMC platforms that we support already. You can
probably drop some of the people on the Cc list, but I would suggest you ad=
d
the openbmc list and Joel Stanley (Cc'd now) in your next submissions, Joel
would be the best person to review the parts that are BMC specific.

> vejmarie
>
> =EF=BB=BFOn 1/26/22, 12:41 AM, "Krzysztof Kozlowski" <krzysztof.kozlowski=
@canonical.com> wrote:
>...

Please follow the normal quoting style when replying to mailing list messag=
es:
reply below the part you are quoting, and trim the parts of the original me=
ssage
you are not quoting.

       Arnd
