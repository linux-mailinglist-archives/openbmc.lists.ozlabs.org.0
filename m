Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E28DA2FD
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 03:22:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46trxw3ScNzDr80
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 12:22:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46trxJ0s6czDqlD
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 12:22:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="lSFKsAMb"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46trxH1tY9z9sP3;
 Thu, 17 Oct 2019 12:22:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1571275331; bh=75xk9WgnTkuSAvRrzhaXO6oV6isPfSFD2wx3d7Ip4WE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=lSFKsAMb7b4Fj5ZU7sFSQtPA0oDVNsTmUaip2YaTIzRhGOeT7M8NyiUmiXgOW3hs2
 I3aqbLELl7LMtE6Czt0wvaqEJp4yo0ePH2WlllYsncKQ6MuZgYvJwWYIU1gU8SukiB
 srst1h++XHqngIIPTkrpxcSoI+zlAit+rii1td2K3QQKmc3Bf74E3G80evn7Bg4k5j
 VukW187RFZW1tKWLk9Jw7slxMH1FonV86744/yptPaR6EOfHOfMEoDC2gPrKI1H0TG
 Vkh0sTs0umPsW/7dctuy/2a9JHWIFJoXDyuvU02u9PqfglsJwqBaMnPAoLsCQbVDOg
 f476bApNeRN6A==
Message-ID: <a5b30ead2b83975f236c635a240364f8164d1a41.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 v2 3/3] fsi: aspeed: Disable IPOLL
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Thu, 17 Oct 2019 09:22:08 +0800
In-Reply-To: <20191017002955.2925-4-joel@jms.id.au>
References: <20191017002955.2925-1-joel@jms.id.au>
 <20191017002955.2925-4-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

> Having IPOLL enabled when turning on the host causes FSI to stop
> working.
> 
> In the future we will need to add a mechansim for the BMC to enable
> IPOLL once it is ready.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

... in parallel though, we'll see what the underlying issue is.

Cheers,


Jeremy

