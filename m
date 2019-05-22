Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5215625E0B
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 08:30:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4582nC6WrNzDqH1
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 16:30:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="hiUppQIK"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4582mF649qzDqLW
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 16:29:33 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id o7so1052214qtp.4
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 23:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4cAH0eIRU1jlE5KEzavwREFGDTv7Q0lk8GnQDdW0pkY=;
 b=hiUppQIKXIdZeLDy+2LTz816GYzgPVQ5+YBhnT+8PiJ7/htE5H8a0ykmrBnL5QZjTS
 //Gf+B6CpmDRQDE7WYAj4w/71eV1dGYmSHJ7tmozIoJ774snj1T90eXkHInovDp7+df2
 pdsvv/Wj8w0PyNlnGX3xZiSAzhJVLe/FiTJPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4cAH0eIRU1jlE5KEzavwREFGDTv7Q0lk8GnQDdW0pkY=;
 b=EJ3/o3c7v+WQf5ws539nYv33/Ue2N3Pb+qRPK6UHenyQDP+d1IlBI3t5vT2Tnnpxy+
 kqcqiug/7SEeoqx1/CpAybVSJTSWrNDMBnSnyWYyggBXfaQSoStLussQDz2IbDZaSUbj
 SY2awvuafsHEqZKBS3Cx/w/V1L2xHkkH5vhUBuDhsrXEyKSkdd9I/3GICXQVZjHuSYaG
 JD0zK0Axvvoe2uHY+hptZkpGobkJ3y8RpN/6po/4+gAAqGrd37XSy9UXrpbwJV0rKltL
 4w7KzWGSXBQYOiAkpuRGsKO3CBD6HsOCSQFgI4bSrVNfI4odJ+lTEIoa+JaFjHtvyEZK
 XEhw==
X-Gm-Message-State: APjAAAUwY4Q1kIB9MrovDm+7/48nszxX2PP28WZzwUCvtIaZQif+MMZn
 BNpfIlBBUrik5IFKpJ9dROS1jrEnxtFaXgdueAY=
X-Google-Smtp-Source: APXvYqzisw2mZ3uh3cWOzgzLVw6HfwGPvFi3lgftgflo11pQe90NQMiNOetOv9P9hFoXMJtiiVxWnX/DlPQ7AhimxhU=
X-Received: by 2002:a0c:d17d:: with SMTP id c58mr60334230qvh.172.1558506570829; 
 Tue, 21 May 2019 23:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <1558475264-29119-1-git-send-email-hongweiz@ami.com>
 <d1d3f7b3-b989-4e6e-ad52-239b6ac8aa48@www.fastmail.com>
In-Reply-To: <d1d3f7b3-b989-4e6e-ad52-239b6ac8aa48@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 May 2019 06:29:18 +0000
Message-ID: <CACPK8Xf6cQJQ+jyxmkveUqAV1jzeo1OePOURtRMdTieO-utxmw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.0 v3] ARM: dts: aspeed: Add Microsoft Olympus
 BMC
To: Andrew Jeffery <andrew@aj.id.au>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 May 2019 at 00:03, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 22 May 2019, at 07:18, Hongwei Zhang wrote:
> > Olympus is a Microsoft OCP platform equipped with Aspeed 1250 or
> > 2400 BMC SoC.
> >
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, merged into dev-5.1.
