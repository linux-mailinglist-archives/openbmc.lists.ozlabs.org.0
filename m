Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B008395E5F8
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 02:16:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsWSb16ySz30TY
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 10:16:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724631403;
	cv=none; b=Sf3Kqy/m/9M5b97uebfZIQoSdGEbl2WxwWy+4SkXnPVGJb5sT1dfRsOzRyd0Lrbe6H55DH/mB+znmSI1U2JDX81YU2AHl8a5B7d9RV3idUYVpspNdE83aUsTOXQkg/2qr+N/C2defY/tgw8LSHmAzUNbV32ijrv1Gtg9Uj9d1jAtASbOTLwhT91K23uO27IAuHNbcjO30qhlObiUNXvps8D5zDApA7MbEf79w5Fsiehwt0M1qblZIaOlUnApxsSNifGz4MAm+oj8jgpV5RjRLvWy5B0liPzNXT9sKH8B5RjABu8r63Z1arx4xAzGe/pj/RRF8TacKxgmFq4ywMnM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724631403; c=relaxed/relaxed;
	bh=6MFzabNMKwrbEd2jFYd40q6yA1C8I8+SIgyzRie3RZs=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=kBUI6TOauvdmZu6Y4UK31bnh6D57AvA8pBsV8n41xa00S7sl4hu09oRRgE/x+o6RUyb3Dmz+j69pRdYfvpTWgA/hb4QNRlpOSwJK7SWNWHSZNp2jr6NJxzLz71/2cwGxF993aXrWn4eI+sd+dBMFyY6H1kJkGVYYpTFPd/5rZUhTGaFAhe0eGueA79BuVr8ky8HaYBGVdwjexj09duBE0hLyFp69aNiklwEYj2btNtRsn6DXtzGcCayZW9/4oQJH8zDw38qsi6wWtUVtX6VhteEYgzXyDKRn+V7ixpxGX2f/64e3AO4FopX0Vh3bstQv+n8xSlCnypwOgevFpR1cpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HBFZX0mN; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HBFZX0mN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsWSV5sGDz2xHt
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 10:16:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724631399;
	bh=6MFzabNMKwrbEd2jFYd40q6yA1C8I8+SIgyzRie3RZs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HBFZX0mNZ18YScuPbA4TGPFK3BOC+C4/uOXdQBlOxy+Flxh5uj+aDvyEGIR/WkqW9
	 ZhtnNlQMDdwlbIXMDGS09/QWazVgOLEq2lcwKAmMSjQ8sp83LTIsfA1nQeKVGWscwJ
	 V4Og6AjfUva2O97NxgPb9HIvG9psZ+Bs6e/h+Bqaks3rR2XK5snVgtEZgFiuCMiOZi
	 L5uCK1oH6ytG96mdJlR7ktZRDsLtuvfBGqgCZ06zBN2xyhToAL6M2ZnugXP7PuVv1+
	 IRdBN7/aHqHW+Vi1JEIzEUnTLkZgL/0uDOhqR9aOXSdnCZl5xF2DTlAjXPEZhu8NBG
	 PTnRTU4e+AYJg==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F3BD765047;
	Mon, 26 Aug 2024 08:16:38 +0800 (AWST)
Message-ID: <f20c390a4a201447d1371f890e97d51b70ac8162.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6] hwmon: Add driver for Astera Labs PT5161L
 retimer
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Cosmo Chou <chou.cosmo@gmail.com>
Date: Mon, 26 Aug 2024 09:46:36 +0930
In-Reply-To: <d1bedbe9-1eae-4991-9245-b0627b5ca0a1@roeck-us.net>
References: <20240823061533.3463647-1-chou.cosmo@gmail.com>
	 <20240823061533.3463647-3-chou.cosmo@gmail.com>
	 <d1bedbe9-1eae-4991-9245-b0627b5ca0a1@roeck-us.net>
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
Cc: openbmc@lists.ozlabs.org, cosmo.chou@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2024-08-23 at 11:42 -0700, Guenter Roeck wrote:
> On Fri, Aug 23, 2024 at 02:15:33PM +0800, Cosmo Chou wrote:
> > This driver implements support for temperature monitoring of Astera Lab=
s
> > PT5161L series PCIe retimer chips.
> >=20
> > This driver implementation originates from the CSDK available at
> > Link: https://github.com/facebook/openbmc/tree/helium/common/recipes-li=
b/retimer-v2.14
> > The communication protocol utilized is based on the I2C/SMBus standard.
> >=20
> > Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> > Link: https://lore.kernel.org/r/20240206125420.3884300-2-chou.cosmo@gma=
il.com
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>=20
> Please do not send such e-mails to unrelated mailing lists.

Right, however, I think Cosmo was just a victim of some `git send-
email` defaults. I expect --suppress-cc=3Dbody would have helped.

Andrew
