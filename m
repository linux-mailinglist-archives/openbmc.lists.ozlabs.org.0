Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA89D9A3093
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 00:23:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV2Qm6Jlfz3cMg
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 09:22:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729203774;
	cv=none; b=Pyy8XIOJUh4TPCzEYg77tjtgg0M6BOIqV4Eif8AK8OH7ruYxPidFO/Uq2PXdZJ2pqg9EeTtdFBFNnCQm8Zg4qpQp5OXPDYGTppYmBuFuGVXAjdxFlEEvlkUkkUOUkW6qNoa9cozRHZVV0PUSXTCBxknB0tbfhQ0r2V7NBipnuxh5/RXJdfRcnqlaDp3DGF6Az8OfqkVZ2Ao9/YkT9tyNpbCvDpaZTWRRdypSj9dPPa7ytkEe4jcNegtVTx9twbRYnLljX08Zw8n/D8a7qnl7lDsco4Bb81yNFl6GI9rv8by5hm+I16S6lg+SHFSeotfe7JxNrYwKFrf6wtGWjf3l5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729203774; c=relaxed/relaxed;
	bh=nwZJpFaMGkIfJiwNAu/kb2SQ2syXsOgdOQCJzbi6/fE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=a1yRHeI+fbdwu5NIsebc6ikDXwlqEv0e+mWam19aqUI3mr5rQ7UkNMAW7Qwdxw8MGYjuMChGirdAnCF51NtLONK/IAMDf4bwxnuennPwquHi9dLtcOqOb8V1A5QM1s+hxvoNIevYQ4bJUA+hpXPo2dt/W1HXbCt7OwEHC2D8vY6mt9+vibSXPzyskJY9uy8BloL11hjpqA7l+7N1lBz4+5qNpkE59LaaHmeTzzYSDUhxcDRTdQ9vE1lptbuA0qPdhZZ9KjaGKdsDBzbJbEDdf8Q/Tj/K+dDfJykrTkR80j3nZCo7zDLwJ6bfalc0syEEe9xNAYnmfT9iiyjwx/MhYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdV1IPcM; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdV1IPcM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV2Qj1qbNz3bjL
	for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2024 09:22:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E9A6A4417B;
	Thu, 17 Oct 2024 22:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5D0C4CEC3;
	Thu, 17 Oct 2024 22:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729203770;
	bh=nwZJpFaMGkIfJiwNAu/kb2SQ2syXsOgdOQCJzbi6/fE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GdV1IPcM10+H6sFnd8NYu7K0PWRGUbsmZFp8bicC/7fby30Z9/6vC7j+rcnYeXb/p
	 2ptfEOMuDuTjjimma2lFuqBT9zx2hlEGQsMwVpG39ubat7p1iPtL9dUSv8ViCoVjSX
	 G6Hz01Ikw7KVE9xpAgqpn3dbCnOT8bsvHEWJiKXMJr+IokT/OaSWLaPmivNyn/0LOS
	 CArW+2A3T/pt6Nq8iYKFHXLzh6jiZxrAaf9bgXSp5vXoRZW9EfO4tzXwAHKnPGf+w/
	 S/aJXr748ckabDH7O9tpjV7e8Eagaud1OGAqHjVK+7AE0UqVh/okEmK4dmNWZwTDjL
	 /ySNsSsmYrkjA==
Message-ID: <46ce613f0e6e5c656f943f5572e95d45.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240912191038.981105-2-tmaimon77@gmail.com>
References: <20240912191038.981105-1-tmaimon77@gmail.com> <20240912191038.981105-2-tmaimon77@gmail.com>
Subject: Re: [PATCH v28 1/3] dt-bindings: reset: npcm: add clock properties
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Thu, 17 Oct 2024 15:22:48 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Rob Herring <robh@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2024-09-12 12:10:36)
> This commit adds a 25MHz reference clock and clock-cell properties to
> the NPCM reset document. The addition is necessitated by the integration
> of the NPCM8xx clock auxiliary bus device into the NPCM reset driver.
>=20
> The inclusion of the NPCM8xx clock properties in the reset document is
> crucial as the reset block also serves as a clock provider for the
> NPCM8xx clock. This enhancement is intended to facilitate the use of the
> NPCM8xx clock driver.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
