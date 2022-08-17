Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D325967A7
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 05:07:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6tHC5h94z3bsK
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 13:07:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CJc5UPhs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CJc5UPhs;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6tGr0zqRz2xHw
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 13:07:15 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso316689wmb.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 20:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=zDTL+kUX5fx414q/QBwIPLzV+/9CrZKRvj8AMk7fNQc=;
        b=CJc5UPhs5xFmXL0feCw7GfUzQi4yadiv66HBKviHBEKggz9WzEw416gPlgkxYr19h1
         WzEb/7LxRnRCwp94mrqw2TuVvJ+Y/YCaebLKgSphn6xQdMYIPrDSrnjBdDz/RdJNw/wd
         DavytKVTVrfweopA4/e/HtD/36r2yVBCYIigg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=zDTL+kUX5fx414q/QBwIPLzV+/9CrZKRvj8AMk7fNQc=;
        b=WchFTULdrzRnsAdRAUIfUNE1kofHvJUmFJ4j9ZRBE8SlOAyMUfmpRQpcOxC0NTiklg
         5tWLA+VvtQTvhjI2jBKz+zxHYW5i0+KUc+IfWTEK3daX9wWNg3VMfBpIbsrqiWmTlKBm
         sN0fq27MntIQi4Vf/Lgf/SV+BtKfGgHJm0gZGBKZkmvdmaWJt9h9z96IcWvAQKZ2Tl0n
         g0dBAzb0HoBE7GO2C/kT+TCnTzN376xDXTtyeNH9IK2DbFeDtStBLl02oekVeAT5qa0j
         8UXfqNphm8DkC6H/A7THNlbrSdfL7s6Qb2NxLs9dYAm/3d0vlwEabYaCrs4Ku70m3ITE
         UlrA==
X-Gm-Message-State: ACgBeo2KzMU80nTmxhK06w40Qpcmwd2+EHo8E84rlOd+Knqwg1anVYRL
	wGNkbahEDhh0N9y9MO+rT+6QLdKEFi+o2L1Upj4=
X-Google-Smtp-Source: AA6agR7VC9JDDgv1doD2k9gjLUG2vQvZJLWtsgzy1I8hlTJhzLnfc3CH/a0jo0nh/drF0TnMkw2EdZcYcIUjqU6KpBg=
X-Received: by 2002:a05:600c:5010:b0:3a6:804:5b08 with SMTP id
 n16-20020a05600c501000b003a608045b08mr715619wmr.10.1660705629756; Tue, 16 Aug
 2022 20:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220817015949.16946-1-joel@jms.id.au> <20220817015949.16946-2-joel@jms.id.au>
 <f4a037ce-c775-df5a-171c-0752dc65dcc8@linux.microsoft.com>
In-Reply-To: <f4a037ce-c775-df5a-171c-0752dc65dcc8@linux.microsoft.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Aug 2022 03:06:57 +0000
Message-ID: <CACPK8XfDuvY0pT-gOBCkh-BsQ6m+SvXNu+tm8LQruKKTrDjQrg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] aspeed/sdram: Use
 device tree to configure ECC
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
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
Cc: Dylan Hung <dylan_hung@aspeedtech.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 17 Aug 2022 at 03:04, Dhananjay Phadke
<dphadke@linux.microsoft.com> wrote:
>
> On 8/16/2022 6:59 PM, Joel Stanley wrote:
> > Instead of configuring ECC based on the build config, use a device tree
> > property to selectively enable ECC at runtime.
> >
> > There are two properties:
> >
> >    aspeed,ecc-enabled;
> >    aspeed,ecc-size = "512";
> >
> > The enabled property is a boolean that enables ECC if it is present.
> >
> > The size is the number of MB that should be covered by ECC. Setting it
> > to zero, or omitting it, defaults the ECC size to "auto detect".
>
> What's the use case for enabling ECC only on part of the DRAM or not
> using max possible DRAM space?

I don't know. I have wondered the same, it's a good question for aspeed.

The objective of this patchset is to support the existing options with
runtime configuration, I think any change in functionality is a
separate issue.

> Couldn't this be just simple update based on what DTS memory node has?
>
> /* Update available size */
> info->info.size = (((info->info.size / 9) * 8) >> 20) << 20;
>
> Regards,
> Dhananjay
