Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6264265F5
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 10:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQhJc52tPz2ywj
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 19:32:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AjbMzcsO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AjbMzcsO; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQhJ94WWrz2yPK
 for <openbmc@lists.ozlabs.org>; Fri,  8 Oct 2021 19:32:08 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id b20so36609461lfv.3
 for <openbmc@lists.ozlabs.org>; Fri, 08 Oct 2021 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eQkKCv8aCOoMPrvXV0bT5NWn7gWtgADL5O+JTFntAss=;
 b=AjbMzcsOdo3rAaoddydDHQAUKq5ik6eiIPwgPlCdZHafIBZQn2V4RSCDlBz9ekU2G3
 2khONs+W/6r5FQRu82Q38u9yr8Eja7n9oOoBpqEjG8VQkAigKTR3IdKZY/ZvmzCNljuH
 4s8Ew2RcHrLr4EQ6wvCN20RiuboMvgQljvsaSBoe7nGPAHsUXxRcjAdRltljEml0FoQC
 2zurzpX9GU5OvUxJY+CRhS6o8/0evKo2UtxdoX9Aov+DdJH2Ky61c1tBvKWhG6RkrYEC
 95xAOdiadpmZ8Ja2GCXZehwN7UbvNixdJ9mHa5MNusnFQGKuV8bRPbCQvVH80hnKkVdt
 4d6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eQkKCv8aCOoMPrvXV0bT5NWn7gWtgADL5O+JTFntAss=;
 b=o4I040Hb7+nFR1WeyoCZs9a4fT3yOeZZ1ys56JLBGVbNNdqQ/9dKKE/7R1WjuaUogC
 KrltjJ0QM/exkVnE/5+LrKVjnnOW201rHYOhxl7bMVcA4Xjsq9Q0xXJkdoNKn1X4BHWW
 IGmoiwV0bNJkzhllaa01zxLWw84VNb5KX37wH6FHMB+HcECbOkxnPXUyp4GT+S3GLmae
 XacuuZyVjAKdrXhwYWD5e6ngeofjSOCbA6pMjINe1TtCsHgGwkmgfEn1Aup7Ju6T9XyU
 ZVNvFjhEK9z2KrOcPfy2SsWubge+0tDc8FsavY96ycR2iX0m4U0sXHpShp6yYam4uPnG
 uHpg==
X-Gm-Message-State: AOAM531Txe/8hQOidbPYRPARGmbb8MzjvJHoKZda+eH2NfiQEpiOabT2
 VDoij09NYUohjTFX7eeoD9XyyAhnN07ksJMQNys=
X-Google-Smtp-Source: ABdhPJwTgHaMZAu46MJe/H6NmropA9rUQ68gTQzIJwK8djs71Hi8NyItWVGZ6DESae58xHcYroF27J5mSMXxn5UoR/E=
X-Received: by 2002:a05:6512:398d:: with SMTP id
 j13mr3990865lfu.292.1633681919358; 
 Fri, 08 Oct 2021 01:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
 <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
 <CAGm54UGjh9QTAw_mPdPCpZ7WihTHYXRe0m=xCWrPmpvDb99p3Q@mail.gmail.com>
 <CAH2-KxBpQbmBAedd63-1KORd9Z81D-gWM7oqQPU05Q=4S5XYzQ@mail.gmail.com>
 <CAGm54UF82Xx_N0g2d0sOx8Yt0vZ--+eAk18cS_68nt2RPoL=pA@mail.gmail.com>
In-Reply-To: <CAGm54UF82Xx_N0g2d0sOx8Yt0vZ--+eAk18cS_68nt2RPoL=pA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 8 Oct 2021 16:32:00 +0800
Message-ID: <CAARXrtnhAirRLo3EWM5=3KhjJWaWq1kPTeZ2=Yuec43Ebp1Y9g@mail.gmail.com>
Subject: Re: [External] Re: New test for patches in openbmc/openbmc
To: Lei Yu <yulei.sh@bytedance.com>
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
Cc: Ed Tanous <edtanous@google.com>, openbmc <openbmc@lists.ozlabs.org>,
 Thang Nguyen <thang@amperemail.onmicrosoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It's noticed that the `repotest` is enabled in CI and we got CI
failure due to node-manager's patch:
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47673

I know the right way is to ask Intel to upstream the node-manager and
fix the issues we met.
But in reality it's not easy and it takes time for Intel to upstream a
repo (and it depends on Intel to decide whether or not to upstream)

@Ed Do we really want to reject such patches?

On Tue, Sep 28, 2021 at 4:37 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> > > I have a similar case.
> > > As an x86 system, some of the recipes/changes are referenced from
> > > Intel-BMC, which is not upstreamed.
> > > Currently, we had patches related to UART routing and
> > > phosphor-node-manager-proxy.
> > > The UART routing patches are being upstreamed thanks to Troy.
> > > The change to node-manager is related to the HW design difference, and
> > > due to the fact that phosphor-node-manager-proxy is in Intel-BMC, we
> > > can not really make the patch upstream.
> >
> > I'm not following why that's preventing upstreaming.  If
> > node-manager-proxy is something you need on your systems, I don't see
> > a reason why we would avoid cleaning it up and upstreaming it, but I
> > have no details on what this patch is, or what it does, so it's really
> > hard to talk in concrete terms about how to proceed next.
>
> node-manager-proxy is in Intel-BMC, so we really need Intel to
> upstream it into openbmc.
>
> --
> BRs,
> Lei YU
