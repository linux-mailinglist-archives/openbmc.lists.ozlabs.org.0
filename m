Return-Path: <openbmc+bounces-588-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87235B42F44
	for <lists+openbmc@lfdr.de>; Thu,  4 Sep 2025 03:55:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHMxw1rrdz2xns;
	Thu,  4 Sep 2025 11:55:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756950932;
	cv=none; b=LZt7virf/YurOxAYHMFa3QFVPSv/fpQxL9+sKB3yV/gM2zJxDBK5uZ4Mo6Ll+pVFA2H0GW6ThQwf2kHRSjh7nFbH94gyDx5cNYmqtIdc/zP+HlHVupM3BuThYqBknvkse4f6oc/gdT9eKqqSObBp5kP1voKjV+d2ns/WlyFeyKXV3bacBsV7S97IUQ7rd0hRgjIVcG/uJrOzVVCwO9EF0DibP/w0lVOYDw+nqqejVSPZl+zEO+2HgwbWmAADXQ9dcR1prs7xrf/dYtOYZ5yzVZ3L8q117/MzG2DwbWDqkfu24ZS1v/O5AsnLmffOHQgoMxF2arkE1SHbtdLbnfPVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756950932; c=relaxed/relaxed;
	bh=9ThEjAJHYoe1VIS23uavptx3FnDO2I9Smo3Dc1isPTM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MZaeblcRmwukjpH7QuQBM04gVwT2ld6kI8BeYW6tQ5alo35eGYi4f3yWSzD6j+Zf6h9xvZM79bw4Zp0HWGpN1c2Lpu4688n2OmR8C4mJ5vupp6UsbFGgG3lYZg2stolUI9KFX8WvEwm2PbEInaSLXLHlVVOhq2knG7xcIgeie8/U9to+x39zTMsIhQgkGLEytMOZOkqsePfcAKuebQ3uXm1Gx6ZvoHj5Ql/Axx/kpK2QDCV+WYqmDYTMgsXsVfEicV+We2l1WoLChLcCWYx9paktxR1p20hgu/hpJhjQs8laUOvE+4vRRvABbvnR3f4ZAnRylu1aqhAM0xXQORsVdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Nb5UxVhe; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Nb5UxVhe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHMxv0vKpz2xjv
	for <openbmc@lists.ozlabs.org>; Thu,  4 Sep 2025 11:55:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756950929;
	bh=9ThEjAJHYoe1VIS23uavptx3FnDO2I9Smo3Dc1isPTM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Nb5UxVhePl5z60jR99q8hHO9ULCrXUQumCrF3TMpuwJFXIGx98qyKXfMXjx+mbRgj
	 LbYuZku6u5M6MCD/LZdrEZbQe92HOGzzi/NJU53iCBuOKIg09bZ2v6PmUHr4fhl/V4
	 kk2hfs0iRqy1W0FG9exl0xYYpaZbGxfjHArHNea9GO4EMDRF1H0gSh/TGgUbQm1gF5
	 5HCJz/GpDPfUCY9DrWzt/vZvh7+yt9PCKYwP1+aL3ufh3TlulG/fXvkJHQQe0VURPe
	 8jfIl0ckdc1zLG2buiuC+57JrmKNSx8NJ8M8vWrIk5303WoxDW+3XAwa9m0QJYO9z6
	 YvyVBMp7nKS2Q==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4F07F6DFFE;
	Thu,  4 Sep 2025 09:55:28 +0800 (AWST)
Message-ID: <651ff3c762b276c315e67e010f08fb10b03eb29a.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.12 v2 0/6] Port linux fixes from dev-6.6
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, eajames@linux.ibm.com
Date: Thu, 04 Sep 2025 11:25:27 +0930
In-Reply-To: <20250903155810.2839634-1-ninad@linux.ibm.com>
References: <20250903155810.2839634-1-ninad@linux.ibm.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-09-03 at 10:58 -0500, Ninad Palsule wrote:
> This patchset forward port fixes from dev-6.6 to dev-6.12 branch.
> The conflicts were seen only in one patch listed below.
> - soc: aspeed: Add XDMA Engine Driver

Merged to dev-6.12, thanks.

Andrew

