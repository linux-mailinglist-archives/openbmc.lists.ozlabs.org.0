Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB94CFFC4
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 14:16:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBzWH1kHzz3bVP
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 00:16:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBzVy3x7yz30BF;
 Tue,  8 Mar 2022 00:16:25 +1100 (AEDT)
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLRI3-1nibeG1my3-00IQoR; Mon, 07 Mar 2022 14:16:23 +0100
Received: by mail-wm1-f42.google.com with SMTP id r65so9175709wma.2;
 Mon, 07 Mar 2022 05:16:23 -0800 (PST)
X-Gm-Message-State: AOAM531pVk0tk19y5nn348WqbFM9UJfFOKFvUwFV9BL7QL0Y9N+jYBuZ
 R106h0DeUpkrBH6zpgRDdcMt112es+CxPpx28MI=
X-Google-Smtp-Source: ABdhPJysabRPmKcRrE/Kx/6xr0pdCTUYYBYzw9UdGhnsD750vY5MOm+A6ymUb8srsaOas8KbFQonhsx1JUb8yl80qaQ=
X-Received: by 2002:a1c:7919:0:b0:389:79c5:fe83 with SMTP id
 l25-20020a1c7919000000b0038979c5fe83mr10387102wme.173.1646658983039; Mon, 07
 Mar 2022 05:16:23 -0800 (PST)
MIME-Version: 1.0
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-9-quan@os.amperecomputing.com>
 <51603aa7-4113-dba4-9a38-0a6683a1d249@os.amperecomputing.com>
In-Reply-To: <51603aa7-4113-dba4-9a38-0a6683a1d249@os.amperecomputing.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Mar 2022 14:16:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Fw5cdxtr3LeG=tNbrTRbseXP+fDzfr-2B+LqbShA99w@mail.gmail.com>
Message-ID: <CAK8P3a1Fw5cdxtr3LeG=tNbrTRbseXP+fDzfr-2B+LqbShA99w@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] misc: smpro-misc: Add Ampere's Altra SMpro misc
 driver
To: Quan Nguyen <quan@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/Io6Ks6I9pcY068kSw94wWMYdRGfCRr3GVwmcryyCmlvZ725Mbs
 0TUeGyidkjDnEhWmp9gY2RUwYgOtjt6MuUmtut75V0/nmhxrRPJaKPpBWYQ/fIsQWEqKmTL
 H5EH9DrGOu0afi31jW9fBnfv2IbMs7QjRNbmzyEGl/4w7naIFJG8ft5qH2a86lzl2W0QoEp
 GB20nsNsShZh8fcnP66VA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n+Mi6XyyCq8=:AxQV9L4M5Qt/oeb0TolL3v
 79dnqb4XJSxrInjC7K2u5LCC+7BbVd09Py2P1+KH6YUWC9MDOCsS0RpFrqR50L9xmCHr+qO7j
 a2DrmCXunzs6+chUh73B5Bl82mGv6rwB24/Vk5qi2LvsL0+RiHh311xzN2fRqBqIl7xKi219P
 fXF+HVDhCD9qBuDp/FGnf3yTKXW10kvOkCm1wAItvfsRa9idOtX3bEHm15/H3Cm1hHFfyGqSb
 mFNSw+uVgQEMyoKigdj9ZecRtEKCY77dIXdLuqRLm0Qmxt9NuMKN6lMLkv+WFx5bCb5zorghH
 oD1q7IahQA+j7LDUaaXorn+7nlttNe9YTOPJ8uDnP1HYwL4+sTJ8YG+leI4M2V5MAN/TrzMJ5
 Z+wfpBNmVVVHyoZDi1pcHRQ7yrVtZT3b3wNhUydH3L7+KBlHKW4CDSsh/oIm3wioZZnVN/WrO
 yjjgwOK0TH8r+vGJ+L4D1ofZsC4QQIlkH/RaLlTGVacx3SZqSVIruTn6vtdWgnOHECdGGjVTA
 3ih2MTHnHf/SyjD8D0D5nvTzQwd1cABKyc6MVqS7jNgLMMkWoeW8xzz6cgh+ta9N/iPqjQomw
 JZqWFnz6xBuOcDUqtIdOG3E8phCpgkBuOWdsLIoPWFZgZO48NJj8+DhXyfwkwg98h4wb5LcWL
 AwYvUWVA4u0k1JyWxGgVAeVES07z8iTXgNZVGqxKXtFKA32Ce2950nt1YKyJ3Ng0oDDxBKapZ
 z4kxpt4MS204zpLOD/c9TSIoWrSbs0k+u+Udkf7PSSkAYILC0nqqzzIiACF+TZ7WN6cIeZvme
 ENFxmLn4OtSZj7QTFZy/AEvoMWooXUyrD4osQ8RrcnMgyY5Fuk=
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Open Source Submission <patches@amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>, DTML <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phong Vo <phong@os.amperecomputing.com>, Mark Brown <broonie@kernel.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 7, 2022 at 9:32 AM Quan Nguyen <quan@os.amperecomputing.com> wrote:
> > diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
> > index a7cd64bf9eaa..5611dd30f8f4 100644
> > --- a/drivers/mfd/smpro-mfd.c
> > +++ b/drivers/mfd/smpro-mfd.c
> > @@ -28,6 +28,7 @@ static const struct regmap_config simple_word_regmap_config = {
> >   static const struct mfd_cell smpro_devs[] = {
> >       MFD_CELL_NAME("smpro-hwmon"),
> >       MFD_CELL_NAME("smpro-errmon"),
> > +     MFD_CELL_NAME("smpro-misc"),
>
> [Lee Jones]
> Misc is a Linuxisum which are not allowed in DT.
>
> What does this driver actually do?
>
> [Quan]
> This drivers is to report the boot progress to BMC and allow BMC to
> configure the Soc Power Limit of Ampere's Altra family processor.

That doesn't sound like it should be platform specific at all, but rather
a generic BMC interface. I see you already have the openbmc list on Cc,
so I assume the right people can see this. Presumably this is a BMC that
already runs on openbmc and can have a platform-independent interface
for doing this.

        Arnd
