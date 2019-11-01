Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE73FEBC47
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:16:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746lp6dPhzF6WX
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:16:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746jB21LWzF6W1
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:13:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="bLJSbmS5"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4746j93khNz9sP4;
 Fri,  1 Nov 2019 14:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1572578029; bh=5kxidgpeBPeFNkjJL+NA21DU2TYmCkWEl1v0G9ydj5A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=bLJSbmS5NgltjWrjuiGmpYmu3xNi+oErgE1JG3nxyfoz3bg9xtrRJcTOHkV2VpKkF
 XoQ2my16P5zxyLnL/74e6tkP3UaIuvheCGjOeKriAQDvQ2OTAMSe76UFFcyTg+EnJG
 q+lOPGEl0V8b+8J3uj1YQo16+BIuu3YUyWC8FFuaBTglD7XIUDuu+z5odjfzWVsxiI
 fCFau+EE/UL4BYOuU8tBu190zHlHjjoSM3yvtdJZ0R3Rtr/ExJrZLq+Q7fUJto7Vf3
 jRYgL56V+0FenIFAgz9H1A9ZxMJSbBDGrAvafA702NRkQseum24sJGXSmhiAqhx/xW
 oRLPJViSF5NyA==
Message-ID: <dcb6c98c2621cfc5e48549f364ab7510372af851.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 v2 5/8] fsi: aspeed: Fix types in debugfs
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 01 Nov 2019 11:13:49 +0800
In-Reply-To: <20191031053625.422-6-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-6-joel@jms.id.au>
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

Looks good. Super minor, but if you do end up re-rolling this, might be
good to mention the correction in endianness in the commit message too?

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy


