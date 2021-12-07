Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB8A46BFF2
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 16:52:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7lDZ2JQDz2ywb
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 02:52:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=XDrCMNM/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=XDrCMNM/; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7lD13m29z2xrx
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 02:52:00 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="261672219"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="261672219"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 07:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="515326578"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 07 Dec 2021 07:50:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 07:50:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 7 Dec 2021 07:50:48 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 7 Dec 2021 07:50:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYMpi7lI7KZZze66jRH9S2pl/nUvQFcmLsZxg9rYaN9r8ppdVsFs+F3lZ2sinuhkym5U/ZSvUuxstQfhPeTlIgfRjHveOxD71mC8cGMlscuk316iL7MRBnvAA48Sic1pfOTWOx4k9Dzn4lIzBsGlfVN+u6KJa+Ckwuv071a4XFGwnj99b056jll7m7+bEByPArlNq0vucEDrIOzO6S7iT4TbzhZqJRIdzObltGFrRsGeGr3sPjJTatADF2xla8t/sMjPnmlnVJRe6lrs/kpaesxvv2PR5PVyMuqyunyS5juZhs1Bjjux4172F2rJlVez8wbasSXctm4RNHr9uHVfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDwhFdjADbdsjllykKco0G1nboePeRZRvAl0P94YXfI=;
 b=gDzFX4fnUJGDoXpZQtEclekYtjjccx+imGeVk1EGNqFoAk0lePcdOF32qybn/EF4CjRq61PEn+IlWnoYPsmHgy5TZBmxgAh0Y9Xsr0yReNNXD05PWIUwrb0buvPuGt+gTeZ0WQKzH03ZP3PqVpKk8+v82tQ/1NJ5OOHiZ9uO5KoesXtIFSaKcVq5f73HQkkN8DBZwiqYqnco3Dwp/iaB75uzqbDUelJDeU/qEJjpidUt/DyATPXIZqbkBk9ZD3Yw9tUyEkqg5k9YwgBDWZSm3w5M8BK9T6SaWrdoiQRi5wzChlbWLr48QIAVBIlviGgTCvEAdW0SrYVmzXl7A4H+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDwhFdjADbdsjllykKco0G1nboePeRZRvAl0P94YXfI=;
 b=XDrCMNM/TFhP4TQsFQrxQltnPPqe0AQR8tl2VVp0D/3nsasRNfpkG5X2HobDGUOhrecnmvOQ+aTArKbNj8mfTXFo5h1TW9/lrEfZP6Ykkd2/hTQFxbNJdDXWm+IFQf0M/KEWi8TX+KKwno6h4wcO3e4IzxnowfwcrqvBPFEiSL0=
