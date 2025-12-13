Return-Path: <openbmc+bounces-1019-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF22CBB1B7
	for <lists+openbmc@lfdr.de>; Sat, 13 Dec 2025 18:03:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTCLy5nMsz2xZK;
	Sun, 14 Dec 2025 04:03:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765645386;
	cv=none; b=AeVTLOOg53Y6l03BBDPVDh/PR7TrKzHenilTboIbWylk96j2sGf90w9vmll0J7r6Ngb5ragD5jC42OtQoFCdgCjoBHa1rQDDJajLOsa7/RUVMVfQy7EjJXKHPwB2PHFlImm84GOFg910uVULwPavtAaXwmT8rim3Npp5QHtJFqg69Xdm+gW7UJkPoW8iI68FgAqsbITqI0L+xIzFlMMxeIHOZNDjRT/Cdp1iK1iurus7Qwrk7P3KgxFvJ0bKKM4RoNc0AVHaYMLoJaMX4bvZTn8EU+NsUqTBidNCHCBreAKRInDtGAurjNlvs0FCjBu6GMIb7LF+OfosUeoB/YTNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765645386; c=relaxed/relaxed;
	bh=ujq1bGmRYdI/lNIRMhfdMuAx8/BNOBd92yqCSBrmzho=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YzBX/s/5GlHAX8fmYez4bMduBxV8Ck9eEQ7r4BzFLkKvcIJ3taHjjUhGwS1P0rJCZR+5scYn1LsbwGlFkq2NFz6hPesNFATQ9xcLxXfRyCs8SQGztZ1YgRtEFrKyt2wTBigHCwWE9YcyMaWlqF9z6rh/EPras2CjbiGwrE9KOjn4A5D8yeH3FPB54sEr1KSNnmOOjbnN5dw7BhzfEKTTtzPxz8d06sv38ioaJ0jg0YsUFFh0TEXTmIoeDxuENQDgSlU/s6UQ5CXg95f48rYvS5g0J/KeHaBlftYfeTfm2qkFu8g6JZ73zULxJkj3WbmBKyQdOuI0Lf5sxRJ/xxe7AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j9C81qHS; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j9C81qHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTCLx4Bmkz2x9W;
	Sun, 14 Dec 2025 04:03:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B76486013C;
	Sat, 13 Dec 2025 17:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E92C4CEF7;
	Sat, 13 Dec 2025 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765645382;
	bh=2UpWYya/vT8/YS5AEgqSuwFPzptYkb/tbVFf+3DX8ss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j9C81qHShiadeRShnsOu1sAf29Rxt5NieumDPmK7zQmI3xoHdWw1NKrGr0EPQq4jn
	 60gmmv9aHc9huhjELKBVgct9RxV1QGoAkMe7A1KSKQHkpv93BJ+h23kW4kKQVbQtEf
	 j1mZCrKsROqh1jsYziAVG19CNOo3O5x39YClxl/N5rfPoZ2CWQ8CEhshjpcMPzK6Cn
	 U4LEXGqvyMDrapV4lmzTWoZy/Qe6Dctfhf7DC9pDS/sBxwnvJ0HzAQ7UxHUxcCHD1c
	 7juY++qMxRvkAbcpS9P/sah4JrqXek1rn32ULwYeCErCD8dmwbSb7Ql/xDk1c/F807
	 BxNuWL6hOs+lQ==
Date: Sat, 13 Dec 2025 17:02:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus
 Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-crypto@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RFC 14/16] dt-bindings: iio: adc: Allow interrupts
 property for AST2600
Message-ID: <20251213170251.4d3b1690@jic23-huawei>
In-Reply-To: <176548307744.1801669.10354753289483698774.robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	<20251211-dev-dt-warnings-all-v1-14-21b18b9ada77@codeconstruct.com.au>
	<176548307744.1801669.10354753289483698774.robh@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 11 Dec 2025 13:57:57 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> On Thu, 11 Dec 2025 17:45:56 +0900, Andrew Jeffery wrote:
> > The device has interrupts allocated according to the datasheet, and
> > the devicetree already defines the interrupt property. Address existing
> > warnings by allowing the property.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >   
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> 

Doesn't seem to be a reason for me not picking this up immediately. Hence
I've done so.  Currently on the testing branch of iio.git as I'll be rebasing
on rc1 once available

Thanks,

Jonathan

