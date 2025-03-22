Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A3A6CBA0
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 18:24:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKmQX3Plpz3c91
	for <lists+openbmc@lfdr.de>; Sun, 23 Mar 2025 04:24:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742664273;
	cv=none; b=D9t4t7VOIjwZJoooc9lMBt0muSVuNJf5/3Vf0Yte8k++1HmQUpuDDfKaXbnCGDWTiOSIbhjlytiuTwuqhGlb+OjxD6TiMPrEjB9CAppSKgETzATQFl29LL4qc2wVOawJ/Kk+fh9eDMP6nfz6wjJZnBd98VTbSGl4yZMMeBuAFrv2HFEBycQtWLxqD5a6iovlepR4nb3aF1rhu7ZZb91/6DwPJZKdHYJMqhh/bYccv6UH3dja2NKq4qBPheHLMqmpwUzMtH3Ry9lNMpf8mkzwer5YX1e9+7ytjXsTQzsYI38e5bUBYIf5nlDTcIQfGXIfQ3XcSXNrWlqlZ532mc7Ofw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742664273; c=relaxed/relaxed;
	bh=lMB21tvVMtr6UjvjYcijOBcTxx8pLLAcgEmgq0f+PTE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QIHpRGSDCo4Za5F48qd/7idNlrG39VfPvPScuPqU5zOjAAuc8WOVbce8eKJw+inFHiTiI0ng/gIBEO4tJduAklvT5UZAp5YhfmCSjWLLwWZHiYGs2jdkUhbRzEq5Y0qoXWw5Ls0QqdzZmSU73eh1Gvgj57X1+jgxsZwJIOgfQZBxlKLrbEhGyytoZ1+UnH7wvs5JJVNHxbIoVX5kVCD5fJkXqXkiKJE64KFx0I0A0SCW/GBj01ryMJbBDOh6EF/M9Vx5YoQuc5EXfwrryBM670oNCF4+d5zd3dyUnYE64i4dzk6Ccs2Uen01g9e13MEY9dJaCd46VH1MqDjY+x3boA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=OXOb4LEH; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=OXOb4LEH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKmQR35j7z2ySZ
	for <openbmc@lists.ozlabs.org>; Sun, 23 Mar 2025 04:24:30 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 131E482882C2;
	Sat, 22 Mar 2025 12:24:27 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id PrsfiOaWNGxf; Sat, 22 Mar 2025 12:24:26 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 346D482888F6;
	Sat, 22 Mar 2025 12:24:26 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 346D482888F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1742664266; bh=lMB21tvVMtr6UjvjYcijOBcTxx8pLLAcgEmgq0f+PTE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=OXOb4LEHweP3vzU3shc9oIXWNdGccGcfqr8xrf7FCxqX2wioXVouE0d5nHYTIV/v9
	 X9WHSmxtNIc2ltVODByGyKohl9VjXLls2OFIjYgyB/dNU2uHqgAOecGjTqiZQrU1hF
	 Dl6Fekto6UGqx2Yx2RL72mV5Mvy4/ozR65cOdwew=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hogkCqsM1wjL; Sat, 22 Mar 2025 12:24:26 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0822882882C2;
	Sat, 22 Mar 2025 12:24:26 -0500 (CDT)
Date: Sat, 22 Mar 2025 12:24:23 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Paul Fertser <fercerpav@gmail.com>
Message-ID: <709373445.19801813.1742664263471.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <Z930epdwnOw+9DkR@home.paul.comp>
References: <1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com> <Z92lMNqRcWrdmMrS@home.paul.comp> <Z930epdwnOw+9DkR@home.paul.comp>
Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC134 (Linux)/8.5.0_GA_3042)
Thread-Topic: marvell: Allow targets to skip MII RX/TX errata
Thread-Index: p8vFhyN3ujK67cZ9vFXJDWhj9xbuEA==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Paul Fertser" <fercerpav@gmail.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "openbmc" <openbmc@lists.ozlabs.org>
> Sent: Friday, March 21, 2025 6:21:30 PM
> Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX errata

> On Fri, Mar 21, 2025 at 08:43:12PM +0300, Paul Fertser wrote:
>> On Fri, Mar 21, 2025 at 11:30:04AM -0500, Timothy Pearson wrote:
>> > Upstream-Status: Pending
>> 
>> Pending what exactly and why? I guess you're supposed to send your
>> series upstream (to Linux devs) first, then after they're accepted you
>> can ask for backporting them to OpenBMC tree. There're exceptions but
>> you need to provide a rather convincing reason for that I guess. I'm
>> not saying that in any official capacity, just as a sidenote, Joel
>> will clarify if I'm wrong.
> 
> Huh, it wasn't at all obvious to me that your patches were meant for
> U-boot, not Linux, sorry (and you didn't specify that in the
> subject). There slightly different rules apply, but in general my
> comments should all be still relevant. Overall impression I got is
> that you're adding a bunch of hacks and that most things about them
> would need to be heavily reworked to become digestible for upstream. I
> hope more experienced developers will correct me if I'm wrong here.

No problem, I understand.  We're working with the customer to get to a point where these three patches will be dropped from the series, and only a v2 of the final Cronos board addition patch will be retained.  This platform was not designed by us, and that is where some of the constraints are coming from, but I will make sure the future patch set doesn't touch common U-boot code.

I am assuming that new OpenBMC platforms can be merged into the U-boot tree here vs. upstream U-boot, as upstream doesn't fully support the ASpeed device?  When I attempted to apply and test to upstream, there was a lot of missing code and it wasn't clear at all that the result would ever be bootable on typical OpenBMC hardware designs.

Thanks!
