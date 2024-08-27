Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11CE95FF04
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 04:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtBFh1qQsz30Vn
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 12:24:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724725477;
	cv=none; b=R8IHvmYoRiDD5x1e+2GOUm8+l+Ts5+pauEmfZniHJoNS30cyXB0OgMBsRr9vKPGN2Q5WjTvhArtMA1J7dYPyhltDojZ2uKQwStTjk8XZXSNohNJCgM661Z7ElbYrGSDWuXsNoIlZEcky1PR89BW3Z3Z3xll1bMznnY/IMg5w6FcKYgnbbTGmgCE1xiFDYrWlAQRQ+4mJgd5wfniBZSnuwswSsU22Tr1ZGqPq2xuaWfAC0e68p6Bnn3nQgB67LRQRI+E5E8w5uUA631ghzHSzEYSK0LEmxavKxALHIHWdQ90/txVFzqXclI1k2I3H9VPTD/xmjqXmuUPfBeCgwwO2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724725477; c=relaxed/relaxed;
	bh=Hb7nm8Xoc/HUv6ETkDz3UJbKSyfJcgRGPbSbHDmjpoY=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=E/s0/n2yfaGRQNrKP3bNNNAatoJQfqMrL1nBYutWihslNfH8X+Z/UbcoZCnXWIxcMT72psoTJy9TDX2eEl/BVa9lmo4LKvRvs99IRVdRpgwGi99/QMIQfPOyTvsxFJv6/HCGfy7nIjEfhAkHZ05hSp78AQ5NtbhfsrMg0XYWZc/7ZKrGNNKedbwQ1KzTQMvkzpYsAOUSbnuv8JFjt68sarFcZOsm1xByO0owTFOmYcoUtk6UJT1Yf7rmVbrlDYWCDcljDE8q1NmJSP9zjCyTBkiYudayYvUzhMPoDxerq2Lm89rAO77AFRT5w2RqeXojhQqxMQMyAImM38S/U4xqhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l7cYvllj; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l7cYvllj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtBFd2Crfz2xYY
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 12:24:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724725476;
	bh=Hb7nm8Xoc/HUv6ETkDz3UJbKSyfJcgRGPbSbHDmjpoY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l7cYvllje6kc+o3q9vHUgu/15zHZWjjJcFRHtmmYdiji5BO/KY2K36XrSCFtoHEPS
	 /vt3DYC21dVVvZ6V1idTB7nW5yPTPj32g5sjw7t4dvCd1nQhORcLePKVPnlo+kCgeV
	 3RIwKx7dQiVIgFXX4Vp4a0RObp8usDN+FZtXOgNfboDOlg5HKXGGsfG1XZRSmspFJW
	 lRXy9adhqwl2x53GCjRke0pwHShX312bveNj0lHvJ4e0r9QBgtFkxwYTWLz00XORa4
	 XcmBsgE5w/uGh9JDrwImpG4bq85HnJdF0rC6V8sS1YlPAR0O8OZBS5Xwv9mkD8SXzg
	 daIgd6fj9oCAA==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 69AC9650A4;
	Tue, 27 Aug 2024 10:24:36 +0800 (AWST)
Message-ID: <0cb34763d4d360403ccac84362eb2f61cc11b0f4.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v2 3/3] clk: npcm8xx: add clock controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 27 Aug 2024 11:54:35 +0930
In-Reply-To: <20240826071128.3030154-4-tmaimon77@gmail.com>
References: <20240826071128.3030154-1-tmaimon77@gmail.com>
	 <20240826071128.3030154-4-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-08-26 at 10:11 +0300, Tomer Maimon wrote:
> Add auxiliary driver to support Nuvoton Arbel BMC NPCM8XX contains an
> integrated clock controller which generates and supplies clocks to all
> modules within the BMC.
>=20
> The NPCM8xx clock controller is created using the auxiliary device
> framework and set up in the npcm reset driver since the NPCM8xx clock is
> using the same register region.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Benjamin Fair <benjaminfair@google.com>

Just a note that this patch generates a bunch of checkpatch warnings.
Is this something you've considered? I ask because it's best to try
remove all reasons for Stephen not to apply your series...

Andrew
