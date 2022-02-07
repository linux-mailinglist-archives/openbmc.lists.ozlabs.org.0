Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A594AB3C3
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 07:03:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsbDR5t2Bz30NB
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:03:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QYTTNnyl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QYTTNnyl; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsbD445SLz2xXV
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:03:14 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id a28so3442679qvb.10
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZkL3bOaxrucylVrF7iVrDzDGzYaY4PmoTbZqUjvgCw=;
 b=QYTTNnyl+E+4FkLrSZsdk2A0QCaSiWadP2bdizN3wbLMKuBlIv7n134+ZxbX+sT6Lh
 4UnTJKjqbK52Gvb6v+FtJZeDF6Kl+9f5bOifFdUyJUjmyrV6ZAcX1wSxlbLrVrduoFFF
 2gh5UBRFmZ+T8guGmXNz4kKfXUVTD4RelMKlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZkL3bOaxrucylVrF7iVrDzDGzYaY4PmoTbZqUjvgCw=;
 b=WUjVOuMMHhGd39myFHCVskzrzS9hfE2C+AjYdUDuA2HU5i4EtE8LrCQnJyGahNKCxp
 XE8yN9dl3MY8rk9HioOLDX4geAO1KoHJ7PZk4ojJnPvAo5TU+WP6Ui5x4qelQJlUB2Ek
 0qphpDudPYsb6WmTFRqf/V/ikixaxkhMLh8R5vneTEr8BYTJHinHOOrOYGNhiE3uk7Ud
 l+DrNTL8qn9X5jPof82YTHJpFLNG55/cQC7ilVDmRJ5vIpav5ObrmU+UU3IVtVOrurZm
 x1BBWkqqdWlh58htCkTt2zIcQkgnrQSbva06jy1zMr5joFdDyN8tBajTwMvMvqM4pLi3
 JmSA==
X-Gm-Message-State: AOAM5310V3hCdlDoAuqABii9QLwn5+e6fza/qCb3R4TBSRrxt+pJMIaw
 n6wswwqQOjhw44m3esIkskbr2snzUHAo9+Z7+DE=
X-Google-Smtp-Source: ABdhPJxYSLsNu1xb+ESmidKri/KryxQ8/czdf5hm8THcklfLzJe54jZIOGUCXp3REsoZsyOjIRrNf55SazNcseNyfcA=
X-Received: by 2002:a05:6214:c29:: with SMTP id
 a9mr2056876qvd.130.1644213790958; 
 Sun, 06 Feb 2022 22:03:10 -0800 (PST)
MIME-Version: 1.0
References: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
In-Reply-To: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Feb 2022 06:02:59 +0000
Message-ID: <CACPK8XfwLCxNVLfVa=FYw0TVXPE_Kj8+p7=6Svw_O10x22Jf1g@mail.gmail.com>
Subject: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
To: Jamin Lin <jamin_lin@aspeedtech.com>
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jamin,

On Mon, 7 Feb 2022 at 02:26, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> Hi Joel and OpenBMC team,
>
>
>
> This patch was applied to u-boot/master, http://patchwork.ozlabs.org/project/uboot/patch/20220119082323.4567-2-jamin_lin@aspeedtech.com/
>
> Commit   2a4b0d5890deb0c973f8db7bb03adad96aff1050
>
> https://github.com/u-boot/u-boot/commit/2a4b0d5890deb0c973f8db7bb03adad96aff1050
>
> Could you please help to backport the patch to the openbmc/u-boot tree?

Sure, I can do that.

I'd like to start a discussion about the u-boot trees and how we
maintain them. Currently we have:

 - upstream; partial 2600 support
 - aspeed-master-v2019.04, SDK tree maintained by ASPEED
 - v2019.04-aspeed-openbmc, openbmc maintained by Joel. Based on SDK tree

In the past I was putting code in the openbmc tree so we could use it
for bringup, and trying to send pull requests to the SDK tree.

Now you're sending patches upstream (excellent!) and sending me
requests to merge into the openbmc tree.

I would like to see fewer trees.

In the short term, one option is we put all of the openbmc patches in
the SDK, and continue using that for openbmc. Would this work for
aspeed?

In the medium term, we should start using upstream releases. There may
still be some downstream code (as we have for Linux in our dev
branches), but this will go to zero over time.

Please let me know your thoughts.

Cheers,

Joel
