Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF11396D5
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 17:54:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xKSv4NzZzDqJt
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 03:54:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xKRy1Qj9zDqJs
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 03:53:58 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 08:53:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; d="scan'208";a="397212849"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2020 08:53:54 -0800
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Jan 2020 08:53:47 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.58]) by
 FMSMSX161.amr.corp.intel.com ([10.18.125.9]) with mapi id 14.03.0439.000;
 Mon, 13 Jan 2020 08:53:47 -0800
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vijaykhemka@fb.com>, rgrs
 <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: MCTP over PCI on AST2500
Thread-Topic: MCTP over PCI on AST2500
Thread-Index: AQHVn2VSe/daZ1HR/0SJwnpAq7UT7qeUJeQA//96gqCAA0FRAIAtBQZQgB6Aw4CAAXo0gIAFPlBA
Date: Mon, 13 Jan 2020 16:53:46 +0000
Message-ID: <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
In-Reply-To: <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.108]
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:
>=20
>=20
> On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
> > Hi Andrew,
> > Sorry for late response.
> > The plan is to have MCTP in user space.=20
> >=20
>=20
> How are you handling this then? mmap()'ing the BAR from sysfs?

>Sorry, let me put my brain back in, I was thinking of the wrong side of th=
e  BMC/Host MCTP channel. How much were you planning to do in userspace on =
the BMC? As in, are you planning to drive the BMC's PCIe MCTP controller fr=
om userspace (presumably via /dev/mem)?

=20
For implementation on the BMC, we agree that it's better to do it in kernel=
 (and as you mentioned  - use consistent interface to upper layers, provide=
 another transport). However, given the time needed to implement things in =
kernel (and the review after), we are starting with a short term solution. =
We will be implementing MCTP (protocol elements) in user space, along with =
a low level MCTP PCIe driver just to push bits on PCIe. Iwona is working on=
 this and should be able to describe the exact primitive.

Thanks,
-Sharad
