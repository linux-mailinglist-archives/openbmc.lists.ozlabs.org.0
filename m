Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B430466D86
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 00:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4sJJ3FX0z3089
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 10:15:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aMQprVnr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aMQprVnr; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4sHt290Hz2yg3
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 10:15:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59B56B823BF;
 Thu,  2 Dec 2021 23:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F410CC00446;
 Thu,  2 Dec 2021 23:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638486916;
 bh=GQ8t5bpF4TlGlqrWcvkPnUaG9pj98dzkZ49NTmV5V/Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=aMQprVnru08ro41CKEiAqMtm+pRUByoLOGbH0Nefik1QSqLaiyryxU0KBm/3k34xD
 Xth0yN9YdAVh2vSwdWqEtlsBgeMFgec92Mf6ObdQ6jmL7XS/Egmw8QsfZBo//yAIrB
 B3W5PoB9gPAKGSuG49Y1xXjwodVWW6bpFvRwZ/0C9dj1ToaMUBdGgwBrG2EYzZPmYk
 TK40Sk6Yu6Zovi823r/M65iApkKVN6hlBRS4IeAHsNtK0UqnhGQgM8kwsqmmi5F+sJ
 44K/s5+TIyQKRqIJ2IDewA/htRJu9pTwkvKZHBvBXtF0rXejM0CX1vBPjsLvMI2f5M
 BiSVFXxZC54XQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211118082858.165538-1-deng.changcheng@zte.com.cn>
References: <20211117011244.158541-1-deng.changcheng@zte.com.cn>
 <20211118082858.165538-1-deng.changcheng@zte.com.cn>
Subject: Re: [PATCH v2] clk: Use div64_ul instead of do_div
From: Stephen Boyd <sboyd@kernel.org>
To: avifishman70@gmail.com, cgel.zte@gmail.com
Date: Thu, 02 Dec 2021 15:15:14 -0800
User-Agent: alot/0.9.1
Message-Id: <20211202231515.F410CC00446@smtp.kernel.org>
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
Cc: benjaminfair@google.com, venture@google.com, openbmc@lists.ozlabs.org,
 zealci@zte.com.cn, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, cgel.zte@gmail.com, deng.changcheng@zte.com.cn,
 mturquette@baylibre.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please fix the subject. It should be "clk: npcm7xx: Use ..."

Quoting cgel.zte@gmail.com (2021-11-18 00:28:58)
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>=20
> do_div() does a 64-by-32 division. Here the divisor is an unsigned long
> which on some platforms is 64 bit wide. So use div64_ul instead of do_div
> to avoid a possible truncation.
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
