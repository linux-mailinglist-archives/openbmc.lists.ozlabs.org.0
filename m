Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51129115
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 08:38:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459GsP6RzszDqdS
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 16:38:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZJs/7bEO"; 
 dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459Gs01tk0zDqcG
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 16:37:55 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id p26so3262003qkj.5
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 23:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VF8SAzuxr/64h26Fz2pAEfs0/jmxZ5nMmF/Y5/wTnRE=;
 b=ZJs/7bEOJa4UVrbBJHe4oPfdRs6ktTn53xCBrVqbTEOADiLyExvcjwkELcSanDFoMl
 0ksOlD/Yxv8iaS3+687t0x4HsFXXD0LAluXSULh2QHC8K+qCzfDzB2hZQDHukvHJVOAl
 asqeqZmrreZTCjzTW42HPB9g4PtyIfLjFvHlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VF8SAzuxr/64h26Fz2pAEfs0/jmxZ5nMmF/Y5/wTnRE=;
 b=A2eZ7p5shx2g9MwGFztPguppRymDq/Bw9BU18tx6iLHJi5MPC8pQE4xplbtyq2jiea
 BHS0BuKJVTW+rR92FAMwB2yLKkl3gIurMB+6Zz2YRgck1o4iBdwaK6FlW4Q114vZH0vj
 eQxecQOCO87kzwcQuifrq7Ns2l6zAkbdbKiSJ80UdeWQGL5c9mXMslobcWxa0EVgbM7h
 pCCXE0il5Tau3C2N6YdvsQNW/9zpsnISrI47lk07anaK8B6f/dXnQYnv2BX8WxKFaG90
 V9iHpo3Ayd9CICEyHub43Ho7EZVstYMtMkDvhEn2Te15Vn99DnOnyGNCTvttkLKN4ooi
 MC1A==
X-Gm-Message-State: APjAAAWjJJTh+aq9zJuH82psfIO0lZ5FrM193Z4QAPhLzgrnE3QZLLCR
 CaBoBefXsicB4fmvsrS1RiXPHiM6MAB9nJwJi5E=
X-Google-Smtp-Source: APXvYqxduFd/kbgG+OypYvfU5OoXXIT3VeTA1A7FXZeZrptyK2c2D0J/XwJ9/c5DvmqfA91i0aPa2sZJc0jhGtt3a2U=
X-Received: by 2002:ac8:2da9:: with SMTP id p38mr82761220qta.269.1558679871640; 
 Thu, 23 May 2019 23:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <24ded2792fbf485689db57aad5f98626@yadro.com>
In-Reply-To: <24ded2792fbf485689db57aad5f98626@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 May 2019 06:37:39 +0000
Message-ID: <CACPK8XdrLBX_KhXcPen_97JbyyPOLWOKZXMU_Rvho=Q19D75Dg@mail.gmail.com>
Subject: Re: Romulus avsbus-control and vrm-control
To: Alexander Soldatov <a.soldatov@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 17 May 2019 at 07:48, Alexander Soldatov <a.soldatov@yadro.com> wro=
te:
>
>   Hi Lei YU,
>
>
>   There is some question about avsbus-control and vrm-control on the Romu=
lus. There are no public documentation for the IR35221 chips, which are use=
d in the Romulus. Could anyone explain what  avsbus-control and vrm-control=
 i2c command sequences do or give register description for the IR35221, ple=
ase?

There's an upstream driver for this part that may help:

drivers/hwmon/pmbus/ir35221.c

There was a plan to replace (some?) of the scripts you reference with
the kernel driver. However these parts are powered by the same net as
the CPU, so when the host is powered off the hwmon driver cannot be
used. It would be good to come up with a kernel based solution here.

Cheers,

Joel
