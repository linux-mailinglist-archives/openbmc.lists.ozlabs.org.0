Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1720434F453
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 00:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F946C1B8nz3bwP
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:35:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UKOQD5pq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UKOQD5pq; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F945y5tb6z2ywy
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 09:35:31 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id i9so17558560qka.2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 15:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nuRu3lImGS4RPxRjEMlby//5u+A/Ll91Pwz0jihsk6w=;
 b=UKOQD5pqoTOXU66HfQu9RZFbBzHkTmwjXVIpV+TS4L2ixAh5ecoNXWlX6FXLeVCiQN
 dokTDoxoqNpEbmQ+Wj70EycxSX5RURjVJKHeAa20FyA1OsnHLTMe8OXif7v0kYavuAzo
 KTz2UfIbhPzdzLZlmFNstqeg53L+LvdKNo8xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nuRu3lImGS4RPxRjEMlby//5u+A/Ll91Pwz0jihsk6w=;
 b=p94UwxlLtu9w5j0iDJR7aYjhfdLQ52O44arbDFbn+jL3tvV9ls/7yuyRvyYkKd9Ots
 XjQZNnJ0hfvJDxnG3AldAgzEBinTgb3hEt6+ar2JBgVNrRm9kAR1fj07X31wjb5PgzFi
 Iaf2JfxZSzO6GEP4Yq+/zOhKjQ7pTZKTVjgHdwyWRVDj/LkM6KNx7mYfngR+OWY0Kz0O
 GWPEjNX9nLXUV+ZioSiMa1EYCDUmqe7sBWrUN7DsOCNCepMI3YTO3UGlezsIDToriA6Z
 9QxIsJtVUGOXTS/K/Z2kocRBxNJcxHT/WW7bsu6oUgm8rWIDhUPD27ioLr9hqpiyv1gy
 pfMw==
X-Gm-Message-State: AOAM5332S7l3IpX60afF7gTOA4v/8xGDldOCRtfci80uuKpehGmdIaX9
 QM6X8d5SS4IHItCiMUKB1J+F5oIHEMVtC0R0BT8=
X-Google-Smtp-Source: ABdhPJzKE3v5tc2ov7OH+2Dgt0wrrqW0S7DtYOmzSz2oXd7QAmSw64zHeLL2s4RArVVnyW7QJ8I+R0INyc2OV7ZBNOg=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr483665qki.487.1617143727819; 
 Tue, 30 Mar 2021 15:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR03MB5090B60085F8D0C40B0D9496CF7E9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <CAGm54UE+zUQHXiLONCVUZRuxOJVC8Mhkxo-A5DZtb+t56oiHhg@mail.gmail.com>
 <PS1PR03MB51000EC29C060029981CE8B6CF7D9@PS1PR03MB5100.apcprd03.prod.outlook.com>
In-Reply-To: <PS1PR03MB51000EC29C060029981CE8B6CF7D9@PS1PR03MB5100.apcprd03.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Mar 2021 22:35:14 +0000
Message-ID: <CACPK8XfyM4R3y7DDfU3Yi13z5QiA-7ciUUdtz+m970tU83-z3g@mail.gmail.com>
Subject: Re: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 Mar 2021 at 05:47, CS20 CHLi30 <CHLI30@nuvoton.com> wrote:
>
> Hi Lei Yu,
>
> Thanks your help to provide this information.
> This issue seems relate to "cannot do write action for /etc/passwd file".
> I'm trying to check whether is relate to jffs2 or overlayfs filesystem driver.

jffs2!

I did a bisection and the offending commit is
https://git.kernel.org/torvalds/c/36e2c7421f02a, from v5.9-rc1. I have
posted a patch that fixes the issue:

https://lore.kernel.org/lkml/20210330134537.423447-1-joel@jms.id.au/

I will merge this patch into dev-5.10 today.

Cheers,

Joel
