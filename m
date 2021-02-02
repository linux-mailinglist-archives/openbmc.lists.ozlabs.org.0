Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E230D035
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 01:18:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVj2v66bKzDqgj
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 11:18:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=kscNU2QZ; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVHmC6VYlzDqTY
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 19:19:31 +1100 (AEDT)
IronPort-SDR: ULCMofBFah6rnvHUg9Z3KqeZ50Rjidd0NvC68xjn5nBHGRUeAmwZNy3Eud4tmcBhuMVVrrNdRO
 qMusHPPhIbyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="160582737"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="160582737"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 00:19:28 -0800
IronPort-SDR: Sx077hOHNxmS/1kuocsVHphu/DZXTPk9HI+cy/yjr8VRrbKMcUVDG84se5Sruwh5OqNIU4R2b5
 Kv1FqFHXGgKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="395961371"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 02 Feb 2021 00:19:27 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Feb 2021 00:19:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 2 Feb 2021 00:19:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 2 Feb 2021 00:19:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSsUBXgNOTKmDgdy/KLCPfbhhPd3MCPh5iH7kTNpqef32Y+zUZzNMCu94yBHQuonosEOE78AFN5cicIFJ/raPqEmMf2C/QrqSGTd6VxbLevWB1xH2YL029NMAxVTNF4TNjg7J1cC+mMqPWJKj9b+3YnQYldw67fYpfj0kZc2oqNa5ho3l6QJPjjF6UxEdBfFeYGo+CnANw+9jHUlTkhFUw5sYT133USfgSxOjdpL2iFN9vyS2yi7ROLiI51nSWT0XY4nzlCUqxzFT4njUy2wgQU0BhWntVDqbje3Iy/uSjOABWMaInW7CsoNLIJsOQ6oxQg6Gdj1qUVLStahVj2dxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td5et3qxVJVBD6IowQq6deivXY2MtBj3Rs+Chucb5II=;
 b=SbQUfhBbmrhe3bDu2KJhnnhjLS1A3lRbOaHIi0Wyf+Gd4mHA9MxNZei0SWGcosVZ2tlFY32JWnQcxuYToc0niczs7dDPutQGoG74d4OUNgLJWVbXy7eqosSZsxvNlba6Ed6HS/iXUOVShIpH2cuhoSS/hLyw040YaHsLuxyqoFqxLSzpx2RCZ0CDj5W+oKNz6uMthljTIKjU+InvDDalUGR9GV5z9PRDNgbTUelzsnEhXlRJkYCpF05M1Lairr9CGhsPP1fD+uiDx1dfeYJ/r/tSR2a1iOyQy+nMFrjvTUpBg0UAF3mLZWzWN1l0AqDLjaFHPAHVk0rG6IcU3pvr0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td5et3qxVJVBD6IowQq6deivXY2MtBj3Rs+Chucb5II=;
 b=kscNU2QZG49dnKNoRZJNLycFpisCrYu1VR6QO3NQTAfPO21bZFQlgM0jX50m/dbMPtB4UkFiqdrhyInepksr4NDiZ+k67gzV52EilPayG62FYogMC49BSBgWTuNuvjozKh1ie+bOaKEfv5UGvjZ/GxBMb74SACz7KCpRHVpaM8I=
