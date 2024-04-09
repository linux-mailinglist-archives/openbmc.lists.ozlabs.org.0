Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D918A89D7BD
	for <lists+openbmc@lfdr.de>; Tue,  9 Apr 2024 13:20:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Wa0TuwjA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDNm14hhmz3dWW
	for <lists+openbmc@lfdr.de>; Tue,  9 Apr 2024 21:20:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Wa0TuwjA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDNlR24KNz3d2W
	for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2024 21:19:31 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B03DB2012B;
	Tue,  9 Apr 2024 19:19:26 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712661568;
	bh=Ov33VvBrK8VrGX8RTLeIh/rfim0WvievaB4mUkXum2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Wa0TuwjAAPxJpRhxaHC4s68wufA5r9zSYryHu0Sluxl86o3relE9r+fAp+Q9yx5xE
	 5UfBkoxy9OmxjNc/KDFLu5MpYgeCWm97dssbtv8RVyOJZeDRFUONNkKSUyp538RFMM
	 CwERlO9dQgp4R/eD8Yefn1mv0Hlizcsm+GoFdF9Nq8pF/hYm+hgMMLGuAYPWEdkhnO
	 5Cjp6/WS2nANtnbsE+EMEpEfIfHs/WGDXYnunDlxyCT11E10JW6WPmxLbGyrhMxABR
	 oGsDgiGtY0VmXtyvQ/1vum1P1eOurMl+FAohRd0P54tLjM6MNy4GIt3pBbWSQfT3lk
	 yzaNAPp+6H6+Q==
Message-ID: <82615949687f273189ac0b74690c07cab6feb45c.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 0/3] Support pwm/tach driver for aspeed
 ast26xx
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Tue, 09 Apr 2024 20:49:25 +0930
In-Reply-To: <20240408105100.2946497-1-potin.lai@quantatw.com>
References: <20240408105100.2946497-1-potin.lai@quantatw.com>
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
Cc: billy_tsai@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-04-08 at 18:50 +0800, Potin Lai wrote:
> Add pwm/tach driver support for aspeed ast26xx.
>=20
> LORE Link: https://lore.kernel.org/all/20240221104025.1306227-1-billy_tsa=
i@aspeedtech.com/

Thanks, I've applied these to openbmc/linux dev-6.6.

However, do note that there's as yet no update to aspeed-g6.dtsi, and
therefore anyone looking to exploit the driver has a small amount of
extra work to do. It would be nice if someone submitted a patch to
address that.

Andrew
