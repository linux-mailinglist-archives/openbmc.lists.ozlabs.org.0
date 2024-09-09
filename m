Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB4B9723DE
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 22:40:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2dxs4YW5z3cG5
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 06:40:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=162.0.218.228
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725914411;
	cv=none; b=VABonN2SUw0GVFf3/X94ldsByjdg8eQvabbAVtgbJdsi0gOB1FdzqJKHRo6DWvUQXnHh38DvX32iUzu3NhaF1GPCT7Hi6WqxtQeDd+A0tneF26+8cGEtMxEHR8FI8TntccPFVN0QXLvRgO1LEAhGtNM6xF/u0ya8PBPb1sRltnRJInwuX93ns/ohVIUpstRF9vxLIJvb2BfW2ikBiEsv4YjheEXZWxNMTIbt9F+LQqdbJ9KQtJ64vuJk1MHLpbxkl9ATtMLRQ3HHEe2aBodwHj8MkRiQRPKWeLLjq3GP/rTGXvP/M8VAQoQrvjkcGK0gWi+u/ORZ4LqhjmiYDBpCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725914411; c=relaxed/relaxed;
	bh=WaOrntoz37ASLnchZ0G2WcRL80WGCuGi8se9Rblzc3s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=a+XtgW7pTt01hsCtLpG0iA7FoF8rhcxWL0a2aG6RWuZ84gUJlzl9vl9NylwJsfzBZtYUS9tDeUi17YMIPhzf4Qxmx3fwLEGC+eZNSDQCazdpI1UEZmYT09PIflAV200ORHKbenJXJY1a8T1GoF3gLHUxF4sYjNTFqO+z09FKehKn+uFp/1JKcxVBqc4npiuBygfBUKKdBAB30H5AXXiCv0REip2RfyzF+isrYzVsP6WbBTJyAsuyyRZf5odjQgOZPUMDyZDxE6Uz8JxCT+FcL5Qh5/WM7WhFjUTr5b31i6uIlyG70nAl7uvSH6S5ThRPHA6esXQIr8pyCdXGFfmQJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gmills.xyz; dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=lXoznvXK; dkim-atps=neutral; spf=pass (client-ip=162.0.218.228; helo=h5.fbrelay.privateemail.com; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=gmills.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gmills.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=lXoznvXK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmills.xyz (client-ip=162.0.218.228; helo=h5.fbrelay.privateemail.com; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 377 seconds by postgrey-1.37 at boromir; Tue, 10 Sep 2024 06:40:11 AEST
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com [162.0.218.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2dxl1XF4z2yGD
	for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2024 06:40:10 +1000 (AEST)
Received: from MTA-11-4.privateemail.com (mta-11.privateemail.com [198.54.118.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 40E6863B4D
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 20:33:49 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
	by mta-11.privateemail.com (Postfix) with ESMTP id 2168E18000B3;
	Mon,  9 Sep 2024 16:33:42 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gmills.xyz; s=default;
	t=1725914022; bh=zENHO7zIfcWqqe7yZTmZGtAV6JowoNYgJAQyvLzad04=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=lXoznvXKwDhFgXSGzZllQynu4oAp3dBkVRnqGq9l6K68lt2sxXvehpCr1RLlhLJjU
	 RX+JFh2SvotAqArGkUwvLs+vqkqMop/wc/ksKf2vrFb6ComQHh+O25yrZznRuMaaL/
	 OXDYXxrCCKv5cKKTB44Gsh9i9+Rnk/fLhz5JotBJ/lnrKyviTPcc0AYOzcQMtEPoP4
	 0nbxI4aCNMBmpJVW8ucg9KO2sRuWBNloDCrDqnd7zXZypqFo0I9KV2Dx7eQOiFmi64
	 ckLG+ENMpudcYU8yd8gK8dRlOZTQPgWfDeew+8cOAIyTP3mn/46AfJjjDTHmjKx1lM
	 xFmynU1cLbMhw==
Received: from APP-12 (unknown [10.50.14.212])
	by mta-11.privateemail.com (Postfix) with ESMTPA;
	Mon,  9 Sep 2024 16:33:40 -0400 (EDT)
Date: Mon, 9 Sep 2024 14:33:40 -0600 (MDT)
From: Gunnar M <gunnar@gmills.xyz>
To: Patrick Williams <patrick@stwcx.xyz>,
	OpenBMC List <openbmc@lists.ozlabs.org>
Message-ID: <66805596.2207332.1725914020019@privateemail.com>
In-Reply-To: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
References: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
Subject: Re: TOF elections for 2024H2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev67
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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


> On 09/06/2024 1:38 PM MDT Patrick Williams <patrick@stwcx.xyz> wrote:
> 
> It is that time again for TOF elections.  The current roll-call is
> available at:
>     https://github.com/openbmc/tof-election/blob/main/2024H2/rollcall.json
> 
> For this half, we have 3 seats up for election.  Currently those are
> held by Andrew G., Ed, and Zev.  As Zev wrote earlier, he does not plan
> on rejoining.
> 
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
> 
> Nominations are due by Friday September 20th, 2024.  The election, if
> required, will be held immediately after with more details to follow.
> 

I will nominate Andrew G for reelection.

Thanks, 
Gunnar
