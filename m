Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB75403725
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 11:43:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4HJK5XXhz2yNr
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 19:43:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=geGIKAXu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=geGIKAXu; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4HHq2F2mz2yHP;
 Wed,  8 Sep 2021 19:43:02 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id c8so3729445lfi.3;
 Wed, 08 Sep 2021 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tcxDxLsWHGr7j1cvxMG2JLruNGk37pPqhVGSTiHNRTI=;
 b=geGIKAXuwrxvpukyugOKBZCm3v64zHneGc4gUrxldK2pKi2rdjMNXnfj8dgx8K58uf
 ogvILTSHxVVBAyqLgjYHreu0k52T++uJp9lOvpiKnpIQ8Bjyz2BIX7YxHlOjn1gortwr
 QOkCGYy9DhxEIO6grVDNeIYuzaEpDIKRHkrvbnADXd+UfND9vaLyUaIZYjH3EbSwN7zu
 hs5MGlB4oIUF1M2DKo6NAAxX4oQmhFNJxeIdmT7c6S72Ui3a+eZ0yvPXJLtQ+owtPjvi
 S8dDAis6RFUobhVc7tVIRcEpEso4uMkcIqQrszZhhuu47/TXi4vZaBTUqGSAjOO/A+Pr
 mauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tcxDxLsWHGr7j1cvxMG2JLruNGk37pPqhVGSTiHNRTI=;
 b=JY+7ISBHKpEdHncdIkBa/vvZEPQmw9wzOnuf4ZY4xb2a7YA/wM1LwRz3AvkZfZ6KsA
 UCTbKDY7HkagtZnxiSD4wLZnHWKa2Pj1ZZg/2qULfLAaHMYtQWRijOCLqyy98tROuSKJ
 svHVd40v9jATnfkIbpZZqocFZ+5zaO+jACxR4weRx0zFjJHInW639R4B08mjrf9Qb7QM
 Q657TnIBhk503dxMHuIW2V6273vzUD6FzUpK8XcNkb3F1aPh/nApNJh8LlgNr76OjRI2
 E7N4+Nf4bnveyZPN+LlxGDSsgHqYEy3YZIwcm7deNhgq24x1Fag7OasXVZeadMtRE3mn
 y1yg==
X-Gm-Message-State: AOAM532AsOVhm0lDmXVM+dvXAwH6xADAIR8KnZnVXQf214F/6894jOkS
 WUDBB3zvYTP3NUiYE7hfqQs=
X-Google-Smtp-Source: ABdhPJxrOHq4d4XwI1TCtF/j7UjWh+chOlUNydbJM4p4e9w/eyyWqy8UuaUlIgCkRr7/6Fru0VeUQg==
X-Received: by 2002:ac2:4185:: with SMTP id z5mr2080264lfh.391.1631094175380; 
 Wed, 08 Sep 2021 02:42:55 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id o8sm142625lfr.265.2021.09.08.02.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:42:54 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 1889gpxA015666; Wed, 8 Sep 2021 12:42:52 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 1889gnns015665;
 Wed, 8 Sep 2021 12:42:49 +0300
Date: Wed, 8 Sep 2021 12:42:49 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] arm: aspeed: Add UART routing support
Message-ID: <20210908094248.GZ23326@home.paul.comp>
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>, robh+dt@kernel.org,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, osk@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Sep 02, 2021 at 10:18:13AM +0800, Chia-Wei Wang wrote:
> Add UART routing driver and the device tree nodes.

Thank you for working on exposing this functionality in upstreamable
way, that's so much better than all the register-level hacks in U-Boot
and similar approaches!


One (somewhat) related question that I hope you do not mind answering:
is there anything special regarding the routing or other configuration
that needs to be done for VUART to work with IRQs?

The reason I ask is that I have tried hard (and I know several other
developers who have too) to use VUART functionality but somehow as
soon as Linux was booting on host and starting to use the IRQ-based
16550 driver the communication was halted both ways. Basically, the
BMC firmware was enabling VUART in DTS, then setting LPC address to
0x3F8 and LPC IRQ to 4 and reading/writing using the corresponding
/dev/ttyS* node. The datasheet is not clearly telling what other
actions need to be performed for this to work. Not using VUART and
instead routing UART1 lines with exactly the same pinctrl/pinmux
worked just fine. One detail is that with VUART the host wasn't seeing
new interrupts but when they were simulated by exporting the LPC
interrupt pin via /sys/class/gpio and toggling it manually the data
was getting through.

Does UART1 need some explicit disabling for VUART IRQs to work? It
looks like setting LPC address and IRQ number in VUART is enough to
override the register part but probably not for the interrupt?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
