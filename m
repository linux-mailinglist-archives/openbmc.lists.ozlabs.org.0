Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD33E6C0B
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 06:41:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471k950lSPzDqdL
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 16:41:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="q1PqP5WG"; 
 dkim-atps=neutral
X-Greylist: delayed 339 seconds by postgrey-1.36 at bilbo;
 Sun, 27 Oct 2019 18:01:53 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47180d3tNkzDqgF;
 Sun, 27 Oct 2019 18:01:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572159702;
 bh=ARdfih51ut3Wc7cOVlkAxrqjxZ2ICiWrQ62g5bzsKEw=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=q1PqP5WGtCAdBon6ZLe+Hpj+gG4uuPCpda0k5wgvbuIZKlSQ1oHK/Aa21jpvK+6bD
 wpb2GmCQN/LQWD5WIrN40fDCHGCxzDO+qZAYujdbzVhA0lsNlw3FVTGX7zhAEJPlhc
 qPusz84VauMM9r0cF4cGSkQM5PmCiQtFma+hojbg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.56.174]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LfAfQ-1heV4N06Zc-00ooQ1; Sun, 27
 Oct 2019 07:55:31 +0100
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20191026042519.29446-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <bec85427-66b8-e0fa-9ee2-07cc77cf4a7e@web.de>
Date: Sun, 27 Oct 2019 07:55:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191026042519.29446-1-navid.emamdoost@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FmGICvn0LmSTTD7R93PU62N8WsZYZ6cdVmszCY8Q/JcMVVRUbYb
 Vp0gqGawU/a6Qlz1JBoLAhB28rowaZFN8uoAfGXOHvvxbqZs8UpzUjC1qx/sPDrngPe0zPp
 TDOb+KZZFwULLo+UwbuDjrmLxEYbLjOg7cujUQWSEr/+ZGhJ8VPHpmBAKRY5Eyuf9HunTNI
 dGvxHMQ43a0KQ0Qu/oyjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yJtLoEaTMRQ=:FVUd+Ra4EuZVLMgJvZF/9h
 c8dcEJ3bPneK+cvViQemkqAo7WIMkFfm4Edi5a/muFQ8XqZv+vxgrmKqSmJ5LFnrJs6t/bzcm
 PkcJAW0Gyj9bBor7r5q2AJC+q3x11ht6zL0b6W3PHtE8lCRF7VIyLBp0tcqmBmHx4EB5pN2Kd
 P1zBAPexrxbCMxQq0PmeGyx7jDkqt1TITElcyY2ahSrN97862by+XHgP4TQI9BkLMm+pyDCj2
 4uUULgmzd1JSwHEFYsbzTUecOYExQuFALb0RuBuZS2AakAHO++GjSxs5AbP0AUl8vGfq7BSzs
 w0h8WK1RYNTieuD4fyCi9z924CQmGxKn3g2vO79d/VI7YdW8fo30RnUPre/fIC+mvH5injwRE
 8BvuwVaJCztwgbC3IJeG4SalM750fvwKzfk3ooxfIH7mzdf7ylmMWxTZ07V4Fji0EZ+8E3eHf
 aMpcL5rWyIWlOdQ5FlM4IdSLmMkk/8mxd8TVUeXKJVOyWw3qUt14GpW5NJ4NR67HcPZLVjlq4
 YM3LTOHT3TxYZu5UVWA+iY25y2czZm83AylpRL05UCwtPgzsV1EeHVcz+sQdszk4joMjuhADT
 lrBhoxjUz2mC2Bi7BVHMeqdqQoU9qpS+AYTXMR6LN5QQJmOr5ddlMAGXNSXpSNI33NG88tgeU
 d2doThMx7+e8871fQk1tI9v4R+5aHuDPfLGcV9HsXMdYgt/xg/v0EG1tY4FfkKHA4P5UQFUMn
 jGvveZ6m7RdU2JAFuwTPiwT09CePoY5xRiVnaUZOvC7lPWLFfiD32jJ0qgtydhjQ5b3Mxc/SY
 gFblsBhdenEPVAUEUBMqaQYYUqq4bO/KfHD1Y5XO/ZqMqglNUUYpx72n5JKlA6z60nM5UqaAv
 Pc1auZZxEyf1QTll2fWvawxMSqh389C+3FcPm/uOFaMVAntnsfR9w5w7K55dI3w4TZH4xk920
 2nyzkEHjN0wVsxAuntBTej7YO7tcQEsFeN2qQyWFaF4rCmybSWyO2T/nREZ4NvhstP6Wt6ihA
 GKcIEODeosCDaBCTVzpwEZt9vVa9MEsEH45n5EcNCtgOVOzIUIFPhJX7+epjo6jSu0/oRFsO6
 QHQgd30NOwC+I6AjqGI0stdY5aYVMQ76KJdvg9v7ztqWD7ECWrsnTQ4KoewyRypFGH7Z0u8gP
 7bZDwGK6VMWHdfzUxxwr5QZYb/GffBdfN+Y/ARiDeQwcZV+PiUg9Xs+tWYE7k8J+njUN53wUq
 8ZxTyc0UVe4iHzeOA0AnJhssCa7NgrgyCeuiGsmLyG1HNQAHT0+9LthshGRc=
X-Mailman-Approved-At: Mon, 28 Oct 2019 16:36:50 +1100
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
Cc: kernel-janitors@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Kangjie Lu <kjlu@umn.edu>, Eddie James <eajames@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1663,18 +1663,24 @@ static int aspeed_video_probe(struct platform_de=
vice *pdev)
=E2=80=A6
> +free_video:
> +	kfree(video);
=E2=80=A6

I am curious if there is a need for such a memory release at another place=
.
How do you think about to add this function call also to the implementatio=
n
of the function =E2=80=9Caspeed_video_remove=E2=80=9D?

Regards,
Markus
