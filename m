Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F76D33F80B
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 19:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0z2w2Vc4z30Gs
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 05:19:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=cB2VZDEN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=cB2VZDEN; dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 18 Mar 2021 05:19:36 AEDT
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0z2c34W0z2y8M
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 05:19:36 +1100 (AEDT)
IronPort-SDR: vFfulFNg9onjxnEgNC3QY65rWDeFUu+my9gmVM8miWB8ato/qMohc6SnDlhOrrOk5lX9nQO3Nz
 PPpm1IYriM8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="168797118"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="168797118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 11:18:22 -0700
IronPort-SDR: H6mEc7SpWshxHz+o+vWquIyvseesO4g/G+vcwcXx+2/GuMx7m0tI1d4SNJBOv50kcVc0kae2Ub
 Mgs50nTi47Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="372437615"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2021 11:18:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 11:18:20 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 11:18:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 17 Mar 2021 11:18:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 17 Mar 2021 11:18:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihHJTWh1sfvyO8pH0g5+/Eo7xiWrQKM8vf2MoDrm498x/DUFaZmwf6yvrGwSN18r36uPeDbBfr0T4v3NEi54hSMbLvf+Fp6gF1RkGuIhIborDNWFXVbSzfmS7R0tz56jVgZcTa40X4gKCbWv/yEhj+Cj7QsurLCiZyA9JmHrQazmgfNqrIv2X7li4Q5ZxJ1QiInx7q10AOpk6ezNsCLTP4/OXYuUMDXXu5lkHQ9vnQwU8HCqsOa0AKOdP+CnanXuGnrcvsYEefqmhviQruelB54QJHebPwptDH/r1JbvgF54hdw2jX+7TlNL2OGZ7+p63EgwonONdt4Ny2PVKvsIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiWDRKdUNm1kdGyUXLvBen2obDXx2dWUPcfYGWFcad0=;
 b=GXr3jrmZEqeEJwyGUTT6s1/zLLHI1yi+jySBKU0Ri9XNentYeLawXAN34sDqWzj5LiFZatLzD+htlXBiEDNKOznI4U77l2q1acJVi7fYWzCJ6Az/cEccjPa4iyzJnrIYqYbnlov2dGqn1PT3iDTiwqiFiwlJ42XNPKbQ3nz0KFYBNGTaxRW0PYEf3gSRapRMD4rMzh2UapHAE/CD2Aifw4877ii/nJa3IVgz9pvKFtGT+r1ESLdw95A3GmOwqR47WAsN0zQ+emCr+ykHgQgJBWyeVL1ZagBxJY18hzqkh4bCj0xK/IPbp0OUz3JD2Ah93XTJDLmFfsg6eqSy3MXlvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiWDRKdUNm1kdGyUXLvBen2obDXx2dWUPcfYGWFcad0=;
 b=cB2VZDENE0xZb1nAO6AVGiCbEA0DhwGUESIkl+9vJy0hsFQGDTUqjyXRLkcemK5jSPIayWiLVB37cHRaYD15LgvyVXivgCVg2z8vtj4cEHn1hgD6HXOI62wn+T62r3VtE3WoHOtXRUP3Yq/wpAVEDd7p92Vabh7fbTwN6HyGLsg=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR11MB1274.namprd11.prod.outlook.com (2603:10b6:3:12::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Wed, 17 Mar 2021 18:18:18 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648%3]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 18:18:18 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Jayashree D <jayashree-d@hcl.com>, Ed Tanous <edtanous@google.com>
Subject: RE: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATgAP1CQAAeFPK8AAFO7oAAAoI65QAYo5M+AAFhb5oA==
Date: Wed, 17 Mar 2021 18:18:18 +0000
Message-ID: <DM6PR11MB441097913A35ADC1B63974E5946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
 <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
 <SG2PR04MB30938BD2D16A0956E2BEEFD6E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30938BD2D16A0956E2BEEFD6E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: request-justification,no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: hcl.com; dkim=none (message not signed)
 header.d=none;hcl.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 553fa7ad-9abd-4114-22e6-08d8e9710a53
