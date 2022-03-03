Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF44CBADB
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 10:57:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8RHd4ydtz3c2B
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 20:57:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ikNtmJ68;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ikNtmJ68; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8RHF0BpBz3bk2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 20:57:26 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id z66so3458835qke.10
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 01:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gafxsigEjvq3LkS14UT+dFcvWi6eNbUfAOVcgjNi5gs=;
 b=ikNtmJ68I53uv6GBbSM2L34Is4MAlOTBwCYx5ls0EivV50VLGOcg1T5GrUDMS+6O4d
 vzqzimGGBCxxfy0b+I3iKD/EQa7OTzJcnTzis/Phd0BUOOsTe9/6TRBsNd0cjawqV2w/
 te7eF26utJ5yyzstQ/hSoTbk42Fdf8CQYneLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gafxsigEjvq3LkS14UT+dFcvWi6eNbUfAOVcgjNi5gs=;
 b=JQbsFUt4Dqy9FzvOMOBpYzrWVopgLnJEsWrvLI7zGmc3Ofhjz1Ea+ikYn78dh20KVO
 Y3S86TjEtTR3ZUJesmTntvfjR8cRaqpdjPgRXaCVTNVoZcYdSvI3z7+bDDpUNi6v9G1d
 iODPfv89XKnh851RvfM+z2Y5rTKrxBHBkJ9oIVIiIj1Gc26NzRCnN+QllpgvHA5e6dcV
 rZ9VGIVSKe2nz463kjHY9mdAsRnAdfDr4fKYbZKpXmmhj59i29TkByu2Scu+XwJcp55S
 Fvk6Y1SM8DHo1seFpfffM9Fhz+IjkUiW3EW0eXabzG0r3IDEUz4OEc4BOY/fB97l+lhj
 VjXA==
X-Gm-Message-State: AOAM530+fyyyxgimPfROfmfH7zdy/eJZhZW1q5iBfjfYQ6OCMSTkZeKv
 yPzJGtJkLp0BVhHAwm4GdA9DQBxFaP3QW4uDMvw=
X-Google-Smtp-Source: ABdhPJxfmLK0csn6uRrprnwcgTS41wbABhufnYmIBchb+iFYwoD6emuXp+41ArJna7exLBBm/kBjnIzkS/Y3quPa1Pk=
X-Received: by 2002:a05:620a:2fc:b0:649:a4e:c430 with SMTP id
 a28-20020a05620a02fc00b006490a4ec430mr18704469qko.347.1646301444139; Thu, 03
 Mar 2022 01:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <1cbb3001-f7ba-50bf-7184-3aec6342e405@kaod.org>
 <CACPK8XftWG2LYu6mPgxjUEBUkeF2nDjC_9C_+Yr56B94CyeAug@mail.gmail.com>
 <04785138-fa0d-568e-b47b-6d0c51cdc426@kaod.org>
In-Reply-To: <04785138-fa0d-568e-b47b-6d0c51cdc426@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Mar 2022 09:57:12 +0000
Message-ID: <CACPK8XdzvASa9FJ++xJAf+Sp-uwfgAd1c3yt57HetBwe9yOOnA@mail.gmail.com>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 John Wang <wangzq.jn@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 3 Mar 2022 at 09:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > Oh no! A failure!
> >
> > I ran it again and it succeeded. Both tests were with random data. I
> > wrote to it a third time, this time restoring the original file, and
> > it succeeded.
>
> and did you reboot ? :)
>

Yes. And I've re-flashed cs0 a few times running at 50MHz without issue.
