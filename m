Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0362F54F6DC
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 13:40:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPcYL6ls5z3cFJ
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 21:40:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.74; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPcY16p98z3bp4
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2022 21:40:20 +1000 (AEST)
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MoNyA-1nMTrT1h4S-00oqm7 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2022
 13:40:15 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3176b6ed923so39444167b3.11
        for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2022 04:40:14 -0700 (PDT)
X-Gm-Message-State: AJIora8wUli5LCNascjb0nXhz6X5WhBVCOjZFlEJbYLP/R9pxX/4L7a1
	Q49XDZFL3MPwMOe6rZBIQaIImXwms4D+WqX3+Gg=
X-Google-Smtp-Source: AGRyM1vlnn4lxtCKDOQYJthDA/6WJPY9HLjuSRhXPkjh9BoYTT6fsyXS9MF8bTJzDmFLdbwhKUgGnU9CDMgZNcHssLA=
X-Received: by 2002:a81:190f:0:b0:313:43b8:155c with SMTP id
 15-20020a81190f000000b0031343b8155cmr11360101ywz.495.1655466013671; Fri, 17
 Jun 2022 04:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220609213513.88479-1-j.neuschaefer@gmx.net> <CAK8P3a0-m1iQ2bP+dsoGTPZGMNBKqB5a6315jdgaT3tuR4WfTw@mail.gmail.com>
 <YqxJLhkCQ2WcHdAp@latitude>
In-Reply-To: <YqxJLhkCQ2WcHdAp@latitude>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Jun 2022 13:39:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EFF57VqYgAtHe-2A6ttENpGmB_zqd+gYXAjg61gQhHg@mail.gmail.com>
Message-ID: <CAK8P3a2EFF57VqYgAtHe-2A6ttENpGmB_zqd+gYXAjg61gQhHg@mail.gmail.com>
Subject: Re: [PATCH v4] soc: nuvoton: Add SoC info driver for WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hsUJdsBNAhqDLzoYWGDmoa/NQ0IWMO5AAa9+niImBUP0A8pdUDb
 Ryr3M5ZZaW7Hv9YHV+cyh0gTi7oUilWYWs5FqgvVhDQ+X54rue2v87f9h9tAdmEKW2BrT3m
 yLz9fyISc4O7XAf8VeR/nPbMCYKb6xWpHRYk8an9PEolHw9LT66rcddWxbm4If5o6NMo4Ck
 hKITV4Se2e7pJjNPdcXrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IqWxMB2ylto=:8uVo9vMjse1+zMCGBzMAxy
 pj6v+S+UcHdaBQRPWkeUcjyqqIC5e+dl0pD2ZJesPiojK3RMP0r1UeVVc6svXXmxvoNE8GS4n
 y4dlcBtBffLy1YSjs137KQzsJJ8DcECDrp5zkTktrsY3ByNgZw/u9oRzvGPNO04DqgOAZGnLn
 VlmZJQnjsymeBK9SRa5CgznHAya3Fi791CyV+3wL9yRcZjwjr1Xd8YMv3ryINTuKykS+HA4rf
 JjSMkP5Z1fXgExDwB/pQpivFNMT5BhRBA85BC3nUQDJMlq+FacMdOKsTt+sYm1Zze/uvKEyQJ
 TIi8KugJrBJCLlnDNU7riaK79pYmFrFwPoOgmy0LZC/8pM34TWdkhfru/KHZWJCRs1OT9ovzb
 6RO4aYXCSGzqRMlgdCDUB9z/iKMHjO0JuZDo8xBRLp4hpEG4uo3Fpc68GmMoOX6OlnvHeoFbJ
 d4a1pTM03FI9xQ7BRC0+Gd5EpFK/tUpoSf6eZrpNlgToyx7dD/ui3JWmYZZpDFXAX+/aiIyZJ
 55YZwp6zV5XJMzLq5DDCXCBbbP4KkwIbimEj53QCYeVHrwAW36LxNTDoH2N3GcVV5lxvHX8hC
 YSCmXzM7E/k7Tlfd88xn/hK4w4X+93XvURiua5idA+7qxoftz5QDbxTf0GUn9XazCzvarVHrx
 5ZXIcI2ze3AHn/KnPhC6agkFR0tNjErwIRtznoCB8IyuiXPcLqLJMt94E/5fn23KyFx+hYpOt
 lgj/BLxjzfofZEPOx/zMBXNE05wfmNTyv6bvJJoM58t5U75quky8AUOHhwOuLG2CPV2XkM29V
 Y5HigMtGGeNxloybloKJMNyElM/26mgCuB7To9+9e2Y27ATeWQoZKPCOtNeoNw+wrX4sMDyGB
 UJA1bCB3Q1z8q99a2AXg==
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Hector Martin <marcan@marcan.st>, Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Conor Dooley <conor.dooley@microchip.com>, Joel Stanley <joel@jms.id.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 17, 2022 at 11:28 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> > Just add the trivial cleanup function and MODULE_LICENSE() etc tags.
>
> The right thing to do seems to be to unregister the SoC device in the
> cleanup function. Is that what you mean?

Yes, plus kfree() the soc_device_attribute, or make it statically allocated=
.

     Arnd