x-ms-traffictypediagnostic: DM5PR11MB1274:
x-microsoft-antispam-prvs: <DM5PR11MB12740706E0893C2A6C2BC7C1946A9@DM5PR11MB1274.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IpmLlNcSLWyPADjI5cf07dfukBmZRWu0oXan/9M+qJAzWoFQpegdK9zJYyDjDe6kqUu1UIIFqmx2577FeXExruKlA5X7b3wSFLDqTvrIdtzolroJFw/pszkiK1u4692HpHVsOd200OhHM7pV0+mIDY0yvdEY6iGn/iPK2lJ60JdS5tB8Fh5OvnQRn8wAJ19hzwnHB8CdcqBcRb4N/M8NaVO9ostYblIycGG1GDxas86QGQIVcmDOjRHsPGWo7LkksF4bk77cMg0Bo7Px0XdzTcDxCFvzYfcYXWcTBIetCqeYUYIuWTHiksghWJ1awhK8sDojwezkGCiIXePsj74+6u6Fm3hH3LgYWi/ud2tIXTsmxA9Gq1bJYcWnQaXfSfVEdd9eRPoZKS6K1iHI5EgBtMTBNmwQGwd945Ei5JaVR1gtyV7qxBNV10zFdCQZbSMK2stWPW6UBf0rtaVrCaaWXFgzNGfHoIKk/5/CHMt0CvBhRygStsNHfyVKxVl0daymi7mB7r6aLYQ2ASMOjE14jRADzXoS09QN/wkOMuS1PTU7dIilxsXZIJNqMoWPq6rXAeoJZeLrLSbFqa4rZUcLl35P2sBgFQ7V6iQ5nibwpFAQNpBPlP92joRYqUTSwpqkkAZGMIgxevjVvpNWXL3qyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(136003)(346002)(39860400002)(26005)(186003)(76116006)(66556008)(64756008)(66446008)(66946007)(66476007)(478600001)(5660300002)(966005)(53546011)(52536014)(33656002)(45080400002)(6506007)(7696005)(316002)(2906002)(110136005)(71200400001)(4326008)(86362001)(8936002)(9686003)(55016002)(83380400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PLYcuEMtxPFtOxmi+aemGKh98LVut7iwBQNL6uapj0wSxdt9VFK187NoZQMf?=
 =?us-ascii?Q?RpqcfZz+nIFhrHJ/GsJqb49Z7fQLG2Nf0GSpKwBDgJUmMKTXLA7TdCax+xVQ?=
 =?us-ascii?Q?Sa8atF9jrzz9VMdpdbb6c31O0h+hNs/B/T+53Ogw5Waauqk3Jro3klC3wJ4I?=
 =?us-ascii?Q?xC61ypvKxb3Qh2QPwYwVpERUEG/VH34PmlPcoId6vN8ZFwFK6bH985ptbCWZ?=
 =?us-ascii?Q?OQ6X+T6EMVWQ8dpk2jmbkZKeMX/voOFpWBavW84CzrXRulk3o8dKfw8RoqJ3?=
 =?us-ascii?Q?lc+XmGTMVhS8M3VQS7Kjir/lbk1KNKjWK0pYWZFT9FgVxvnw3GrYmBgken2R?=
 =?us-ascii?Q?094HgJnvDnNSky5wyDwTpXERb2TlO76Ginz1kQRl3H6u4KkuSzl9PrpDLsX2?=
 =?us-ascii?Q?csvXPFgZdew51T20R7P3X71+y6abzaqHnqaJiRcCeeqwbUDW9yvDA1wJjhXL?=
 =?us-ascii?Q?YHoCKXzRpen+p7SzDN0TcvMWmqhy7Wf7z70OWmEYhdtm0bBWAS3J8LKmJalx?=
 =?us-ascii?Q?37YmvEsC+vzOZGrlR4MiF1FR1Q9bcRKdo80WcP1okLl4LYmk2bQRibmZIox7?=
 =?us-ascii?Q?boxNgasrwwKpVpqh2qrfqVXgPP1co83Un1kWWI4z43ayWFgq1tMGTH187wp/?=
 =?us-ascii?Q?ndOB+ZYcUP5o+jm9SithQxvTsL5KKyPwc0Z4Kjdxb/+pl4YBZgN6mHkqf/K7?=
 =?us-ascii?Q?Bgc14fNP3TX4sQbZa/THPngTyoxQYok75GxAgNz8G84WHUzkhOPjiSbnYsiS?=
 =?us-ascii?Q?gU9F7C8hUbEMPIQq1lSEEpQWmXWuYI9gPz5p24t+yaaRS6k5Sr/VmcCuM9Rt?=
 =?us-ascii?Q?jXrpo2YoeU7vKRPbJQAyB2z9iDPhcYCqCPOsCI0oa2iy3Q3EHaqCNO4IWzwO?=
 =?us-ascii?Q?2O+PJo0QEW54lnAZpwFDPboGeguIvUBUPefIt6X7qtxsGJZsnuvlA8goa5YS?=
 =?us-ascii?Q?AC2FqWPcurqEGN/OvexLOWOP25NZnyGuMIsX/L7+IjN6CHNMYGDLoXzZPDCp?=
 =?us-ascii?Q?MtUHgfqNVBViaqqhMJ5sQGcwpelVUo3EbfaEAbCaG7hWJHjWm81vIvZoQIl8?=
 =?us-ascii?Q?HlUDcswwqjirzx8/iMnYXuoWx2ariLqnznJoawTvXlJHf09FWiKPOAa7ei5z?=
 =?us-ascii?Q?74YFxe6eC7HLIsQuvlejNsD6D2pqdP/yHM5OJWf5nomQ4ydzCJTguOLRSCaV?=
 =?us-ascii?Q?GTBJplYXdZUt1toLOkrCWkup+2qh1F/Gg+TOKEmPEkmklrm+8Hba3Bho+j92?=
 =?us-ascii?Q?gxEexMbTNOLvoEtMPr5o4V10LOy1Ve2MS/F6dVgHdfo7fHR+TNhNlsovuY88?=
 =?us-ascii?Q?zPw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553fa7ad-9abd-4114-22e6-08d8e9710a53
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 18:18:18.5452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/MsLbvZFWeD8VRn9xYgPTuojyqJEDxsFJMnUTnbjSg2ZxY3UN2LkvYn+UT74utenNOBzgcy2LQPzWobzjnKdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1274
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



-----Original Message-----
From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> On =
Behalf Of Jayashree D
Sent: Wednesday, March 17, 2021 12:39 AM
To: Ed Tanous <edtanous@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: RE: Negative value returns for sensor in tiogapass

Classification: Public

Hi Ed,

PMBus spec only have read and write format. In the below link, PXE VR uses =
11 bit format. Also sign extend the 11bit reading so that negatives show co=
rrectly.

https://github.com/openbmc/dbus-sensors/commit/e4a970d9aea97c7c1a11c63215e7=
d3cda2124e54#diff-135678dd2046935c5dd0be8e5a5a529d33231203149e786d57b15a3cc=
0cc1240

            constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
            value <<=3D shift;
            value >>=3D shift;

Could anyone from the intel team can clarify the need of above logic used i=
n IpmbSensor.

[Ren, Zhikui]  This change was made to allow negative numbers be reported c=
orrectly.  This can happen during test. Without the change, 255degree will =
be reported and trip threshold event incorrectly.=20
Exponent data is not used because it is always 0.=20
=20
Regards,
Jayashree

-----Original Message-----
From: Jayashree D
Sent: Tuesday, March 9, 2021 4:48 PM
To: Ed Tanous <ed@tanous.net>
Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
Subject: RE: Negative value returns for sensor in tiogapass

Classification: Public

Thanks Ed, I'll check it out.

-----Original Message-----
From: Ed Tanous <ed@tanous.net>
Sent: Monday, March 8, 2021 9:37 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
Subject: Re: Negative value returns for sensor in tiogapass

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]

