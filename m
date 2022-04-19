Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C604507BEE
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 23:30:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjcRf44kJz3bZg
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 07:30:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=i9vvzVd2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=i9vvzVd2; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjcRF3hqTz2xlF
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 07:30:32 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id p10so31633548lfa.12
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2022 14:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hFMp1+5jruu9voTy4Ou3O3HfKhvfbSilppow+zSctrU=;
 b=i9vvzVd2zB1T3nf6EUbqHRH6EaxGLfq0NKSQTxOwe+4KESfjp6bG+qEqCSucUHJPqA
 Fi2oP/UI1DXeK0WrLwYFDbt00kJlYGJiI5+sN7p+ZWSOFk/WNGV28SSkEBQM71BxVRCZ
 coXAGaS+bHA4qxVFj13eBciD775vsQFfIk67PND3ixKcbtJtS0zZtT6/jmsMkz+3fPPJ
 7hzyOQX8nvVwIN2tSy2lsV0uI2gF21Z/ssonTDXoyr16Vif21dRJ/XuVe3bByrOONIyI
 dqL1fvjegGlzkD+y7M149O4wOgjuZU/eXdcBnaGkNzWIyJECoNFTpOtO1/RlfcSaaMFP
 5kHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFMp1+5jruu9voTy4Ou3O3HfKhvfbSilppow+zSctrU=;
 b=3dwQgptu8JcamqoNaGmM4APw8H24y/ADbLrL5bKSOTXb3eW4eUBBSln3KaHLLED9Cc
 qzAtarCU1bz+NJXfsSl2sP5qC4vmG+NslblmsPMUwJQ8wryKhcumvxWghymEm6atmYcE
 tvgnHpoRep4QYl8lvdac/vcnSesHsrR9Irurm6a/ic42DUHT02H1F7Hpe/oWByxXKzlc
 MfaxDX6vI0FIdL8Nj9wxTSgLJ/dajosIeXZ8EEaQ1FCSh5bPBAjYQxHeRHeyAJH2in7v
 3DoHzghXbb1U9kood/1wTWPMM+ccvER8q/uBExLdu0MVLbZx2urGlpXMx8gTZnY4DXJn
 Bz1g==
X-Gm-Message-State: AOAM531DAGUdQavzAImetoc+ACJ54NOUdRZcyYfMixJLR9ecnuHrtG8I
 O9WkhqVtBhuyW6FQr0ae5EBk0McjhBTW2AbUMqBL2w==
X-Google-Smtp-Source: ABdhPJywkEQs61B4cK37etFPFZAbz5BNVgo5w7EGUNk6CbvWL/9TG9Jbh9xtkJ6etFwJBJ8EhzB02ybcA9LzO0hBISo=
X-Received: by 2002:a05:6512:22cc:b0:471:b3ae:d873 with SMTP id
 g12-20020a05651222cc00b00471b3aed873mr1682103lfu.588.1650403825178; Tue, 19
 Apr 2022 14:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <FE2B7C36-070C-4DCF-84C0-FB3A53EC0837@gmail.com>
In-Reply-To: <FE2B7C36-070C-4DCF-84C0-FB3A53EC0837@gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 19 Apr 2022 14:30:14 -0700
Message-ID: <CAPnigK=-OiqwEgoFtHazscEQzboSpseDNyvVJk41VxLJiKaUkw@mail.gmail.com>
Subject: Re: preventing chassis power-on until bmc Ready
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I don't really like using multi-user.target to order host startup
because we may have lots of optional or non-critical services that
take a long time to become ready that just end up delaying the boot
time of the server (which is a critical amount of time to reduce for
our usecase). I can also see how different platforms probably have
different definitions of "critical" components based on what the
bootup firmware ends up querying the BMC for. But having some kind of
unit we can opt-in to ordering services against may be useful as we
have our own targets for this purpose on google BMCs.

On Tue, Apr 19, 2022 at 2:03 PM Andrew Geissler <geissonator@gmail.com> wrote:
>
> Greetings,
>
> We at IBM have been finding cases where we wrote our services in a way that they
> assume the BMC has reached "Ready" state prior to a chassis power on and host
> firmware boot being allowed to start. For example, to power on the chassis, you
> need to have collected all of the vpd associated with the VRM's and power
> supplies. This vpd collection occurs on the way to BMC Ready, and services
> in the power on target assume it's all been collected. We have other scenarios
> like this and we're wondering if we continue to whack-a-mole by fixing
> these individually with explicit service dependencies or do something a bit
> more global to ensure our systems aren't allowed to power on until the BMC
> has reached the "Ready" state. This state ensures all inventory and other
> system data has been collected and created on d-bus.
>
> The BMC reaches the "Ready" state once all services within the multi-user.target
> have successfully started running.
>
> I know in the past I've heard of servers that allow both the BMC and Host
> to boot in parallel (which sounds awesome) but we're not there yet. I'm
> contemplating an optional package in phosphor-state-manager that could be
> installed and put in the obmc-chassis-poweron@.target and prevent
> any other services running until the BMC reached Ready.
>
> The obmc-chassis-poweron@.target does have a "After=multi-user.target" within
> it but that doesn't control the services within the poweron target. It just
> ensures systemd will not consider the obmc-chassis-poweron@.target complete
> until multi-user.target has completed.
>
> Anyone else have a similar issue and/or thoughts on this problem?
>
> Thanks,
> Andrew
