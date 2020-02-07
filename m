Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1E15534C
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 08:55:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DSK24qjQzDqfX
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 18:55:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.69.93;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=b9+f+s1M; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690093.outbound.protection.outlook.com [40.107.69.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DSJM5BvqzDqd1
 for <openbmc@lists.ozlabs.org>; Fri,  7 Feb 2020 18:54:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPFHZW6+fwp0NNPMK07U7mwLJe4uefskJsxxw7wf9w+blgZWhqLuWbh2ASMU/a0qSEk1Bq9Wi8Q2CvsgGzVEcA+T5q7hT7lxgeUSaotWd/CrHdh7ElI0CAjx+PnklxlSQangH5PLNvqvYrib++L4ppoWDKlUfYTpzW4io4hIiilNZ/R68HUAvY6C55vd0YTbehv8BmcU+PnYUT0gEYndXR5lRY3Yu1ZGYZYvXQZtN3tqXf4lRpoWTRjNCvW923GCdkDfQbrJfeg9j2JFmFDt3wPk9Kwedyiwa17juVZ1eLsjTHa+CDuzWNmspwOGh0kyeNcl5L/OpLSKcTuiX6Tufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVaEhlhnNl3XOAeRD17lrviZOOttcsNqgj9AGgnF9m4=;
 b=b8LLErJRCRdUSorHWGGgG3tU15ZbwnQQX3aIKAHRuzAD3/s08MvjB9wXQ8HkbW/p9sSB1Otm2jgMdYNsxde4Tbo3AsKo+SVTLf8lm05u0qI6PyKYIRB3xG4/AF3q8UsySV48fp6dSIbDwe8Se5IUWHpdWdWUVB/ycG1845kamot/tL06RCWHrN59ipmh/FKzp5plbecqz815EwTh2LqLmWdMAO3Ir1fOCDFcajeS4jCxHCx4OsFYykxA8D7FiJsBle8myBkSTKblHuXJ9KRPt3/e9b7NdFcaH59p70MxfpH+t5Dx3IfSEfXhN11jHK4jvV+SBCHI9kZnygEQPMx1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVaEhlhnNl3XOAeRD17lrviZOOttcsNqgj9AGgnF9m4=;
 b=b9+f+s1MbDuTmrAnnnR0yucDCmUZtieitw99sr/YXCOZ7LG+ItFmxTc7jG7XVLU/QBRHyf67sjIA0Hs6Vy+sWf/U1IqWAf9HdeFRR/Xh0jSIZl8nYOGqGa3eY8xblzrn7+tjlz4ucvnICi/1k6gXU47zi3BozZX/gAxe+qyOhAE=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (20.180.12.7) by
 CH2PR21MB1429.namprd21.prod.outlook.com (20.180.12.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.7; Fri, 7 Feb 2020 07:54:51 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::e4d1:6fc0:16e9:ae03]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::e4d1:6fc0:16e9:ae03%7]) with mapi id 15.20.2729.010; Fri, 7 Feb 2020
 07:54:51 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Enabling kdump on AST2600
Thread-Topic: Enabling kdump on AST2600
Thread-Index: AdXdifhQPN8y8QSBR9SXUpj+dn5NWg==
Date: Fri, 7 Feb 2020 07:54:51 +0000
Message-ID: <CH2PR21MB15104C1CB3653876F2112B53C81C0@CH2PR21MB1510.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-02-07T07:54:50.1903953Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7b352637-e4db-43aa-93f4-d8bd6c66f3f6;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 341c29c1-9fe4-46ec-60f1-08d7aba3034b
x-ms-traffictypediagnostic: CH2PR21MB1429:
x-microsoft-antispam-prvs: <CH2PR21MB1429CDFC64DCB2C04551D12AC81C0@CH2PR21MB1429.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(189003)(199004)(76116006)(66446008)(66556008)(10290500003)(52536014)(64756008)(66476007)(86362001)(66946007)(26005)(8990500004)(5660300002)(6506007)(186003)(478600001)(316002)(33656002)(7696005)(8676002)(81166006)(6916009)(81156014)(8936002)(558084003)(71200400001)(55016002)(9686003)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR21MB1429;
 H:CH2PR21MB1510.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8hb1D6zt3yg0aNd3OW7Gx4rwU87MBcoTCMv0vv0eYnu7g41FRq903M4NTV8/Uel75Eaxzn1H5PUsjC6dk5bNbeJtVUqmClG8ZkTgC+sgGy1JlV9TbPt7wWPsRzFy6UTdJ19bNRESZBORLjU9ZCxLEyBz91JhvyzNMYv4uJ5ICBhsJ+d9xC+cJK6oMO2CAUDyBSiSe9geX0ZJZxFFfVCpzUMDbrKP5ZC7rkKLMNG//SFif7HhGorH5FfUlrAUyJwSPJtVi8hBQ/hoZimAXMZR6tidJrBL8zwxJzFfDggNuBjWCsAa+wNEVzMMybihfBPt+5V7OsmcK4xkW4u/5/sYlDumYPphGjs6r2dQaOlXvbcqA5f9HC6E+uvx0I9ihXFMpCigoUC/BV5ktlst8DQTgzY5UInwCtI/v5Q6TXlRZodovPhH5kWdVB5IPQRjg2u6
x-ms-exchange-antispam-messagedata: CRF55CSDQQYVMfbQxvSwVWcRjQtFzKPXQL7P6h3y5IsbcR983wrj8+yZOuSXdAPFe0WU4Vk0YYPC5tVKxvV9Wrzk4FJK4U3tR8lNvbAQxgFCDWR1ILq/Rl9sQ+o93GtxYtZJHVdU3V/QfWyphw+svg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341c29c1-9fe4-46ec-60f1-08d7aba3034b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 07:54:51.7991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmlZpCa00QiUKtoSenhR0BH/SVegM4tRQllVO7QfXxX3zLF03W9u5vZwLB+dat4vB09IkItHyvEivof6v82FAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1429
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

Hello,=20

Has anyone tried kdump  on AST2600 EVB ?  is there any known recipe that I =
can use?=20

How are we retrieving dumps from BMC ?

Thanks
Neeraj



