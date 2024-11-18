Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8C9D1B25
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2024 23:32:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xsj6r1tc3z3cTw
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 09:32:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731969138;
	cv=none; b=EYWUB/SeGMgmz0EmUYjiZx9owitC39YAI5g5COZ7iasG+HBYvHJwkw4cbU3VhfX8SvB/E7IMQajyNf7jD2WOwNBgPzCttmVF3S6tU5b/uHL8sKSdXEaJ/25yj8uYNtilBgT1Mgez718neBxXY/XermjvP4ul1+ZAow6uVAbLKqH7XDDBerzeFWnNqS1Yhpm44GMazYrQsf4z3bf99TSLfXs0oLJzH2izsKiH4TFVWjlkXwjkK0je2ZysxWrCsnpodB6vwzB/IU7JzmIt/F6zHOEZ0z19NYiS4hN4dzGBP5QwIbopQmBZM0OSOuN28YORDHBT0pDsovfGZX+G7mdrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731969138; c=relaxed/relaxed;
	bh=5aErXHvSRfyoWVmBYHxB758OOXtseYu60zbPywekSpQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fsHAMMvrVXTxkyYS/h4hogxzhMy60n7gG0sbbMQE2Q2Sa06nlJF2WdhIAOuLLFU2ykrAf9Bgzg6sbmS//9jAQn2Dm5JAaPX1bkwxPtAzqppiJDXZy9lyisclYZczSh0CqAIhMS64xJvyILCKBLzSkiL1Anfd1SlAOeBI6/irtnMmQwQz+SbanSYUgRhzTO9Eok+o3XgYXBe1PioZ6lL7FR7a2X/VAPwC/0apKILDZHWPhRV5IEhRGds1jd+ePNyFXqQblGOjrEbbXXMx+erVnA9fW1KvXOTe0n3P8t2rl8sCFFA2uuwwNHmEnp3F1sVUhMpnSxYUVZ7TuPF+80WiCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=h66HiovW; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=h66HiovW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xsj6m71Zlz2xCp
	for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2024 09:32:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731969134;
	bh=5aErXHvSRfyoWVmBYHxB758OOXtseYu60zbPywekSpQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=h66HiovWMBkR3g4FH5GO096GOSeQ/nMogmfdVWgET/gRGmf/oIFDLdu6M/fsDD2hW
	 55xAzD6mHpkhjKdFjBa6ymcuh8tduTypRxtpym0KUdGjYZq/mBqumZrvxVEZwL6j27
	 Rcj5evqKsC5SxTbfRSjpBPc7VO9657ZlJeMhTSPrsE+7oGlIfOF1vIdtYs3Hp8I3PM
	 vlpT1gJFgisAOo5hKN+5/sRYqXEUIgD3ciqxRueB5U9icgUGbfBSWPQ4V0TLYfSFtU
	 WQwzPt2b0+DCgx64xpBYWkumbJzaMuJRtQrgfpTNQuNvopCeWnRvjR5SBTiGIP4WJl
	 /WY/sI/DlUcWg==
Received: from [192.168.68.112] (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9526468D9B;
	Tue, 19 Nov 2024 06:32:14 +0800 (AWST)
Message-ID: <d3a8cfe496ea5374dfff13a938d845c8185ebb6f.camel@codeconstruct.com.au>
Subject: Re: Pruning obsolete BMC devicetrees
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, 
	openbmc@lists.ozlabs.org
Date: Tue, 19 Nov 2024 09:02:13 +1030
In-Reply-To: <81994aad-acc8-43f3-b29c-5f3e676760c8@linux.intel.com>
References: 	<b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
	 <81994aad-acc8-43f3-b29c-5f3e676760c8@linux.intel.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-11-18 at 13:35 -0700, Bills, Jason M wrote:
>=20
>=20
> On 11/10/2024 9:49 PM, Andrew Jeffery wrote:
> >=20
> > =C2=A0=C2=A0=C2=A0 2020-09-22 9e1cc9679776f5b9e42481d392b1550753ebd084:=
 aspeed-
> > bmc-intel-s2600wf.dts
>=20
> Intel no longer supports this system, so it's okay to prune the DTS.

This was a reference platform, right? How wide-spread did it get in
practice?

Andrew
