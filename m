Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ACC888C0C
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 05:07:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JD2lFsF3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V2ztN5DNMz3cZR
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 15:07:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JD2lFsF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V2zsr2cHsz2ysD
	for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2024 15:07:28 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.226])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C75E320173;
	Mon, 25 Mar 2024 12:07:21 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1711339643;
	bh=CoIVJFIQSTbqr5S+Y1jqyUTRm7+NCvDEjH3kJb4GA1I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JD2lFsF3Y4YGLkcLS/dWqfkCpWRuBMmPxDy1yYYjH2yrYh7l5eoyNjIOR7Z1ec04P
	 WEQYUFzz4tiRhGNYCOukAkXEHWLjx2Q1R3sGX7xc2ctUbwc70Zs12SQqhOojUhJ34V
	 irczeoyn331cn5yeAHZ6CmkTNLf9cUMRTtuk+bVQMYsyyq5rDFjueKPOtfNAaCxa9I
	 4v+lj6ELvuD4qGyCnNLyfgHkDtKIyEflwEQMOkXrsL0BKRqctwLWVdQ+ZrhaRBEPog
	 qb1E4tsk55pZjKUtY2BHrhmIEOjCJtiPTFxvLhPX/sQq+no4KxoZWgaFKVo9bEhs+v
	 uafHgnAtPiWmw==
Message-ID: <41240fd88cfa0364c9fbb6245f317eb67bfa0842.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6] ARM: dts: Aspeed: Bonnell: Fix NVMe LED
 labels
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Date: Mon, 25 Mar 2024 14:37:20 +1030
In-Reply-To: <20240321145952.190544-1-eajames@linux.ibm.com>
References: <20240321145952.190544-1-eajames@linux.ibm.com>
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-03-21 at 09:59 -0500, Eddie James wrote:
> The PCA chip for the NVMe LEDs is wired up backwards, so correct
> the device tree labels.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

I've applied this to openbmc/linux dev-6.6 and my for/bmc/dt-6.10 tree.

Andrew
