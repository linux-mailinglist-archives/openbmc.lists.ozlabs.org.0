Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B236B65D
	for <lists+openbmc@lfdr.de>; Mon, 26 Apr 2021 18:01:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTV4s5GQ9z303k
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 02:01:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=b4FERgmb;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=b4FERgmb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.128.92; helo=kor01-ps2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=b4FERgmb; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=b4FERgmb; 
 dkim-atps=neutral
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1280092.outbound.protection.outlook.com [40.107.128.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTV4X6kPMz2yRQ
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 02:01:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvSHxOC5RZ5VmV25O7cb7KKi/pK+8CMi2Ep3v0MIixU=;
 b=b4FERgmboR3FsKexMHNcCcB0pFXsLXO24J/CLvoNmVUPzosIWxYsrsmzXBP9CMVBkcNL0k44Wc1XyOJ5Cb3VKZXOWDloC/yDIM8VzLP9ZByVkEJQf6FmWxdieZkR6al3xqv/VzxEUtxpDDdcsliVqDlg2Z+0VcqDPWXViyOTkY5DMzrVuLj1TF+ak3dTcSSaUT4p197ZZioAF5xhmAX3ouMTj9se9owtZPrTSDZAlUQTvD/9OCnKdftjnelAf5dp3dC0qabBMAz5vveNYMZDzrluQfiwyul3tVxWPq5/nwziYljV2xe715anLyyuf2FIQMxdr+tLWdQwrmudZLrFdw==
Received: from PU1PR06CA0007.apcprd06.prod.outlook.com (2603:1096:803:2a::19)
 by SL2PR04MB3370.apcprd04.prod.outlook.com (2603:1096:100:3d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 16:00:57 +0000
Received: from PU1APC01FT059.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:2a:cafe::3c) by PU1PR06CA0007.outlook.office365.com
 (2603:1096:803:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Mon, 26 Apr 2021 16:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.51) by
 PU1APC01FT059.mail.protection.outlook.com (10.152.253.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 16:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7ZSYUyfnQeixiY0ieg3/hyiP81pUc2CjRJl7/hfBSWLrX3d58yiiQzqmw0zRrg7eFqvyLw6m92VB+OdqZsHJ499gZv6Uu+eMMczt0I9o5n4OIS64daZ1oy8QAQs+GzNVSeXE+Ucu9j1p3Zhs9TNrmu/hV8MvziZ3AKbT6q+tcWqUiL+gEggaQEc8d3Z5NXj4v7SUYYgV106NN7MUFPplyngY4BNn2v15zZUZaiok0QVrb6D5DVRIi/khyfVKcuSG2NUT4hQejCvNQJ9l7i6klTszqUB03KJt7QnusU9IABK7g9DbMYGgRnk4i1xbzkghAxz+xbdqm+9XZRkUDjWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvSHxOC5RZ5VmV25O7cb7KKi/pK+8CMi2Ep3v0MIixU=;
 b=HOQoyhoDXqqNWrosPTiQ4V4IJ245RK63j+cGUwbK+dHNPq0Wyx09na7oMXlQ+zpNFJFEsWcDLeTSIRdBUSp2sk8oPgjFQeNbU4t3dB6K5Zy7FMIqmQR2x6Kn5Bhpld0UQpmKldXPBpa2LWhHZQG3lL90m95WSFMRxjK0ohT5L//1eu2Hu8Er9J4d3KG6TrOscReCcY3sw793vQrZv0s2ZwV21bZifyXujgwuo1MR3SOaCWx3ee9lalzi6+adbVMMQ20yvcnHo88b00kq5sS8phB8c4YWmjw0IFmC1D6IHyUuEr+v7dLVVCsfagWArErE9ayk9UjN5U8RDi55+GsXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvSHxOC5RZ5VmV25O7cb7KKi/pK+8CMi2Ep3v0MIixU=;
 b=b4FERgmboR3FsKexMHNcCcB0pFXsLXO24J/CLvoNmVUPzosIWxYsrsmzXBP9CMVBkcNL0k44Wc1XyOJ5Cb3VKZXOWDloC/yDIM8VzLP9ZByVkEJQf6FmWxdieZkR6al3xqv/VzxEUtxpDDdcsliVqDlg2Z+0VcqDPWXViyOTkY5DMzrVuLj1TF+ak3dTcSSaUT4p197ZZioAF5xhmAX3ouMTj9se9owtZPrTSDZAlUQTvD/9OCnKdftjnelAf5dp3dC0qabBMAz5vveNYMZDzrluQfiwyul3tVxWPq5/nwziYljV2xe715anLyyuf2FIQMxdr+tLWdQwrmudZLrFdw==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2604.apcprd04.prod.outlook.com (2603:1096:4:5c::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Mon, 26 Apr 2021 16:00:53 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::54f8:a70d:5570:fac9]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::54f8:a70d:5570:fac9%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 16:00:53 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Entity Manager error in tiogapass
Thread-Topic: Entity Manager error in tiogapass
Thread-Index: Adc6tGSjhLUXMjPPTwme3f9r4r0GsA==
Date: Mon, 26 Apr 2021 16:00:52 +0000
Message-ID: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYjkwZjc1ZTItMGE4YS00YjQ2LWI1YzMtNGM3YmYyM2UzMDQzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InNvUWNrR2hPbHlpYWIwT2FkTDVESEl3eEdvbFgzQmZqd21XY3hmQllTV0VHV3pKK083OHhOUHd3SDIzbXdONkcifQ==
x-hclclassification: HCL_Cla5s_C0nf1dent1al
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6e84:85e4:701e:6130:52a:3a3d]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fc28dcbb-ebca-40f0-9ade-08d908cc7a16
x-ms-traffictypediagnostic: SG2PR04MB2604:|SL2PR04MB3370:
X-Microsoft-Antispam-PRVS: <SL2PR04MB337055243EB5EB0615F18FB8E1429@SL2PR04MB3370.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: N8gbLVvu6Z8GCI9dR+5EeIaO2dDu8bmoz/uiyum+hxIzDlQnZFuC3r6h4DnKcxW/zdu1qEUM8bLrSmiYMUBj+UPX6uxAajz003Z9FtK/eNvPXICO6K6auDqupMwZgvwz0qBtMlSlTHE951xPTcP5tXD0iXxKcqTp2tydijq7sou2+lPVct1fpoclWbgxxAeDppR2d15+yQ3EYENIQGC0svucwCWqoU2OXrj66Ul2O0+HQRO3oweyhNjCKQurMvqwPVRAwkkaHZBaXf/Ls7/Y23xI1Sc0fgEzznbRsvVlTKNbow1sj6V32dRxrqiy8XRfeU6mP1S/gBn/iH3wGwSXHKFVIN77+P9DpCk27rFSqIcaypvYWmemOUPfDCNDnRs4BQD/2EZWyJN5/+7GPvinF8ADOfnOI7kPhbXDDJfFGR9wO6k5JRIzIz1RAmCb2xWm/iO8zrWl1vrS5CjCHzB2qJodyVrD4dzSYVTEdyH6raC8EDYQxmKx0MZu4v8bED/OzAHdvtjktnxqcy+IHyvgCcwoCBmnxhsB2NgCS54Uw6+d+78i9V96GANPamlulICtFpM9XwkeVLIZ0Hp9tETnZYFnocuRobX/JGudi8/ZRVLOL0v/oGcPsiPi8n7I2e/rUo5Y3G9zAtsL63u4lmFLNDEEZy8k2tbxRRz+eKH6k1BinAL+8xWRmp7Hff++yJlx
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(55016002)(83380400001)(186003)(33656002)(2906002)(7696005)(38100700002)(66946007)(76116006)(52536014)(498600001)(71200400001)(64756008)(5660300002)(66446008)(66556008)(66476007)(122000001)(6506007)(8676002)(166002)(86362001)(8936002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?c2FYUHZJMHVVRU9SaUkwcEZDMXArbHNwY3pXajVuTHh2MHlRWHZoaVd1?=
 =?iso-2022-jp?B?NmhpMTEzODZibk1rYjhaT2w0R3J4cTlPZVNjellTdjJjWmFhT2V1dE9F?=
 =?iso-2022-jp?B?eWFXbHRkbEZLamRydGJjdVNTTVEyRDIxLzVIRmNVYWJhaTZ1OHhUeTN4?=
 =?iso-2022-jp?B?N2ZZRG1tRVY0MHp5S1BGWWpoazc4NUN3bVVBTms0RndPQzU2dEdEVlhZ?=
 =?iso-2022-jp?B?Z1ZXSHZBSEtwTUpBc2J5am5Kd2pmS1Z5eVMwSVZIdmtjdDVWLzJsVkdZ?=
 =?iso-2022-jp?B?Rm04YmxhMGxKNE9EQXczTnlLbkwxSUJJS3dBZEdvbXp6aExXOHdVbVU1?=
 =?iso-2022-jp?B?UW5aai8yUEhqL1lIVDlPY0xZUzNNZUozd0xaa2Fsd0FOaWxXSlNOZ3ZN?=
 =?iso-2022-jp?B?T0gyTjVhUEQ4MUUxL2RJT1dXMWtoYVd3ZGNWNHNSSWpKUnM5MEFiSnls?=
 =?iso-2022-jp?B?WC92MXJBWUhSZzZJSGRYNmhubnhOc2pSaDNPUmFCL2FDbVNXQUlJMERh?=
 =?iso-2022-jp?B?V2s2TVpETnF2eUxWbUFxUjg5WDB0WFk0MmJrQ1RVejJpRHRpYWdWRXMz?=
 =?iso-2022-jp?B?OHdWSkI2czhBbmF5cjhzUTZaQkNOVGdodFByMDVXL29aK2FPalhYdEVi?=
 =?iso-2022-jp?B?UHp6bENhc1N5QzNKR3N2UUJucmtoWG9mdjlocHc1dGJGVmdNRkhINTcw?=
 =?iso-2022-jp?B?R09OcTBuSEVNZDMvNUtsU04wV2QxWGxsb3JDTktZcDdvTzVLSzJSZjAx?=
 =?iso-2022-jp?B?aGZ4dloybTBEamx3S1RJZ2c0N3FBMHBWNjc4WEowYVYrbTlhVVZhdStN?=
 =?iso-2022-jp?B?TjVsRzRGOEJlNm9BanJIS3ptOFloOWdpcEdaSUc5aG5rYzBFWWVvU3lt?=
 =?iso-2022-jp?B?bDNMKzdIUjVITzJ3TGFsa3l3N2p2dmJZalg2RDNjRThyMXNXYkJFdWZ1?=
 =?iso-2022-jp?B?MEIrZ09veU0xSkZvUTl6NCttNVl0VTFJSHJyam0zY0d2eG5LWDhUb1NP?=
 =?iso-2022-jp?B?WDJqTHpSU3FzQUhuSG4ycGRyQ2RlQ2xMdnZCQ1lnMCs1Z3V1YTVsMDcy?=
 =?iso-2022-jp?B?Q29vcmUyRGpDUnluZUY0MlpqdW1SeEtLK1NpN2d5TUlIM0dmaHcrY0lS?=
 =?iso-2022-jp?B?anNHa2VVQk05M2VLd2swUlFWdTlqdFp2eXBObTIvckp4aUNGdWR2R3VS?=
 =?iso-2022-jp?B?K0VnQThvMEFIeFVLYnpJbnFWT1YydjRWN2E5YTIxQ2w4enNkTWlrUlJE?=
 =?iso-2022-jp?B?WExCVm5TV0U3Y3ZrVHRaOGtxV0NTa0hhbVMvTDZNbVFoVVFQUno3Wldj?=
 =?iso-2022-jp?B?dlZFS0xVdVJjRzdTU29OOXdUTjh1OEFocG1QbTJRYlFsbGpGdGxPTFIy?=
 =?iso-2022-jp?B?ZXlUMVFVU2duN2pPVzdodGY4YzlONEl6MEZLMVVSdUNXU1Noek1CMTVu?=
 =?iso-2022-jp?B?TzU5QmtDcU1pZFRoeGdWbmp2T0VMVFlBTnh2Z3BBV3NHb3d0VjhWQUlo?=
 =?iso-2022-jp?B?WnY0OWwxQlJTZVViVmZQU0ppK0xFOFg2dWk0UHJUNDNaMzNkeXNzVHNv?=
 =?iso-2022-jp?B?R2kwOXUzUi9ZZlRIOHBNcGUyZnlCcEM1a3puN3NteFljbUdEdXlPYk1n?=
 =?iso-2022-jp?B?QXZYU1oraVIxdFNtdjhJOU5qWGNHYmdMUlNQdjVIdTFEaXhJeWV0c21a?=
 =?iso-2022-jp?B?dG9qd2M1RFhDSGQ2U2g2MnR2bnpCZ2d5dlRhY2V2TXlldFdDem4zSjdS?=
 =?iso-2022-jp?B?b25xb0hVWUNkL0pnOUZobXowRFlVQTUzaHVhUWxxTE1scmdaYXhvVjRK?=
 =?iso-2022-jp?B?VUxHMlNMSHBRSUljZ0oydHl1c1dUV0xwSWJXYVB4VXQzb0JuNmlqOXNU?=
 =?iso-2022-jp?B?cTJ6eFNYNzRqNkJSU2xHMWl4QXk0L2d6cnhJcVJOYlJZeXN4RERLYk5v?=
 =?iso-2022-jp?B?c2VJSDVKWUpaNFdoYmZNSWE4MnFaelZiWnlZbXJKVWZpR3BkY2MzSWNq?=
 =?iso-2022-jp?B?TjdYUkhlZ0V3ZVFBRzhmcnlxcGcvSQ==?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30936A198A555EEBC1DBF78AE1429SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2604
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7ca41684-bc21-413a-2634-08d908cc7825
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xpAAtMBlM7j6FcU/kA+nbObI712bwDQ5IDZqwGfbeBPXMmaxgU5Ov5oaIW2dj4K3TkyTU7fEQmjn9Q/QsuqV5JVJQJMGsXLhFUWX00mU/O/otpSgHDP617lWgTr0s+t757ACN6T/MH4pD3mDyvTOK9xw66eTCHSefWsGmg1z4qa6mPJyLMu+kW412k4WD63/KfSDwSKlfrny5QUfnVgdYrQCX3VR5Utkc7YJvXHNCtcW56D52ARRx00J77+oDt4NbjHdZJQoPFvi7Wf3rYocVPVP4jSeUEDq6fywtcSlgwX0EoAxlO5oU2pSNNuczmejLX6UGa/mpbx4iDlvBTvbEqwpQSz5MeZGWHFnILb0SFMl9ItCYOimP40YupnZceXWoLdXMYGtfqH1KPC6ROJ0mXYII2W33r4imyKCYOn99p6sWWdLx5gNOCs1CFc+D0U0Vj8BdxZ0H5anGeXfW3MLwKNWzqU1lHfDORl7p081bVfx+JmZ19Rp6QHN7jhB/+xs270PF++SFoOiPwNSNkgRo+ImD/kMjt0uOaB06Ly52VFxowmPut+Oh1ZNT2p9XH+323jwAZ1X0GSYKTbF17V7V2KSnZZsL1Q/JkWoqb5QxX0jKhVvqPmFJrRwWZWgZ5FyxOrevg1GrIbnK/lu2PMcFfmLoHDmbMvLvyhoAbnb+xdhc8i7c1Wl1Gnwx3tmGsskIO+yQR6rxXEVmrVAQKSZ2tYOwnX48EaNW5vKxFOjbuhPxXDN17UCZXGBtGg8UGRRu+5hr7+UZVLL8lMfTc50qYrIm5OS1bxMNlgyvhB63a8=
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39830400003)(376002)(46966006)(36840700001)(8936002)(336012)(70206006)(186003)(70586007)(83380400001)(356005)(47076005)(5660300002)(166002)(7696005)(81166007)(86362001)(6506007)(8676002)(36906005)(6916009)(508600001)(36860700001)(9686003)(2906002)(55016002)(26005)(82310400003)(34020700004)(52536014)(33656002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 16:00:55.7201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc28dcbb-ebca-40f0-9ade-08d908cc7a16
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3370
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

--_000_SG2PR04MB30936A198A555EEBC1DBF78AE1429SG2PR04MB3093apcp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Classification: Confidential
Hi Team,

In the latest build, I am facing the below issue in Entity Manager for tiog=
apass.
Already issue has been created in Entity Manager Repo - entity-manager term=
inated by 'std::filesystem::__cxx11::filesystem_error' * Issue #8 * openbmc=
/entity-manager (github.com)<https://github.com/openbmc/entity-manager/issu=
es/8>

root@tiogapass:~# systemctl status xyz.openbmc_project.EntityManager.servic=
e -l
=1B$B!|=1B(B xyz.openbmc_project.EntityManager.service - Entity Manager
     Loaded: loaded (]8;;file://tiogapass/lib/systemd/system/xyz.openbmc_pr=
oject.EntityManager.service/lib/systemd/system/xyz.openbmc_project.EntityMa=
nager.service]8;;; enabled; vendor preset: enabled)
     Active: active (running) since Thu 1970-01-01 00:04:10 UTC; 25s ago
    Process: 851 ExecStartPre=3D/bin/mkdir -p /var/configuration (code=3Dex=
ited, status=3D0/SUCCESS)
    Process: 852 ExecStartPre=3D/bin/mkdir -p /tmp/overlays (code=3Dexited,=
 status=3D0/SUCCESS)
   Main PID: 853 (entity-manager)
     CGroup: /system.slice/xyz.openbmc_project.EntityManager.service
             =1B$B(&(!=1B(B853 /usr/bin/entity-manager

Jan 01 00:04:09 tiogapass systemd[1]: Starting Entity Manager...
Jan 01 00:04:10 tiogapass systemd[1]: Started Entity Manager.
Jan 01 00:04:27 tiogapass entity-manager[853]: Inventory Added
Jan 01 00:04:27 tiogapass entity-manager[853]: terminate called after throw=
ing an instance of 'std::filesystem::__cxx11::filesystem_error'
Jan 01 00:04:27 tiogapass entity-manager[853]:   what():  filesystem error:=
 recursive directory iterator cannot open directory: No such file or direct=
ory [/sys/bus/i2c/devices/i2c-16]

Regards,
Jayashree
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_SG2PR04MB30936A198A555EEBC1DBF78AE1429SG2PR04MB3093apcp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#B45F04">Confidential</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the latest build, I am facing the below issue in =
Entity Manager for tiogapass.<o:p></o:p></p>
<p class=3D"MsoNormal">Already issue has been created in Entity Manager Rep=
o - <a href=3D"https://github.com/openbmc/entity-manager/issues/8">
entity-manager terminated by 'std::filesystem::__cxx11::filesystem_error' &=
middot; Issue #8 &middot; openbmc/entity-manager (github.com)</a><br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal">root@tiogapass:~# systemctl status xyz.openbmc_proje=
ct.EntityManager.service -l<o:p></o:p></p>
<p class=3D"MsoNormal">=1B$B!|=1B(B xyz.openbmc_project.EntityManager.servi=
ce - Entity Manager<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; Loaded: loaded (]8;;file://=
tiogapass/lib/systemd/system/xyz.openbmc_project.EntityManager.service/lib/=
systemd/system/xyz.openbmc_project.EntityManager.service]8;;; enabled; vend=
or preset: enabled)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; Active: active (running) si=
nce Thu 1970-01-01 00:04:10 UTC; 25s ago<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Process: 851 ExecStartPre=3D/bin/=
mkdir -p /var/configuration (code=3Dexited, status=3D0/SUCCESS)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Process: 852 ExecStartPre=3D/bin/=
mkdir -p /tmp/overlays (code=3Dexited, status=3D0/SUCCESS)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Main PID: 853 (entity-manager)<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; CGroup: /system.slice/xyz.o=
penbmc_project.EntityManager.service<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =1B$B(&(!=1B(B853 /usr/bin/entity-manager<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Jan 01 00:04:09 tiogapass systemd[1]: Starting Entit=
y Manager...<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:04:10 tiogapass systemd[1]: Started Entity=
 Manager.<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:04:27 tiogapass entity-manager[853]: Inven=
tory Added<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:04:27 tiogapass entity-manager[853]: termi=
nate called after throwing an instance of 'std::filesystem::__cxx11::filesy=
stem_error'<o:p></o:p></p>
<p class=3D"MsoNormal">Jan 01 00:04:27 tiogapass entity-manager[853]:&nbsp;=
&nbsp; what():&nbsp; filesystem error: recursive directory iterator cannot =
open directory: No such file or directory [/sys/bus/i2c/devices/i2c-16]<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_SG2PR04MB30936A198A555EEBC1DBF78AE1429SG2PR04MB3093apcp_--
