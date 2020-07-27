Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7194722E40C
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 04:39:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFPCr4ZHszDsG8
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 12:39:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=BGMZ4QwK; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFPC14vG5zDr48
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 12:39:01 +1000 (AEST)
IronPort-SDR: InkC71/AEjSAVafKEaWIxcElZCvKBwtMFt+TuMNDQCsGHFfkUO9WrFNoQuCfoqTmLW0rTzryi/
 g/3gcQz0n1eQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="150123419"
X-IronPort-AV: E=Sophos;i="5.75,400,1589266800"; d="scan'208";a="150123419"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2020 19:38:58 -0700
IronPort-SDR: FvAk/Kd42tt+5AI14d8btN7I5JidJP402CbExj345cDCKMLOMJnbCpK+oF6Ttm3T1HygZHy/7I
 /eeBSzxKNcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,400,1589266800"; d="scan'208";a="463906171"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga005.jf.intel.com with ESMTP; 26 Jul 2020 19:38:58 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 26 Jul 2020 19:38:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Sun, 26 Jul 2020 19:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoI0mnyXrjSdKj3SFH68xjdXprOW2yPmUZjcI6tJ4fc7PMIH8z5FCOKLjWrKdSioStywqNnaMdapuJpVJQ47RexLhNxm4F/l+3YHJFPNw9GpbSv+Ttwa18mNTBl6oSYxfkJsiQ2lmpIv9ckwse9lV5LDmT84MvVHKvQxYlbd1Y6ooGAe9TGWBl63ydJy2UrZ2Iu58Xiahvhbp2fXrsIJK/vXOte7GtAdsL9QU9QuYFAiNFs08fboCREKndGIapRwor1XZhp73cs9S/2hJPiKwtCgvhXbuitWxDoo/6RdcZ6iDq5S+8LWL7L34mhzaacFWgrewK2oIy0otRXq574kyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmQ+3JaspLBmbhRHTLWhWcU07MWcH3AHWPvTiUOXWps=;
 b=U1eQUvFsHeDdYfKtkYgH6zRBGAJb4pnGsre0y/KxYhLWU5py/STTH8S4hZ5mW4fasQg8EqPeiOqgxKASZQeXX9fkLtx1T/T3DlAQvD5UUNCx0rCha4WpdE3m1oMtRpEA6ZB4eRmJzyPO0QbpB26xeZMfKMFUrZbg285qyEOxWJkiCuaMTSxGWJfAfT5vkp6fQQ9PPpuPB4Rk3GKnx3U/DJXB2GBEVjy+AbZUJvIxDO4K6MNUZhAxjn8tnLAwfpNA7K4Q/i0/sjuMrT8ELN5NW3g2jkuMUDQx8uEz71osjrAjRXsoL02Z4T1Hv7Bqysrq0sv72wLTjohPjbhWHSl/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmQ+3JaspLBmbhRHTLWhWcU07MWcH3AHWPvTiUOXWps=;
 b=BGMZ4QwK4vzrUMUslBT07JeC5VB9YtfOjy3hvq5LRMPP55EnLQEVIG4SCKugEbiv8oT2faOvTTZ41Kbwe7KJ4OmrNxpSp6zkdccVb0ELozl3nIKWxQIp07xboPoyfKldk+PXqHuo03IismsIsISbfOZqRas6mIqFrMXL+2INxZA=
Received: from SN6PR11MB3520.namprd11.prod.outlook.com (2603:10b6:805:cf::12)
 by SN6PR11MB3374.namprd11.prod.outlook.com (2603:10b6:805:c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Mon, 27 Jul
 2020 02:38:56 +0000
Received: from SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::3d8c:61ab:3bf6:ecf7]) by SN6PR11MB3520.namprd11.prod.outlook.com
 ([fe80::3d8c:61ab:3bf6:ecf7%6]) with mapi id 15.20.3216.030; Mon, 27 Jul 2020
 02:38:56 +0000
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: "Ren, Zhikui" <zhikui.ren@intel.com>, Manikandan
 <manikandan.hcl.ers.epl@gmail.com>
