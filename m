Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD763675EB
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 01:51:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQclM5QGRz301J
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 09:51:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AXv1h6Wc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AXv1h6Wc; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQcl81GCJz2xYp
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 09:51:13 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id s4so4753501qtw.3
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 16:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=v5jpUJex3kZO3NQi2vJsPQC0wGjoxbJujeWfj0EeINg=;
 b=AXv1h6WcJQB/gJw14rv1C0Ia4YSNXyr+FQ8VqOeIGL9jrh4WMxr5MqC9qDnw5Kn0VI
 kh9MNYQICrSBo5ZJWJ/WbEKGVcx1EHJhoUMeOGVaLXZKYGEXu54V+2d708P2OPFY0PDB
 7SVP2O/oXZIdHR0AKoz2JWTdPk+gmBkF45X7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=v5jpUJex3kZO3NQi2vJsPQC0wGjoxbJujeWfj0EeINg=;
 b=slWAlhEC71leIt7cMll36hivXsQ7ef3OCsznDErBkm/HSNw0W2r4b5gZWkhKCOUH3+
 z/KBUfCY70gRFS7WJNIqfDLcS4Qa95uZYCDh0xzFS3OSETaRdG6aGOvP0939wKwrx40J
 /Pwye3fSDo/oOXSxuTJGCH08JOYmhyN3bBITFCmDM41M0tgFbW8ovqO9HlFzvpcKtNoC
 Ys4hbwBCmsdGOMqC2uhRUO7IoZy5YezP+ElNez1AlL/ZtH7Tc5OwfqplzLDLer9cxSXf
 Gt+w3CDHYfFuDXMzbchTzO0M97fLICaN5bFqFGLzCPHr3TyswDR9wNkbRXKuEy6FCZ6R
 rGCQ==
X-Gm-Message-State: AOAM530yCm8XS84Bc03psJTcSFKPQ3qd9858trLMhWo1KkWgwArdweqd
 ksKrU9iFUVwDNOe+jpS1zuOUGETSAFu7hlzXMO9ppEcEJd4=
X-Google-Smtp-Source: ABdhPJz9zCf/Lwlxpejk/Suii5a4EzSUVw3xJgF9M1du/OCXDHlQPIp+J7gROeJfdVKOk6Dl9WHNpTtE2M9pehDpASU=
X-Received: by 2002:a05:622a:216:: with SMTP id
 b22mr347552qtx.263.1619049068119; 
 Wed, 21 Apr 2021 16:51:08 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Apr 2021 23:50:56 +0000
Message-ID: <CACPK8XcXTq1tzQ=aLa8pEKyt3WBWWfj18vhh9ks1DxDn+T+i7g@mail.gmail.com>
Subject: u-boot update for ast2600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello OpenBMCers who care about u-boot,

I've updated OpenBMC u-boot tree to use ASPEED's latest SDK,
v00.03.03. I've also applied the series to support for FIT
verification including use of the HACE to perform SHA hashing that
I've been working on with Klaus. The bump is here:

 https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/42502

I've sent a set of fixes backported from mainline to ASPEED for
merging in a future SDK release:

 https://github.com/AspeedTech-BMC/u-boot/pull/7

We still have a number of patches carried that are specific to
OpenBMC, and of course the new FIT and HACE support.

My focus is on supporting u-boot on ast2600 with eMMC. I test this
mostly in Qemu with C=C3=A9dric's aspeed-6.0 branch:

https://github.com/shenki/qemu-boot-test/

I do  run u-boot from NOR on the ast2600a2 evb I have, but I would
encourage testing from others if they care about this platform setup
as it gets much less attention from me.

Cheers,

Joel
