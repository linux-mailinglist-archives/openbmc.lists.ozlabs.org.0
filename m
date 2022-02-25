Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0314C41ED
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 11:05:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4lky4lj5z3bTr
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 21:05:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ndrTu4Rr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=shuox.zhang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ndrTu4Rr; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4lkR0sY3z3bPD
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 21:04:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645783487; x=1677319487;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=oUc+GDp+KCTRleKxb+QC1QNsYciebHgnr2l88jHahos=;
 b=ndrTu4Rrv9nRf1btmbYzJeN6YVurN+Q8ZOodfGgsCqtNvMbm86fu/LyL
 RJVgllZUGtUtdIFWrxWyaCi6KP+IRQ2K+PGVoaSAXgRZYaYwqmSN1W2x6
 C7d+teygl0IIBIaUjpoNlv1Vnd+DpuWm9qihJ6AVmnxa3O6uR8f+M5IdK
 aBDn0J/WwGSOy0hRokiaMpI4kFpM7F3vcMDa2xT2s8M0P5X2YnPmg0JYU
 4TZ14OQArMBe4aHmkypu6QlqgIXJtWHLG8iUbT6Qnwxlu0zT3ZxUP3stp
 8NDz8pZduZvlSJK5VpEbTCLMKNrL3/5kQqWdo8XFmVWOe08gHFJKCDrdT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="250048394"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
 d="scan'208,217";a="250048394"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 02:03:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
 d="scan'208,217";a="628801891"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2022 02:03:39 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 02:03:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 02:03:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 02:03:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELkCwxTYPQkCoaDluOZ6eg2N3AU7wewhLghDm/tDiiCLP8+B7tLhkOvNhGTQQwb2zCQ/RtI+VRHmxmURBZqDeZbJz+B5FEXD0A4Z+FAiFBuzOYlWPthqWTGZITUoDdUpgPQDWxY93c50w7p4ZVXZRvVANKiOCpkukhoU5Hc3RZlvfogK2cS7TcrLyxzWq63wTGOICO/96qQgdqS3P+acQCej0tTPm0c9TgSG81tYmo5qE1WAOuFDR5jUOhahVJrRULFvRbHXiTCHl0GID+ZbORlGaqIQHNcp6kPe+Na4OtpfhVaaVIUYk30ifpzf4Q3ckve1QfTGprou1QMdTupiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMfOatoxOJu9h3lM65xN4IX/R/kq19mXOR7/Be4OZ00=;
 b=AlRhgUpdByetAJpFRo47rqhAZs+mX9kfQcE8ubQR0J2/oVApsazLRaPfaHIFkxWcG/u3e6cJWEPikV0ciDl+pi5VHaHfotvadCqnYtv2+qUylEuRksf26YREYz3LXL75xyIUuQIxyFf/650jxjm0HSTiKydR+gJVrIg45Io+kCFDcPIEmf9cPyCniWtuaPu0GRzdG+WYFpvNU8SJqocfeQs/ItGReKY11zJlY2v/yZQUm3hNvBDxtDL7LvahhD1nW+NOGjHZYaCIxg/4HjWyy5CJGP6wRyEGxd1ZDW0CgnaKj0En+U+l3qEor1AHfeQgvQMxhGfu/0bohqtlO5jGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3349.namprd11.prod.outlook.com (2603:10b6:a03:1c::21)
 by MN2PR11MB3679.namprd11.prod.outlook.com (2603:10b6:208:f1::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 10:03:30 +0000
Received: from BYAPR11MB3349.namprd11.prod.outlook.com
 ([fe80::59e:19fa:d48a:83cf]) by BYAPR11MB3349.namprd11.prod.outlook.com
 ([fe80::59e:19fa:d48a:83cf%4]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 10:03:29 +0000
From: "Zhang, ShuoX" <shuox.zhang@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish-Service-Validator fail to validate Oem
Thread-Topic: Redfish-Service-Validator fail to validate Oem
Thread-Index: AdgqLu3dluaOatkxRqq4cTPa6yM+9g==
Date: Fri, 25 Feb 2022 10:03:29 +0000
Message-ID: <BYAPR11MB33494E24397F5FEBF895988EE23E9@BYAPR11MB3349.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 812dd27a-652b-4875-7ed3-08d9f84612ef
x-ms-traffictypediagnostic: MN2PR11MB3679:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB36792A748DA7EBF0840143A1E23E9@MN2PR11MB3679.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lI+OdMERe9rPoo/gHEIvHvg3/bkBL9PH3CacxPXhnVocfeAHWgmCqYDsA14D+IC4lnBUEeIe333oxr3d6ErCThmhgW8KDeRu1i5aHS4ozDIjT+3g0EsmJH1TTxiGlS/lu95zrYPEAK/yELHCe9f8S3ZzVg/mfzWaP294/Oc/vinhB0o1xFMhlbqRxxGYLWteFPj9Tvbnp506Tr+0S/osH7rAeUUq+XvVz9Gzw+SahxVn+KM0ZYHTbO0wNed5vgn6vOiwjcXihkzuRjI4gfaqUq5n5l5Odh0MaZfvBh66z3entKUdqopiadnCOi6TXjP0ZN15pc8ckF1+6bA4XJYP3DYm52MV/PSFvB/1ASq2xaqtZ8rk5wNTxpFIWkwzOQR3FdYlzM+zPoV8jB+Yn3KGjOFMmS3w3cvqh38BK/j5AmEaoYRL6DSjQStM6akzRPw9viXxTTTtiSVIfdSlglth6LEXQTtFLxxqV+S8nFzVQV7Ogzl7Syy3+tQOJCYkNeUdcgiALEtjKXYBsQ5gS92ltYl4RePDH6MDum+t9sn8mIED7Ans94bULftcRVFsXf0EOgcMdwlfALK+Ahdrh93AOMl7UK2O4+QxfUWzm/p0t/PmvZJs+LKg/6qjeLMdwfw7GZovWOO9eUjkxQIQDWlRluTC7TotN2pG9+MNhneJoj9eoEkgcwH+Tc7cIUl0eT3OOySB3JKP6MorzQ+wyWbxYcCCHoLJfx9sJeo3Dk8YGJ8uQ6KljZAHw/js4nschIcnhnHdMfeka6yxRO8YntVEgWmXKUzw1G16WvYtHZ3mkdsNGxDHHn58+BQ5DV2KUSBJiodSepzU8i9iRqbqvKza01gvyzE/Vx8csvIdWyDrqqo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3349.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(71200400001)(38070700005)(508600001)(76116006)(83380400001)(6506007)(66556008)(66446008)(55016003)(64756008)(66476007)(82960400001)(122000001)(4326008)(7696005)(66946007)(8676002)(186003)(26005)(8936002)(166002)(33656002)(6916009)(38100700002)(52536014)(15650500001)(2906002)(86362001)(5660300002)(19273905006)(9686003)(563064011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BHWc8vcOcsnLXCdPU0+H3B8CGbJcEcbpY8Np9qnD1SpnRgUkUWeNbQKKQnFt?=
 =?us-ascii?Q?2hdPxwOAFGzVbljHRoVpjAlCwgNxcZfgNlcj+ip5nrQY8NIbv0U2lpAyEsRh?=
 =?us-ascii?Q?Xkj3h80ef1yZtt+ayIt0DaMHUs+RcX7LwnU9H1QbFIvHhc94MGFl7LvMpCJU?=
 =?us-ascii?Q?4y2GrTH5WE4qY1tP8n6IfaQ03vMiPz35t5Lg0xcJxgerrHW6WVh3F+LM0WEi?=
 =?us-ascii?Q?SLXEyWNGtkUMI5663g83NvT02C0YL2s/Hr8dlba3yZrDrbbo4+xmgu6gJ1Wd?=
 =?us-ascii?Q?nWBi1iISCJ6LMDeqrUkCFGft/VL7PA7lS43jJwHmC0skhPbQuszUDAJaI4Xf?=
 =?us-ascii?Q?dB1f5Yhoa+qng5upYqtzX19w8qso4A2L5O7j3mjehe+rCO1ZmgnWXzOPYBld?=
 =?us-ascii?Q?wbnKrWo6IfB+4ywvGwNufcyIGXEvOxFp/FHPNKinSuDyIMdZg0SNshwJ5nTq?=
 =?us-ascii?Q?bnUFFf8Rr93aVPa0Uq3r8kQotpdq6aAK+L5MguMVUi6vg8srJVrVtB9BtOBb?=
 =?us-ascii?Q?ApSc0ddxhGZrqj1HkuawzYoONRumJ3Tc/dk6457zEULEao+8Odk3yn/BR6Sq?=
 =?us-ascii?Q?8+ZNpGUYuNA6jjOWHtVykBATPrioVl+tIsOuJr6v+i7EKO1dE/wLP6jC7gd4?=
 =?us-ascii?Q?a2ZFFJzNjLACsRaLXEZdNPaY8ildo+P9D4Vb2sBuUlIv94DNfXfa82L3JHTk?=
 =?us-ascii?Q?y1ttJ00xmNh4jNC31eQ5oN625+LXsuN2BYwBv+BgPzkQ0sxDLXtudSVOjG8T?=
 =?us-ascii?Q?4LIFUHsnmQtEfaOHZbu9F1M+I9TK0GvoRAQU8x2SzXD1k2eDhHAeZ0Ifyf8V?=
 =?us-ascii?Q?JHS+QSvZejBybfGzxaqvnE4s13yfLzfzTc5ta1AjKsLH5vrVtNAz5OuM2rxO?=
 =?us-ascii?Q?yJG9lsSlQKFfyVCwcmyKB02cOuQcMpVdtIOMTUdJkmAjQ2wDkTBgd9OL2waj?=
 =?us-ascii?Q?UdzOIf1Z04TQHiLqV5pc1F+SrtLrZZk2edcB9xAiVkgCbvyHe0SUtqDTHMjT?=
 =?us-ascii?Q?ROPW6lhpEi99v6SMdW5ySnG7ZWPCWeEBQaSEJaItuNJlyODHKYX1zNL1UEtA?=
 =?us-ascii?Q?v10p+qQInZ6wN+atlhNykVFgJp/jwMb54Ngs2TcoAeI7sGKAt7hwMdvS5Kxu?=
 =?us-ascii?Q?2tiSLI1pd3j25Q+LrPasNnDm2j2J+OMg52oG77bhEIiyLxJFjO5eVGiemb1c?=
 =?us-ascii?Q?wyeQyTF0fY91EED1/ABjUezchNX//zmzVnxGUfrqlCmeRdZNSAXgYFtgJ+eg?=
 =?us-ascii?Q?G9CnkKuUFzulBX5tyczi7FbA8cN5v1Nu2I82TaVYc11Kj4wxwiGwlzK9hrC6?=
 =?us-ascii?Q?Oh4xJZQPvZihTmKQ3q8+4Q0rVf9km26aI8LSHW9xphvI1AvO4dU748Idzr8T?=
 =?us-ascii?Q?mrc2kuUAYnGV+Ejbr/BFExDaz7al8mg5F/D4EwYTC8GrE7w13ENv1ml2Zrpt?=
 =?us-ascii?Q?2myVmHX9cOdkFUWGEdsa+6Y5CC+fU6ftrOgkiTZab1e9cHuqtuhe+5mLoRV4?=
 =?us-ascii?Q?vewxuBHdA3kx28oxJ1mbXlBJKoSBeDVc76rQ76puKlgmiA3NY7TaLmNUA45b?=
 =?us-ascii?Q?PzK6aF7EJgsiLDlKApeKbwWNpCJ2IMguy9UCNhbDnwTwQFy+QI9SU/iLtsoT?=
 =?us-ascii?Q?dg=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB33494E24397F5FEBF895988EE23E9BYAPR11MB3349namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3349.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812dd27a-652b-4875-7ed3-08d9f84612ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 10:03:29.7939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2hRdhOM2JdKS0LaoIK1pVbuy/Oruo9jAf3JJ61nUcUJ99d6ruhuSJr/fraVo5fOxz0zcUsDy60UEGx6GAfzhGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3679
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
Cc: "Tanous, Ed" <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR11MB33494E24397F5FEBF895988EE23E9BYAPR11MB3349namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,
      Why does the Redfish-Service-Validator tool fail to validate Oem, the=
 namespace OemManager has the node OpenBmc in OemManager_v1.xml.

        <Schema xmlns=3Dhttp://docs.oasis-open.org/odata/ns/edm Namespace=
=3D"OemManager">
            <ComplexType Name=3D"Oem" BaseType=3D"Resource.OemObject">
                <Annotation Term=3D"OData.AdditionalProperties" Bool=3D"tru=
e" />
                <Annotation Term=3D"OData.Description" String=3D"OemManager=
 Oem properties." />
                <Annotation Term=3D"OData.AutoExpand"/>
                <Property Name=3D"OpenBmc" Type=3D"OemManager.OpenBmc"/>
            </ComplexType>


Oem.OpenBmc
[JSON Object]
none
Yes
FAIL
ERROR - Type OpenBmc not found under namespace OemManager in schema of pare=
nt
ERROR - Links.ManagerInChassis: Linked resource reports version #Chassis.v1=
_16_0.Chassis not in Schema localFile:./SchemaFiles/metadata/Chassis_v1.xml
ERROR - Links.ManagerForChassis[0]: Linked resource reports version #Chassi=
s.v1_16_0.Chassis not in Schema localFile:./SchemaFiles/metadata/Chassis_v1=
.xml
ERROR - Oem.OpenBmc: This type is invalid none

"Oem": {
        "@odata.id": "/redfish/v1/Managers/bmc#/Oem",
        "@odata.type": "#OemManager.Oem",
        "OpenBmc": {
            "@odata.id": "/redfish/v1/Managers/bmc#/Oem/OpenBmc",
            "@odata.type": "#OemManager.OpenBmc",
            "Certificates": {
                "@odata.id": "/redfish/v1/Managers/bmc/Truststore/Certifica=
tes"
            },
            "Fan": {
                "@odata.id": "/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan",
                "@odata.type": "#OemManager.Fan",


--_000_BYAPR11MB33494E24397F5FEBF895988EE23E9BYAPR11MB3349namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Why does the Redfish-=
Service-Validator tool fail to validate Oem, the namespace OemManager has t=
he node OpenBmc in OemManager_v1.xml.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"background:white;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"145" nowrap=3D"" valign=3D"top" style=3D"width:109.05pt;paddin=
g:0in 7.5pt 0in 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0in 7.5pt 0in 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Consolas;color:#24292F">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &lt;Schema xmlns=3D<a href=3D"http://docs.oasis-open.org/odata/=
ns/edm">http://docs.oasis-open.org/odata/ns/edm</a> Namespace=3D&quot;OemMa=
nager&quot;&gt;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"145" nowrap=3D"" valign=3D"top" style=3D"width:109.05pt;backgr=
ound:transparent;padding:0in 7.5pt 0in 7.5pt">
</td>
<td valign=3D"top" style=3D"background:transparent;padding:0in 7.5pt 0in 7.=
5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Consolas;color:#24292F">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;ComplexType Name=3D&quot;Oem&quot; =
BaseType=3D&quot;Resource.OemObject&quot;&gt;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"145" nowrap=3D"" valign=3D"top" style=3D"width:109.05pt;paddin=
g:0in 7.5pt 0in 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0in 7.5pt 0in 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Consolas;color:#24292F">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Annotation =
Term=3D&quot;OData.AdditionalProperties&quot; Bool=3D&quot;true&quot; /&gt;=
<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"145" nowrap=3D"" valign=3D"top" style=3D"width:109.05pt;backgr=
ound:transparent;padding:0in 7.5pt 0in 7.5pt">
</td>
<td valign=3D"top" style=3D"background:transparent;padding:0in 7.5pt 0in 7.=
5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Consolas;color:#24292F">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Annotation =
Term=3D&quot;OData.Description&quot; String=3D&quot;OemManager Oem properti=
es.&quot; /&gt;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"145" nowrap=3D"" valign=3D"top" style=3D"width:109.05pt;paddin=
g:0in 7.5pt 0in 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0in 7.5pt 0in 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Consolas;color:#24292F">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Annotation =
Term=3D&quot;OData.AutoExpand&quot;/&gt;<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"145" nowrap=3D"" valign=3D"top" style=3D"width:109.05pt;backgr=
ound:transparent;padding:0in 7.5pt 0in 7.5pt">
</td>
<td valign=3D"top" style=3D"background:transparent;padding:0in 7.5pt 0in 7.=
5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Consolas;color:#24292F">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Property Na=
me=3D&quot;OpenBmc&quot; Type=3D&quot;OemManager.OpenBmc&quot;/&gt;<o:p></o=
:p></span></p>
</td>
</tr>
<tr>
<td width=3D"145" nowrap=3D"" valign=3D"top" style=3D"width:109.05pt;paddin=
g:0in 7.5pt 0in 7.5pt">
</td>
<td valign=3D"top" style=3D"padding:0in 7.5pt 0in 7.5pt">
<p class=3D"MsoNormal" style=3D"line-height:15.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Consolas;color:#24292F">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/ComplexType&gt;<o:p></o:p></span><=
/p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"3" cellpadding=
=3D"0" width=3D"1013" style=3D"width:760.0pt">
<tbody>
<tr>
<td style=3D"border:solid windowtext 1.0pt;background:white;padding:.75pt .=
75pt .75pt .75pt">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"3" cellpadding=
=3D"0" width=3D"904" style=3D"width:678.15pt">
<tbody>
<tr>
<td style=3D"border:solid windowtext 1.0pt;background:white;padding:.75pt .=
75pt .75pt .75pt">
<p class=3D"MsoNormal">Oem.OpenBmc<o:p></o:p></p>
</td>
<td style=3D"border:solid windowtext 1.0pt;background:white;padding:.75pt .=
75pt .75pt .75pt">
<p class=3D"MsoNormal"><span style=3D"color:black">[JSON Object]</span><o:p=
></o:p></p>
</td>
<td style=3D"border:solid windowtext 1.0pt;background:white;padding:.75pt .=
75pt .75pt .75pt">
<p class=3D"MsoNormal"><span style=3D"color:black">none</span><o:p></o:p></=
p>
</td>
<td style=3D"border:solid windowtext 1.0pt;background:white;padding:.75pt .=
75pt .75pt .75pt">
<p class=3D"MsoNormal"><span style=3D"color:black">Yes</span><o:p></o:p></p=
>
</td>
<td style=3D"border:solid windowtext 1.0pt;background:#EE9999;padding:.75pt=
 .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span s=
tyle=3D"color:black">FAIL</span><o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td style=3D"border:solid windowtext 1.0pt;background:#EE9999;padding:4.5pt=
 4.5pt 4.5pt 4.5pt">
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Tim=
es New Roman&quot;,serif;color:black">ERROR - Type OpenBmc not found under =
namespace OemManager in schema of parent<br>
ERROR - Links.ManagerInChassis: Linked resource reports version #Chassis.v1=
_16_0.Chassis not in Schema localFile:./SchemaFiles/metadata/Chassis_v1.xml=
<br>
ERROR - Links.ManagerForChassis[0]: Linked resource reports version #Chassi=
s.v1_16_0.Chassis not in Schema localFile:./SchemaFiles/metadata/Chassis_v1=
.xml<br>
ERROR - Oem.OpenBmc: This type is invalid none</span><span style=3D"font-si=
ze:7.5pt;font-family:&quot;Times New Roman&quot;,serif"><o:p></o:p></span><=
/p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#A3151=
5">&quot;Oem&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;C=
ourier New&quot;;color:black">:&nbsp;{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font=
-size:9.0pt;font-family:&quot;Courier New&quot;;color:#A31515">&quot;@odata=
.id&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier Ne=
w&quot;;color:black">:&nbsp;</span><span style=3D"font-size:9.0pt;font-fami=
ly:&quot;Courier New&quot;;color:#0451A5">&quot;/redfish/v1/Managers/bmc#/O=
em&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New=
&quot;;color:black">,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font=
-size:9.0pt;font-family:&quot;Courier New&quot;;color:#A31515">&quot;@odata=
.type&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier =
New&quot;;color:black">:&nbsp;</span><span style=3D"font-size:9.0pt;font-fa=
mily:&quot;Courier New&quot;;color:#0451A5">&quot;#OemManager.Oem&quot;</sp=
an><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color=
:black">,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font=
-size:9.0pt;font-family:&quot;Courier New&quot;;color:#A31515">&quot;OpenBm=
c&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&=
quot;;color:black">:&nbsp;{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#A31515">&quot;@odata.id&quot;</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:black">:&nbsp;</span><span style=3D"f=
ont-size:9.0pt;font-family:&quot;Courier New&quot;;color:#0451A5">&quot;/re=
dfish/v1/Managers/bmc#/Oem/OpenBmc&quot;</span><span style=3D"font-size:9.0=
pt;font-family:&quot;Courier New&quot;;color:black">,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#A31515">&quot;@odata.type&quot;</span><span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Courier New&quot;;color:black">:&nbsp;</span><span style=3D=
"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#0451A5">&quot;#=
OemManager.OpenBmc&quot;</span><span style=3D"font-size:9.0pt;font-family:&=
quot;Courier New&quot;;color:black">,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#A31515">&quot;Certificates&quot;</span><span style=3D"font-size:9.0pt;f=
ont-family:&quot;Courier New&quot;;color:black">:&nbsp;{<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font-size:9.0pt;font-family:&qu=
ot;Courier New&quot;;color:#A31515">&quot;@odata.id&quot;</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black">:&nbsp=
;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;=
color:#0451A5">&quot;/redfish/v1/Managers/bmc/Truststore/Certificates&quot;=
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#A31515">&quot;Fan&quot;</span><span style=3D"font-size:9.0pt;font-famil=
y:&quot;Courier New&quot;;color:black">:&nbsp;{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font-size:9.0pt;font-family:&qu=
ot;Courier New&quot;;color:#A31515">&quot;@odata.id&quot;</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black">:&nbsp=
;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;=
color:#0451A5">&quot;/redfish/v1/Managers/bmc#/Oem/OpenBmc/Fan&quot;</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:bl=
ack">,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font-size:9.0pt;font-family:&qu=
ot;Courier New&quot;;color:#A31515">&quot;@odata.type&quot;</span><span sty=
le=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black">:&nb=
sp;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#0451A5">&quot;#OemManager.Fan&quot;</span><span style=3D"font-size=
:9.0pt;font-family:&quot;Courier New&quot;;color:black">,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"line-height:13.5pt;background:#FFFFFE"><o:p=
>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR11MB33494E24397F5FEBF895988EE23E9BYAPR11MB3349namp_--
