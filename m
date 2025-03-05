Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BDCA50F26
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:53:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SWT4bRqz3fpp
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741169919;
	cv=none; b=WSEhuuHO4ULjWQOtI3/IlQN7VgvA9AioLp0kHMRnQnqyXXBSGX1gWcnmQu+XOOafOFJXKyOwtDmNf7DmGZgzonM839Xv/zgkMBTRdkRVYE3a10Jp5a88ERrltrbn6U2fFmPF/CJKlwj1Br33TRRBtMbOECQOawFJzYf+knr4mB6AK7d0Z5KXRXDOnR4wAPvfD5pqDWeYO9m+w73/ptdN+B/J4y/1mLWcyeEl+baYzBsfzIlBH0pF9K/srh5pXTldhkgGmvmovDe+Zcw9gK0nxfo440QnrPpAR2C/J+BlAvMEcxSCFJsgdXb2nMZnVnqIwTAS/9duE0cIFLwUZmb9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741169919; c=relaxed/relaxed;
	bh=4Vo3qOOAEBPswAqRgvzNrNkT7zw+CqURid5oS8C0xpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkZUj7cTBmGMzVXIh4z52KWEudssqfVg0CEvqMOUkuYtJfuHMvz3A8ude/G1uIWXRmI2TEKHaw+OBAxMi+RzmxbwMSgSPk1QJQcBGee1twVuSYlrbuSgPw4litqr8g2S39qHVnm/vMdJ2Kv5UGiG0wLzIkP/FKCDXXFGAPi1eADFmoCwHxkhwBewE+4hpMo+zbnVP32W4QtrxjbqUmPf3GvtaA0ZhZqkeMmz8ZBdTYeM10IPp9Adpk3tls+H4Q06bHs5qd7VAlsD4KvWyOvQrTTmo5NOhYsyoHd7YOPnFVlEEpptlQ8uYuziZI/q7SXnMT2VU4HzBib7iVVQSU8pYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JVElypjc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kabel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JVElypjc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kabel@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z77mt3pnBz3bnr;
	Wed,  5 Mar 2025 21:18:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 956E0A40EFC;
	Wed,  5 Mar 2025 10:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4705FC4CEE2;
	Wed,  5 Mar 2025 10:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741169915;
	bh=4Vo3qOOAEBPswAqRgvzNrNkT7zw+CqURid5oS8C0xpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVElypjcaIYX5rKtiv06hcSXy4HstFjKOeRhShpFjk2Jel2eSkA/O0uK8Wninv5/a
	 hI5Ui+51QY9Sc5wOaelsMqqEki8iPKL/7clrg37rGARtPtuO5FAtalmSz/cR624zt9
	 twTkQB6/0FugO2QSLBDkRJ1MULKIVW+tzVSg6Ccu0iGgHjhAUJfebciXlktocUXdn0
	 bbIXddxhOqHs7IDCCnaG84EzsvIT+/+FsZux9DQ1iCMoMbwVVWuwRuT4u+s9e3MuJC
	 lkrQutRMyjpWtEs6QOIxSX4h5Qvjsi5oAAXmBv854hriyofgHQ/0kVmCe+F7yX5KZc
	 9wpnC/K5XUGSQ==
Date: Wed, 5 Mar 2025 11:18:23 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Message-ID: <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: imx@lists.linux.dev, mwalle@kernel.org, tmaimon77@gmail.com, hayashi.kunihiko@socionext.com, alexander.usyskin@intel.com, tali.perry1@gmail.com, paul@crapouillou.net, daniel@thingy.jp, patches@opensource.cirrus.com, christophe.leroy@csgroup.eu, festevam@gmail.com, chrome-platform@lists.linux.dev, maddy@linux.ibm.com, benjaminfair@google.com, lma@chromium.org, mpe@ellerman.id.au, openbmc@lists.ozlabs.org, krzk@kernel.org, evanbenn@chromium.org, linux-mips@vger.kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, mazziesaccount@gmail.com, s.hauer@pengutronix.de, naveen@kernel.org, npiggin@gmail.com, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, wim@linux-watchdog.org, bleung@chromium.org, linux-arm-kernel@lists.infradead.org, andy@kernel.org, support.opensource@diasemi.com, andreas.werner@men.de, avifishman70@gmail.com, thomas.richard@bootlin.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de, venture@google.com, jwerner@chromium.org, romain.perier@gmail.com, shawnguo@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

why is armada_37xx_wdt also here?
The stop function in that driver may not sleep.

Marek
