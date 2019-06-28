Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7E559586
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 10:04:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zq6P2BGczDqts
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 18:04:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zq5x3sG7zDqrW
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 18:03:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ixSaex71"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Zq5w42wkz9s3Z;
 Fri, 28 Jun 2019 18:03:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1561709028; bh=boM+Mf6WbkJ2DO8q6GP6RdfdzZngsCtNOs13wwYMpyA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ixSaex71cMX+LlMLIj+mcojr77dotGz5Vt8H0VbiDPy3azXceWSfwq3LBf+1b7c1c
 hJnVWgUW4fTmQygtv9GPEVvG4PgnLw7TpBkIvOekJcm94uAUhN4Vojhy/B8XoVBX4p
 QYarRiNXH+RCm5il3rq2KOXmDieWqC+0j91KrHrzNRtxqc61SaaRx7vVoBIoqjxB/X
 /rcUQ1rDjI0ULxw4ccUz7g81gt/8r7NrmHzV8ien7+vncYWr5gA/9eeMiE+MLbzosc
 eGyLSXAnN1q5Dp9c7nJIy2c4Xp1IQfzxIh930Oe0PTVRZKtfTZIvGJA1odMPDIgcCO
 6vp0VUxL+mCag==
Message-ID: <71919e713353e4bf9ce9a6a62267ecea95f945b6.camel@ozlabs.org>
Subject: Re: [PATCH] fsi/core: Fix error paths on CFAM init
From: Jeremy Kerr <jk@ozlabs.org>
To: John Wang <wangzqbj@inspur.com>
Date: Fri, 28 Jun 2019 16:03:47 +0800
In-Reply-To: <CAHkHK0-4hBz1bJggNnm7sOm15QcM-2C3RQA-QbpNt-R6BQP3xQ@mail.gmail.com>
References: <20190628064139.17408-1-jk@ozlabs.org>
 <CAHkHK0-4hBz1bJggNnm7sOm15QcM-2C3RQA-QbpNt-R6BQP3xQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi John,

> > +       return rc
> semicolon missed :)

Whoa, I must have removed that after the last test. v2 coming.

Cheers,


Hereny

