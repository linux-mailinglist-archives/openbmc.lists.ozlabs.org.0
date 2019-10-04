Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B5CCC2B9
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 20:33:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lJRV3drCzDqdj
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2019 04:33:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=bjwyman@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fMLOHddY"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lJQl2gWczDqMC
 for <openbmc@lists.ozlabs.org>; Sat,  5 Oct 2019 04:33:02 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id k20so6627359oih.3
 for <openbmc@lists.ozlabs.org>; Fri, 04 Oct 2019 11:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7AfsYaZzE/bpO4QaUvpRUQEi0xkigaJlnBSLado9izM=;
 b=fMLOHddYOpVLbgIVgClj2l7f3m9QwfjDUF7qoIy/FD9nVFn2mwvx6fb5em7A4hYcJz
 LMtqC6aURabLw3GVG7Bwo4NX2CvfYCCNAu4TsMIxdqFNkv0kD3ay264HnCjgs5ZqezAE
 dUpOaESkdRgofn6MtcjfZTFkpxXoy7g8vO9RkhS9YkCT3mxZIzDKUcrlWW+GnvDAUX51
 XpWPsgdFli/VtNdWyzR/XKuePOnlh1IIAIVWUoM4rchihsLqAq9vQnwLiSC80VG3DsBv
 NQuI+IaFk4D8TxbwTylQqsCGGQu06GBa1SXXU1zsK2wZTdbVDonkEQYW+4pZVjrMmrUN
 AbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7AfsYaZzE/bpO4QaUvpRUQEi0xkigaJlnBSLado9izM=;
 b=OrpTsN1q+jJmE3IPwHLjdjZ84TgSaT6UOOlw26+BudHtmYTYnb20eOU9XgGqqhYVnZ
 eExKdgv3mffW06P/Yqcj6H1O76y3AlmtGhWGpHM58C/9M78wv1+Dls9ooPAEs+/FEULY
 tvpmIJARFjW9X+FuPSYPYlr28uPaVHbk61oN6Li+Io85cu7Ht+FBwgnJrcNge3R2Ir98
 upneU46XRk5yeXhUYzET0PkkxIj1mPOw83FSuqV7JbopPCk53hQaR/FNNQ+er0gsYP71
 pkcgKFAKo0mzSqtPnqQnF0+XSfsboDxcLj58KJZQ/1bpWwsV6r6qAZEoeCdelX0KP7U0
 1pvA==
X-Gm-Message-State: APjAAAWPGjq+RItc7e44NVLCSLzrffa5v3MIfZYNyJOwSAvkp8gWq472
 swOilWFgaSI+TRAO791o7S5oaLDA6zLgfIU+xB4=
X-Google-Smtp-Source: APXvYqyvvgCnGnQN6MqAbRuhZgrIz4i8P9vxlAkVYTAc5r3qgmZc0vb7NZyDvReLbQulqjYef7T4DvwQYj2In28ETKA=
X-Received: by 2002:aca:5b84:: with SMTP id p126mr8332251oib.4.1570213979231; 
 Fri, 04 Oct 2019 11:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_7C14F1899E03C3479BFA6A169AFF9DFCCC06@qq.com>
 <1ba3bebe-1a93-4848-a2ed-979e31c7b708@www.fastmail.com>
 <tencent_34EA53595EFE6AF25F53F427650E7D1F1708@qq.com>
 <tencent_AEA99F5038687CB8AB0765B1F867C9EB4C0A@qq.com>
 <e3883ab8-7318-4033-ad4c-94018bb0dac0@www.fastmail.com>
In-Reply-To: <e3883ab8-7318-4033-ad4c-94018bb0dac0@www.fastmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Fri, 4 Oct 2019 13:32:47 -0500
Message-ID: <CAK_vbW2_rSU8O=r+vMrJ8XVA_H0ZDi-Q9n4OaiJ1TKWqNJ7U5A@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=EF=BC=9A_how_can_i_use_ipmitool_to_interact_wit?=
 =?UTF-8?Q?h_openbmc_which_boot_from_qemu=2Dsystem=2Darm?=
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?5Y2X6YeO44Og44Or44K344Ko44Op44K0?= <1181052146@qq.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Sep 29, 2019 at 9:06 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello Liu,
>
> On Sun, 29 Sep 2019, at 17:04, =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 wrote:
> > Dear Mr. Andrew and openbmc:
> >
> > Thanks a lot for your helping.
> > because ipmitool use udp, so my previous changes for qemu cmdline are
> > not right. i change it as follows:
> >
> > #qemu-system-arm -m 256 -M palmetto-bmc -nographic -drive
> > file=3D/home/openbmc/openbmc/build/tmp/deploy/images/palmetto/obmc-phos=
phor-image-palmetto-20190926123057.static.mtd,format=3Draw,if=3Dmtd -net ni=
c -net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-:443,ho=
stfwd=3Dudp:127.0.0.1:2623-:623,hostname=3Dqemu
> >
> > change "hostfwd=3D:127.0.0.1:2623-:623" to "hostfwd=3Dudp:127.0.0.1:262=
3-:623".
> >
> > and i run:
> > #ipmitool -H 127.0.0.1 -I lanplus -p 2623 -U root -P 0penBmc power stat=
us
> > and i got:
> > Chassis Power is off
> >
> > it seems ipmitool works well together with qemu^_^.
>
> Awesome! Also, thanks for following up your questions with the solution,
> that's a great help to others who might try to do the same thing.
>
> Andrew

Interesting. I am curious why the QEMU readme or wiki pages do not
have a note about how to forward ipmitool traffic. Is that something
that should be updated on a wiki or doc?