Subject: RE: add multi-host support in the phosphor-post-code-manager
Thread-Topic: add multi-host support in the phosphor-post-code-manager
Thread-Index: AQHWXq75KgcDkp4u006PFBoyX/RiKqkSRi8AgASpVACAAAMegIADzdow
Date: Mon, 27 Jul 2020 02:38:56 +0000
Message-ID: <SN6PR11MB3520FA25B5A6BB890567521490720@SN6PR11MB3520.namprd11.prod.outlook.com>
References: <20200720160013.GB17117@cnn>
 <DM6PR11MB441079DE8A76ECF6C35E185094780@DM6PR11MB4410.namprd11.prod.outlook.com>
 <20200724162110.GA9905@cnn>
 <DM6PR11MB4410E72996262865A6C8937994770@DM6PR11MB4410.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4410E72996262865A6C8937994770@DM6PR11MB4410.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDU3YjZkYzYtZTNkMy00MjFhLThjZWQtN2E5MjEyOThiZmQxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibkFiVUJoOEhMWnQzcVVFSWdnTld6bXlNQXg2XC92R2dtTk1tVEdaekw4T2wxR3ZMMHVkd2ZIdU9HRm9YajZDUUwifQ==
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 937e1faf-81f7-4a21-c204-08d831d6357c
x-ms-traffictypediagnostic: SN6PR11MB3374:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB33742E10B1BE933846B56D2390720@SN6PR11MB3374.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SJjqK3rWJZq9P/fu+OH+JqbB6P4b4/Sruqyd3+cY3gKaNqxaVU8LpgEgj61ag+DJYEm6pv2BRJwjSUAAsO0YSarqh6AMzVbIcQtLN7yx6pR6wrloc0T2q2JScHrfylxsQ95kZ0Dxa+2hoGKe4wsQaA6v6FsGj8w3MpCK2pv7K7wOkaS+OikI7c0dwe9XaeVipOb5wzK+//cXBvI2OVkFJYWtdOssEKrxZ0MsVmO/mvPL3UuPsbxT4kYt2fpq92AUpRnuXnBbFfuG3RIX8VCPug4kvM4ikUI7kJhIfLwSY4bMKU7Sqd1b/r6fwoi4rAh+PMP3v6CXKVGKM3q/vkRQpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3520.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(86362001)(55016002)(8676002)(54906003)(66556008)(66946007)(2906002)(83380400001)(316002)(66476007)(64756008)(110136005)(66446008)(71200400001)(19627235002)(76116006)(9686003)(33656002)(5660300002)(52536014)(4326008)(53546011)(478600001)(26005)(8936002)(7696005)(6506007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /4/SPr1p4j7Wy0fLKRRGvJ/26foQf5yVhl3zyoW4EIBtGM186FyqZ3Vz6/4NDD3LlnZ05aZgM10g+TMGKGxcyHqjB1HqJglWgh/0tsYm6E1weJbVKgdPWgTZiRDRYzvOCwIkoIeIQyLiGgZaA3bvJZkXvC2Zsr/GmD4Bsi950E+ORjKtO0JK1JIEdsLazAhM4OZeywoWNMWBvpiGKCL8rkBJkE2a9Fm+tMmt9w4JLCFUWFM6iDbhNNwbeRScFVywAoFBjsvhE5Vq/tiogG/xCC9rYcuruTMXM0RauV03KR8aWJlfatFbK3hjD5WzFu9QwyXjZfSVRVjDwd6FrXEayPQVAOWb8sMVDyw0mH0vZ848pVeYq/1uBu5Kbjs4oy4ZOohFsZFJIt3+YV+UVRHl7jzkwq0a/jXDGtrWTtBkCOTNO5xDYBtBiHlcDsypB7zzb9ltDUjY+c1/25zeuumpxzWT4kAZoRWMNx0H5NmjuiPR5Wr+Prq+y/KQaHNHttGH
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3520.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 937e1faf-81f7-4a21-c204-08d831d6357c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 02:38:56.2316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GC66dbmfq7/9v5EGAE3yF3Mjnzp2nm1zBFfqNdUcbdoma7zN1w8Y21A38vnjLhZ5HiiDOEIDXFAOZnBQtajTyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3374
X-OriginatorOrg: intel.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "velumanit@hcl.com" <velumanit@hcl.com>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please see all my comments in the Gerrit.

Thanks,
Kwin.

-----Original Message-----
From: Ren, Zhikui <zhikui.ren@intel.com>=20
Sent: Saturday, July 25, 2020 12:32 AM
To: Manikandan <manikandan.hcl.ers.epl@gmail.com>
Cc: openbmc@lists.ozlabs.org; Wang, Kuiying <kuiying.wang@intel.com>; velum=
anit@hcl.com; manikandan.e@hcl.com
Subject: RE: add multi-host support in the phosphor-post-code-manager



-----Original Message-----
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>=20
Sent: Friday, July 24, 2020 9:21 AM
To: Ren, Zhikui <zhikui.ren@intel.com>
Cc: openbmc@lists.ozlabs.org; Wang, Kuiying <kuiying.wang@intel.com>; velum=
anit@hcl.com; manikandan.e@hcl.com
Subject: Re: add multi-host support in the phosphor-post-code-manager

On Tue, Jul 21, 2020 at 05:10:04PM +0000, Ren, Zhikui wrote:
> I would think that one process to handle all post-code is a cleaner desig=
n.

   Thanks Ren for comments.

   As Patrick mentioned on different hardware toplogy and hot-plug-able=20
   concept matches with our platform.
=20
   As per my undersatnd on recent multi-host feature such as =20
   obmc-console, host-logger and x86-power-control implemented based on the=
 multi-process.

   I will update design doc in Gerrit to discuss to further on single or mu=
lti-host approach.=20
=20
>It is good to be consistent. Thanks.

> -----Original Message-----
> From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> O=
n Behalf Of Manikandan
> Sent: Monday, July 20, 2020 9:00 AM
> To: openbmc@lists.ozlabs.org
> Cc: Wang, Kuiying <kuiying.wang@intel.com>; velumanit@hcl.com; manikandan=
.e@hcl.com
> Subject: add multi-host support in the phosphor-post-code-manager
>=20
> Hi All,
>=20
>  We woukld like to get opion on below multi-host support approaches.
>=20
> Background :
> ------------
>   The Phosphor-post-code-manager supports only host to store/retrieve the=
 host postcode history.
>=20
> Approaches:
> -----------
> Approach 1: << run the multiple process >>
>=20
> Create and run the multiple phosphor-post-code-manager process to handle =
each host postcode history.
>=20
>    xyz.openbmc_project.State.Host0.Boot.PostCode
>    xyz.openbmc_project.State.Host1.Boot.PostCode
>    xyz.openbmc_project.State.Host2.Boot.PostCode
>    xyz.openbmc_project.State.Host3.Boot.PostCode
>=20
> Approach 2: << pass number of host to single process >>
>=20
> Pass number of host to single process phosphor-post-code-manager to regis=
ter dbus object and handle each host postcode.
>=20
>    xyz.openbmc_project.State.Host0.Boot.PostCode
>    xyz.openbmc_project.State.Host1.Boot.PostCode
>    xyz.openbmc_project.State.Host2.Boot.PostCode
>    xyz.openbmc_project.State.Host3.Boot.PostCode
>=20
>=20
> Thanks
> Mani.E
