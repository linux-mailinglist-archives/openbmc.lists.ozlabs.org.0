Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC74ED705
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 11:33:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTdQj1vd4z2yw1
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 20:33:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=v9uQyhos;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=yadro.com (client-ip=89.207.88.252;
 helo=mta-01.yadro.com; envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=v9uQyhos; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTdQH0xyzz2yHX
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 20:33:10 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4124A41257;
 Thu, 31 Mar 2022 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1648719184;
 x=1650533585; bh=VpkK3Y1iE5GIBwC9pwTNCECBf4j9ZM2iAIXptoy4Gkk=; b=
 v9uQyhoshRMDyGEh7DQ8rOENLTycemlbUfcJ6kSQZs2c/T9vzDL9I3W+33po/RLf
 xi4QWq5MzEQLqWG+q7X2sO+fUDokuK9sam9Fkaz+jOpe5472QAlvpFClbZG7kDXM
 lAR4gt0U1CGJKF2BpFGT94WVVJ2jH1w8EQOeS7d8Pj4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFPPq9SmydcR; Thu, 31 Mar 2022 12:33:04 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 927204152E;
 Thu, 31 Mar 2022 12:33:01 +0300 (MSK)
Received: from localhost (172.17.1.114) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 31
 Mar 2022 12:33:00 +0300
Date: Thu, 31 Mar 2022 12:33:00 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Subject: Re: Multi-led configuration in dts
Message-ID: <YkV1TIPJ7rPfip8A@nbwork.lan>
References: <CALXuKJc_pYJv0xYWtN5mzbHwpbHshukg34BjSzhqmpTdUMXwXg@mail.gmail.com>
 <Yjx1OQt7YRgD0OHt@nbwork.lan>
 <PSAPR04MB47261F3666AFD3FC08D0D7A2A71F9@PSAPR04MB4726.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <PSAPR04MB47261F3666AFD3FC08D0D7A2A71F9@PSAPR04MB4726.apcprd04.prod.outlook.com>
X-Originating-IP: [172.17.1.114]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: "spinler@us.ibm.com" <spinler@us.ibm.com>, sri d <srid.11486@gmail.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrickw3@fb.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 30, 2022 at 04:04:28PM +0000, Velumani T-ERS,HCLTech wrote:
> 
> Thanks for your response. There are two ways to get this done.
> 1. bring support in phosphor-led-sysfs for defining multi-color and use them in the application
> 2. Add support in multi-color led driver framework.
> @Alexander @Andres Jefery Please provide your suggestions. We may be using this in multiple platforms. We can plan for the implementation.

I had the similar question earlier:
https://lists.ozlabs.org/pipermail/openbmc/2021-October/028045.html
It looks like a preferred solution is 2.


> 
> Regards,
> Velu
> 

Cheers,
Alexander
