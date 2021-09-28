Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A45041AAB3
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 10:37:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJXtl27hbz2yQm
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 18:37:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ii66gVhi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ii66gVhi; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJXtH1wWgz2xrg
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 18:36:50 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id z11so29125231oih.1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 01:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/Po6qW4x+IJhpP+bKPahp2cfjRUvQodMGD+0/oKzVA=;
 b=ii66gVhitzeWxAwEAvxNwklqcNcJS56ns7pK27uMDJRwihiCPth9zFz37IQgunj7oh
 +2Qwn2aBg9v9o3PUyx2mqumII3kOkey9EPwrjqUqMUpwGmvx4lu2KLhbgnGg9Qt3vW34
 A3B+5SEefDEiIR6XIkpx1rK+M8QWOqqzaJue/hCC5EKNdphHJVTze2uA4yMHrBHxstd3
 6b/fkH91V4TX3ApvcV3VE54ewMw2nhuToVq2oHwp+nn0UUy9sby1wD9kgAZCbN4jUKyP
 5jBNhAG80ra3Eg5Bo2ZW0VBeXU5iJ+ONhHn98VhYYCGDtQ0JC1D7a+1WYfS8XWs0Zk69
 VqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/Po6qW4x+IJhpP+bKPahp2cfjRUvQodMGD+0/oKzVA=;
 b=L/HHQqPXiR/sVIg4Afc5RvAOlRIralOAu+k5RqZXY5uvPgq59bVYCm5B42fKFJ7K6c
 ERS4px1oURnN4qMOFJ/eOHhLkqFigPnYTxAclWViB2TLc8Jq1l2Jce42B+cf8HFVc85T
 NPdiuBuJlW+9xkHtUBzt7NrjvKA2fUi3NQ6szbdSSsbZuTmUSYGNMC/rqoYYutizK2B0
 t7AnPmfOmF+b9NVTrYLcVBj6cM4vG3hntvzYIJNpRPtW8vJX31W6AmZrQEeI2S5hcRxb
 Vg/LLyr34ga/56jUlU4srq0S+SQfQv2uQTFZX8Coi1xPjqbzk0O04ThvvQEdtk791Z2D
 JElg==
X-Gm-Message-State: AOAM533N+8P7UxcG2exg8F45omCfvOujc7rij0siUORJCL5bJjoNb8iu
 DFd+dtmDgp1USZhSsrGJ5FmRRz9VE9pC+J4KICneGcidV0tfNI97
X-Google-Smtp-Source: ABdhPJySQg4LxxOVc1HX2fl478Ktu5klwsWfZ7e0rhZ1Ukb4UiHLlN5UiT6DCJaseCR1GxRKcwKNk3+Xb4WKPwZr2Pk=
X-Received: by 2002:a05:6808:e8e:: with SMTP id
 k14mr2751499oil.28.1632818196580; 
 Tue, 28 Sep 2021 01:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
 <CAH2-KxDT9DTXp99d+eV-zNinLWhw9ihaHVLNQnVsQtB7X2ZkHQ@mail.gmail.com>
 <a40d7b9c-8fb1-bf5c-1c31-3b426c0f0fa2@amperemail.onmicrosoft.com>
 <CAGm54UGjh9QTAw_mPdPCpZ7WihTHYXRe0m=xCWrPmpvDb99p3Q@mail.gmail.com>
 <CAH2-KxBpQbmBAedd63-1KORd9Z81D-gWM7oqQPU05Q=4S5XYzQ@mail.gmail.com>
In-Reply-To: <CAH2-KxBpQbmBAedd63-1KORd9Z81D-gWM7oqQPU05Q=4S5XYzQ@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 28 Sep 2021 16:36:25 +0800
Message-ID: <CAGm54UF82Xx_N0g2d0sOx8Yt0vZ--+eAk18cS_68nt2RPoL=pA@mail.gmail.com>
Subject: Re: [External] Re: New test for patches in openbmc/openbmc
To: Ed Tanous <edtanous@google.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Thang Nguyen <thang@amperemail.onmicrosoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > I have a similar case.
> > As an x86 system, some of the recipes/changes are referenced from
> > Intel-BMC, which is not upstreamed.
> > Currently, we had patches related to UART routing and
> > phosphor-node-manager-proxy.
> > The UART routing patches are being upstreamed thanks to Troy.
> > The change to node-manager is related to the HW design difference, and
> > due to the fact that phosphor-node-manager-proxy is in Intel-BMC, we
> > can not really make the patch upstream.
>
> I'm not following why that's preventing upstreaming.  If
> node-manager-proxy is something you need on your systems, I don't see
> a reason why we would avoid cleaning it up and upstreaming it, but I
> have no details on what this patch is, or what it does, so it's really
> hard to talk in concrete terms about how to proceed next.

node-manager-proxy is in Intel-BMC, so we really need Intel to
upstream it into openbmc.

-- 
BRs,
Lei YU
