Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F9A5FC7EE
	for <lists+openbmc@lfdr.de>; Wed, 12 Oct 2022 17:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mnbb22cHyz3bnY
	for <lists+openbmc@lfdr.de>; Thu, 13 Oct 2022 02:06:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=glBJX2jw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=glBJX2jw;
	dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnbZT36mJz3bjb
	for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2022 02:06:08 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id bb5so4988577qtb.11
        for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xftxVLRbwErBfZjIdLPPzQehqN4edV3u86VnvR+lJs0=;
        b=glBJX2jwhLIjx7hQnfV5Z4XjGc/vIxt79FbbCcZgxkaK1/IBMCb6TyHB2wVaAUfaFi
         739iJu0CG01P4fC+fiv+OMztAU/c31BheejIaw0jYALPEK9CAX++AHLIOr5NRK6iMGtM
         Dw/gI/0+ZojFGjUuMlcsFOq38HFsfPE9/Lp82kaaqsYeQ5PDF5zGKJAp3ZXdZWr5WNLg
         bMYqT/y7QZkPUeWRDjCVpflhfhLHx725gRE3eik358LM0PIUjfdhrhLvZvsOcVrYUukG
         /XG1pik85+btK0/T8weC0A2gD/wyiKl1/mrKmH1NkzmOJ/ilQ20k7+ReFL9Ae8Do0M9w
         LLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xftxVLRbwErBfZjIdLPPzQehqN4edV3u86VnvR+lJs0=;
        b=Xe65v0hXkr0VyoE4qbBQExfmEvA5/chU1DaMRFy8ACBths4wqwTyuk6zqo5Ng3Vpqe
         6iEUy/4duRXbiWwl4Zgygw1S4YVB53Oa2PLadhpVfUZllMYKoEXH33Iw6EXrUh0TKiu9
         RdxnoqQF05h49ftMUWyH71Yt2Jt3TWfVtOGkUqN4HV61Qnfxg8vD7oRb+lheZincZP+z
         qbHxzGOgDXkxzwRZq60L1aX2wLSRCE2TgSckCuFRlXO/NELdpmNp8hk9kaeHhf91adTl
         MLcf1lJxPSHwRnvJwBsTAkbLgyDteKiDF6icl1nfW4BK1Mi6z6ZovRZQTENg2Cbt9jKE
         OWhQ==
X-Gm-Message-State: ACrzQf1K5U8usaIrG8PO6RbQExO/TyWXvzEUO/t+u861zvzpI/FFgKsD
	ShZF1mxA0Awp2U2L4Lv8ZyQ5gASXxpG8FXiMfcGQlQ==
X-Google-Smtp-Source: AMsMyM48RW17ELaY3C42+CkqwB/2e3LhaJub+QaTJnFJUkLD4bp+VQrtj7bIcITRHYbCECwX/etYT89PNuR5N/OnzFo=
X-Received: by 2002:a05:622a:288:b0:35c:fe52:2e5 with SMTP id
 z8-20020a05622a028800b0035cfe5202e5mr23399639qtw.59.1665587164339; Wed, 12
 Oct 2022 08:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <CANFuQ7BJBX2dZyrYAvxfuZ2sjnWLR-iAbu6_iCQHBFg7--0X-A@mail.gmail.com>
In-Reply-To: <CANFuQ7BJBX2dZyrYAvxfuZ2sjnWLR-iAbu6_iCQHBFg7--0X-A@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 12 Oct 2022 08:05:53 -0700
Message-ID: <CAH2-KxAZ1GrbBsUU_+OyWmroJEkwhBa5Ao_g5EtcUAsB75fxxA@mail.gmail.com>
Subject: Re: Enhanced sensor monitor
To: George Liu <liuxiwei1013@gmail.com>
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

On Tue, Sep 27, 2022 at 2:44 AM George Liu <liuxiwei1013@gmail.com> wrote:
>
> Hi, all:
>   I am working at Inspur and we're investigating a feature related to
> sensor monitoring.
>
>   As far as I know, the OpenBMC community will only trigger LED alarms
> when the parsing FRU/VPD fails or is not in place. The lack of the
> function of triggering the corresponding Sensor fault light for the
> fault status (Warning/Critical) of the sensors, including
> threshold-type sensors and discrete-type sensors.
>
>   For threshold-type sensors, this function has been implemented in
> the Intel warehouse [1], I think this should be a general function,
> and even many companies have implemented it downstream, so can we push
> this function upstream?
>   For discrete-type sensors, it is only implemented in the
> sensor.yaml[2] of the phosphor-ipmi-hostd, and we found that the
> present state is simply implemented. I think it is necessary for us to
> improve the discrete function and support all types and offsets.
>
>   In addition: For the SEL function, the phosphor-sel-logger has
> implemented threshold-type sensor alarms and records SEL, and I hope
> to also integrate discrete-type functions, and be able to get all
> sensor information through `ipmitool sel elist`.
>
>   So we currently have an idea, we hope to create a
> phosphor-sensor-monitor repository and implement the following
> functions:
>   1. Provide a PDI interface (eg:
> xyz.openbmc_project.Discrete.Sensor.Value) to record discrete states

This interface is intentionally not present, as it removes most of the
modeling required for exposing these types of presence, and states in
other APIs, like Redfish, and would require agreement on naming
conventions, which we've historically had issues with in the past.

>   2. Provide a way to monitor threshold sensor status -> trigger LED
> -> log SEL (the function of logging SEL has been implemented in
> phosphor-sel-logger, I hope the two repositories can be merged in the
> future)

Merging those two repositories, while possible, needs more discussion
than is present here on how we would accomplish this, and what the
advantages would be.

>   3. Provide a way to monitor discrete sensor status
>       a. If it is the data on the Host side, trigger the PDI interface
> through the ipmiStorageAddSEL method of phosphor-host-ipmid -> trigger
> LED -> record SEL

I'm assuming this would be implemented in OEM commands?

>       b. If it is the data on the BMC side (eg: PSU, OCC, etc.), it
> should inherit this PDI interface in the respective daemon, and the
> phosphor-sensor-monitor only needs to monitor the property value of
> the PDI interface -> trigger LED -> record SEL
>   4. Flexible JSON configuration file, ideally, when adding or
> deleting sensors, you do not need to change the code, just update the
> JSON
>
>   There may be many situations here that we have not considered.
> Welcome to ask questions. If the current proposal is accepted, I will
> push a design document, thanks!
>
> [1]: https://github.com/Intel-BMC/provingground/tree/master/callback-manager
> [2]: https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor-example.yaml
>
> BRs
> George Liu
