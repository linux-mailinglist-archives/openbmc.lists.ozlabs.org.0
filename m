Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BCA48A4BC
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 02:09:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXszn0x5Qz301M
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 12:09:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=WCTOvZ5g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=52.101.57.14;
 helo=na01-obe.outbound.protection.outlook.com;
 envelope-from=derekma@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=WCTOvZ5g; 
 dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azon11021014.outbound.protection.outlook.com [52.101.57.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXszG1GYXz2xsr
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 12:09:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2xRWha+P2Fezn1KpRYjpdE+poevPSXdwMrzq9Iq5aW+Srp/LviLNgrgwf361RFjXApkJUUI9WW63nSagF1eOiDHLwk5Hp5aui1ELobXgm17S1Xf+/o1lUuIT9aiamnkK+UG5nOU3KnIhOypGru7el8GhDpqLFfN7yQK2cfs/epLh/sr6twpMvnf6S77lQXOb0KAuwtfXcfdG9yPgtCVYaNF2M4XaKe9/jxO9MEw646cLbB+hB6Y3AFhjWKd8ypCpXKlq5j5F+RiZD3mXBM0U+IVDSqQtHDeudro0b2LiB5O0hTRmrNNAfV4wviX6uI5lTpSNSBpMsmTD0pI79YWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnrq1d1xtBgvSagyIPfopn482y5BQffetC3IOnMB8qU=;
 b=XLMm42pWrE4eisaNSV7L1uhgFhuPRULByHv4vFMSrCWPYbWnLcp206/v9anWXWSe4fgVlnlra54Jd5MFRVvxJ4/YNlAbALAt+aBRaNckPDQOChZnYIrRmFm/amS7FEv4yJ4ynTtAZoUHC1KWICjP4mLq15i0AOw2bj4QMcgXbaesQqQmVcCg4dXxUfPWM/r1TQo/31EjfHe0kaN84QIAAMQkH4T51A5fA4+yHhREXwfNADqFxCjFEILle4U0q8IYKHyvaIcbqVzPc7Gd8bKaS6IqACAYzVbVRhljTVwsYdw6YWE/4324/soQMShoWWx1JgA6xVkv/JH3tkm8ZkzFEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnrq1d1xtBgvSagyIPfopn482y5BQffetC3IOnMB8qU=;
 b=WCTOvZ5gKsvoDLMY5S7YlU1LTZ3f1m8kXGrslq8p1/bF/qiw3enc80y30dM9xhfVsRecTfu7OvMOXq3WXrUQHjUyVmWZ7aGjIVwMJxFe2w3wSlfvu1KhW+Od7NpxpTneFTeuvc4w4/5ztJyw3lV30+t8lKbYcdxORjbUNxo+/nw=
Received: from MW4PR21MB1922.namprd21.prod.outlook.com (2603:10b6:303:73::23)
 by MWHPR21MB0703.namprd21.prod.outlook.com (2603:10b6:300:128::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.1; Tue, 11 Jan
 2022 01:08:51 +0000
Received: from MW4PR21MB1922.namprd21.prod.outlook.com
 ([fe80::6d29:a06f:80c1:fa58]) by MW4PR21MB1922.namprd21.prod.outlook.com
 ([fe80::6d29:a06f:80c1:fa58%7]) with mapi id 15.20.4909.001; Tue, 11 Jan 2022
 01:08:51 +0000
From: Derek Mantey <derekma@microsoft.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Firmware update for auxiliary components
Thread-Topic: Firmware update for auxiliary components
Thread-Index: AdgGho0/r9R9naejRPWRWFe9u7V5ww==
Date: Tue, 11 Jan 2022 01:08:51 +0000
Message-ID: <MW4PR21MB1922F4A3A57393CDA8B09BDBB0519@MW4PR21MB1922.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=a37f098b-214c-4c3a-9477-37888916e013;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-11T00:59:33Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e947bf28-ef11-4e8f-117d-08d9d49eee16
x-ms-traffictypediagnostic: MWHPR21MB0703:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MWHPR21MB070348AC8172D42A0E428C14B0519@MWHPR21MB0703.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xeYDgQ7cetMVZdP4N388tSvVCuiARnAzjbbXN4SpDiWHzXD9Gw0aSM619WoZ4FgX5+D99Bzyl9WhP5sD8dI7R4aYa5b/ZAuxcLgMOK5g7UzApBtPcZkNCRQd12z8LFRX+GSZENy+T9B3KFPUCSiXV0yfuP06+jAqWOpO6x3YcpCzvlIAvBl9l75SdUZcbNDOOiFVvhaRXbe2/sF4B8nSNZObUnSmwkxIPvmjOcEVhmCKmez0xtHRtf8UqVG8Acuf4inykCwRsvghQLFx6XArwD/j7DxNLKEwl5fVQOSEifdyoDchCCGXAqHVLfygHxiGSpVmt5iLnR86DrPmj00fKOcWKx4OK35fRlXwAJz0PCBugk9bCZZXB2zuAIpbPeveDC5PMlq+3M7GH6lzR4R7JjR46g8dZF7qih/2TeF4aNRrITCKJ3N8lYwXBhCBBVbl6yICqvl2VW3OTzC7UuqdrVBJ0AMOrMnsPCYXy9sDTRPQ8xOI/g8LxR+s71okKd95nSmAWzds5Mf3wTHeu+xjEbOxuE9lbDvBDXEYsK7NZkSsmJ/yHyWfOh44U45H++w03s2wYkLUX0wqhmbEi6+UrokNwM90CA908EvcIrrP0874icsZ+cZ+hXYOybfSrWg/NyYDA7RBbIhjCJUVleeP3k+JPXhrCwc4nYYkDDMU0x7mANsSMh16pL4lt8sfMf5+ffX4MJw+5S4tFV98+LXjHIn+Uvt7lZ4ckuVM1G5A4y0gTcsM5ui6coAnbiF2b4XpopNxjIbrtQiT3X9DyvROxB7TM07o4za23BAuDPKjycMzRYW+gy3Td2i3tk5PswstWHYf2hMp7F/MCDTPxR5YEC/OKHTaEIf6X5I7mXFNis4YNug5YDYh5qshBPTd6HSI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR21MB1922.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(86362001)(186003)(8676002)(8936002)(83380400001)(2906002)(52536014)(26005)(82950400001)(122000001)(82960400001)(55016003)(66446008)(76116006)(64756008)(33656002)(10290500003)(316002)(53546011)(8990500004)(66556008)(966005)(7696005)(71200400001)(508600001)(6506007)(38070700005)(6916009)(15650500001)(4326008)(66946007)(66476007)(38100700002)(9686003)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ICojV9dd2kBFSmg0qEzcZ/gZub6nXKoCd9lEIC4U4ONc7V18Hg1pCgeOdk7N?=
 =?us-ascii?Q?QQmUaGMhzWYY/j0ry085hdYAbgcsPHnjKvxz7RW3kNyx+pTHjL4/Gct9Oer5?=
 =?us-ascii?Q?hjFjbL3SpgmgDYVDy4VlLIN4XsT+rX2Wgj7AJRoviB2D7lYwNCmHDusRZ5MX?=
 =?us-ascii?Q?Os5nzhXx9kEYZ2QVppyHB72CYpC4SIdXqvdDsBNJN3brzL9vRxzbBCIDy6PV?=
 =?us-ascii?Q?6y8OHkHGRrH/StwaJ1Lk2kspODXSsXqE/2vmWq/83rDbdugJOdgCOG5RqEra?=
 =?us-ascii?Q?Q33WjOhO4I5JEFmqkKBmCB6jspXkoQUsPwdkF6oSs4wdMo1GWleWb1BQ2RIK?=
 =?us-ascii?Q?+Z4rfEtJzI0MojMctDK2r9yXMuv40tGX1GWUGvxUrJ+3DvpVgIacWSVpIeLJ?=
 =?us-ascii?Q?Zv26gW8Q1AMEDYrUNQxL3LARo1p/Mg5arOMrN7fkKWvlNNqon/tv8QLIPy4d?=
 =?us-ascii?Q?ZQWxqYopFZOaE4tB3pUNpdON4U/szZSabds4095jDC/CD/wMHWCtWc/CkKqL?=
 =?us-ascii?Q?Cc8WPvraIDuzNjUr89CbT7c3fb8n7kXdRKsnYD26LL13kie/gUxyDzZp6wDY?=
 =?us-ascii?Q?Aqa+05jRIa0I5ojcYNtFI8S58z1nLziiP6TPUm0RpBmFrRfBglWY8POdLCdj?=
 =?us-ascii?Q?405mUGhb4MSx2N0oZiWv/k4P23+B6vh7AKZcrdj3urI9dbRvuKt2UdVFtBpY?=
 =?us-ascii?Q?/ZTixVWkTLwnDhtl3+U40yPcWksFNIYlo5CVpLsh/D99DsrFv5QXF1oboCJS?=
 =?us-ascii?Q?z9Q1kSo+Cf6z1opo08DGkHpn6u8HdqDSHbaa1Z4JbUseqiW3MDoXo64YDuJF?=
 =?us-ascii?Q?Qj3gy1eAXP2/js0YE9NrU5c4EZghFYCo1BpjvfRyzfr6Wt33i8AVgztupYPA?=
 =?us-ascii?Q?mHCtcrOrM+c01rBXzdXjc8QYdI9yGWi2GHDEbIRNlB8Gw0ndqPxd9PWEaw0k?=
 =?us-ascii?Q?UdJg+WRtUpGvBIF4/8rraRGcwWY/NPLFpwbIMe7WN16WVJS8y6/2zocGqWwA?=
 =?us-ascii?Q?UliMzXEIdgTXA/YzgwKWYjPa47a673tgTi7ZxV7XQ1969C4HuCQDdo16sBiP?=
 =?us-ascii?Q?ovzQN6YFbFTAAlm2wntOwNdNeP7aL+ULJ7AWHhkcvRxdVlF81FNZRH391SVJ?=
 =?us-ascii?Q?wAFs0mEgFcHiWfrL26zgOOLHZN1CVihEOIqlWFq8spYBX1qB1QmPK5nDjpjE?=
 =?us-ascii?Q?wbyN7Vkxon8SRhgYZ0jn98Au0zHOLMqMDXr2s92p8FDQ0JCegu3gKy1AgOVg?=
 =?us-ascii?Q?v02Ap23sP5zkqAHW8Zln17CRW1wbZotmG+K7Hf7WHuR20setNw0aOpxOf8Gt?=
 =?us-ascii?Q?L+gc4LM0ewNAVmUwBFuCO3SJOavEywZxS0dR5dN3y0Y/1xIU8y/B5a9CyfrG?=
 =?us-ascii?Q?xuF5kAdaMotwc9g9pEbIwUj4CkmJ37X3qtEye7x6lbCB5kJatl1I4/oy3WgW?=
 =?us-ascii?Q?fQtpWsNRA22pnJT8mk59CTiwI8RVXfaZXwcOwTHbYGw9FtvxsgKlpfO8ETGl?=
 =?us-ascii?Q?NUn9+x5VE1JGdoHxN62I1pxr5xVZ7f2waBIFUTbr+YkyPdoZJvklDhif/i2e?=
 =?us-ascii?Q?dqIHBXCGELFosnQWSMayLPKiUPZW8bwQA0z5FduoWGv9GyfBD3LWJLMYZpnj?=
 =?us-ascii?Q?Cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR21MB1922.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e947bf28-ef11-4e8f-117d-08d9d49eee16
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 01:08:51.2231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6rWz4Zb0xuDOovoZBqDNDw6Kz+EVgDhVWPMZBliV+QYHSSMEXRNd7bjj7mXPIaVoQ8WMims5YG+swYC2NjI0gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0703
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

Excellent, those changes look like they would solve most of the concerns I =
have.

Are you saying that the team at HCL is working on updating the ImageManager=
 and ItemUpdater in the phosphor-bmc-code-mgmt repo?  Or is there a new imp=
lementation of the ImageManger and Item Updater?  Is there a contact for th=
em so I can maybe get a preview of the changes?

Thanks,
	Derek

-----Original Message-----
From: openbmc <openbmc-bounces+derekma=3Dmicrosoft.com@lists.ozlabs.org> On=
 Behalf Of Patrick Williams
Sent: Monday, January 10, 2022 6:42 AM
To: Derek Mantey <derekma@microsoft.com>
Cc: openbmc@lists.ozlabs.org
Subject: [EXTERNAL] Re: Firmware update for auxiliary components

On Sat, Jan 08, 2022 at 12:44:17AM +0000, Derek Mantey wrote:
> I am looking at enabling firmware updates for some auxiliary components i=
n our servers that don't fall into the "BMC", "Host" or "PSU" bucket.  I'm =
trying to understand if there is a pattern I am missing, what other people =
are doing, and the possibility of changing the design.
>=20
> Right now it looks like the path forward would be to extend the "Version.=
interface.yaml" in the "phosphor-dbus-interfaces" repo (https://github.com/=
openbmc/phosphor-dbus-interfaces/blob/6f69ae5b33ee224358cb4c2061f4ad44c6b36=
d70/xyz/openbmc_project/Software/Version.interface.yaml) and add new Versio=
nPurpose for each component.  Then update the Image Manager, Item Updater, =
BMCWeb, etc to handle the new component types.  This seems like this would =
be touching components up and down the stack just to extend.  Is there some=
 other pattern or way of extending the software manager to handle new compo=
nents?
>=20

I think you want to see the documents changed by these two commits:
- https://github.com/openbmc/phosphor-dbus-interfaces/commit/f05e2050dbba80=
d130fa87875448cf48e97ce7f6
- https://github.com/openbmc/phosphor-dbus-interfaces/commit/ac7adcb5471eed=
5eaa9474a697dc1db254fa9187

These are intended to take care of exactly the usage pattern you are asking=
 about.

> When I look at the design, it seems like using an enum for the "VersionPu=
rpose" is a little too restrictive.  It doesn't allow for other components =
to be added, other than the "Other" enum entry.  But there isn't an extende=
d purpose string to allow specifying what that "Other" value actually means=
. =20

You are correct that the "VersionPurpose" { "BMC", "Host", "PSU", ... } is =
rather limiting and with these changes it is effectively deprecated.  I add=
ed the following wording:

        This property is deprecated in favor of Compatible strings and inve=
ntory
        associations.  The enumeration should not be expanded further.

> What are people doing for components like this? =20

Since this is a new change you won't see any code reflecting this yet thoug=
h.
There is a team at HCL that is working on some implementations of this for =
devices on the Yosemite-V2 system.

--
Patrick Williams
