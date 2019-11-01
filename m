Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1FEBC4C
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:17:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746nb60zQzF5TZ
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:17:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746mw6NkLzF4x9
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:17:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="DOPCm5Lf"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4746mw0ldZz9sP4;
 Fri,  1 Nov 2019 14:17:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1572578224; bh=HgDj0f8ZThUguh0wgW00Ft9utVoucZt3OILQ+Ai/B+Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=DOPCm5LfDHMFJYOcvB9YuLcxHrWSCMwQrDZnrzPpgfQ5MSyibzYeRr/WE8Q+cVR+B
 9pQ/dlV1GUhSpCswrCw1YczmQZ5740W3AJPBZPM0q1WSunkAUuI3pVpS2kQv+fGtqT
 sqo2bNctF7uVLkjb0BPt7ki4O38h66rZjGYPdibH2U9WypUAhLDYIOz/jzV701VkGl
 RFR/IDv7scWqKbBm/QjqJM1DtwMwzGTribNso/2uXBoV+LAnu1KEYqaTBh+bqBjtkv
 KI3NBrVCoRkatT1SgGdy2fYvKaY438AziTgH/iIe1VG78XbgDM3kE6KAwkyQR3NRLI
 W7mGLY+UfOGiw==
Message-ID: <93f40f731bedbf24fbcfe38964c0769de5dbf9ea.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 v2 4/8] fsi: move defines to common header
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 01 Nov 2019 11:17:03 +0800
In-Reply-To: <20191031053625.422-5-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-5-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

> The FSI master registers are common to the hub and AST2600 master (and
> the FSP2, if someone was to upstream a driver for that).
> 
> Add defines to the fsi-master.h header, and introduce headings to
> delineate the existing low level details.

I'm in two minds about this - it's a specific hardware master
implementation, while fsi-master.h is for the generic core API.

That said, it's probably neater than introducing a new header here, so:

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Maybe a potential future change: a unified driver that handles this
common hardware, just with different register interface implementations?

Cheers,


Jeremy


