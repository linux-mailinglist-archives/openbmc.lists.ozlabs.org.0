Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B387B5B0641
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 16:17:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN48T4lZCz3bhf
	for <lists+openbmc@lfdr.de>; Thu,  8 Sep 2022 00:17:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qq2xcCE7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qq2xcCE7;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN4811xf5z2yxG
	for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2022 00:17:04 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id z20so16159103ljq.3
        for <openbmc@lists.ozlabs.org>; Wed, 07 Sep 2022 07:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=izoVtEQI3AorFoVIV2jH2nl8Mtygz9NI3KRAZPi16U4=;
        b=qq2xcCE7cMpaXbBm/DCr7TmIH09c/tyruyYuJ874jGkGH2C6rS8xb9f/Fin40GWC0d
         G+1W9dDWEOHMESr30Sdaitr3RHTDvccuxYgHFAxbSNbOglUqXaPHIxMOlRLl2RBI0gaI
         9uk0eCuumOC0CquOHDdZ+NwXaNhaQVK5XS3WnG/neUxGwREyY8aLVcP40m+HO0n5ND9t
         0ODydyYe5bdxvnObStMpboJo0bFz3pzwPkSyMX/Q6Venj2M8fg4pv3/kkgQk7SL8ERtr
         HUKNwYEhtWKNMgoyO1kgzbH9ZJ5IBWQ/x/uCN4KY/pxYIZmDos1lKWuVKMcbPPGHEHrZ
         xbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=izoVtEQI3AorFoVIV2jH2nl8Mtygz9NI3KRAZPi16U4=;
        b=5WW6gK3VK9dve2Jhgj36G6LeReQK8A6iq8mpzCqBBiHcWS1RREUjFYnKijGagL5mup
         2SADkzT8eJAUj5VNHfVfd3IvldTgETgvHD0PAAQHktugYgcVENOfq8R70L/M/j5B9/75
         KTKwdqaR5p3BA9VvMr4hXxJt4qBUh9RaWjfuFQTwXYzWIhiJTkt2Js1rcy6IHPoFu6qX
         IMH6aA4vAaEfCFUHIXBjGGK1TScvdYCv+W29TxAj1+BSowZl67OASQrIda5XoMbkXH5f
         jLbo8X5hBremBKhcy8xQ19YPLxdleZT3cTTVKk5LgNNQgIcZaASOVJb8IXx2TRpbUbrX
         xPcw==
X-Gm-Message-State: ACgBeo0YgGXpC5iutUCU2YYBSMBfw9D1ncTd2CfKt0AJuSkJSUWnw73g
	DiU4gZ2Q4ljRfuXbTogp8RE=
X-Google-Smtp-Source: AA6agR5b+rvRvBkfSNy9SuhiGAOK5QdBPpsGW7YeGaEMdTCO3FaSzuHiZx7dVOao5RVy4/S34Aq8vw==
X-Received: by 2002:a2e:391b:0:b0:26a:c75c:ff6e with SMTP id g27-20020a2e391b000000b0026ac75cff6emr1013759lja.99.1662560216033;
        Wed, 07 Sep 2022 07:16:56 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id k5-20020ac257c5000000b004946e72711bsm2507518lfo.76.2022.09.07.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:16:55 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 287EGqsj016353;
	Wed, 7 Sep 2022 17:16:53 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 287EGplf016352;
	Wed, 7 Sep 2022 17:16:51 +0300
Date: Wed, 7 Sep 2022 17:16:51 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: SATA hotplug notifications for BMC inventory updates
Message-ID: <Yxin03RwpUvVPsAy@home.paul.comp>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Johnathan,

Thank you for answering, please see inline.

On Tue, Sep 06, 2022 at 08:53:09AM -0700, Johnathan Mantey wrote:
> On 9/5/22 04:11, Paul Fertser wrote:
> 
>  Hi,
> 
>  An OCP Tioga Pass platform features up to 4 drive bays for SATA
>  storage accessible from the front and fully hot-pluggable. The
>  backplane is usually connected directly to Intel C620 PCH (aka
>  Lewisburg).
> 
>  It would be nice to have information about the currently attached
>  devices (model and serial number) available in BMC inventory but what
>  are the ways to get this information?
> 
> Intel systems only get drive mdl/sn from NVMe devices that provide that
> information via MCTP over SMBus. SAS/SATA drives, to my current knowledge, don't
> supply this info in that mode.

Indeed, NVMe provides this additional side-channel over SMBus
specifically for management, alas nothing like that is present in
SAS/SATA standards.

> The insertion/removal events are also managed from the BMC via I2C to a FPGA
> solution residing on the Hot Swap Backplane. The FPGA provides registers that
> allow the BMC to query the PRSTn/IFDETn pins.

I can also imagine I2C GPIO expanders doing the job, yes, this seems
to be reasonably straightforward.

>  Is it possible there's some additional module in the all-mighty ME
>  that can supply BMC with the current state of PCH SATA controller? Or
>  is there some other sensible mechanism other than talking to UEFI on
>  startup (which would mean BMC is showing stale and thus misleading
>  data till the next reboot)?
> 
>  Even though the question is quite specific we'd appreciate any related
>  insights on the topic; there must be some side-channels to RAID
>  controllers and such for BMC to be obtaining essential information but
>  so far I wasn't able to find any documentation about this.
> 
> RAID solutions are outside of scope for the Intel BMC.

Intel VROC too? Why? We'd be willing to contribute some development
effort into bringing RAID monitoring and management to OpenBMC,
wouldn't the community benefit from that? Many other vendors currently
offer this feature, why shouldn't OpenBMC? The problem seems to be
with the documentation availability; can you please tell where the
relevant hardware and protocols are described?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
