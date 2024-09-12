Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D15975F98
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 05:18:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X42gy1gvMz3c72
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 13:18:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726111083;
	cv=none; b=Z4jQgOCxbUQbX1kNMxDvb92Ol7zwZXklsVlop7oCKlcfi7IrnbtsLUUQIYNEyX2TcTaRpbiKZ6STR8zyX7WJi4+SoVQMyQQk8BTGVdquPL2oKsqiJKho7pZraWo8tBgRMTEfY8nXz/vA4jGAqZn210ZVPRsspMrp4CpBNCFeUPRDnGajPhrd7g49MIRmWyWfb1KQd/pShCwZIO0lEO9etF+fqPdK1zzYA28jq1uunnQA5PIa/hB7M7TJ3EVXVBWkmBS7vDG+gcPUhJWm2Vk+abca5DmxvuYeBT/61p2dhz1bwlJCZNbnhSH2YyeI5IOo/+gDDVWB2PwAhqfBCQuPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726111083; c=relaxed/relaxed;
	bh=f/XhJSgctVDvlv4GVO532wMo4WC7B8vUv7gHPcMm3jc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=awVXPdeYIzYBqg8T+dohjgnIjehMKCbRq7OjNhg6fTLd189gnqY9GB+ZvDh7sQv+9blGJqa/x2iRUqdzquB0OoPqv0DKf1G0ErNn6HbbQ/R1CFq6X9GZzXCg4r7pq6khKwH7sOJTEXCc1imel5uLiDkJeo445BzvTN0sI2P/D0W9Kfa5+8H9BtU4Ah4WBL+TCuZTo6DtW1+bPm+Ce3fk948lL3Ee5e6dpJ2o9QoThDEJS8gJQV4i5U7Uld3Scsixv9cZfi/D6TAwenySljIEFxF2n69tgNXyzeyMrWw4/amlM/sR1Mgrc4mWJ6NYNRBaUixsnlHKMeZ1DFns86o/Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NrRhwUK8; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NrRhwUK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X42gv4Yk8z2y8k
	for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 13:18:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726111083;
	bh=f/XhJSgctVDvlv4GVO532wMo4WC7B8vUv7gHPcMm3jc=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=NrRhwUK8/Io2vySTLVHlLXaFQ+pQ0KhGqj2/hgNA1yjo3x4D1HmslRIIeatigL/Oc
	 ctLvaZRfVJ4bP45SftWIXvgGo2l+Z8OnQoDreZ4uDVKf2sqaiphSC6qkr5lIpEVD/6
	 jzDq64z4a66gf6UjlgAbsaIjH+WfYWUe8BJjXdSzzFx2QjK/bangcwq9FzktMlNtRN
	 S/snlcVclZrrHgUZDOmnJgHABuO1baZMpi5smvIpLiF8RcxQDPycSwv/FQkmbhp7C/
	 K0xxi+h762pmJ62CwFz4dfbdNOJ1ycWIRXUnWD/lVkUDel45qtnSeVXnjaBTDf1bRu
	 LX+oiVyisyqdQ==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B7E3A650D6;
	Thu, 12 Sep 2024 11:18:02 +0800 (AWST)
Message-ID: <15bc181d5cbbdef6590e1945ace206a00525b477.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6] ARM: dts: aspeed: Fix Rainier and
 Blueridge GPIO LED names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Date: Thu, 12 Sep 2024 12:48:02 +0930
In-Reply-To: <20240903155947.425132-1-eajames@linux.ibm.com>
References: <20240903155947.425132-1-eajames@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-09-03 at 10:59 -0500, Eddie James wrote:
> Blueridge updated the LED names to include the "led-" prefix as
> upstream required. Rainier should match for ease of application
> design. In addition, the gpio line name needs to match.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Is there an equivalent patch upstream? If not can you first send one
there, and we can backport it?

Andrew