On Sun, Mar 7, 2021 at 10:17 PM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
> Hi Ed,
>
> In the below link, PXE1410CVR and ADM1278HSC are using the same reading f=
ormat.
> I am not able to find any information on PXE1410CVR. If there is any spec=
 available, could you please share it.
> It will be helpful to analyze both the specs and fix the problem.

I don't have any specs available for those.  I would assume they follow the=
 pmbus spec though, you might start there.

>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fmaster%2Fsrc%2FIpmbSensor.cpp
> %23L144&amp;data=3D04%7C01%7Cjayashree-d%40hcl.com%7C8676d30f4d3a4dda1e0
> e08d8e24c4957%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C63750816456
> 8775248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
> JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5lhuUdfI%2BG75C8I1HDAaEH
> VP46%2Bz1r3nJV0ek3CiiR4%3D&amp;reserved=3D0
>
> Regards,
> Jayashree
>
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Friday, February 26, 2021 9:57 PM
> To: Jayashree D <jayashree-d@hcl.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Negative value returns for sensor in tiogapass
>
> [CAUTION: This Email is from outside the Organization. Unless you=20
> trust the sender, Don't click links or open attachments as it may be a=20
> Phishing email, which can steal your Information and compromise your=20
> Computer.]
>
> On Fri, Feb 26, 2021 at 12:55 AM Jayashree D <jayashree-d@hcl.com> wrote:
> >
> > Classification: Public
> >
> > Hi Team,
> >
> >
> >
> > Recently, I have tested sensors for tiogapass, in which one sensor retu=
rns negative value.
> >
> > After analysing the code in the dbus-sensors repo, I found the followin=
g issue.
> >
> >
> >
> > dbus-sensors/IpmbSensor.cpp at master * openbmc/dbus-sensors
> > (github.com)
> >
> >
> >
> > From the above link, We need only below line in the code to process the=
 HSC sensors value for tiogapass.
