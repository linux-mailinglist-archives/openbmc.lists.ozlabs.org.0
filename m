Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3E1068A3
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 10:09:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K9bD5LzLzDrKj
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 20:08:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=zbigniew.kurzynski@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.b="TkN/Fx1u"; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K9ZF6lCMzDrCJ
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 20:08:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 01:07:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="407516209"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by fmsmga005.fm.intel.com with ESMTP; 22 Nov 2019 01:07:56 -0800
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 22 Nov 2019 01:07:56 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (104.47.49.51) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 22 Nov 2019 01:07:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijiH1WHh+kwyBJTrZaTgRxjXmPbRuc3i4RLZRIe2mdaIYVGCyIg9uRwAh4y/+OSasU3ULG/oRHTZFn0ZCq43Ew6LETviKlEqThYjRjHA6MK/QjRH/wYuCpRREBgBMoTeTjk1zWviwlR+pPJlxokvtDuGd0+LL1OzBkBzq+V/FZB9cRywczYdoLozDF1mqO5XKvUM68ul0sqvzHm0qKnusfh30y8mK/yXvgfeG57iqNHkghQnduYOfkNTBibL5botzaorkFcHUtm0rxRHn1NaXIGu37JgJjFHlR0xwEd8xL1TKfF5q3xOtCJNtAQimht0e0pUn0dBDkHyTcFc9NTlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntDJhOl9JAi9QLqz8CMX3VPt0kakREJA9S8BkxnBB5I=;
 b=GhMQ0K7Cxo7rSAR0nFGMR41sadyHDKBB9Udp3KuNvNDfz9nvVHJdPhFqFd0a6nqykpUrMa1DPyabKsTCIfA11+oWHHvvpMKLOOfSN5pz+L/rzxsIk2fUjFXNZ3u2IG/mG6xH/WP8/Au6S9VEbkFFbZ9yobOBApsGp2KDu+dNw73YnFF+Js3q/HFA2LlfLumcE7Vao6HWE1XhSFiJ0n+KBmga2w2SFTDI05lI4IiPdSOFXfdn5w7PLRAmuglevCz/lrHn6HKNaiaDAETfvyseH2jkPdPfa4rCHrnHbxbZEyTdD/e8nX/GHO4ftQ8v0Dz+S3wos9t5QyqxhWGFA1pqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntDJhOl9JAi9QLqz8CMX3VPt0kakREJA9S8BkxnBB5I=;
 b=TkN/Fx1uH7xAKih5Qm3Z7lvNX0k8qojfzQcGjVe70Vt5/n3+a54bWVM9l8c9yo35rOT90a4igeUdrocuE1TLT1yFr9/YM/MIEm2KAuUZOIZAtax1JEEwT3ttf+5Pruj7UoTPd5LBDxRxL+K1TgBRrL+cnyLlAFxr7zlanbBPTP8=
