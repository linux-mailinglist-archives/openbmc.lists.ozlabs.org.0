Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5B5C87E
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 06:43:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dBTP38jVzDqTb
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 14:43:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dBSs3726zDqTY;
 Tue,  2 Jul 2019 14:43:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="S3cXogx4"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45dBSr6w8Yz9s00;
 Tue,  2 Jul 2019 14:43:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1562042605; bh=iMxxUb/MrP5191LRn/nhBkFeow9aH4C71D4VIMnNmRM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=S3cXogx40ElVPWdtEYhfnIcMrb8TYMv+B1xiJHUGxAt2qAUgNfWW2IdQdPh9/Z8+A
 6fAWJGzr68M/oUWTxGC8wVYJ5iHEJx9Dtb5yBmfD/JczygqUAy2fD/1fpq15jR67k2
 M6q6aj4vxkQw5On2qFdn1MgBva2NLYCGr9J8oNAkKZNO5vqvzWujqb5hjtIMBmV9hB
 XW2b1yFEfaYiJrKpJDkSzPREBRvbm4imtcPS2nux5nGxSfV+skEBlxG50ZT22mUmvs
 7lENejasmL/gsS9/49RCMPote2mSjmE4NN9eowOcYQ+T7dlGswD9hMTzcGYbVaxC5i
 bSt/mlcGaIqxA==
Message-ID: <7cb3a9fce3c51837e7cc29fb15e10ed7c6d2631b.camel@ozlabs.org>
Subject: Re: [PATCH] MAINTAINERS: Add FSI subsystem
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>
Date: Tue, 02 Jul 2019 14:43:22 +1000
In-Reply-To: <20190702043706.15069-1-joel@jms.id.au>
References: <20190702043706.15069-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

> The subsystem was merged some time ago but we did not have a
> maintainers
> entry.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy


