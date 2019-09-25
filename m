Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A310BD617
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 03:24:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dL1d61X3zDqg7
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 11:24:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dL1326nZzDqfL
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 11:23:28 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 18:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,546,1559545200"; d="scan'208";a="183099021"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 24 Sep 2019 18:23:24 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 24 Sep 2019 18:23:24 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Sep 2019 18:23:23 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Sep 2019 18:23:23 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.113]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.32]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 09:22:19 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: OpenBMC CVE issues in openssl
Thread-Topic: OpenBMC CVE issues in openssl
Thread-Index: AdVyfreiWxhXubG7QG+GhqVvf1a70///f3eA//95KACAARWRAP/+jHAQ
Date: Wed, 25 Sep 2019 01:22:18 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E52D1AC@shsmsx102.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E52C8BD@shsmsx102.ccr.corp.intel.com>
 <FAD2D9A0-A730-4A28-9798-0B8B3228E14F@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E52C90B@shsmsx102.ccr.corp.intel.com>
 <A939C572-3918-43F2-A444-5211C49EF17A@fuzziesquirrel.com>
In-Reply-To: <A939C572-3918-43F2-A444-5211C49EF17A@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
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
Cc: "Jia, Chunhui" <chunhui.jia@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Mihm,
 James" <james.mihm@intel.com>, "Shi, Yilei" <yilei.shi@intel.com>, "Xu,
 Qiang" <qiang.xu@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,
It's great. Thanks a lot.

Thanks,
Kwin.

-----Original Message-----
From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]=20
Sent: Tuesday, September 24, 2019 7:12 PM
To: Wang, Kuiying <kuiying.wang@intel.com>
Cc: openbmc@lists.ozlabs.org; Jia, Chunhui <chunhui.jia@intel.com>; Shi, Yi=
lei <yilei.shi@intel.com>; Mihm, James <james.mihm@intel.com>; Xu, Qiang <q=
iang.xu@intel.com>
Subject: Re: OpenBMC CVE issues in openssl

at 10:48 PM, Wang, Kuiying <kuiying.wang@intel.com> wrote:

> Hi Brad,
> Ok sure.
> I prefer to upgrading openssl related separately first and then others.
> Because I have urgent requirement for the latest version to fix=20
> security issues, do you agree on that?
>
> That means I submit another patch just to upgrading openssl to 1.1.1d,=20
> is it acceptable?

Hi Kwin

I merged 25306 this morning which contains 1.1.1d.

thx - brad
