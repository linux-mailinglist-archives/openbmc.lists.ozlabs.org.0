Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E7170B43
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 23:12:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SVRL0zzhzDqXW
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 09:12:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kpd/2k73; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SVQg6BPVzDqVc
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 09:12:09 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id ea1so584181qvb.7
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 14:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2UyeR9foQ5WEH2qzBp0+dd+aDDWyJ0ojCpgxv6NJSm4=;
 b=kpd/2k73Q4+w8l9geSDQcuQAbmw2dgrQ5JGFtBANnLxfA9fpjLxFdT0IrpbRJpi2yw
 ex7b9EbthY9XOUgyyHLAyoUfezL42ath8nbJpefhpV2ZdyJ6LVD0wuRchLGs7kmFDvdz
 gZFtS7OZcDeH4zQ52akUzYFMR3V6w0AqLhKko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2UyeR9foQ5WEH2qzBp0+dd+aDDWyJ0ojCpgxv6NJSm4=;
 b=irLsN5VfATAYZJHzai6x3ShiscBOR942eBy2D5+vrUVKo10oSsWnAx/wXu4f8vtER8
 PkYyo6B0+D5JLEWeMptYGhrq7y4dGynZz7Oy7ZLHwT18GnynKXxg+aShaRVM1taSEhpY
 Sfo3LmE2hYo4Wwd+V+9YAThQDiE81lCbxyhND+vKDi8Wad5TiB4HCDcfvWCMKHtsxRt7
 KMxOf1gdMUVS1rEQVWVP+L1NxgfyGSkpE1O4PKgs4lJ21kQDWV2wGVxt+QUB6kxt4XnG
 53YfT9P/e/w7hZaQ6TjolgUVqHg46WzYtODQR/QoEUV7uI7VgqIsK6nQ5uodcEUK3IQK
 FkoQ==
X-Gm-Message-State: APjAAAWB969O7sMkadDh28xqgi3V7tP77HBVfQXLgFPgNFy83CPppA8N
 nPEtBxIPqU4PeyynP0iv3PCW7HPlHB97dodExVtCVw==
X-Google-Smtp-Source: APXvYqxM+8xI4H5Wqkx7bcXVyEPiP037dxuHP/rUtb447RurfCxS0VUQz4nftaA6X5nc5XxqDHPBMJGrgQ67INVmDDE=
X-Received: by 2002:ad4:55ec:: with SMTP id bu12mr1448691qvb.107.1582755125247; 
 Wed, 26 Feb 2020 14:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20200211234950.4010-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf5qcyBv3yZ7BRu-v4PGmqsvbXnMqoQEhsPyq_JC-wUZQ@mail.gmail.com>
 <1564f185-93e8-9ad0-9bfa-16f2a9af814e@linux.intel.com>
In-Reply-To: <1564f185-93e8-9ad0-9bfa-16f2a9af814e@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Feb 2020 22:11:53 +0000
Message-ID: <CACPK8XfztgpY-D1rcFrELU+hS28H3wpFR02MKfavtpW4RP6WLA@mail.gmail.com>
Subject: Re: [PATCH dev-5.4] hwmon: peci: change label strings to reflect
 natural numbers
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 26 Feb 2020 at 22:07, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Joel,
>
> On 2/26/2020 1:54 PM, Joel Stanley wrote:
> > On Tue, 11 Feb 2020 at 23:47, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >>
> >> This commit changes label strings to reflect user friendly natural
> >> numbers like 'Core 1' instead of 'Core 0' and 'DIMM A1' instead of
> >> 'DIMM A0'.
> >>
> >> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> >> ---
> >>   drivers/hwmon/peci-cputemp.c  | 2 +-
> >>   drivers/hwmon/peci-dimmtemp.c | 2 +-
> >>   2 files changed, 2 insertions(+), 2 deletions(-)
> >>   mode change 100644 => 100755 drivers/hwmon/peci-cputemp.c
> >>   mode change 100644 => 100755 drivers/hwmon/peci-dimmtemp.c
> >
> > I don't think this was intended.
> >
> > I fixed it up for you, but please try to figure out what went wrong so
> > it doesn't happen in the future.
>
> It happened while upstreaming it. I changed the static label string
> table as a dynamic table to address review comments, and I missed
> this mismatch. My bad. It'll be fixed in the next upstreaming spin.

I was just referring to the files becoming executable :)

I am surprised by the code that makes string allocation dynamic. As
you know the number of strings (one per sensor), and you're allocating
a fixed size for each string, I would suggest you're better off
allocating all of the strings at once.

Regardless, I suggest you change the calls to snprintf, as if a
machine has more than 999 DIMMs it will overflow the string :)

Cheers,

Joel
