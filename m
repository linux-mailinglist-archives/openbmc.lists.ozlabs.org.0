Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0D12388B
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 22:17:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47crYr3VV1zDqRk
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 08:17:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.70.124;
 helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="fW52Pkp4"; dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700124.outbound.protection.outlook.com [40.107.70.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47crXg6vXbzDqM1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 08:16:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM/pCE8r4aqfSFvWgfgqFBQOADr1l/rFM2p7zrfvpOStZqvQ4+djfHiZTN57tZVkd7e7AHGXZ+fFvaLQ4777vLT5aeNKZQZvlnFOJ3SQwi2/KCFef5GJwMJa3RNGAXHT/3xlveAM65wT+Y79UODLn+2c1yKM8rlnUnWRTdUuiEC+Rz90qRh7vw2G+3q45XWnEUU8dZC6xUhEg7KWo2EKQhGRsl4wmfK5Pc+zlkDoJGE85THyoZYh2QX2xe18NYC/Zzznsvt2B6k2SIwvqp38BQgO16E4L+nVd8bDdZRxu5HWZwm67Y22PqgdOkVHHNQiB7aj26HNYFpHyRyi9IH1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxTjENjbQYJVJnXMgLU43Yb+y5d4UQUupqzmEH+emFM=;
 b=QwIRleuukvklaTCWX9XVv3Pi0GEoz2iwqG19rydYMAlXhtlSLE2kivfLn1bkBahE0hBtrYr7moPbHNkyfjoz7G338Z5hnhmI8gb6jsVCY+FmRfR2KNR+2xT6DhJ0jXZC3u8nUIo/nD3W+JXmq9qYZ5NIoQNG8oRXiwqRhtWa7hAJKVvVnR2H/PL2z6rmUcIk8ZUYNY3ImXj8F2Jborz7G0iI1hW/hnxjef0tjbFFn5UseMtvw1eDtw7JskdowTq5rdZPUjHWydzMzg+jDZvIOWN3Vzz1KktjZhZw5VkUGOtEOVGj2A2cWoLHGVTkQrciMWokpRPwgbYHqvkueCQnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxTjENjbQYJVJnXMgLU43Yb+y5d4UQUupqzmEH+emFM=;
 b=fW52Pkp4U1DxSCdqjPodk5LRIbJrIzO81FJpNjLOo8AG70dDJ4FqmhVnuZqwa8onOfRnB9oyh6mFiqnecVqKJwF1/0M4HsD7m6I1reQyhEVzR0HW0daoD94TMz0PzixfqTAj24kwpSPFCt4SNLEuoCwsXr+X4NqdF0OyZQBK5CY=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6PR21MB1242.namprd21.prod.outlook.com (20.179.50.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.8; Tue, 17 Dec 2019 21:15:56 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::b49e:1e60:52e0:69cf]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::b49e:1e60:52e0:69cf%6]) with mapi id 15.20.2581.001; Tue, 17 Dec 2019
 21:15:56 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: [EXTERNAL] how to get pci config space
Thread-Topic: [EXTERNAL] how to get pci config space
Thread-Index: AQHVtPhoFm1LEaTOGUCqyx7AUYNegKe+tCuw
Date: Tue, 17 Dec 2019 21:15:56 +0000
Message-ID: <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
In-Reply-To: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-17T21:15:54.0554900Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d6d0cc57-2df7-4f6d-a636-5ff857d0a7c9;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4d42127b-93fa-410b-13ad-08d783364e75
x-ms-traffictypediagnostic: DM6PR21MB1242:
x-microsoft-antispam-prvs: <DM6PR21MB12427825804EDCF084B7840FC8500@DM6PR21MB1242.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(39860400002)(396003)(366004)(189003)(199004)(13464003)(8990500004)(71200400001)(10290500003)(5660300002)(66946007)(7696005)(6506007)(53546011)(186003)(33656002)(26005)(8676002)(9686003)(110136005)(76116006)(478600001)(55016002)(66556008)(316002)(8936002)(86362001)(52536014)(66446008)(81156014)(81166006)(64756008)(66476007)(2906002)(66574012)(4744005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR21MB1242;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uQqUHCJyj9VT9UMavYVPp20MbiBBXeOuQJtD+KqtNrd8WVdYB6wt8dURTt2Ree58Y3YK0d3WLhRbLkXmJwTS99lWFZ30wblVgumuw6oClHORD8zSQDnmRN9TKC6BTNfWK/jpdCLa0vUEf6XWgbaBsTVybCpW2RNUjdrc6PyDA/sZVVXMwDRHzxjgx4/UUDpFqxIwSEmbSSQVCCQQ80jyeiEwBIOtLu/MT8IyYYoI2+Yg0c4tYGvSTu4IQ9DbyRjnd7Aoaym0jVI5R3wtciKCZOYCANnqGmjMpkNXoHezzBwwQD73d5ZTgT+b6TifWnYztmrQ+7yRnJSjoReESOg9x/dXM0Q8MUWneK9tnqn/CQug2gef5aBxnEv7z9FBGx0jK46LUL4F1HgvlwikSrG7/KuwHYa6yvFKlpBgQ0AWMa9QWoQ59/bJLUw5GXDBj1Oil3SrbIzSSu9dRW1JOARZoLwJEhwD5RezBac5EilFOaIYAg5ilqPkEYDCHFbzT7PP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d42127b-93fa-410b-13ad-08d783364e75
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 21:15:56.2479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ky5WGehJnRbJEd8tjfBLhS7t04vytRXr7vAMSxgXJqCi8eJnrvCSLGy1pcTcU7o6zOTg6g4tVDU3i6EZLHLxxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1242
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

Is there any broader use case for this?  I am not sure on Power but on x86 =
it really depends on how the CPU PECI is router to BMC. If its wired to ME =
then BMC->ME->CPU( via PECI over DMI or serial PECI) but if its wired to CP=
U then BMC->CPU( via serial PECI).=20

Neeraj

-----Original Message-----
From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> On =
Behalf Of Brad Bishop
Sent: Tuesday, December 17, 2019 8:38 AM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [EXTERNAL] how to get pci config space

Is anyone already sending information from the PCI config space down to the=
 BMC?  Does anyone think exposing that kind of information via the BMC woul=
d be an interesting OpenBMC feature?  How would you do it?  PLDM?

thanks!

-brad
