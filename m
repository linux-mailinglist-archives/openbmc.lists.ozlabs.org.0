Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B093EA80
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2024 03:14:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f/+ZVXlp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXL3z5BVNz3cRR
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2024 11:14:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f/+ZVXlp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXL3P5HvFz3cML
	for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2024 11:13:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722215631;
	bh=XlRX6YhDP8EO1rZU6t9bsxzLFhv6nDZ5hmxY07asmdw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=f/+ZVXlp7IuUs+ljlUQtj2HhW5XjpMPKge7InvEsfqy5hSD05Tul7KscE5YL2Z+KZ
	 mv/GxhQ9s2U+4633P7UPDLf0J14fAbF61EPh4bmRrbyBG7CAXKPzP5V5RTyWI2VtPQ
	 5NGr1gXx9OIz6tdOe9fB5oijrB05XiYLX25e9xrgF72msMMfmVTT/TofyuuoMsSpPY
	 jEeIk+iwQRI2y+CA7+dul+2dPKwVB/H7XSmTsI3i9PKWhNjg2JQA2izjUEztf9fgtQ
	 P0F51jHHfLFHY5KiLY4A4h26X12jQPexbz+mU2Wz29+uYCsarDe9HuV2sKwcwtVLaj
	 Z48OJOPU9xoXQ==
Received: from [192.168.68.112] (unknown [118.211.93.69])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 58E7F66B02;
	Mon, 29 Jul 2024 09:13:50 +0800 (AWST)
Message-ID: <749dd8c83b569ef0d5ff032e57e0ce31185040d9.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-4.7 1/1] First commit driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Wenliang <wenliang202407@163.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Date: Mon, 29 Jul 2024 10:43:49 +0930
In-Reply-To: <20240726080137.49537-2-wenliang202407@163.com>
References: <20240726080137.49537-1-wenliang202407@163.com>
	 <20240726080137.49537-2-wenliang202407@163.com>
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

Hello Wenliang,

On Fri, 2024-07-26 at 04:01 -0400, Wenliang wrote:
> ---
>  Desktop/Linux-4.9.88/drivers/hwmon/SQ52205.c | 563 +++++++++++++++++++
>  1 file changed, 563 insertions(+)

Thanks for the patch. However, a few points:

- I'm not sure how you've organised your work, but the Linux git tree
doesn't contain paths like `Desktop/Linux-4.9.88`. You will need to
follow the regular process for kernel development (clone linux.git from
git.kernel.org[1] for instance).

[1]:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/

- OpenBMC's fork of Linux exists to minimise the time we spend
maintaining the kernel, while maximising the ability to integrate BMC-
related work from upstream as soon as we can. We've roughly settled on
running LTS releases and following the stable tags, while backporting
drivers and SoC support where necessary. This means you should send
your work upstream _first_. Once it's merged there we can backport it
to the OpenBMC kernel tree.

- The dev-4.7 branch is obsolete. If this patch were to be applied, it
would be applied to the dev-6.6 branch, as this is the current LTS.
Please make sure to test against upstream _and_ the dev-6.6 branch if
you would like to see the work integrated there.

- When sending your work upstream you should adhere to the guidelines
provided in the documentation. Particularly, "First commit driver" as a
patch subject needs some improvement. What subsystem (hwmon)? What
device (SQ52205)? It would be worth spending some time reviewing the
following resources:

A guide to the Kernel Development Process:
  https://docs.kernel.org/process/development-process.html

Submitting patches: the essential guide to getting your code into the
kernel
  https://docs.kernel.org/process/submitting-patches.html

All the best,

Andrew
