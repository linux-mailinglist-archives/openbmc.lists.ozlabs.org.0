Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD65782C8
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 14:52:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmhgw62pvz3bkd
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 22:52:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mfwU1MrX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mfwU1MrX;
	dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmhgS37H9z302d
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 22:52:03 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id m10so4713761qvu.4
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q4uXCnri7wkZqApftIfl++Q32cRWGI8+outdITbrGHc=;
        b=mfwU1MrXxoUE9k8PRf1ghXzDyHkUuq7wH5bE/Iie7YAGNDnffmXTNlGee4El/zADOu
         HMaXGJvyJ4tN8bAs62/cQCCuQh+PS4OunuuB2EHqlPamTfb5UgqWOdd6xsR4pI0GM9sh
         L+AbQgyT7FLKBR91CL9Oirc5o/jsRWGmkFMbh1xZfekjrM1sVJUtoaxLLSaxs6UqxKVq
         F4jfK19USZ8Pwnu/ZtdI/2Snfw3HByfa8T4ncy7mM2pjSCIQYlVTAZsHWcdEbEYvmmUR
         MD5N/iatkvSBkw+x80i1wtg60ZEQmegYiLYMoT9ft7RE9dKKjc7kHjzN7Ci5IQ3YzeMI
         /vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=Q4uXCnri7wkZqApftIfl++Q32cRWGI8+outdITbrGHc=;
        b=FFXnNYe1gtYIf1RiEbPE+YWAQIg67vX7E4uNnmLkXW++MSoQVSetcI6omgxZlSoXvM
         r9cLvTwsKrD/aBU23F5JrgQHuLverY/4NAD0Ew8h/qO2wOVr+Es6O7Axp7h3aYzU+syq
         xMPnZywclWBsLQfh1ur+ia1V6axFilCoFm+HBuNzijn8K9MK9L/34a8QB9y5NaovV0yS
         +fqyqZGcmPIvEfgBATGTwOHgII85luiE7XcngeXUQxV+A0EaPmopY8nl6kMukLaQnDQO
         Z3EEhOQzKZ3SbC6Bhap7AuM80AiBAgC7cqM+HM8rQ/bJw+aowgdfo6J1utmO85+PM890
         hyvA==
X-Gm-Message-State: AJIora/LIWUN09ks7RXW5wZYnO9opyZQ+NkVicn/MXIyy1yBR6iDBE8i
	f74E59MN0iEyT1HYthisaQ==
X-Google-Smtp-Source: AGRyM1vse5BUOdsqfBrG9qrwaKVpJOQ5Sqbh1uVY6hhCSsFT/ffcNioVZq5UoaiRMiyDIrZlg2oWwA==
X-Received: by 2002:a05:6214:410a:b0:473:38b7:e09c with SMTP id kc10-20020a056214410a00b0047338b7e09cmr21024496qvb.26.1658148717955;
        Mon, 18 Jul 2022 05:51:57 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id y17-20020a05620a25d100b006b46a78bc0fsm10984027qko.118.2022.07.18.05.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 05:51:57 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:5961:4f8c:df98:38fc])
	by serve.minyard.net (Postfix) with ESMTPSA id 2C0A61800BB;
	Mon, 18 Jul 2022 12:51:56 +0000 (UTC)
Date: Mon, 18 Jul 2022 07:51:55 -0500
From: Corey Minyard <minyard@acm.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 0/2] char: ipmi: kcs: add Arbel NPCM8XX support
Message-ID: <20220718125155.GA40038@minyard.net>
References: <20220717121124.154734-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717121124.154734-1-tmaimon77@gmail.com>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openipmi-developer@lists.sourceforge.net, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jul 17, 2022 at 03:11:22PM +0300, Tomer Maimon wrote:
> This patch set adds Arbel NPCM8XX Keyboard Controller Style (KCS) support to 
> KCS NPCM driver.
> 
> The NPCM KCS driver tested on NPCM845 evaluation board.

This seems reasonable, I've pulled it into my tree.  If anyone has any
issues with this, please respond.

-corey

> 
> Tomer Maimon (2):
>   dt-bindings: ipmi: Add npcm845 compatible
>   char: ipmi: modify NPCM KCS configuration
> 
>  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 5 +++--
>  drivers/char/ipmi/Kconfig                                  | 6 +++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> -- 
> 2.33.0
> 
