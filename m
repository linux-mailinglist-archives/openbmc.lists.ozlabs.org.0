Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E9E9A1682
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2024 02:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTSq95NvBz3cLQ
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2024 11:08:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729123714;
	cv=none; b=W6H3okL5fNXcN9yvlglb/0JOyjZNL8zeTFTOcM3x9XrIDni+U3RiMR9UHAagvPhMKtQiC4hmPXMy8JbVsXMewEafX2GUIq4sWg2E3shdb1FdndykAFbD4+J2vFxsp+Wlf6hFHyCLxvcMVHPjd3GD+5gZLLN85XFKdqDOlA/0ndT9fhYYuUMmNgh1z6+22CboKghShXupLELmu+GVBNxkzolHLXOdmE5tjP5U5dfZ9DqZaMozFyhkW+OMiQuLXObrqcsNesnRBfllAeupfMQYbLwIWOguHYWglHXHIki/LaU97M31nI5winVjznMlnD0ETSKmT4gQP5tvLfv+9GjjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729123714; c=relaxed/relaxed;
	bh=MJLV0tcHDxYrAJWRYnY4HRU2T9JXBQ/Ox19qpn6RCQY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mOonYO/hzPxBc13nKRYwFK6Cf4WWMP6FRpcI16Jgw6nMO5BPlgpiAFkp8yZf4j4nbAgHY3eoj77YdRTaUM8IJmez05KdAzYWLPBTs8s6G1QYYQgcucqt7AcxAfNZMPAvghNrrC0cCwdQG0sVDONlGewCGIdg/E442/KH2W97swEy+m5nyqtU0+0Di2EYIX4HD4ir8FYb1K/R6xW4kJwO6p5lIK1C09P3kEjGhG1XfpX8tS9VQSVhQZAeNzrUshvsKGRQtFDQGrEA7p36bDPv35swJF0IPhwdoGqvi2CayayU6vkD+MasSa05Lp8ytz/pgI8sKTBb6BxLpUDA149Cgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PdIzXG2o; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PdIzXG2o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTSq46tbWz3bZr;
	Thu, 17 Oct 2024 11:08:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729123710;
	bh=MJLV0tcHDxYrAJWRYnY4HRU2T9JXBQ/Ox19qpn6RCQY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PdIzXG2oo8nlIjIt6YdEvK79moJ6OhTLC/559NkVkW3MmTY58QSR7gPQ2bMIHvFPP
	 K0jYXX6ycnnuKPOQrAUJeXy6ScnODBUZNqR8dMda4SDR9uglT/iFxny9G3M41bYOpc
	 X7Ic9ngP3FWtxLnyhAK29dxGRG5XcISMN1L4Z51H2nZ7c+G9tMRMhgP+PiM+VV1XoA
	 20HeD6o6Hikr84Z4Pr2tfKanhrxUbO7LT03hNeSt9ClkUIvB+6moOuJTHcQga5u3As
	 5+Ucba5h9Cw30ZS3/6cwBRcxAKBVgYE/y6HDHu0vkmhsf06bI+PO56Qx1DJUrSQWhW
	 Cet5g3j+8MMbA==
Received: from [192.168.68.112] (203-173-0-39.dyn.iinet.net.au [203.173.0.39])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 913C667E1F;
	Thu, 17 Oct 2024 08:08:27 +0800 (AWST)
Message-ID: <f833ef3b873d0e71581dd138f046b19fa3fdeaf2.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, Chanh Nguyen
	 <chanh@os.amperecomputing.com>
Date: Thu, 17 Oct 2024 10:38:26 +1030
In-Reply-To: <c42be4ea-9902-4fac-8b1e-afc38fe04bad@amperemail.onmicrosoft.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
	 <172891445289.1127319.4114892374425336022.robh@kernel.org>
	 <b5919d904c9f06a618a54d49bc895c3081a511e4.camel@codeconstruct.com.au>
	 <e8e31fb4-4a9f-4ea9-be4d-9ba29d824cc5@amperemail.onmicrosoft.com>
	 <7555c528c90e6151f54d0e17c278527f95fac184.camel@codeconstruct.com.au>
	 <c42be4ea-9902-4fac-8b1e-afc38fe04bad@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chanh,

On Wed, 2024-10-16 at 17:26 +0700, Chanh Nguyen wrote:
>=20
> On 16/10/2024 12:07, Andrew Jeffery wrote:
> > You can also find discussions where other maintainers (Guenter, hwmon
> > maintainer; Krzysztof, devicetree maintainer) have asked that "pmbus"
> > not be used as a compatible:
> >=20
> > https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@roeck-=
us.net/
> >=20
>=20
> Hi Andrew,
> I checked the discussion at=20
> https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@roeck-us=
.net/=20
> . It seems the maintainers don't want to use the "pmbus" compatible for=
=20
> specific devices. The maintaners require an explicitly compatible from=
=20
> device list in drivers/hwmon/pmbus/pmbus.c .
>=20

There are two problems:

1. Describing your _hardware_ (not drivers) in the devicetree
2. Binding a driver to your device

You ultimately care about both 1 and 2 as you want Linux to do
something useful with the device, but for the purpose of this patch
adding the devicetree, 1 is what matters and 2 is not really a part of
the considerations.

What needs to be the case is that the devicetree describes the device
via an appropriate compatible string for the device (manufacturer and
part number). Prior to that, the compatible string for the device needs
to be documented in a devicetree binding. This may be the trivial-
devices binding if there are no extra properties that need to be
described, or you may need to write your own binding document for the
device if it's more complex and one doesn't yet exist.

So whatever is in pmbus.c needs to be fixed later on if your device is
not yet supported by it, but that's a separate problem (2) to the
problem you have here (1).

Who is the manufacturer and what is the part number?


Andrew
