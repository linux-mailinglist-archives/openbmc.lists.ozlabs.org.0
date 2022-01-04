Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4C74848F1
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 20:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT3Bk68brz3054
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 06:50:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=SZKTCSFo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=SZKTCSFo; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT3BK1nrQz2xtQ
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 06:50:30 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id s4so44301337ljd.5
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 11:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bN2aJBIZLE86nfdi8TL0hVhmB1bAESedazkVeP07OwA=;
 b=SZKTCSFo6E4agKyKnMvUWX5AkrkI/cXkz2QsrnU81Nk6GwdmksF5zTX/E5Glzpg2CN
 Eu18wVnvE+QDbr4EPiE/VIa1swt5smCA1q+tDRTNYIb754Jsr95IYhJb2+ONh7qcY/Iw
 AWHPQ6vTaXoMkKFD9f1pbRtvR3Ua8PAq8B4udRi40dVhpkWadL8TK2UXl9ZilWdiEVUo
 G7eTmNzd912HeIyxUKLab4TKVAmyfJxGK4VXoJl7SRsPRH7vRVzXL2ZCerblkwfmiL9X
 l6NGrmzBAojw/smSuiLMGcLRoxLJpRyqu+Ko0GQbOtNF07wnIgXPfdjYtmTmBa6zgf6N
 k1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bN2aJBIZLE86nfdi8TL0hVhmB1bAESedazkVeP07OwA=;
 b=WbO2m1eIo8fl7YC0Hs39HvDJbbNaRg4M6CzRU2oCF6zN1QVVq9jRXKec6sAn/BUTV/
 rxXUapKTAkkqqvoW5o2zEUtHpfivbt+/AQXa1cLXWfKA/jpnrqEFwTgOW/f0DHsBYd5L
 9DVtSLFyR9wOaiELIJ6K/73jc4sZvhXyYba3eaYIrVd1kNM6Z0y7c00R9svUhteJ/MgV
 xnIfOjEx7MwzanW4/zj+dEPwjadMBBdrih1GXMs/6MCsqfsKN4aRYS6HNbnoF4XYV6Ap
 kKqJGcWFg5q+4TYgB/5+nm5ug4c0S7CgNx0rxFqdcYrB9qkxr4E1ezOCUMwO0T+kXjBU
 BAtQ==
X-Gm-Message-State: AOAM532G0nMiWg2ptFeZDARJIBjf74ZF9aDCjfmhVoF6qKSakLMvf2dO
 K26S4dSyxWd9XnQC9ovimZRpK1P9rP3vT9uPCt+1dw==
X-Google-Smtp-Source: ABdhPJxn6c3Xiia37EixR5OhIU37ihGQYrnIvR/F26Yr18/B1QzJR4Z+4kZP409fVMQZnsZzji76Rv7b3n582vxVAfg=
X-Received: by 2002:a2e:83d0:: with SMTP id s16mr39720620ljh.360.1641325823897; 
 Tue, 04 Jan 2022 11:50:23 -0800 (PST)
MIME-Version: 1.0
References: <CAA7TbctqbhbfV5e-QH-QcuwgfHPVLj3z6wFAXKMo6cd-=A1ZYg@mail.gmail.com>
In-Reply-To: <CAA7TbctqbhbfV5e-QH-QcuwgfHPVLj3z6wFAXKMo6cd-=A1ZYg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 4 Jan 2022 11:50:12 -0800
Message-ID: <CACWQX80YTyuMYozJgpLx36X_7sbwdp2O+BGCdxJQXyMPA+VjxQ@mail.gmail.com>
Subject: Re: New repository request for platform specific Bridge IC code
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, velumanit@hcl.com,
 patrickw3@fb.com, Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 3, 2022 at 11:55 PM Kumar Thangavel
<kumarthangavel.hcl@gmail.com> wrote:
>
> Hi All,
>
>        In our system, Bridge IC will act as a bridge between host and BMC=
. All the IPMI commands from the host are routed to Bridge IC and Bridge IC=
 will forward those commands to BMC.  Similarly, BMC will route IPMI comman=
ds to Bridge IC and it's forward to host.
>
> We wanted to put this platform specific Bridge IC related code and ipmb c=
ommands handling code. So, we need a new repository to add these codes or s=
uggestions to add these codes in any other existing repository.
>
> Could you please provide your suggestions on this.

There aren't a lot of details here, so it's kind of hard to make
concrete suggestions given how short the above description is.  Can
you please put some more details in, background, links, ect  Some
questions off the top of my head:

1. How does this differ from MCU sensor in the dbus-sensors repo,
which also manages a "bridge" IC?  IPMBSensor also implements IPMB,
how will code be reused in this new repository?
2. Who is going to be the maintainer of this repository?  Ideally it
would be someone that has been a maintainer before, or someone that
can mentor in how to be a maintainer.
3. How is this code going to be configured?
4. Where is the design doc for this new feature?  How is it going to
work, what features are going to be exposed?  What new interfaces will
be needed?

>
> Thanks,
> Kumar.
