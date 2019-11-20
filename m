Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08A1030FD
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 02:11:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hl5J00BzzDqh2
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 12:11:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.77.95;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="GDcO28Yk"; dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770095.outbound.protection.outlook.com [40.107.77.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hl4b6FpyzDqWP
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 12:10:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZoeinfo8EmziqXQ1D8pfEYqHmITobH5QxtP249hH+aTUv839rXl7taD/jhp1V19sq4ZQMYRQl3UXoCpKY0Rz5nlXgRc3TsQW31tHTWCTIg+lpcNvb7VOwS5LTIzCfADXWQuoj2ri6i1TZW26Ysr1zKNYNM7tmcFYv43Chd5KajwpL97dBqB/Q6ztMbqJ+gfoD8D+s7PH/+2SnsqNTBiR9q4DoYeSaUjcz6URE8KqmkLS0ajznY/Pmpi4tgSAfFQv9HiC0jqrj3JxFVm8gcD9vR/8JR2NIncCD70DB3zBjZHT2n2Y9YcJHv1TvvryL6oaXKizrBjJUv/vl6/nErisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynNtbQnnuVJgw/wa/75COZII66WxxaTDulDW1tqjPXk=;
 b=NKTObPy7XwtT3mrpN8wubu4nGUVOhmAImZUT+9ybUDlc8jmqb5WWuWzHDENStnQPbcq2xrnkX4aY0yXCOoizyuN0j0w3NQ7wwDyURgZFILLNAmSMR/95D19NJbhrVuUfbnjGKLmRPiKIia/ikg7WwK1B5Yt5RptNE13xbfrm1FwRlP2+OY27SZxB67o5D8oFB0mVUTZyepXBUdCGUCfyqVnlWOa/VUgC2YUvBFuKPbpMj6KcjeHCwmzzyiAlwgyT9ueo9rfDc40R1HhPY2rM/9JFxfe0BKjDr5qRAv/+XMRMT3HQ/4QAGG2jO+fVDhFzLXzEHUy+H1WQQMP/eCw6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynNtbQnnuVJgw/wa/75COZII66WxxaTDulDW1tqjPXk=;
 b=GDcO28YkVsxzF50zNPIgqEOh5RXuOZokA8yBO6kbZIpEESK/OfDS5yNXU0K+mPcg/Y0J8L5zyOFDjIUzjkZDXgqMA59jAONOwbecr3/WrtLdUKg7Y5saTrh/D066cwpUASrZs/BHIty3nqz01q90c6IVBlbMS6tKF1oU+I2lfJw=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1157.namprd21.prod.outlook.com (20.179.56.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.3; Wed, 20 Nov 2019 01:10:50 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::4061:7276:2e3f:37d2]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::4061:7276:2e3f:37d2%2]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 01:10:50 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC performance on AST2400
Thread-Topic: OpenBMC performance on AST2400
Thread-Index: AdWfOXcU5YedmCvgSyKt90DRCzBX8g==
Date: Wed, 20 Nov 2019 01:10:50 +0000
Message-ID: <BYAPR21MB11918F9B4AFFC4B9E7FADB22C84F0@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-11-20T01:10:48.4092529Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=bf13966f-92ee-445a-b94c-96519efcdd9a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:a:11f1:b39:da47:5319]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22539c99-77c1-462a-cef1-08d76d567b9c
x-ms-traffictypediagnostic: BYAPR21MB1157:
x-microsoft-antispam-prvs: <BYAPR21MB1157E11A909E53A256B62E54C84F0@BYAPR21MB1157.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(39860400002)(396003)(136003)(53754006)(199004)(189003)(6116002)(256004)(186003)(7736002)(81166006)(10090500001)(102836004)(6506007)(66446008)(66476007)(52536014)(5660300002)(86362001)(71190400001)(71200400001)(66946007)(64756008)(66556008)(76116006)(99286004)(55016002)(2351001)(8936002)(9686003)(5640700003)(2501003)(305945005)(6436002)(478600001)(316002)(558084003)(22452003)(81156014)(1730700003)(8676002)(7696005)(25786009)(74316002)(46003)(33656002)(476003)(486006)(10290500003)(6916009)(14454004)(8990500004)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1157;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G6rirZehuX+Yth4SOVv3cJoWATsfwbds4v3/ObC2A9GyEK5F81YsK8yKqD11iYeBE32A2CaB3fklOfVRP3Jyg8mL+hibQkSefCTs0YlxSCKgT6fXBpJK83ALvBEw4RpEs3qjy1QZxf/rfd/87fo1x3syJoS0AcYQv0FiM1uUQggpb8ETkKLOygGN19l6+zVBNt68ZanoHaZsAihQo372jYAZW4SnMr4RbrKabuQSHge3bZCfYEK/QWnoWhe6vv4dOMmBp1E0EHRPUI68lDCMOte2VZxyVMpt3o6KaMi0zaEmBhHZqWAkznkXzDiNd8MLGUaIomd1LceuyeBcSBlljDmBi/Mye7vQTQURHuOd3c478KqJasDl3YTlHtP3F9U1+UFPvd20LzjLdm0mcSadwQ+2k8Pq0a8yTQhal2IDKHU0HgZhHJsdV21PkcL4oV5b
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22539c99-77c1-462a-cef1-08d76d567b9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 01:10:50.3824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 83BIQUS6Mu9Wr2gbgPbzXGE8gRanHki81Z+OvvzNr2kciXuiCMJU5ZzbbaBM1/fJEGfgYlN1gRDphIPC2JZsZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1157
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

Hello All,=20

Is there any performance data published on OpenBMC with AST2400?  E.g CPU u=
tilization during Idle, sensor monitoring , stress test or overall time to =
process a IPMI/Redfish command?=20

Thanks=20
Neeraj

