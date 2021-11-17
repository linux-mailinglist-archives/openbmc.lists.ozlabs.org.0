Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7813454D0A
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 19:23:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvWWz3NXjz2yyK
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 05:23:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JmdKwVZT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JmdKwVZT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvWWX5lRJz2yTr;
 Thu, 18 Nov 2021 05:23:04 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEFD361BC1;
 Wed, 17 Nov 2021 18:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637173382;
 bh=sWJKe/8SQVs6SgDfWnpRWDalKpe+YyM+HJZGdR1UHtc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JmdKwVZTmueZEXGZMFqJYQfR5/Jy5cmEcFSy6rhizmg6ZYIUgmFfvtRNwgcrQqpiQ
 e6GXRfxT2hL65t9ZAwQJpw2/FbvQOPDvlx5R6yFkyDIYdPJtRSZ0oHUln2byNlzYJF
 l32Kuy/BVJ7bQ/pGUkU6Kz7xFWUf3KDnDEdhuNDlXbypFXeXZjEo4GcuWrI4HE8ZnI
 De1mQ5t/jP+wzG+08eBg3sQcozmBO5FjbZq/T1MecdALHcW5LLtsEOF9HSoq2vsYL/
 SLQrJzJH7GcKgz9w2COMHanpKVUJ3rFl0pYuP1umbgDczpci3NC795DhjCYQwOXWc9
 tTQ2Ek80wOSNw==
Date: Wed, 17 Nov 2021 10:23:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v6] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211117102300.68d00e9a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211117075513.GA12199@gmail.com>
References: <20211117075513.GA12199@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, Amithash Prasad <amithash@fb.com>, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 17 Nov 2021 13:25:13 +0530 Kumar Thangavel wrote:
> +const int padding_bytes = 26;

net/ncsi/ncsi-cmd.c:21:11: warning: symbol 'padding_bytes' was not declared. Should it be static?
