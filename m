Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665AA81A947
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 23:44:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l1s6VUB1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwTCG0X6tz30gM
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 09:44:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=l1s6VUB1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwTBh4C8Fz2xcq
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 09:44:12 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-80-147.adl-adc-lon-bras32.tpg.internode.on.net [118.210.80.147])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 67209200EE;
	Thu, 21 Dec 2023 06:44:09 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1703112250;
	bh=nYbPL5QEI89Zs7bLc7Nbl9oANrmL7X82z3hSiEkyQAA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l1s6VUB1cKf0lNLdAUq2DJPGaG6QP1/orWZOkp8LUjX29PFyt59EXcmrwwzDgquHy
	 wO7i2HFl+N/nfNo8r5zTxghbccl9BF5AqPe5m89jknSNJbeG+iEQLy8Kh95MJZ1DXs
	 LjDDKw4K0AQ60X9bCgJREwO+AJK05I6thYIWgZ/bvCNGQY7yNS5v4NH+Pe57z1BnxG
	 0gqQ3m6ucVFAOrfsKYfxeB/vA/+ONm32+xK0b7n1D2ujYaXA0QgTUTbIRnYmttTvA/
	 qlV/bLj7XIrRjv/t9atMwWqe60M4DTcRmqtBWgU5fox1l/ILdiyFUs5Ro95iKJzGpI
	 sy9B2rDw2EqMw==
Message-ID: <e16bcaa19915d9b3f8adf7f4deea15c033c5f0d6.camel@codeconstruct.com.au>
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>, 
	jozef.wludzik@intel.com, cezary.zwolak@intel.com
Date: Thu, 21 Dec 2023 09:14:06 +1030
In-Reply-To: <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
References: 	<47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
	 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2023-12-20 at 15:18 +0100, Ambrozewicz, Adrian wrote:
> I would like to apologize for this issue.
>=20
> We were undergoing serious reorganization recently and this indeed flew=
=20
> under the radar.

No worries, thanks for responding. As mentioned, it might be a good
time to assess whether there are others in the OpenBMC community with
an interest in helping maintain the telemetry repo, as it seems to have
a heavy dependence on Intel :)

Andrew