Received: from SN6PR11MB2749.namprd11.prod.outlook.com (52.135.92.28) by
 SN6PR11MB3231.namprd11.prod.outlook.com (52.135.112.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Fri, 22 Nov 2019 09:07:55 +0000
Received: from SN6PR11MB2749.namprd11.prod.outlook.com
 ([fe80::5ccc:3522:bd20:b4ac]) by SN6PR11MB2749.namprd11.prod.outlook.com
 ([fe80::5ccc:3522:bd20:b4ac%3]) with mapi id 15.20.2474.019; Fri, 22 Nov 2019
 09:07:54 +0000
From: "Kurzynski, Zbigniew" <zbigniew.kurzynski@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: phosphor-certificate-manager refactoring.
Thread-Topic: phosphor-certificate-manager refactoring.
Thread-Index: AdWhEjMmYpc3/EViSxmZcopSijcz3g==
Date: Fri, 22 Nov 2019 09:07:54 +0000
Message-ID: <SN6PR11MB2749157C9FFBF80F4C8FA9B492490@SN6PR11MB2749.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjE4ZmJiNGQtNWFmYy00YzM5LWI4YmMtMWFkYTE3OWUzZGUxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUVVLMTBcLzdRXC9Md28ydldSQTNFSG45c1NDKzArNHNtbGJ0VWFqSllEb2x0VTgzWUJGblRpck9ncjBRRFZ0bkh3In0=
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=zbigniew.kurzynski@intel.com; 
x-originating-ip: [192.55.79.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41efea52-e1e7-4f77-b55a-08d76f2b75e8
x-ms-traffictypediagnostic: SN6PR11MB3231:
x-microsoft-antispam-prvs: <SN6PR11MB32314218013B543F88D1504C92490@SN6PR11MB3231.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02296943FF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(376002)(396003)(136003)(366004)(53754006)(189003)(199004)(33656002)(66066001)(86362001)(6506007)(7696005)(3846002)(102836004)(26005)(186003)(6116002)(2906002)(6436002)(5640700003)(55016002)(9686003)(25786009)(2501003)(305945005)(66476007)(66446008)(64756008)(66556008)(316002)(71200400001)(76116006)(66946007)(14444005)(7736002)(256004)(3480700005)(2351001)(71190400001)(6916009)(8936002)(1730700003)(478600001)(81166006)(8676002)(81156014)(5660300002)(14454004)(74316002)(52536014)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR11MB3231;
 H:SN6PR11MB2749.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VUwePDYRF4trezw1i69emqesbu8QVsOCrwhf5c9IJvFjhUiMmCAaM9MTCRC0e6RA4ygFp/C0OKIWYN8ssqsUzd+kMJkQoxQFGvCntr5myA5XWXGnSrXgW0j/rBQeDcWaSQeiC6SD2b/NzX6/SdbzTA+KfPBjR+PadLQ5KXbBb2QmTpUx068/G7wA9figJKkvD5Gw9igyTtFIjCK4PjFSpNhUVd/cI+19CrG02z14ZWLSSUy8XiJGxUR0WrPIugFNkY4YgIm8f2Cjg+FSOt3JQHDPnlRwbC8wDIRfIwjhe/Y89DRPVhfXdOg47BkTKnf10xKCUbvYR8MNQs7bxXhd/nZRlank6UwHfllePvktN86GOjdDomF329fYpeyjN/VIIka/b+2XMzcF1wyNOwf9BPBKC0OqITQO/E33rSGr2Qxur3FuTb8xYB/EEgWdxBQZ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 41efea52-e1e7-4f77-b55a-08d76f2b75e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2019 09:07:54.6647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qF9Q5ReKdNx00NrRXuZsUzAaaevW7cMoRGMJUckrDkmpV7LeolTNjCH+2BuZ4P9BZz67Pz5niCMeAMhDQ2fHXclY5Coc2vAKjYUCfELy6og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3231
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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

Hi everyone,  =

I think it is good time to do some code refactoring in phosphor-certificate=
-manager.
The certificate manager supports few certificate types, each is managed by =
a separate service instance.
	phosphor-certificate-manager@authority.service, phosphor-certificate-manag=
er@bmcweb.service, phosphor-certificate-manager@nslcd.service
Initially the certificate manager was designed to support single certificat=
e file. But now one of its instances supports multiple files and the code f=
or that case differs quite much from the rest.
I would like to propose a small refactoring of this code in following steps:

Step 1.
Create a new subclass of Certificate. The base class will remain as is, foc=
using on single certificate approach, while its derived child will extend i=
t with support for multiple certificates.
The Manager class seems quite generic and I would leave it as is. Two insta=
nces will operate on the base Certificate class, while the third will use c=
lass derived from the Certificate.

Step 2.
Moving files:
	1. meta-phosphor/recipes-phosphor/certificate/phosphor-nslcd-cert-config/e=
nv
	2. meta-phosphor/recipes-phosphor/certificate/phosphor-nslcd-authority-cer=
t-config/env
	3. meta-phosphor/recipes-phosphor/certificate/phosphor-bmcweb-cert-config/=
env
to repository phosphor-certificate-manager under a new directory 'service'

Getting rid of below recipes and moving their functionality to phosphor-cer=
tificate-manager_git.bb if possible.
	phosphor-bmcweb-cert-config.bb, phosphor-nslcd-cert-config.bb, phosphor-ns=
lcd-authority-cert-config.bb

Step 3.
Changing the way of managing and storing TrustStore certificates.

Now all certificates are stored and managed directly in a /etc/ssl/certs/au=
thority/ , but files in that directory are subject to many restrictions lik=
e: =

	the files must be named using the subject name's hash and an extension of =
'.0',
	If there are two files with the same hash they should have different exten=
sion number,
	Extension numbers cannot have gaps, which is a problem when we delete some=
 certificates.

I propose to store certificate files in a separate location, where file nam=
es do not have such restrictions.
And put in this folder /etc/ssl/certs/authority/ only soft links to origina=
l files.
Each time when any of certificate will be changed/deleted/added the manager=
 should simply delete all links from /etc/ssl/certs/authority and the recre=
ate them by iterating all certs files.

Please let me know if you have any concerns.

-Zbigniew
--------------------------------------------------------------------

Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek
przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by
others is strictly prohibited.

