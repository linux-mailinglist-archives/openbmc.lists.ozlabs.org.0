Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD788B459D
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 04:45:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XSCf2nS0zF3vc
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 12:45:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EHPgV//V"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XSBy4dDwzF3tv
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 12:45:13 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id h144so3932729iof.7
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 19:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ueDtEGeybenY0HkUhRy83UfWpdRMAFuLB/DZDaPflas=;
 b=EHPgV//VrRge/KZB6VXw2Lt7EcFo2z0/hy/6y+eDs8HCvs5PwnDh4O8eS0UA/4bcov
 H2yLUH8p/3/sJ6UTwekMliTB2yH/00i3bx8rwBkII30aXGMFBAsCEHefOZCKjLa7mBmB
 XWhnxU9NLeu6Dp8L8yBQfB5klv2pV2nb2slDthsnWjGxeBAV/NRX4H7b7s4f6c72ZQzP
 wF7ClIkwXRJFCBOvIMZ0IWkZlL9rDp0RoI6Nq/0/4EA6UOo4Ivp6xjIlbrhD4pQPhtgG
 Vi6gpCq+ocCWxEUjMHPcS4oiW58SwoU7SpE+bSBa5fElyQT7I+PN0tJYLFn6VL8e2WtM
 Usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ueDtEGeybenY0HkUhRy83UfWpdRMAFuLB/DZDaPflas=;
 b=aiHy+kiiuaNF0srQ7ZTmvkVCjRnQNR8D+HKPuoqyz2m579hVULfgqxPopKIpeByz/Y
 7OhVyOLL44HtH22gxt74aEJLFXTfquHDu5bqArjxyd9SlpuNuZVCRZIIVwZHPCGxF7Fx
 6QxGISs3e9KU2Hx3G3HvvaiUXne7Y1HJnAc18jr8gQ1+3hJr8ov7RZrZ4cbFTpylSDZU
 BcV1DdYkTUOIbwy2Xcb26Qm8lQJLgmJvVuC/dSv7NoiPgorvdn/35JgEyqicxOV9Q/ub
 SIfcoiQ2NZib/kIwRvub+ymz8JlPl3UnsAv0zTmIsUIfrMQKGLUMtxQ8nRLm4IWMO/FL
 GPiA==
X-Gm-Message-State: APjAAAX6Uja4iKxBR+lOwbWpYdKPisdKVWh5ixzDGDMLsZv1Z6ZWkK5O
 stIsiNkoK1becqBJtLJn95umwZJfrkKZw3LQNT5thCppgL4=
X-Google-Smtp-Source: APXvYqxbdvtRd8i0hnIeJ2QJnDYLikWboXiO/6uFIj0GzJLFX0fRhwXHJKq73R9lnB55w/wHO0qGGADSEPVgr47ACrU=
X-Received: by 2002:a6b:8e0f:: with SMTP id q15mr1250158iod.186.1568688310301; 
 Mon, 16 Sep 2019 19:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <05C62CB4-950C-42F4-9C17-41C91E54D9B4@fb.com>
In-Reply-To: <05C62CB4-950C-42F4-9C17-41C91E54D9B4@fb.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 17 Sep 2019 10:45:00 +0800
Message-ID: <CAARXrtnDnsq9BQEftaeymEF1W9ehKCwuzUZLkKbkcXJ3a60RnQ@mail.gmail.com>
Subject: Re: Phosphor code updater
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 10:34 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Brad,
>
> I looked into code updater from phosphor-software-manager as you suggeste=
d last week. As per current implementation, it is copying all 4 partition u=
boot, kernel, rootfs and rwfs. I wanted to make some modification to allow =
user to choose whether to upgrade rwfs or not. This way, all persistent sto=
rage can be retained after upgrade as well.

By default, image-rwfs is an empty image with size 0, and thus it will NOT =
be
updated to rwfs partition. So by default rwfs is preserved during code upda=
te.

>
>
>
> In my proposal, I will add another property named FactoryImageInstall whi=
ch can be set as 1. =E2=80=9Dtrue=E2=80=9D means whole image would be insta=
lled including rwfs and 2. =E2=80=9Cfalse=E2=80=9D means everything will be=
 installed except rwfs partition. This way, old rwfs partition will be reta=
ined. This property will be under  xyz.openbmc_project.Software.Activation =
 interface.
>
>
>
> Please provide your opinion. I will send patch soon.
>
>
>
> Regards
>
> -Vijay
