Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F061285EE
	for <lists+openbmc@lfdr.de>; Sat, 21 Dec 2019 01:16:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fmP33fQ9zDqsJ
	for <lists+openbmc@lfdr.de>; Sat, 21 Dec 2019 11:16:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fmN753r9zDqsQ
 for <openbmc@lists.ozlabs.org>; Sat, 21 Dec 2019 11:15:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 16:15:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,337,1571727600"; d="scan'208";a="218963918"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 20 Dec 2019 16:15:07 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 20 Dec 2019 16:15:07 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.58]) by
 fmsmsx156.amr.corp.intel.com ([169.254.13.211]) with mapi id 14.03.0439.000;
 Fri, 20 Dec 2019 16:15:06 -0800
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vijaykhemka@fb.com>, rgrs
 <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: MCTP over PCI on AST2500
Thread-Topic: MCTP over PCI on AST2500
Thread-Index: AQHVn2VSe/daZ1HR/0SJwnpAq7UT7qeUJeQA//96gqCAA0FRAIAtBQZQ
Date: Sat, 21 Dec 2019 00:15:05 +0000
Message-ID: <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
In-Reply-To: <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzQ0MDhlNTktYjAwMy00MTUwLWE2YzUtZWI3NjQwZGE1ZmY2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiXC8reVN6WUFPYkVjeFMrK1VBWGpLcXhjdjdsTzQ1bU0xbFNuekREVmJPam9Pb0FITFY1M3A3dEVcL2YrNEd2eUc2In0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [10.1.200.107]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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

Hi Andrew,
Sorry for late response.
The plan is to have MCTP in user space.=20

Thanks,
-Sharad

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>=20
Sent: Thursday, November 21, 2019 4:39 PM
To: Khetan, Sharad <sharad.khetan@intel.com>; Vijay Khemka <vijaykhemka@fb.=
com>; rgrs <rgrs@protonmail.com>; openbmc@lists.ozlabs.org
Cc: Jeremy Kerr <jk@ozlabs.org>; Deepak Kodihalli <dkodihal@linux.vnet.ibm.=
com>
Subject: Re: MCTP over PCI on AST2500



On Wed, 20 Nov 2019, at 17:29, Khetan, Sharad wrote:
> =20
> Intel is working on MCTP over PCI (VDM data transfers). We will share=20
> details shortly.
>=20

In the kernel? What does the userspace interface look like?