> >
> >
> >
> > int16_t value =3D ((data[4] << 8) | data[3]);
> >
> >
> >
> > Since the below logic is added, the values get shifted and getting nega=
tive values as output.
> >
> >
> >
> > constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
> >
> > value <<=3D shift;
> >
> > value >>=3D shift;
> >
> >
> >
> > Could you please suggest any idea to resolve this issue.
>
> I haven't looked at this in detail, but we should follow whatever the spe=
c says here.  If whomever wrote this originally put in the wrong math (whic=
h seems likely, given they were implementing 4 types and probably only usin=
g one) then we should just get it fixed and do what the spec says.
>
> >
> >
> >
> > Regards,
> >
> > Jayashree
> >
> >
> >
> > ::DISCLAIMER::
> > ________________________________
> > The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not guaran=
teed to be secure or error-free as information could be intercepted, corrup=
ted, lost, destroyed, arrive late or incomplete, or may contain viruses in =
transmission. The e mail and its contents (with or without referred errors)=
 shall therefore not attach any liability on the originator or HCL or its a=
ffiliates. Views or opinions, if any, presented in this email are solely th=
ose of the author and may not necessarily reflect the views or opinions of =
HCL or its affiliates. Any form of reproduction, dissemination, copying, di=
sclosure, modification, distribution and / or publication of this message w=
ithout the prior written consent of authorized representative of HCL is str=
ictly prohibited. If you have received this email in error please delete it=
 and notify the sender immediately. Before opening any email and/or attachm=
ents, please check them for viruses and other defects.
> > ________________________________
