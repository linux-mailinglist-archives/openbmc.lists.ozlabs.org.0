Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5518BCF7A
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 15:49:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=WZmddShb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY2pT0qV0z3blN
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 23:49:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=WZmddShb;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY2nv5gr3z2yG9
	for <openbmc@lists.ozlabs.org>; Mon,  6 May 2024 23:49:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1715003360;
	bh=TrJBKOFeHNHTVl4vqvoSxC/IygwCtN3+nC/Sfq3sN9E=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=WZmddShb4E1ZTwqm5Ie8WXF3fRnzzh0n3Yh3UE6ZuKNL5udRUttacr+DgElofksGS
	 ThGNwpCZnJHD8HheOEfpzxU67+DjrGQD5oL/RWV5ruF/y9KpVW9smOP05izR7UqLJp
	 LCC2zgVNzy487Dwt5aegtnrOTJ5DnlQvW7kDTwcWqam2v5E9xIVBsvJr92tX6S/Xx7
	 +5WemyFPToPV+KcUp92wUugcxDIajSL6nneIDH+SP0trRTt6pWT5Hw+L3ee9Z02chE
	 3y3oCXnpZwl7sUZg7wzp3ERAJdOgnr5CL1yKxIf/VHBAmy3nO6lnMcxC3FME40WLfw
	 bIkEM8gnH03Bg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VY2np64Vkz4wny;
	Mon,  6 May 2024 23:49:18 +1000 (AEST)
Message-ID: <d8f1e86eccb91d02b22648fd69dd38b2ce4a6494.camel@ozlabs.org>
Subject: Re: [PATCH dev 6.6 v1 0/2] i3c: backport mctp-i3c driver
From: Jeremy Kerr <jk@ozlabs.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, 
	joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Mon, 06 May 2024 21:49:16 +0800
In-Reply-To: <20240506104802.1225466-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240506104802.1225466-1-Delphine_CC_Chiu@wiwynn.com>
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

Hi Delphine,

> Backport mctp-i3c driver from torvalds/linux.
> Also need to backport the commit to support for bus enumeration=20
> & notification for mctp-i3c driver.

All looks good to me. I have the same set in a backport branch if it
helps:

https://github.com/CodeConstruct/linux/tree/backports/mctp/openbmc-v6.6

Cheers,


Jeremy

