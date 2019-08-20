Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC3D95565
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 05:37:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CGgz2dhczDqhT
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 13:37:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CGfk6pZnzDqdg
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 13:36:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="DWtPZCcl"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46CGfk28XVz9sNk;
 Tue, 20 Aug 2019 13:36:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1566272174; bh=lvdSd9AxIRtif2xO+zq/jufN/nkLaPmS+rg53VKmAag=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=DWtPZCcldG0QLTuo3WqfuE2vGifFeoYm4HIH5Pnt3xBTiYPGEpES0DxKH5ooYVT4G
 RniOoUwNWfJJY8yXBfkyGOnOSULNp/XcfzBt+3JyALRzDLcd4yH/xhEEu7g2vT4o+h
 DInCxBBBZ9bxp9Jnevb1ZWHVhxRFVPo9/W1+oUz+ZvOe4mwR5sabdmp0tw0XdCZ2an
 91RG+CWM6L2/w2ITw5FPuQb660h1vvLyHohHfB4PNNrPXCoL5WB/Oroa79sfrl5QBd
 l7/ZIfthT6yV5ARRNdWpKG82/G9k9dPC1akWgqY/YKo4wJ/TcJlhbwDiqUvjPrEGjO
 0ag4A+S3ClkiA==
Message-ID: <631265d9997044632bada77a2537d976b282073f.camel@ozlabs.org>
Subject: Re: [PATCH dev-5.2] fsi: scom: Don't abort operations for minor errors
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>
Date: Tue, 20 Aug 2019 11:36:09 +0800
In-Reply-To: <CACPK8XdiiZdnX4VXkkZzUm=Ygd8P6W0akCJ=X2SaHmBX0=8pWw@mail.gmail.com>
References: <1565896263-26277-1-git-send-email-eajames@linux.ibm.com>
 <CACPK8XdiiZdnX4VXkkZzUm=Ygd8P6W0akCJ=X2SaHmBX0=8pWw@mail.gmail.com>
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

Hi Joel & Eddie,

> > The scom driver currently fails out of operations if certain system
> > errors are flagged in the status register; system checkstop, special
> > attention, or recoverable error. These errors won't impact the
> > ability
> > of the scom engine to perform operations, so the driver should
> > continue
> > under these conditions.
> > Also, don't do a PIB reset for these conditions, since it won't
> > help.

OK, that makes sense to me. Provided the scom engine is in a working
state when SCOM_STATUS_ERR_SUMMARY is set, then I think we're good. On
that assumption:

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy


