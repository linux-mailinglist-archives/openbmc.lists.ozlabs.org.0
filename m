Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA78850EC40
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 00:46:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnKr84qRYz2yQK
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 08:46:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=PRl0ly+X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c110::1;
 helo=na01-obe.outbound.protection.outlook.com;
 envelope-from=derekma@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=PRl0ly+X; 
 dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnKqk51wNz2xX6
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 08:46:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4mIwu5cS4UQA1iq0yV2uNl9akDc03fTzC0yqpofTRyVnzKrlBz6RfSI2rmjOpf0dyo+S0uus+A+Lr+kksoTee5jKq6sGCAhCitfhvqNjU8ZXSk+cH3goOEf0xRTO1dE3V6XA5vUm5SZc58vzR3Bbo3mdGQuC7HXXq/Esj8vo3yrhonL6G+v+eCxZ8IU99lPLTJE379bkRzpVdzY0B96+P+Qs/Sxci0A9vgNCt4ELEyTzHwqGp4+StTnwbohsv2hVfu6aP1fgVR3nhvnLTQEEn2mvm0m3c6HVS/oQkADXxP7IJV45txLbcawJ/F/NJo1+Bx8XwLlmr+jjjLwRGNNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIc2niW+q85BXaWBMlc8GWTxdx5pIZSWuXltjn1h1oo=;
 b=K9ipfhVn8yNXnY+5xmAsSwB23LCcVDXe8g2vTcUukNEHTzPYumVv0fgD7YnL6lbk3UtFn3QdBuqpgFK04VclvdxfHtFpCXk9w5QMGFmZESH6FRYLQvEkAvT3a4M5KmQc3tUTxZCtkVxqDR7mUApojllytOBvUMbsggyiDI6GVgx8KIAKq5oO2frhaEHeSzaU7HkhHll5TnPNTFbCcnSwQSRmAA8tAkUE2qB+zf/h1Bj24akErJqViJTNJQGcFeAnfRE1rIZKXsU7DDQKvm0bF2F7tut6rr/cDcftZm/fh9UqdQ2M4OPlVqu9UYXUh9sOXRBg92Xn40HnMGTHuZbvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIc2niW+q85BXaWBMlc8GWTxdx5pIZSWuXltjn1h1oo=;
 b=PRl0ly+XgveUPU5YzkfE3adHT7fAkMmPrv+fjc++33n97MRYQWjk2o9PcJGMpMvx8btRkhf4YcOSLXxYGsDv+X7ykpsFMvjJWh8zk2iJDi1KIMByQRwewc+3rt4g9OdVbQF4UPpBOYmHvd+sNWOOu0eT1XhwByagpyj8DXWObRM=
Received: from MW4PR21MB1922.namprd21.prod.outlook.com (2603:10b6:303:73::23)
 by SJ0PR21MB1983.namprd21.prod.outlook.com (2603:10b6:a03:294::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.4; Mon, 25 Apr
 2022 22:45:49 +0000
Received: from MW4PR21MB1922.namprd21.prod.outlook.com
 ([fe80::49c1:c573:2550:6f44]) by MW4PR21MB1922.namprd21.prod.outlook.com
 ([fe80::49c1:c573:2550:6f44%9]) with mapi id 15.20.5227.004; Mon, 25 Apr 2022
 22:45:49 +0000
From: Derek Mantey <derekma@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Linux Kernel JTAG Support
Thread-Topic: Linux Kernel JTAG Support
Thread-Index: AdhVnF+AeeyfNKXWSuW5TzlSzarg+Q==
Date: Mon, 25 Apr 2022 22:45:49 +0000
Message-ID: <MW4PR21MB1922FDDD3AC06B9A32F82894B0F89@MW4PR21MB1922.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=6734f8b2-445a-49c8-a3ba-bcfa61ec6a4a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-04-21T16:24:32Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09491042-3bc0-4455-f8cb-08da270d5801
x-ms-traffictypediagnostic: SJ0PR21MB1983:EE_
x-microsoft-antispam-prvs: <SJ0PR21MB1983DA423D9F022A08D24E12B0F89@SJ0PR21MB1983.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lLrblZ+OOxjzRlUFcwy64fiWd6YVikTRSB4HOLSjfoYZnVg6azb3wxTA9rNvotpmD1ZOtDi0lh8dzBvWPa4C0PESMeOuGnMVTqgbctRQTOwApBCAwGUUukpuwgQfgj6vE/d7cCd4LX/9qnRyEQMqLB8PJlybZFjuQ8JZAHy7hoQ+/twvbFD2ODiTa6aU5Q3UMySjSGIxEBs1zNtnHMzk4SO/NMocyfasH6Jf9e4n4GPJtzk0smAUZoQfnEKFlEbUZq/oHwNsx9UtRm3+Qy8HJrYdLt6yIdtDEiHW7189sCFoFMx9D+9CRzQP/XRwluvGS4zOZpTkaMR16Vxf475TyWyCYrYzC/PY2Fer75NQrebtH32Gx/4dFHJJTXZh5a8hq1mYUwFil8lattrL2G+YnAl+q/3g3yW86HGjTZ96/TWyGGHDfwDL5/uF67g1Iz88zZc/QxXuMK+FlT/xpd1EMW1CnfMADhL0ExntdQY+5KNwkwdYRCqeeCSnAbCw7qnYI0F3jb+5ZnNjbHFPHsNFlv6hhilzYDD7h27K8jhLDeUmC1vEDamGNmbgoaithWJrn1TCsWiabsTXaFPWP6bhdVLkCdzkBOFIxssQgC4nsnqoTAB8AKcWkUNjSQHYf/njvyTYx1JJSX7kyjR7V79bv/je5SlhvFimDmpzDZhhjMpY8sJSeU4iMPILETwr3cXoQ3Rape+BMs51oydM2Mk9vhR3C2RnLQ80o3XLkIZWymPNjo65Wj9B4H0yW/fw1gy4dtNNCxlI1TcXybslz5ri3NnI9Gh8EM9fYyIpM/0G1w3HoDkxzpPtLhy04NiCGvO2lTyVUp8q9AtYnSLwhsHC6IkiJcwyiMODEH1teI85a6Jq4zxetBpRaJwLmoIFCvRj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR21MB1922.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(8936002)(6506007)(86362001)(508600001)(966005)(55016003)(52536014)(5660300002)(82960400001)(71200400001)(10290500003)(76116006)(8676002)(64756008)(66556008)(66446008)(186003)(82950400001)(33656002)(66946007)(66476007)(7696005)(6916009)(316002)(2906002)(3480700007)(83380400001)(38100700002)(38070700005)(122000001)(26005)(8990500004)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V1/2EFt6OviDUTEiv+YecubCczUuuUlZMrbMo5nMSxvs0cInCEVJfSmeX1NI?=
 =?us-ascii?Q?LuUfFZcgDg12bCwjy6fkwiigUOJctbRTINMrx3TETsNxq/hTN7Txx0jv88mo?=
 =?us-ascii?Q?GFPCMclLpkxsTK4IBiqe9YJBU0SbqzWYndekjcbmkFdleULGt8b2J+IhsTmI?=
 =?us-ascii?Q?8SF0gXbVtQB4CL3yL/oNYIWsqwOgW1oYls5+/rZWpiX7dg5Uz/lMlR+0YCUr?=
 =?us-ascii?Q?V1Zoh/yKlieylnMncAEDHCdDuHEVs5zYBWjDy50uWdtD2ExlIH6zWMEl6xfI?=
 =?us-ascii?Q?BQCRQJOTpFQR4pITwMXUgvEHxuJmkvDQQEPCQIjsFhPmmRznhtHUYM2MB6HS?=
 =?us-ascii?Q?p0wVOz4znJ2ls2kCbBA0dt7p03+ETbf59MItEJ4O4zvWaQelleaxXBUJuoWI?=
 =?us-ascii?Q?gH8BdmVm7uG/fZHPRXqxijM02ZNjqhAWsZVwpm1AR49e+dXXFPU0hj7VGye/?=
 =?us-ascii?Q?I0AAiE6Eu0kJmmSX8oM93PY2rj09KDXWy9qiBu815zfLhKRMhSi7UqLsW4CF?=
 =?us-ascii?Q?E45OSn2yVVRppwDCz7aMIdMWIkEXwqGkLeCSSO7aWBM6feTyRd/3DhdC/OXj?=
 =?us-ascii?Q?s4Y6LfhJfBvwCkEp5HuXfLGYYvCKeANCWfoGZZv6LJHgmLsY6/OUJCLBpOBH?=
 =?us-ascii?Q?uiPPUhxTgIAoOmhOP7C2KRkBTXg0jip4XtTownJpkMRhVdsllGtJCROK3Svd?=
 =?us-ascii?Q?cCZjCoIMMNzD3lV3NH4ObxSDNVEJgibSM613PNeinFwNuSaFl40rzT3mU7bs?=
 =?us-ascii?Q?LRyDWefFwZvgK9hXw0s6KAGMZEGt1zkTFwYUUudfM9IpMkxA2uzPk5OCoYOP?=
 =?us-ascii?Q?N6Emeum+Vt/zEH4f2wPSQaAfa6PHpP/v6uY+Q+YaSNirtx/CltMxT3cwL7Z/?=
 =?us-ascii?Q?mrPgb/AqGxzddc3bsizerguYHOnQHmypAx8lX7IKL2jRR5upfVhcQ4hVY/jd?=
 =?us-ascii?Q?XLPEKDSIBU7wM13afaaCGBxrNzUFiKMb63PYvdsm3yS8Xod7vb/KC225VTMI?=
 =?us-ascii?Q?rhLCRujOJy3k7PC83x/Za/12UcY4Xi14asUCfwoe5XSM4GT7vC/0NGt7wXgr?=
 =?us-ascii?Q?a7BkLRxVIMAOgNBYYJqPJPb/ienX/054tIGKRbI49C+JtMeM+NTQCPmb8/zd?=
 =?us-ascii?Q?AwtyNDpVRXjEHjVb49kMg2NJKCrdlqi79p9PF6evvQe26StiCE9zEbIGiYOM?=
 =?us-ascii?Q?KzkWy6DFn50dUgzymXM+vp1ztj7WiWmcZQxRr9QyZB7wTOmShIRNJ2yO0x54?=
 =?us-ascii?Q?jjqHacy/KxWvvQyjyh1A2/GGcu1AN6rZhBoYgeJuCHnSNeW1P/zUs2n52TZr?=
 =?us-ascii?Q?KeZHenALJNlzW6a5lYPf9hxBl4FuY+TqOTApUj957N58nV9WkViqxMAt9aWD?=
 =?us-ascii?Q?6ye1Ht/337WHXnNnYWJDsYWVeOaQ8qXijxtFuLl9fKWCFlu6p259WVRqL+p2?=
 =?us-ascii?Q?W75ZgasfTarx8PfnyGJYFWeXKze9KCNzyvPIwWYtyenQ2aoIpFtugnd6RI4H?=
 =?us-ascii?Q?JvJdfjztOP9WH7+RF6yN+5Ds4zVCWWEA7DRfzLQElkxrRusGeXZ16wv3KGJT?=
 =?us-ascii?Q?/FY+38Q8rgEZ2liYCHfsjctKX3cwXG2rlAb8SYtFdJihTwBhEvrMuoy+dh3w?=
 =?us-ascii?Q?kDatXRls3u3NndbEF/xg9WwovljRoswRdWiaweJQLSao58iXdgyJy7flq9vx?=
 =?us-ascii?Q?6Y4xclB4Naei6XVshs+EQiGTQnJApB1VvJF7MnziJCzddLz+HFuVfWXmW7sO?=
 =?us-ascii?Q?ObPQaKINxg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR21MB1922.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09491042-3bc0-4455-f8cb-08da270d5801
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 22:45:49.0328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 472Ri7phSaghOEBZfE2voLuXao1N6tlq/ucOEh96VdDwYIALem4NEG+qcYgWX4I2qr+Ccu1NDT66aDkIRmdsDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR21MB1983
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

It looks like there was a discussion a while back (~2017) about adding a Ke=
rnel driver for JTAG devices.  We are looking at using this for a variety o=
f scenarios like OpenOCD and FW update for CPLD/FPGA components.  I was hop=
ing to get some insight into the current status of the JTAG drivers and if =
there was anyone working on it.

The patches I saw from 2017 were: https://patchwork.ozlabs.org/project/open=
bmc/list/?series=3D18558&state=3D%2A&archive=3Dboth

Additionally, it looks like there are multiple implementations that exist:
  1. Facebook: https://github.com/facebook/openbmc-linux/commits/dev-5.6/dr=
ivers/jtag
  2. Aspeed: https://github.com/AspeedTech-BMC/linux/commits/aspeed-master-=
v5.15/drivers/jtag
  3. Ampere: https://github.com/ampere-openbmc/linux/commits/ampere/drivers=
/jtag

It looks like these have different version of the driver with slight differ=
ences in the interface.

  1. What is current status of the JTAG driver?  Is anyone still actively w=
orking on getting this pushed into the upstream kernel?
	a. Was there pushback from the Linux Kernel on taking these changes?
	b. If the upstream Kernel doesn't want to take these changes, would we con=
sider having them in the https://github.com/openbmc/linux fork?
  2. Does the community have a "preferred" JTAG driver that they are workin=
g on?  I am not sure how much people are sharing the changes to JTAG.  Is t=
here a "best" driver to start from?
  3. Are there any other people working on or looking at the JTAG driver?  =
I would like to know what others are doing so that we can align ideas and r=
equirements, and not re-implement if possible.

Thanks,
	Derek
