Return-Path: <openbmc+bounces-633-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDEAB525D5
	for <lists+openbmc@lfdr.de>; Thu, 11 Sep 2025 03:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMgF60tBmz2xnx;
	Thu, 11 Sep 2025 11:38:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757554714;
	cv=none; b=XH9lRbcJPpEKcbHLj32oXkRicbbfF3hRI1hvLzT2IJlO+w7D3RCrX3rBEqZR88kuMHY7NGJtoodE1Ujlf+OTjRC0GLdkMNKWEJkzRSu4c1T2sKdVWSfnXlmsLUXUEPVISZcKSv/tFiZ/uA6W75uPO2bbeTeAb2v2il9DZMz+UGtzeIAbEZ51klJyfWyBvt6e2F7SgHlGQHdyG+aTAbSIQFU4uSYqqDNyzKzDejJoDX8SFWqC0LKQAPK+XYX3VzT65Ote6+R9s0VOOudZ3aWTJET0dFU+azMXwR/RfK/cVifV5rCytM1/FkqFgAXQPGEXon0LUTqwtAldwsIdz04W6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757554714; c=relaxed/relaxed;
	bh=F01UXaPaBhKCGLzKaH0Cho4DISR/Sr2ga40NNR8fcTI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ifvAGCBzdgokFHXu7TJt/FvQFlUTR/wA7UJ8eXdsZf6VUXjvAI2TjIVCBWWDRr3PzAZWIfwQj+ALWQW18+gXGeF0sRPYtR/ENymPcFHL+yu7wN2ibpniAKYpZuKGEbGzegEdM9Dur8oikEwsZXFgCsml4WJs9nIkjXvsl6FFSQdzc35oWXEjClYpRMcgq57y0KEofJVMD62qPT7wg2uaaBtWEw4HWmvxDJF2B9Ci/X0wA++va5hbr6WhiOBHhdGFvDUAC+ikd7Mw4q/Ic0pdGRvoAe2GNLdV5vqSYit22TuQHPBBSYUhzmvZhFKUJ+BC7dW2aLfHSKp11cG2YstIcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=lZDvQexR; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=lZDvQexR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.org (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMgF44QfGz2xnn;
	Thu, 11 Sep 2025 11:38:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757554712;
	bh=F01UXaPaBhKCGLzKaH0Cho4DISR/Sr2ga40NNR8fcTI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lZDvQexRfGR2ujTpjGRc5Utz8gUWAg5HTzk/eyhJXVlD8VrLy5zAYy5OW5RpdWibP
	 4ypXhPyGFxMdQs4BpnClCLhFHL1iyX44hObNcWyxO15XRHR2X1GH84ZsC5FwxBVTEs
	 uwUJUvgTWsJBSHIOK24AoViwxyvIHK6c7gUn2YeJh/z0n3KLvQKV+RMSBFkTj3uVmr
	 W9+VCCVTKI3iMhLgbp6xKTXtIg88IH82U2tPtEmnJd/aRwx0YNZ2vFq40wxIja/8Nb
	 rqIH7bMatrij3/F3rev7bhDLFwIrc/ykBvjULz3lQ4Z+jRZlU38haiU6Y46FB50RWa
	 ZYXzfEbd9OTXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMgF11lvcz4w8x;
	Thu, 11 Sep 2025 11:38:29 +1000 (AEST)
Message-ID: <3fdee5330d91b5d18a69a311e4df6de874973ced.camel@ozlabs.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From: Jeremy Kerr <jk@ozlabs.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	 <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com"
	 <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org"
	 <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"p.zabel@pengutronix.de"
	 <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	 <linux-i2c@vger.kernel.org>
Date: Thu, 11 Sep 2025 09:38:25 +0800
In-Reply-To: <OS8PR06MB7541BD362CE9FC0AA3CFC46CF209A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
	 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
	 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
	 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
	 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
	 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
	 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
	 <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
	 <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
	 <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
	 <OS8PR06MB7541BD362CE9FC0AA3CFC46CF209A@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ryan,

> Sorry, for ambiguous.
> The global register like a mux selection for new/old register layout.
> Like following example.

That wasn't the ambiguous part - I think we are clear that there is a
multiplexer that controls what registers appear at the node's bus
address.

The question was more: it sounds like you're switching between
*fundamentally different* hardware units with the mux switch - not just
a different register interface for the same peripheral hardware. Is that
the case?

This is an important distinction in that some SoCs have the old
peripheral, some have the new, and some have the mux-switching between
both.

Behaviour of those two peripheral options differs beyond just a
"register interface", and calling it just a change in register layout is
misguiding the conversation somewhat.

If that's the case, then the separate compatible values may make more
sense.

Cheers,


Jeremy