Received: from DM5PR1101MB2235.namprd11.prod.outlook.com (2603:10b6:4:52::15)
 by DM5PR1101MB2236.namprd11.prod.outlook.com (2603:10b6:4:58::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 08:19:24 +0000
Received: from DM5PR1101MB2235.namprd11.prod.outlook.com
 ([fe80::4560:3721:7eae:cb3d]) by DM5PR1101MB2235.namprd11.prod.outlook.com
 ([fe80::4560:3721:7eae:cb3d%9]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 08:19:24 +0000
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: =?iso-2022-jp?B?RGF2aWQgV2FuZyAoGyRCMiY/NjEnGyhCKQ==?=
 <DavidWang@quantatw.com>, "Mantey, JohnathanX" <johnathanx.mantey@intel.com>
Subject: RE: sdr info command of intel-ipmi-oem
Thread-Topic: sdr info command of intel-ipmi-oem
Thread-Index: Adb5MqUhjfBkluTDTTKnNx8aU8MIKgACUp9w
Date: Tue, 2 Feb 2021 08:19:24 +0000
Message-ID: <DM5PR1101MB223500A819747BEC47328FE090B59@DM5PR1101MB2235.namprd11.prod.outlook.com>
References: <HK0PR04MB273783D0CA8B4D19291A167CC9B59@HK0PR04MB2737.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB273783D0CA8B4D19291A167CC9B59@HK0PR04MB2737.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTUxN2Y5NzctMTU1ZC00OTU2LWEzZjQtNzY1NmJjYmM2MTYwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVnhGK3JSOENiQ04zN1ZRRExPUkJmc3RNQm1TXC9NUHF4MDYwak5CU25JcHRSVFdaRlloU1hSeStOc2ZNWlZodGgifQ==
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: quantatw.com; dkim=none (message not signed)
 header.d=none;quantatw.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 799c1638-4f2e-4358-5ad8-08d8c7534053
x-ms-traffictypediagnostic: DM5PR1101MB2236:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB2236E8C96E0A1853604134AE90B59@DM5PR1101MB2236.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YcwCW9wL6D4b/Hv0Dt31YgMlsl885/c/LKFJLQ2eIvkMjD1O2knwS9cpx1ba+u+R0R/UuQ3quyXACdwS6nIxOyAHeo9JrNt05K8LWXNwID1iPcUGCn8m9uZPUeWUaC2XhVOrOrSLBomJLjotVNvniTYjSdPHEhtx9dgrNj7V3DHSeUvRLAj+LQ4iyy1w75cfPO0dgBodaE3+7nd1PwHoU1qCQKh6c8po2ESFviJQNWcrly/dIxgOyIH+GDTil25GbKIn88WJwbeIExs5uQkQkok/dleIob3Uv3YBLPYVTh23omnLSGY7Z5b6ikP0E+xn2vZvuoKrpv362QbIuNalqKvY1CKsPoz0kBG2Wb9Dv9zsDD1wOxWzoe2F6Vgh6DNPnOxHbKDtW0x7QvpVkoG0K4Oj93bkNzvQAd4eryOzwJaY1qv55yUysuw1uOeo/MWFT3DYTN1IwsTjn5uEOaaQDqmo/QPHuGE/ouPYU72ccGGCDJvK6l31HaajWZrqXphM3bPCwIGSUBaJ2DskgMsahQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1101MB2235.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(316002)(71200400001)(83380400001)(33656002)(7696005)(64756008)(55016002)(110136005)(9686003)(8936002)(478600001)(26005)(6636002)(86362001)(2906002)(66476007)(66946007)(6506007)(53546011)(52536014)(66446008)(66556008)(76116006)(186003)(8676002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?SHc5alJ2WmlEUWEvdWlZUzNTSVpCY25sd21FMFZjRy9mRXdxR2E5T0tS?=
 =?iso-2022-jp?B?SXRCNllNZWFFOWNYNXlvcEUvalA2emdSTnFEdlBSbVVrWHBKNVN5alF0?=
 =?iso-2022-jp?B?MkJKV1JkRjZjMUVHMnlIKy9kdW9zSFU3S0xWL3hnVUxERnVtVk5ic0pa?=
 =?iso-2022-jp?B?dmxReVZ6bFFWZTFmdGpHZTAxTGwrVzQxVzZiTCtlQkVZY1Vhd21uaVBU?=
 =?iso-2022-jp?B?ZVMxcy8yS2wyYzhNbzFKMXBtVVc4bmFaY0RJK3NKZFAvSFRvV0RuVDA0?=
 =?iso-2022-jp?B?OWNnWGpOK3gzQ0o2dUNldEdYa0Y3UnRTaWFHSkt5MjZVb1F1ZytuRnpK?=
 =?iso-2022-jp?B?SlRXZHFxUkdSOWU2SDZkRzNvL0U5dTQzTWJvZ3ZQd2h1MCtqa1R1RHFL?=
 =?iso-2022-jp?B?bFU5MU9TT2lJd09IbzRDRmM1R1ZJZkM3WkxzMEFvUjRQRDZwVHIyMVh5?=
 =?iso-2022-jp?B?NndRdVdueXBXWFc0TEtrOFBJUnZINjRveEYzNmVXZVRqMU1VQk5pNW52?=
 =?iso-2022-jp?B?V0IyT2Z3dUdtcDBYcEdjc3lDSWM0d29jakh2WmVXZVVKRW9yRnlJbVFQ?=
 =?iso-2022-jp?B?c0NZRFFNYWt3aWlaR0pxN3E2MGRZVnhJZGlLc3pPV013eDVCNy84Mml5?=
 =?iso-2022-jp?B?azNHU1NHMlJnQWIwTnh5aUVwbzdKbUI4SDVtR09NM2Q1TUk4eFFOZE5y?=
 =?iso-2022-jp?B?cWNUeVJ4bTR0dVBMQ2ZaQTV1ODgwMHNaaVRpa1ZJVXF3bVE1UVpzOXNS?=
 =?iso-2022-jp?B?WUl0cWxNUDVHc0pPNitrR0hpQkpuQmJ6Y09RNVAwdElCRGtuSU53ZVQ1?=
 =?iso-2022-jp?B?UzRFT0lQZWxnSFhXYzdQeGVtY3QwQ2JEalppRkdaU1FxdGwrMGs2UFVO?=
 =?iso-2022-jp?B?dTkzRGtLWDdBNDJSVGYvQ0ZhWnh3Q1B3SGRLaUptZHJBd0NaS2pHcUxV?=
 =?iso-2022-jp?B?WWc0UWRyQ3A3UE91RHhUeW5DM3FBcVNKU2pVMnN1MEJ3azh4bW9TZzU4?=
 =?iso-2022-jp?B?Nm1CMWVaU1lQVW5KTTJ0OXRnK3F2MzdXdEpVQkVJMXMzZjNtbVpkUUtj?=
 =?iso-2022-jp?B?ckFqQks4aVhleEhKZ0x2ak84STltcWZkL1hybndkR1Bta1dpTkIxc3hy?=
 =?iso-2022-jp?B?TlFlRHIrR1NBcGc1UjdSNEpkS3kyVmprRXJHZEFBMVNNL3UzdGZjZFRG?=
 =?iso-2022-jp?B?TXpObjVseGg2dE1vTFc4aXZySWdIeHZyeVljeXYzU1g1SzJCOHZlb2xs?=
 =?iso-2022-jp?B?V0psZ1gvWGJWNlZuTUV2Z0l6cVk0SjBHR1ZRYXB0T0Z1S09QYmhtUDhZ?=
 =?iso-2022-jp?B?dm1STlEyYm8zSFRxMWxOQkNJWHh2MEk2bmF1MFhLUU1mWm1mSzE2Y3lo?=
 =?iso-2022-jp?B?RG9OdCt3STlSa3ZsOXdiaXJlVmJZdkN4NmwrdnhFeWlNTnR4Lzd1L2Za?=
 =?iso-2022-jp?B?dXo5TWkrN0J4UHppM1dxUTRMSER3SklVTndTSk1pQzdpeDdybzVyTTIw?=
 =?iso-2022-jp?B?SkM3d0hTcWRtUXArd0xqS0s5b3U2NGtWc2xvL0MzenlFZWtXSHU=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1101MB2235.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799c1638-4f2e-4358-5ad8-08d8c7534053
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 08:19:24.5434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6RykaAm48hMhF0PiBy9fyM5+pnYLenfUZAmhH0+G3a2fBLLjmf1ZK0wKnTXFIoqSXCJMB+JFyIidU3BPyHHlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2236
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I don't see the issue mentioned by you.

root@intel-obmc:/lib/systemd/system# ipmitool raw 0x0a 0x20
 51 6d 00 ff ff 22 78 6d 43 27 00 00 00 83

Thanks,
Kwin.

-----Original Message-----
From: David Wang (=1B$B2&?61'=1B(B) <DavidWang@quantatw.com>=20
Sent: Tuesday, February 2, 2021 3:29 PM
To: Mantey, JohnathanX <johnathanx.mantey@intel.com>; Wang, Kuiying <kuiyin=
g.wang@intel.com>
Cc: openbmc@lists.ozlabs.org
Subject: sdr info command of intel-ipmi-oem

Hi,
=20
    I'm testing some case with intel-ipmi-oem package, and I notice there's=
 some different  when execute "ipmitool sdr info" (ipmitool raw 0x0a 0x20) =
between intel-ipmi-oem and pure phosphor-ipmi-host.

(pure phosrphor-ipmi-host)
:~# ipmitool raw 0x0a 0x20
 51 b5 00 ff ff 00 00 00 00 00 00 00 00 00

(intel-ipmi-oem)
:~# ipmitool raw 0x0a 0x20
 51 7b 00 ff ff ff ff ff ff ff ff ff ff 83

With pure phosphor-ipmi-host, the initial value of "Most recent addition ti=
me" and "Most rexent Erase time" is set as 00 (7th to 14th byte).

With intel-ipmi-oem, the initial value of time-stamp is set as ff. And the =
sdr timestamp update when BMC reboot and initial sensors.

I think it should record the time when we add sdr manually. Is it also expe=
cted to record the time BMC first initial sensors?

And what does the initial setting of ff mean? The ipmi spec didn't mention =
about it.

Thanks

Best Regards,
David


