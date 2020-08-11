Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B36241AAD
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 13:55:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQrqt3x9SzDqT8
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 21:55:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z5aHQm37; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQrq624rwzDqMb
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 21:54:38 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id v12so13155635ljc.10
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tuAxxjSPgoSZM8oS60ADXS0tGvrqFM4fcsw0fTjVWo0=;
 b=Z5aHQm37pfDuOotGF6iYQslcMPgtWwF6XsfGwAUa4EftSW89c6SQ45AwuoxU4d7i2N
 hWRt8vqM31X94ncifXpw9mxmxybWYTc+jMN1O/s10PAj43XAwHgQ9uka2U/789wt8utr
 O35Bk87Imc8ZgMptEugVTIIwLXSMAJs4FoaM3DZTFzNA9XQD+9u7IN+kzaHrkRoZNuQE
 4tS/f4ack0rgBbqsAo81HywGfJGaxJvRCeH0AMw3pUrViiODU7pyz0L9PqRUhNFrASGa
 1ZhhOz88iBVMvze7dM/iTX86/1A2E7gl0Ot0iqf+pPLGuVd+FMZc7h3My4V2QvvUH9qU
 Bsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tuAxxjSPgoSZM8oS60ADXS0tGvrqFM4fcsw0fTjVWo0=;
 b=F7fCfVB8qlYPdokzR7NXCHpABil8oUia4f11+4jCO2JhhTiPRzS/euQGDmTBrkV8+V
 l6YSlLUfKlAsXq0D0xisYSZB0AO3/oMyGoODaTOW8Q0NftmbUNliXKXRil4o5v0p5HtY
 u15Pt20eQcMNwtdQZr/FSuN9otfx0g/dQBvRXfXsyGbQXUp448SSlwppefwf5bxOCmjU
 smYk56zypMB6gCUBi+a7NmJf6lB1qwRLHWKjCcoXh2jAsyJyeJdpYlaeutljuoYjXnU3
 h3VI3dBOUGaFs2nIDL9c4VZ+eZFt/cbcavV1tt08WBsY+BAdD34mewmiM6ezhlUVKSK4
 aaqw==
X-Gm-Message-State: AOAM5330rR4LJc9TbY18bj75nz9KxeZARSbpb6oB1h55ZNT5MpxHBHrJ
 z7MOtBGj3xQ+xhGf1fRMU7o=
X-Google-Smtp-Source: ABdhPJx/WRok5o4mNjfTlzMgiIY3+pJ0wVSwVhPetlAs6qb4rrDIXiREmd7gAjYKDZcf0DV4+rhw7w==
X-Received: by 2002:a2e:8197:: with SMTP id e23mr3126828ljg.406.1597146873962; 
 Tue, 11 Aug 2020 04:54:33 -0700 (PDT)
Received: from gmail.com (109-252-93-52.nat.spd-mgts.ru. [109.252.93.52])
 by smtp.gmail.com with ESMTPSA id y1sm12652368lfb.45.2020.08.11.04.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 04:54:33 -0700 (PDT)
Date: Tue, 11 Aug 2020 14:55:09 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: The Power9 host booting problem with OpenBMC kernel 5.7.x
Message-ID: <20200811115509.mfztusiuo5udp4i4@gmail.com>
References: <20200810184446.GA14652@bbwork.lan>
 <CACPK8XdFNpsyzgY8n_3VTxS-Z88bT1pBEXPO+w=dWE6G1fj3jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XdFNpsyzgY8n_3VTxS-Z88bT1pBEXPO+w=dWE6G1fj3jA@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>,
 Eddie James <eajames@linux.ibm.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 11, 2020 at 06:12:30AM +0000, Joel Stanley wrote:
> On Mon, 10 Aug 2020 at 18:48, Alexander A. Filippov
> <a.filippov@yadro.com> wrote:
> >
> > Since the kernel in OpenBMC was updated to 5.7.x we have a problem with the P9
> > hosts booting.
> > On host with one Power9 CPU the failure happens during the Petitboot is trying
> > to initialize the network and it leads to host restarts.
> > On host with two Power9 CPU the same failure happens during OS booting. It
> > increases boot time, but at the end the host OS is completely started.
> 
> Oh no. I have spent some time testing the 5.7 tree primarily on
> Tacoma, our ast2600/p9 platform. We saw some strange systemd failures,
> where services such as udevd and journald would be killed by systemd's
> watchdog functionality. I did some preliminary debugging but didn't
> find a root cause.
> 
> I'll fire up a romulus and see if it reproduces.
> 
> My guess is it's something to do with the timekeeping, irq or rcu
> code. All areas of complexity!
> 

We had similar behaviour in P8 when tried to use ColdFire FSI:
https://github.com/openbmc/openbmc/issues/3433

In this issue, htop shows 100% load of one CPU on the host and it is not an OS
task. Looks like FSI doesn't stop working and fully loads one core.

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
