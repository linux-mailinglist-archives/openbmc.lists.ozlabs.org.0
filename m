Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941324B1BF7
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:11:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvxv81CLzz3bYv
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:11:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=l7XOgLXM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=l7XOgLXM; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxtn1Mvmz2xXs
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 13:11:27 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id o10so6999074qkg.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 18:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yzeX9vjTaUtos6RaViCr8dGhbEDTq6+jI0wa1wR7KFU=;
 b=l7XOgLXMMiHD6o2WnmN2tVmu451rgMkWAzkEWrNKHS3Yj2yQIgqNgN32phr0cmAH+9
 6zgTHXyfG+0JfDjz/VfHLi5RTs76AutQdnUupOPP/Q4LzpTvYGehEOeZ0QIrwXqmTvIo
 YZBjSzdGCQV9eaBrW6oiLJi2otRsvAUZjh4Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzeX9vjTaUtos6RaViCr8dGhbEDTq6+jI0wa1wR7KFU=;
 b=5kOR20+03QKXU6Ust283LE4SC9wwaTM2pq0iNug2tQu4NqiFH6btscDXwsXviKPx/z
 JR7tq1v9Qqw3QI2r3k/XUAKwnI3lOvCYLf5yf2uwh+LuJ9jFqZ7f9RwTv0boOKmgcCA2
 cUfJv+BEccAdYY4+DdBRm9fGqeGMDFP9tfQMZb0dTTHt7ZkPnFtRcpWD4NvyBhELT/MY
 gKK4x1xmN70naDbXwdnQHmYIzOOigEnUx53kFg3Iptl6DRQN08vx8xsbzgCXV2odXCcf
 N/V4GwXt0VlZmxwy3oLUz8bGzSzbmqOHt4Y2xHPIpvRZPVcRfcZyqqrDeAHbLc5EfyPp
 +ELw==
X-Gm-Message-State: AOAM531U8mxraJOEfQRMDZ/4l7+ElLiA0hqudcxTrCQahjWzOCzvzRTZ
 viQYIUzW5LlHBYGCzIdNKqR9BZx2qlQnHAjoG5w=
X-Google-Smtp-Source: ABdhPJyLKq7WwY8HJaQAZzBdtynZN2fhfsV+jyYTtgjPC5sPqRBFzKSeKG2QaLvkwqKTVT6yOOmn3nSyPZPkjLyfvFs=
X-Received: by 2002:a37:b0c5:: with SMTP id z188mr5204439qke.165.1644545484076; 
 Thu, 10 Feb 2022 18:11:24 -0800 (PST)
MIME-Version: 1.0
References: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <CACPK8XfwLCxNVLfVa=FYw0TVXPE_Kj8+p7=6Svw_O10x22Jf1g@mail.gmail.com>
 <TYZPR06MB4015B2ADBBB832D151F4B433FC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <HK0PR06MB3779776EED65721E481F8676912E9@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB3779776EED65721E481F8676912E9@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Feb 2022 02:11:12 +0000
Message-ID: <CACPK8XfM+jNJ6bsABCPgGYWDg7bczjKKFjmA=Lzbi166nSOjbw@mail.gmail.com>
Subject: Re: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>, Zev Weiss <zweiss@equinix.com>
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
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Dylan Hung <dylan_hung@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 9 Feb 2022 at 02:29, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
> > I would like to see fewer trees.
> >
> > In the short term, one option is we put all of the openbmc patches in the SDK,
> > and continue using that for openbmc. Would this work for aspeed?
>
> Yes.
> Are we going to do this through PRs as usual?

Works for me. I've sent two PRs with the obvious changes:

 https://github.com/AspeedTech-BMC/u-boot/pull/9

 https://github.com/AspeedTech-BMC/u-boot/pull/8

We need to work out how to arrange the defconfigs. Would you like to
see openbmc using one of the defconfigs you maintain, or should we
keep a seperate one?

configs/evb-ast2600-cot_defconfig
configs/evb-ast2600_defconfig
configs/evb-ast2600-ecc_defconfig
configs/evb-ast2600-emmc_defconfig
configs/evb-ast2600-spl_defconfig
configs/evb-ast2600-spl-ecc_defconfig
configs/evb-ast2600-spl-ncsi_defconfig
configs/evb-ast2600-spl-tiny_defconfig

The openbmc ones are here:

configs/ast2600_openbmc_defconfig
configs/ast2600_openbmc_spl_defconfig
configs/ast2600_openbmc_spl_emmc_defconfig

The openbmc and openbmc_spl defconfigs are legacy and not tested by
myself. I actively maintain the openbmc_spl_emmc configuration as it
supports the rainier/everest

> > In the medium term, we should start using upstream releases. There may still
> > be some downstream code (as we have for Linux in our dev branches), but this
> > will go to zero over time.
>
> Agree.
> We are also working on upstreaming fundamental drivers to U-Boot mainline.
> Once it is sufficient for most frequently used booting paths, Aspeed will start using it.

Excellent. Thank you for your work in this area.

Cheers,

Joel
