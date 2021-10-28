Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758043E42E
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:48:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7hn4Hg7z3c6k
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:48:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg7h65gXBz3002
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:47:34 +1100 (AEDT)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MuluN-1mxMkz3kTT-00rlpF for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021
 16:47:30 +0200
Received: by mail-wr1-f54.google.com with SMTP id o14so10607239wra.12
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:47:30 -0700 (PDT)
X-Gm-Message-State: AOAM532UiyZrcAiANsZrj28r9OH149m+732ruDOVAwpriyCYqJ4l+bYV
 25ZSvPK/HZedQTIgzKZ0Y3/PahWShoCuIAAWZtY=
X-Google-Smtp-Source: ABdhPJyoVAkAAk4AI83BWc3dKhVnjPD+OR+iyHl9JwP/4ZYST1PD7Ic/FVFx5Kh4Wx0twMESb211U/sUQga85d1YsLc=
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr6283991wrb.336.1635432450567;
 Thu, 28 Oct 2021 07:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-6-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-6-lukas.bulwahn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Oct 2021 16:47:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2GGbik3r5BCKE2ZCkpFyzv8Q54z_iV84ZJ+kNXYUTMzw@mail.gmail.com>
Message-ID: <CAK8P3a2GGbik3r5BCKE2ZCkpFyzv8Q54z_iV84ZJ+kNXYUTMzw@mail.gmail.com>
Subject: Re: [PATCH 05/13] arm: davinci: remove reference to obsolete
 BLK_DEV_PALMCHIP_BK3710
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hO/aITWr8SS6cCdk7wuXi9+IYE6Avi8cRngOV4DURYbEg7+wMSC
 p++jWNOu/k29KBivp0Og667Rsgf3TB6DbtS6POtJKCCskbCk2+XJ4X80nIvyzuI47gorndR
 WXorenWTK2mc8PV13rOW1vmcFjY8Qo/jc2vK2mEEB4KHw0PpEGPTRDItuvI8C9C+7wLwA/b
 Wrp867TSBd2rIiTb3W42Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aUGH027K2Q8=:Raq+jswldQ2m+ikeGqlMWg
 +ciNth7OCnMpLmUIieWhrsq+J+QoYSM4diWKv6oEFUfO+eBIpUfXn48qirX1lmPVaVRLkNpib
 +Qxpia5rUwF0F3TugYVEKe03w+CLtKvGqEb1H80sf5tGRoABLwKfeo8ByCvAzeVLzprqqOD7W
 4AqcDg311X+v5WuzCtiW4xE7J0K5VwPLSMIwM+X79gQqK5BETJ25xK7Nr1XJQSqddkUxhYhyd
 hq9PsnRPPJysRmjNzaVMl7Aay3OKZ8bmJ+scbZzfURwSZ3BjmdrRJ15Z5QB6aLhNqDxx4COJQ
 mAFMgOhWrVhKXj7TrhG65PhLCElrFBbp/zZZaSmscwjtp7qn5Asq3mNX9mwHnDgYs7dsYossZ
 WvOjT8fKzW8AJKzEVHi+JyYIGlc2IVs3rxb+JTao1MhErrPejWr+WwyKZ7Syzr5ReCcUTOZzc
 rT85zkD9TGeA4QEMa8bAavavqqjt25DlpyhpIUU/0JwBIs2qHrCB17zmPzs3mPWq4jvryWWuA
 b1oLrj+5ib/cvboae1PcpXChbR8eadqr13zozrqBsIZElkSIXat+L9Z70XDX9GObECVTw33+S
 jMbKwCIA3vKw+FVBK6O6GYgwWD4XDG0teTvYaFruTrcMss9jojiYYMY7EUWr0nlirEVo8s2x/
 CTFElacmO26hzE7InMNuVFhi9p4n0vzUpcmhsWskSibK9mtspUKAmrdKVc1zi6CXdYppHqnju
 5B4AaYaKXiBds7AuCdwAEfTxq9N1U4/b+p/RGCvXH/7MFrC5i5hLjy7V6cOvRsqvpP4qvJExt
 4KvLP+FNoF/zgs3gs3XYWL+NpM5XGaGGjOyQ9ehVS1ww3uorz0=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, kernel-janitors@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Krzysztof Halasa <khalasa@piap.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linusw@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit b7fb14d3ac63 ("ide: remove the legacy ide driver") removes the
> definition of the config BLK_DEV_PALMCHIP_BK3710.
>
> So, remove the obsolete references in the mach-davinci architecture.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
