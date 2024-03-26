Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA188D2C8
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 00:21:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bf78/hZT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V45Qg3wxvz3dS0
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 10:21:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bf78/hZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V45Q031fxz3bs0
	for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2024 10:20:40 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.226])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C83DE200DB;
	Wed, 27 Mar 2024 07:20:38 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1711495239;
	bh=5LMuaTA//ft7/a0fu9qFOSDRNhm40x5yJd8VYwEv0qY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bf78/hZTutL131ph65j5Om2Tjtd69+bUWAC48NpIQb6g3Ayxfj6AWvi8ASdiM2NcT
	 ZnQVz8zn0rCYipALJ9xiQnI9zBZCS+0U6O4/9U30ESj2eTPBfTSwOaZT362J158LHT
	 LGDuWSHOakQFnigIlPReQHItZKU8TBaoOkv7x0GsiVoS/HNYNIgV87+yqp2QccZ+F2
	 YbyVchJduHY/PmcNiNEk4FaSmG5XF/1sUW01BcMw5c1WKVZlLGgxB2xwR8LfI5RYuR
	 FtHMIagVtC/VY67tZl1EHokZnInl3pKWInBpwBYP5nftcVzl9r05i4hjPWMkxW13Je
	 e+JtAGypFjkMw==
Message-ID: <cec6687b1714509ba20853cd1ad581ff4e05f5c2.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 0/2] ARM: prctl: Reject PR_SET_MDWE where
 not supported
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zev Weiss <zev@bewilderbeest.net>, Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Mar 2024 09:50:38 +1030
In-Reply-To: <20240326194959.10777-4-zev@bewilderbeest.net>
References: <20240326194959.10777-4-zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-03-26 at 12:49 -0700, Zev Weiss wrote:
> [Re-sending as I forgot to CC the list the first time, apologies for
> the duplication.]
>=20
> OpenBMC on AST2400 has been badly broken for some time now due to
> systemd services segfaulting on execve() after calls to
> prctl(PR_SET_MDWE) spuriously succeeded.  The MMU of the ARMv5 CPU in
> the AST2400 cannot meaningfully support MDWE because it lacks distinct
> read & execute page permissions (read implies execute), so these
> patches ensure that the prctl to enable MDWE properly fails on
> hardware where it isn't supported.
>=20
> These patches have been posted and approved upstream [0], and while at
> time of writing they haven't yet reached mainline or stable upstream,
> they're on their way and should hopefully get merged soon [1, 2].
>=20

Nice, palmetto userspace behaves much better under qemu after applying
these.

Andrew
