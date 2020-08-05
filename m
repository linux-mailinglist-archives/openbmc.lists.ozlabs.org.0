Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A123C4E2
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 07:03:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLzzs3PHdzDqgM
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 15:03:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=qo9d3yky; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLzz06jnVzDqdc
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 15:03:08 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6A68B4C84F
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1596603781; x=1598418182; bh=GWWCP4uVKAqjH/BCK6IUJUAPl
 nJNIn9T1IzaD5j0Kno=; b=qo9d3yky28HnaLT/3vNffJ+fdubpayUUKdknBPHCs
 q+thkGiDHvWFVe6KRPWUkKibGbYcWbUrIsg36HI4XXJ6Cq/xrhxVnmn+D516neBu
 Z6BbM2Nr1tKv6jiFrAKymbaHEfKooVPR4SDVv0DandzODedjjzYViOQ2tVoQksVw
 fQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVhyrK83i3h7 for <openbmc@lists.ozlabs.org>;
 Wed,  5 Aug 2020 08:03:01 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id F0D504860B
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 08:03:01 +0300 (MSK)
Received: from [10.199.0.34] (10.199.0.34) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 5 Aug
 2020 08:03:01 +0300
Message-ID: <60a45667d9df8f35f26152ded3176eaaa5c1c137.camel@yadro.com>
Subject: Re: OpenBMC : FRU Inventory management
From: Andrei Kartashev <a.kartashev@yadro.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 5 Aug 2020 08:03:00 +0300
In-Reply-To: <CACWQX80rQkOZ00q3C9HcR8deSbekcVF8GE2e7-HC-Wxt5i4DMA@mail.gmail.com>
References: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <e00d409b-a845-85ee-16d7-0bb53f1e013e@linux.vnet.ibm.com>
 <BN8PR12MB32820389DABEE2E32ED84E57C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <3b6f8a090359d4ffebf3ef98a9aeb7e77df7b10f.camel@yadro.com>
 <CACWQX80rQkOZ00q3C9HcR8deSbekcVF8GE2e7-HC-Wxt5i4DMA@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.34]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

Thank you for answer,

So is this means there is no any fully functional platform based on
Entity Manager yet?

SMBIOS solution looks like good example. As far as I understood, it
depends on some external component which will read SMBIOS memory and
place it to BMC (e.g. using ipmi oem commands).

On Mon, 2020-08-03 at 00:49 -0700, Ed Tanous wrote:
> On Fri, Jul 31, 2020 at 2:02 AM Andrei Kartashev <
> a.kartashev@yadro.com> wrote:
> > Hi Deepak,
> > 
> > Saying about inventory management for non-BMC accessible resources
> > like
> > CPU/DIMM with EntityManager: is there good example demonstrated
> > preffered way to do so?
> > Trying to bring up system based on that Intel's fork, but looks
> > like
> > they have own way to do things ).
> 
> https://github.com/openbmc/smbios-mdr is probably what you're looking
> at?  If you're trying to implement a custom inventory scheme, that's
> probably very similar to what you want to do for your custom type.

