Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD013C39D
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 14:52:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yTKf4tnqzDqSq
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 00:52:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yTJb5qQ4zDqS3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 00:51:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=ybRP7Tmp; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47yTJW68CTz9s29;
 Thu, 16 Jan 2020 00:51:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1579096303; bh=BAeXisiY0OmrCyvzL7hKcDG25jzoFyFo4/lv9StDMXc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ybRP7Tmp2zsZsqoNT4ljyPMut6b4Y0QYr/2DMIgvyqyNZwpzzEPK1GqSP2PY9WsLr
 rnqDvfZWp+0lpUbWPBU50VDxbzU3qlklzkJi9m+xHC3NP6dR37NWyU0sLsJa1yutrB
 4ZJwRhEXANHd66ucQ3bViJjUkF2M/zElbg+vAL+F9RBV8xpxBLdKtDjFcnjRw2WjwW
 QZcJa66ZkwZh6xNS28RBED9mKRGbbelsyhtxVyTapAcw9GLOx2bPdGia/Ygj2jlY7d
 9RDGi3uExGMniQTxl1bgP8DxV4MmajxGNLGIUqHrfF9oXWK+LRty+HeQP1+XyyuedO
 fFIjBu4ANk/QA==
Message-ID: <ade63a1fda67cd8df1a2ba0638b1015878a0ac80.camel@ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
From: Jeremy Kerr <jk@ozlabs.org>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 15 Jan 2020 21:51:38 +0800
In-Reply-To: <20200114174532.GB3512@patrickw3-mbp.dhcp.thefacebook.com>
References: <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
 <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
 <20200114174532.GB3512@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: "Khetan, Sharad" <sharad.khetan@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 rgrs <rgrs@protonmail.com>, "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,

> > Just a suggestion - you probably don't want to be passing MCTP
> > messages over dbus - this is something we learnt from the IPMI
> > implementation.
> 
> Is there a pointer to this "lesson learned" or the issues surrounding
> it?  It seems like the btbridge is still using dbus, so I assume
> host-ipmid is as well.
> 
> https://github.com/openbmc/btbridge/blob/master/btbridged.c#L47
> 
> I'm curious to understand what the issues were/are.

No, nothing that anyone had specifically documented. I recall there
were concerns with shuffling larger amounts of data over dbus,
particularly for things like firmware update over IPMI. Because we're
using a dbus signal for incoming messages, we could potentially be
writing a lot of data to multiple processes - and more than necessary
if those processes haven't set up their dbus matches correctly.

I don't think there's enough concern to change existing code over for,
more just a consideration for future designs, of which this is one.

Cheers,


Jeremy

