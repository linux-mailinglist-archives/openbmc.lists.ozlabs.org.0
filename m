Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BF338254
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:31:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRZ65sD3z3bcs
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:31:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nesLpw1f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nesLpw1f; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRYs3Pz4z2xxt
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:30:56 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id l4so22705103qkl.0
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QV0nSjA2HCF0nyhhD6GRSbmdenKZ5e1eqH/d40mJkSs=;
 b=nesLpw1fSD2QrBdUD9MlDSHerKWLSvRGs/KFRtOa95iDTA+xTARbVIsO343GVAlQtx
 GbExX7soPOJ4QZGgQy3sZ4f3vjQLDFSZbvhOwclVfLnNPdYwCz1WO0W+2Fj5wcTzttEe
 RSTWuy5RSAowJJRWVYZq+a/JRxWl1NbzBChgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QV0nSjA2HCF0nyhhD6GRSbmdenKZ5e1eqH/d40mJkSs=;
 b=AcIl2qj5ISJpTNztooc5m4VvZB36eT/+gHP63P4Eoh9JUtaE6GwjJkbc642VcVSBFU
 dWoU/dUGQlCXqSqA7YQx0mm7IdI5lHEk3B5Vw1xktCZXX2eELj12M96aTPdwz4sOegfZ
 GYZulPM07d+VtUatRMefdFuJ+snYU7OOeh/qMHAMR3/MAbB+4Gt4rU4x1G+XAIhInU6q
 IFJ4qSd9hBN1zdULOoL4fN+5X2+9GxFFLe58X+EXwKfq/JAWBm7H7b8yi+4qqEssdlae
 nd41O3kmHejwvRYxsZWeIOxbUD+FItygf/RBRvCxtU/uc1RUIbT2oa/uN6ouzWT1cTHg
 sJIQ==
X-Gm-Message-State: AOAM532criZIpcmcs2PdxgZ87H0zJjSE1aBDcsZdQO8xeR6qItJKvgSe
 3VSRDuIvgkTkJwKjxaIIvzTBmc7qwT/2EQnYhA4=
X-Google-Smtp-Source: ABdhPJxN8bpyXWZQlqs3hcIvBKKlnYL/6PluqaxshZ+uUrIhEIbRAbBf2Bxx03r7sF6I3VU9uQRC8b80eIAEiwWenA0=
X-Received: by 2002:a05:620a:4055:: with SMTP id
 i21mr10355565qko.55.1615509054134; 
 Thu, 11 Mar 2021 16:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
 <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
 <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
In-Reply-To: <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:30:42 +0000
Message-ID: <CACPK8XfBu5_2xs_Eu=OtShNFQnAQ+Tc1Q1qM7Qgcaggd-yLumQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
To: Milton Miller II <miltonm@us.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 12 Mar 2021 at 00:21, Milton Miller II <miltonm@us.ibm.com> wrote:
>
>
>
> -----"openbmc" <openbmc-bounces+miltonm=us.ibm.com@lists.ozlabs.org> wrote: -----
>
> >To: Eddie James <eajames@linux.ibm.com>
> >From: Joel Stanley
> >Sent by: "openbmc"
> >Date: 03/11/2021 06:09PM
> >Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> >Subject: [EXTERNAL] Re: [PATCH linux dev-5.10 06/35] ARM: dts:
> >aspeed: rainier: Add leds that are off PCA9552
> >
> >On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com>
> >wrote:
> >>
> >> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> >>
> >> These LEDs are on the fans and are connected via a
> >> pca9551 i2c expander
> >
> >This change doesn't make sense. The pca9551 is an i2c LED expander,
> >so
> >we don't need to expose the pins as GPIOs and then attach a gpio-leds
> >driver to them. We should instead simply configure the pca955x driver
> >to drive the LEDs as LEDs.
>
> I'll refresh your memory on why we have been doing this in our
> devie trees and then let you consider if this is desired or not.
>
> The led system insistes on creating a compact map (no holes) (as
> does the reset subsystem).
>
> However, this means the relative led number for a pin changes
> as the prior pins change from gpio to led configuration.
>
> For example if pins 2 and 7 are leds, they become leds 0 and 1.
> Changing pin 5 to also be an led means that pin 7 is now led 2
> not led 1 on the led subsystem.

Thanks for the rationale reminder.

Are these led numbers important to userspace, or does the renumbering
affect device tree changes only?
