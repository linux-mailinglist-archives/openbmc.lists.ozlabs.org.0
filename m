Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F54BC089
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 04:58:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cm8R0TFCzDqCc
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 12:57:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46clxT4FXzzDqRw
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 12:48:27 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 19:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,542,1559545200"; d="scan'208";a="189232494"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga007.fm.intel.com with ESMTP; 23 Sep 2019 19:48:24 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Sep 2019 19:48:23 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Sep 2019 19:48:23 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.113]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.195]) with mapi id 14.03.0439.000;
 Tue, 24 Sep 2019 10:48:21 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: OpenBMC CVE issues in openssl
Thread-Topic: OpenBMC CVE issues in openssl
Thread-Index: AdVyfreiWxhXubG7QG+GhqVvf1a70///f3eA//95KAA=
Date: Tue, 24 Sep 2019 02:48:21 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E52C90B@shsmsx102.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E52C8BD@shsmsx102.ccr.corp.intel.com>
 <FAD2D9A0-A730-4A28-9798-0B8B3228E14F@fuzziesquirrel.com>
In-Reply-To: <FAD2D9A0-A730-4A28-9798-0B8B3228E14F@fuzziesquirrel.com>
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
Ok sure.
I prefer to upgrading openssl related separately first and then others.
Because I have urgent requirement for the latest version to fix security is=
sues, do you agree on that?

That means I submit another patch just to upgrading openssl to 1.1.1d, is i=
t acceptable?

Thanks,
Kwin.

-----Original Message-----
From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]=20
Sent: Tuesday, September 24, 2019 10:41 AM
To: Wang, Kuiying <kuiying.wang@intel.com>
Cc: openbmc@lists.ozlabs.org; Jia, Chunhui <chunhui.jia@intel.com>; Shi, Yi=
lei <yilei.shi@intel.com>; Mihm, James <james.mihm@intel.com>; Xu, Qiang <q=
iang.xu@intel.com>
Subject: Re: OpenBMC CVE issues in openssl

at 10:25 PM, Wang, Kuiying <kuiying.wang@intel.com> wrote:

> Hi Brad,
> Openssl is already upgrade to 1.1.1d, so please help sync to the=20
> latest version.
> https://github.com/openembedded/openembedded-core/tree/master/meta/rec
> ipes-connectivity/openssl
>
> Please let me know, if you need me to submit patch for this upgrading.
>
> Thanks,
> Kwin.

Hi Kwin

I pushed a change last week that picks it up: =20
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/25306

Something broke though, so that will need to get debugged before we can pic=
k it up.  If you are able to help you could cherry-pick this change and do =
some builds and/or testing.

thanks!

-brad
