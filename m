Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ED35A10A8
	for <lists+openbmc@lfdr.de>; Thu, 25 Aug 2022 14:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD2Wf1sVDz3bsS
	for <lists+openbmc@lfdr.de>; Thu, 25 Aug 2022 22:36:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.10; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD2WF2S0Gz2xbC;
	Thu, 25 Aug 2022 22:35:52 +1000 (AEST)
Received: from mail-ej1-f52.google.com ([209.85.218.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MTigN-1osIoL2FHZ-00Tzxx; Thu, 25 Aug 2022 14:35:48 +0200
Received: by mail-ej1-f52.google.com with SMTP id h22so28996969ejk.4;
        Thu, 25 Aug 2022 05:35:48 -0700 (PDT)
X-Gm-Message-State: ACgBeo0EoxdEfNamhEHAON2b9hKSTZN83T/rQNmqlSUs4XSB/6zc976k
	rakgdbjXVJls77YC4oemHWfRc7iJjJzA0kkETnc=
X-Google-Smtp-Source: AA6agR7fgaLb9s7H5/Li4IutxFIzar492nAzVxOsAVeMPK8zWfEAvRnEz1Shj5SNAoM6ETiorM4CGcoYPkDi98xLJSQ=
X-Received: by 2002:a17:906:8458:b0:73d:d0e9:4b27 with SMTP id
 e24-20020a170906845800b0073dd0e94b27mr1897590ejy.766.1661430947749; Thu, 25
 Aug 2022 05:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com> <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
 <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com> <673e200f-f458-7866-f956-3d5bd7160a49@os.amperecomputing.com>
In-Reply-To: <673e200f-f458-7866-f956-3d5bd7160a49@os.amperecomputing.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Aug 2022 14:35:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3MU7shuBpcpRNC5L6xxQmSy8FXCX1jvYXhv-NT3PMYOw@mail.gmail.com>
Message-ID: <CAK8P3a3MU7shuBpcpRNC5L6xxQmSy8FXCX1jvYXhv-NT3PMYOw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
To: Quan Nguyen <quan@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Lo4Y21aND9Iy927vCDx17hd6zDC03xZTM+U+OsQyJShqWGeyEpx
 DXYDQ+kw13drUOHzu+0IVXxfF0KNEoFFq2PzJE6CNhbNZVz1MdHQafLVHsN0GGOtQ/6c40D
 FSmgFy1X2pje1A/FD3vL4Oc7YEhQ3jVXzgXJ/UIcMAn7kv2u43/57AtT1D/ZuzwqwXpwR/r
 qzZtu4J9dS7JVZ7iSDw6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s28lCLKVFzI=:B9JvWNRTksWxC+oDor2dab
 0JErvnlW67ZALyfApJuFUjbgEsstzZhyKMr/hHTI5dvebXMpUiF5YfY7EzAQ7yGXUzYSAScEZ
 v8UaC0MciwkB5mr9WAlLoyS11sXjRp5WvY5QbX6dW6KWCzhR3+hT3qhWt0hTUptMkz4EhKf43
 ryRvq01lsMct5H0GUC0ZM5FWB85VIBOyx2w9LBKE+J7r3OlrWJKU4Rvp4GmaLn7G/oi21UqZ8
 1AjLkknGkkVVutCWnkhRySohaH6nd3ah9R65t5/OjojCoRNoYwW5xhAF1EDJ5aUb/CKr8BjzM
 TpCW4IkXVM3rAJCe+WLOElzLBu492RMqdw56S92ElswWnlMGxmx3Ou0cnuRGg72j85ifETSYx
 2mKwt4+z/JSYjs+FWkwYeEjDawLpSkMC6akEAFYj37/XGzmycoV3qtlzHnBK5MzNIOHW51v28
 EsZsfPRH/Eoaje/53paB+hpHnRbt+fOFRqg1kRDpBf/aSRD9aBn8In3gYi88VIxBZRRU9Cu2W
 iicGkcJdgCH88msch8coQC7s8ItZoA3N8V88JCzdEjv3umBXd/VMJK4H6JLhlqdYbpZR7Zrc2
 rwl5eT0Yb3YVoIpRc8mSer5tLCWyKQyz0mOhQ60KNznKohkO7EqmD9VMQ95wDZmQrloEhRqO/
 kpsIM5t9dNwx4QHvKy78b3p1KSD6VH+NFEYEMHAGsRVw0Z2uWC3INBHwlW/74pQuIUZHsKEBF
 ZGNcmEijR9JLQ7Ncg4CU/j5spgbOxn5FmL4ikomLA+me6/nA5vXuICqWK4wIqO4LWkSz2Arke
 k3nu6xtXwEXg73cORgzlevchGOph28yf7USE1ggcW1/bM4FHASMe/WNvgCw3aTnIxmTB6v+Xe
 1yldnUGJ92lg+T4HbDHg==
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 23, 2022 at 10:27 AM Quan Nguyen
<quan@os.amperecomputing.com> wrote:
> On 18/08/2022 19:06, Arnd Bergmann wrote:
>
> Thanks Arnd for the comment.
>
> I think adding -append could solve the issue.
>
> But as the bootargs still exist in all other
> arch/arm/boot/dts/aspeed-bmc-*.dts should we still keep bootargs for
> this dts?

I think it should still be removed. Only 238 of 2547 set the console using
bootargs, so that would make it more consistent with the other files.

Changing the files that have the same issue is a separate matter.

      Arnd
