Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABA8520AAD
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 03:29:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky0nm3JHsz3bwX
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:29:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Lg+rn8bt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Lg+rn8bt; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky0nM3qnxz2xF8
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 11:29:10 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id i5so21665114wrc.13
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 18:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZq2gU+7souRVLVl87Qih/I+EQONYEUjxSFlohmQke4=;
 b=Lg+rn8btUFXRBzeZdVzYac8XAXUjtwRyoEOSfl/BjSsLHWp1tOw/ahPBxVwG1wr0w7
 OQs7gquHom6c0aDulIYLRYr204ti+tbM4w+xI0X+5S+dmZBBMFW849V97HXFOeBOEjdS
 r/BurXvixsyl65tQ3R3qKYozzZ5niiO0YsRJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZq2gU+7souRVLVl87Qih/I+EQONYEUjxSFlohmQke4=;
 b=LK7Jb/XfGDfboQrK3lc2UFfJFDV6aOS+H+QbL1l5UW3DvKKsqN06TrUPDmSBUTXjWW
 gmWoTUY3f3tbSSIyglznytuIphOwIfQlojZzedAs9f62SbGCDzz0PJ0jPTX8snzH/KOq
 +KFlDcQqFGKTYGxRdIQCdCJS3S/cDKtU6YbtowkPTLFLQhqseo0Q9E+RYx/OTB0YhgEG
 6M7uKiJhbDrA8N2CZidcCQFXz4F0V3rrLQNYaLMBFRy/lQTxx9vFZIc5hGsBL4OnWSVu
 F+gQ/0wVt/trASG7mHOlMkL4gmKZEBTGyFTU7yW1Saq04dFiRZS25lA0S3XhZYhKqEqs
 4yJw==
X-Gm-Message-State: AOAM530shsU7ARnOsatMeHFQcKpRQTt70qXz2InAL20pQsjHczTIuTVR
 ghfQZwgsiGXvrRNKju/o63EQn9RjMHxpR2UGk+Y=
X-Google-Smtp-Source: ABdhPJyHY1ajQCk9EHifJmMUZtYfSrP//0rS/NVyCd90QoTF2g6heNQumAG4OrFocUxkkIsTYmkK3Mrjlje5rD5TjkY=
X-Received: by 2002:a5d:6ac4:0:b0:20a:dd04:81da with SMTP id
 u4-20020a5d6ac4000000b0020add0481damr15847035wrw.705.1652146144888; Mon, 09
 May 2022 18:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <CALNFmy39ph1pQoVavHZbdTCACLMxf38f86WKH-CbPbrHDoomNg@mail.gmail.com>
In-Reply-To: <CALNFmy39ph1pQoVavHZbdTCACLMxf38f86WKH-CbPbrHDoomNg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 May 2022 01:28:52 +0000
Message-ID: <CACPK8XdU5C-_TdFDDxobOL4-jkwPZsjHts5hv2Jx2r1n3PuY6w@mail.gmail.com>
Subject: Re: Aspeed platforms: MAC address provisioning
To: Patrick Rudolph <patrick.rudolph@9elements.com>
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

On Fri, 6 May 2022 at 06:04, Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> Hi,
> I'm looking for the generic "OpenBMC way" of provisioning the BMC MAC
> address on platforms with an integrated NIC. In the past there has
> been the u-boot "u-boot-initial-env" target to create an environment,
> but it's no longer used on u-boot-common-aspeed-sdk_2019.04.

I wasn't aware of this. One option you have is to add this
functionality to the new SDK.

>
> What's the default/common/preferred way of provisioning an unique MAC
> address in production? Should it be stored in an I2C EEPROM or should
> the u-boot env be created from the running system?

Take a look at first-boot-set-mac.

AFAIK there's code that populates the Inventory with the MAC addresses
from the VPD.

There's another service, first-boot-set-mac, that reads the inventory
and configures the network service with the mac addresses. This
persists the mac address in the network configuration (eg
/etc/systemd/network/00-bmc-eth0.network) and optionally calls
fw_setenv to configure the u-boot environment:

 https://github.com/openbmc/phosphor-networkd/blob/master/src/ethernet_interface.cpp#L995

 https://github.com/openbmc/phosphor-networkd/blob/master/src/ethernet_interface.cpp#L1206

A design goal was to not have to read the I2C EEPROM and parse the VPD
in u-boot, hence doing it on first boot.

Cheers,

Joel
