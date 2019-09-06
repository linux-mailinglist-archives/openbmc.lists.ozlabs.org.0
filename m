Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90558AC0B1
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 21:42:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q7Hh38d9zDrFl
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 05:42:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="IU2LJGmL"; 
 dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q7H91cZPzDr6Z
 for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2019 05:41:55 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id d26so6882609qkk.2
 for <openbmc@lists.ozlabs.org>; Fri, 06 Sep 2019 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pXcj/FKKYni9KhSFduTA3x48XXXp+cd3zSgbiVhJtOs=;
 b=IU2LJGmLcmlHiZpTCxCry4aS0x4CQmNQSllGUmDnJCja3B8Pr66cula3qG4eieZFmc
 1MNjtA0cVQcyNcoYLIIBwiSrEfoCT8CgduT+Ft3I9RxzpsefQosTB7s8O2+HXWeMvmIx
 IIHIfUcHlVvnE7s6ytTNmZPKlX3cMCe+HrrlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pXcj/FKKYni9KhSFduTA3x48XXXp+cd3zSgbiVhJtOs=;
 b=it7M2oqggSszyJUlz3IjIjjdh2jKHHAs6P1/Ll5h6uSBLua0r+qMOSSnnHyB0Hq2e8
 YoFYS3qf/DhEyZaRl3L5GW9PejrGPnd9Ssfy1KGntNjbwm480VxEEcKsg13F8/P6Nw8e
 Do0JozpDJ8zCBvWkGCR1qO3OX9zy4Kc0qjfD9xaxOqen+9O9enEgqgQHVw6zUVmInGym
 HiCeQh1C1nULZTEX1e2hCsve29W4ahWyYiy/uXLPWgMWty9gSiC4QJEmHWuIQeVnmdxF
 2ssKXvkxYmtCVdJ+z149K8+ErMdCuPB6CvMAAz/pg3w5lou/DbMA5T+ECR9PnQYxe/He
 FAkw==
X-Gm-Message-State: APjAAAWo9vyIQxQCCX4KVWW+2nWyJYs/eC722UErfIZWVYOr2vTJRpRR
 twcEzo+/mJfXrQBLREtCLJu1rD1TYxwh1Z9ICFw=
X-Google-Smtp-Source: APXvYqwXSDFR/JA2JFrZst2Sd9oxdI921O1v//xuQto9Omqfl92j2ApHde2cRt9LPxsI8bklX1NULA+E9PRHT8o2exY=
X-Received: by 2002:a37:a44f:: with SMTP id n76mr10890737qke.414.1567798911703; 
 Fri, 06 Sep 2019 12:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <18e1fb68-1607-0e01-5b21-171a83f94bd9@fb.com>
In-Reply-To: <18e1fb68-1607-0e01-5b21-171a83f94bd9@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Sep 2019 19:41:39 +0000
Message-ID: <CACPK8XcE+JMHCD_7TuH2EpWOyX14qGA6UGkGNFEsg3apA=sVpg@mail.gmail.com>
Subject: Re: net/ncsi: BMC gets incorrect ipv6 link-local address
To: Tao Ren <taoren@fb.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 4 Sep 2019 at 21:34, Tao Ren <taoren@fb.com> wrote:

> I enabled NCSI_OEM_CMD_GET_MAC on my Yamp BMC to update BMC's MAC address=
 while bringing up eth0, but I notice BMC's ipv6-link-local address may be =
derived from the old MAC address, which leads to DHCP failure when DHCPv6 s=
erver assigns IP based on ipv6 link local address.
>
> Currently I workaround the issue by restarting BMC's eth0 interface (whic=
h refreshes ipv6 link local address based on the new MAC), but I'm looking =
for an "official" fix. For example, shall we notify network layer when BMC =
MAC address is updated?

Tao and I had a look through the code and couldn't find an obvious
call that we should change. The NCSI layer appears to be doing the
correct thing.

I think the next step is to bring this up on the netdev mailing list.

Cheers,

Joel