Received: from DM4PR11MB5247.namprd11.prod.outlook.com (2603:10b6:5:38a::20)
 by DM6PR11MB2907.namprd11.prod.outlook.com (2603:10b6:5:64::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 15:50:47 +0000
Received: from DM4PR11MB5247.namprd11.prod.outlook.com
 ([fe80::cc1c:8881:2222:3c56]) by DM4PR11MB5247.namprd11.prod.outlook.com
 ([fe80::cc1c:8881:2222:3c56%3]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 15:50:47 +0000
From: "Hawrylewicz Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Virtual Media repository request
Thread-Topic: Virtual Media repository request
Thread-Index: AdfrgHuEI0ZMq8KMReSTBd6TOacaLw==
Date: Tue, 7 Dec 2021 15:50:47 +0000
Message-ID: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 42387f11-b816-440b-4a8a-08d9b9995643
x-ms-traffictypediagnostic: DM6PR11MB2907:EE_
x-microsoft-antispam-prvs: <DM6PR11MB290728B21DBFF4D9DF0C83D5B96E9@DM6PR11MB2907.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFG/aGf99GaJV3WAGtSvWKCYI+mVg5Ce6M+AAAs6koOl3JJZeaGU8TaG7YQAzKziECNki2pICt2PVbzF9D2PiRwe9dgWVYjHRU0M+yv45FwdoKjBiJ91apsyB3TMOx9NYa1Dsw2ckIezrn6Np5rutvo0hf8oGdT8UbasiA9PnezjWfdbr0ZvQTG15ZgKczUS0HfqcCpyMiKv1jcY9q9up+8knn+RfkzoOXKpMACkMz0cexeFQ5FNmMD/O/rZ9g4Vh3NVasgEGr85O86QaXgaav4wnJtUbC930gvjAVzm3QSrq7LED2mFAwGeP4NP44sfC+rHYRQTIv5D9t7u5vKnaFJAE3iG/A9rOrtjlAcWX8VFGOkWWuimY1caydzS9d6BNQfzAThAH7Q43wvvExdKs9/AQs96nXoe5nOKghzW1/C3shnIUshlxagEoc/xKACdGZzrGGS5mj8xyDwYXo5TT9jDR6QXddF9JCpjTb8CdVaq2yenqA0YmYHPeWOcujwWUzoFG9NrHui0EPTqnr79D41MsMJW0Z+c+7KtM4WL907jX57q8GrJW7Eu306fETk5ToW7Ak5B1nefsPMy0BzCVH/ztpWH5wqKWWg700u9p7b8FZxM0Bvdnufal1zHlUKCBmCwWdZ7+GDu40Q4HVRiTHo2Ms2RAnsYrhuBbL3PfBc9OTuBD2CGyJUJm7EGOut1X1YEDAjeW5Sga+2oY+wuy18IUDpLqqSu5PuNVg4inQ0Be91I6bv5IPsAq804IMWpbaVc4Iw5WVBYAGEO50RiVo898GUBc4YlmB+InTrxK8xRFJCbqV0xHWWmjlj3yzS18Wjnz/jaNnxM+AiCUfKQtw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5247.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66556008)(38070700005)(66476007)(508600001)(66946007)(26005)(5660300002)(8676002)(86362001)(71200400001)(966005)(9686003)(186003)(4744005)(66446008)(2906002)(6916009)(64756008)(316002)(52536014)(55016003)(6506007)(122000001)(83380400001)(33656002)(82960400001)(38100700002)(3480700007)(76116006)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P7ZPEXnrGsG4rrK+djNnV11VgGIBYMnzjBWQq+yIgk8UUeZijhh08FKJWtkx?=
 =?us-ascii?Q?pxR9xg3zOdYYcgQRRDzAF5iCHLU1xPG1b3GvaBLsNEwkR8urLF5QRRrgMoFK?=
 =?us-ascii?Q?N8NH1TnUgWlHjmqc3Ii9B1x/guxXxbhVtZDteI38BG87i1hSYKBRHRnTuSka?=
 =?us-ascii?Q?19ZrFzvltfZuuF39ZOVVJp85tSAgkPhNWVwuMpZe8AU2u3AD703vu/eTUeQD?=
 =?us-ascii?Q?KXfGMOwjuTzvoG36LeXsijD94Sa7y48dSo2e/HT9rl0KLkmwq6O7krn065Mc?=
 =?us-ascii?Q?MzWsJ9c9XSR+mviocUHPr8IbEbkuSxmUe4vtY9//yFr0Loxod6WMu4y1aD0E?=
 =?us-ascii?Q?Ph8oXJm8HqLpUOGFZS0wyq20MlhG0oQ2mnGbAMcUUOMF97FhzX1h5drWDUxA?=
 =?us-ascii?Q?t4V38ikfskCQLvuBa5kQB1Vscw1v/1rYwmbP8y1diTHAciPPo/BkgzH7alnO?=
 =?us-ascii?Q?Ky/9KFKSitLQBaNVTJqI4fpE5TpXnNUEwuQzQJDSjEOWlPU3CIL1tprLM+Sr?=
 =?us-ascii?Q?sgcp0ln9JaLmT/6HfZhrTNVaxARuSZTCM+udUcK7O9PtBd4igciZHQcuh03l?=
 =?us-ascii?Q?Qx/5jF2WMLo5/DjryWS/TQMp9RVbcJW46wLamnMi1oPkBMCN1P2aa356qkR2?=
 =?us-ascii?Q?oz8xrUMMG6k0evBUtz+v+DTfMMyQC/aBFFrjasLON/Po0aVCmUyjYib1lz4P?=
 =?us-ascii?Q?HBA5suaa0DNr8/WOoH4LmR2tQsuK59t6rgNaujG+xoGvcIJAK/SL4enxGIfO?=
 =?us-ascii?Q?/dtAdqiC+HxwCHJShzaow519JvSn1W8eet6qJpAr+e14hIxQzkP7/qm4Yhaq?=
 =?us-ascii?Q?0cGKH9umNfFzmJ5YdEpcK/DBfNNZ2MwnjzT3xkBYONtaATF/GBAKF1gbubmc?=
 =?us-ascii?Q?5XqHvWjnpP5EwrV79sy/7T34YlOVmpy9ZbBLtGT9mLf64FwI3RkzAw0ve1+4?=
 =?us-ascii?Q?GO7Rk/DQ98R9tlozRUKYZsN9CUwY6FC7zz1zFScN1eBpIpKdLjL/wat4Jbfs?=
 =?us-ascii?Q?e8VjRNu+TxyPIYdYcnXR+p0r3MTzVONg861qfesZU30LlpwMPhkxSuWKOu/e?=
 =?us-ascii?Q?YmNeU4HtDCYBNNP5BCzKLxj5ewGDeKjEkBfQmAgJ01sJVWT5kSIprBmtS7by?=
 =?us-ascii?Q?dMm2k3CZRVSwvqRY0P379AMPOnljYctrN+JHd0AEY8ts14O1tyO/jPFdg9o9?=
 =?us-ascii?Q?PgMWLYtRb+DIzsYyFUCoT4WTdch9yyWww0y6G9xK8JrgaEVCwDLL8ZF8RxYC?=
 =?us-ascii?Q?VjN7RV25MAc8gylM/gri1o/sUpBhqL13eT/Tg+fyQQ65o1jeQ3F1g12jszcn?=
 =?us-ascii?Q?Z7u678g7wuEPexzBpRjJ4hCp+5M/LJ4kf4wGxL1IFvzBX5O6me2YuHuRD8/L?=
 =?us-ascii?Q?oYCzNwAt+QdfQ/MPw65qZLSXM/B++JM+cRR33Hh9XQTGwS4hQOlxRxsQgG71?=
 =?us-ascii?Q?9Y6W1GWlrAXji33n5kzRhKLySgw2LwTeTBQSkZrCjVJHxFJLZmFKww0fEeW4?=
 =?us-ascii?Q?zg00cG0yF9gtowVipkhd6gwQq8srdToN7e8Y5SxpSfn6ZWH1LVEvWoullRnM?=
 =?us-ascii?Q?NbNAJ68g3V5hfdTyeI8Js3xa2j9Lp0du++vqtEH4QmUYEzjqEvgfLL/zTwNV?=
 =?us-ascii?Q?neT0pyLKXonxbDbtWL6t8ulQRlg/6EVrln4Bq8ILWox0d4fod7IDb5tyCVPD?=
 =?us-ascii?Q?EeOK5A0+j9Er3dGVQEWItMwuvp+sSSOeayXdqICKbLDq0lVv5T7ie/G5/bc3?=
 =?us-ascii?Q?uQK54SW6c+pEfcugjvtMnzQExNKjhGcyDxE+ARkoD/UrKpigaz9J?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5247.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42387f11-b816-440b-4a8a-08d9b9995643
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 15:50:47.7364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N2vpRWp7Qy+kqsKx9Txoxf3oey3Tx/mkKh3a+QdiJjjHHnc8tKybe+/0FBY8+I6hl/FOhEtXfsID3l8yDjeqS7E2JWS2CBZZNu3tq/I2wl2rbAfj+TZHejSgzbHGbSBzzT4eRyqRrRWC1kK/rVPYoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2907
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi.

I would like to request for new Virtual Media service repository (based on =
the design document located here: https://github.com/openbmc/docs/blob/mast=
er/designs/virtual-media.md).

The service itself is a reworked Virtual Media which early stage is availab=
le here: https://github.com/Intel-BMC/provingground.

And additional question: is there anything to do in order to enable CI for =
this repo?

--=20
Best regards,
Przemyslaw Czarnowski

