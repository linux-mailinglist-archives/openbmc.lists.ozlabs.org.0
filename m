Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B869B92
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 21:42:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nYpR4T0FzDqT6
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 05:42:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=raptorcs.com
 (client-ip=23.155.224.45; helo=mail.rptsys.com;
 envelope-from=tpearson@raptorcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=raptorcs.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorcs.com header.i=@raptorcs.com header.b="gl8SsRez"; 
 dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nYnp0XQjzDqSK
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 05:42:04 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 95342888FAB0;
 Mon, 15 Jul 2019 14:42:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5JPaeog09XBW; Mon, 15 Jul 2019 14:42:01 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 23765888FAAC;
 Mon, 15 Jul 2019 14:42:01 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 23765888FAAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raptorcs.com;
 s=A94A9A2C-6F84-11E6-B0DA-2EF54ACC974C; t=1563219721;
 bh=1E+VsMGLDzOqYxQk6lnxUIaSW9AC+brmqqK/vqiiPSE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=gl8SsRezz0yPVlfdvm9mArH6pmU6L/XHxH2knKbUP4dq6W3PMMRL0Sy3ojijkiG5s
 c9X27FdoIo715XUqL+r1KpHkf7AwsLVwMkBZSviX/542aHPZJSM/kQJrWMDKh8JssU
 POxfUY9MhQU96BkZzB26gpiQ+ZyMXgVHsFujwg2k=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id h5VACXae1Dwd; Mon, 15 Jul 2019 14:42:01 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 0581C888FAA9;
 Mon, 15 Jul 2019 14:42:01 -0500 (CDT)
Date: Mon, 15 Jul 2019 14:42:00 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorcs.com>
To: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <1887653429.250003.1563219720928.JavaMail.zimbra@raptorcs.com>
In-Reply-To: <e72e83d8-365a-8519-8ed7-614c2be82ddc@gmail.com>
References: <1601006714.273471.1562959285670.JavaMail.zimbra@raptorcs.com>
 <e72e83d8-365a-8519-8ed7-614c2be82ddc@gmail.com>
Subject: Re: CLA for Raptor Computing Systems, LLC
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC65 (Linux)/8.5.0_GA_3042)
Thread-Topic: CLA for Raptor Computing Systems, LLC
Thread-Index: FcdUjNTrwiXpKXuvPnZuCkHdkvInIw==
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
> From: "krtaylor" <kurt.r.taylor@gmail.com>
> To: "Timothy Pearson" <tpearson@raptorcs.com>, "openbmc" <openbmc@lists.ozlabs.org>
> Sent: Monday, July 15, 2019 9:05:31 AM
> Subject: Re: CLA for Raptor Computing Systems, LLC

> On 7/12/19 2:21 PM, Timothy Pearson wrote:
>> Please find CLA for Raptor Computing Systems, LLC attached.
>> 
> 
> Welcome! Thanks for signing. Your CCLA has been accepted.
> 
> I did notice that there is not any developers or CLA manager listed in
> Schedule A. Let me know when you would like to update that and I'll add
> to it.
> 
> Kurt Taylor (krtaylor)

For right now our legal prefers that sign-off authority be highly restricted; if I can get this relaxed over time I'll definitely let you know.  In practice that means I'll probably be the person responsible for review / sign off / submission of the patches from our development team.

Thanks!
